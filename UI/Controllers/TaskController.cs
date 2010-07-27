using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TaskPuddle.Models;


namespace TaskPuddle.Controllers
{
    [HandleError]
    public class TaskController : Controller
    {
        #region Index
        //
        // GET: /Task/

        public ActionResult Index()
        {
            return View(Task.All());
        }

        //
        // GET: /Task/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        #endregion

        #region Create

        //
        // GET: /Task/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Task/Create

        [HttpPost]
        public ActionResult Create(CreateTask newTask)
        {
            if (ModelState.IsValid)
            {
                newTask.Save();
                return RedirectToAction("Index");
            }
            else
            {
                return View(newTask);
            }
        }

        #endregion

        #region Edit
        //
        // GET: /Task/Edit/5
 
        public ActionResult Edit(Guid id)
        {
            Task task = Task.Find(id);
            return View(task);
        }

        //
        // POST: /Task/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Guid id, Task task)
        {
            try
            {
                Task.Save(task);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #endregion

        #region Delete
        //
        // GET: /Task/Delete/5
 
        public ActionResult Delete(Guid id)
        {
            Task task = Task.Find(id);
            return View(task);
        }

        //
        // POST: /Task/Delete/5

        [HttpPost]
        public ActionResult Delete(Guid id, Task task)
        {
            try
            {
                Task.Delete(id);
            }
            catch
            {
            }
            return RedirectToAction("Index");
        }

        #endregion
    }
}
