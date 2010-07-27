using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.IO;
using System.Text.RegularExpressions;
using MarkdownSharp;
using System.Text;

namespace TaskPuddle.Models
{
    public class CreateTask
    {
        [Required]
        [DisplayName("Title")]//[DataType(DataType.Text)]
        public string TaskTitle { get; set; }

        [DisplayName("Category")]
        public string Category { get; set; }

        [DisplayName("Description")]
        public string Description { get; set; }

        public void Save()
        {
            Task task = new Task();
            Guid id = Guid.NewGuid();
            task.TaskId = id;
            task.Category = this.Category;
            task.Description = this.Description;
            task.TaskTitle = this.TaskTitle;
            Task.Save(task);            
        }
    }

    public class Task
    {
        static string tasksPath = HttpContext.Current.Request.MapPath("~/Data/Tasks");

        public Task()
        {
        }

        public Task(string path)
        {
            string file = File.ReadAllText(path);
            var titleAndBody = Regex.Split(file, "---\r\n");
            this.TaskId = new Guid(titleAndBody[0]);
            this.TaskTitle = titleAndBody[1].Replace("\r\n", "");
            this.Category = titleAndBody[2].Replace("\r\n", "");
            this.Description = titleAndBody[3];
        }

        [Required]
        [DisplayName("Task Id")]
        public Guid TaskId { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Title")]
        public string TaskTitle { get; set; }

        [DisplayName("Category")]
        public string Category { get; set; }

        [DisplayName("Description")]
        [DataType(DataType.Text)]
        public string Description { get; set; }

        public static IEnumerable<Task> All()
        {
            return Directory.GetFiles(tasksPath).OrderByDescending(task => task).Select(taskPath => new Task(taskPath));
        }

        public static void Delete(Guid id)
        {
            string filename = GetFileName(id);
            if (File.Exists(filename))
            {
                File.Delete(filename);
            }
        }

        public static Task Find(Guid id)
        {
            return new Task(GetFileName(id));
        }

        private static string GetFileName(Guid id)
        {
            return tasksPath + @"\" + id.ToString() + ".task";
        }
        
        public static void Save(Task task)
        {
            StringBuilder content = new StringBuilder();
            content.AppendLine(task.TaskId.ToString());
            content.AppendLine("---");
            content.AppendLine(task.TaskTitle);
            content.AppendLine("---");
            content.AppendLine(task.Category);
            content.AppendLine("---");
            content.AppendLine(task.Description);
            System.IO.File.WriteAllText(GetFileName(task.TaskId), content.ToString());
        }
    }
}
