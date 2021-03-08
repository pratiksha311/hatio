package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Model.Project;
import com.example.demo.Model.Task;
import com.example.demo.Repository.ProjectRepository;
import com.example.demo.Repository.TaskRepository;

@Controller
public class HomeController {
	
	@Autowired
	ProjectRepository projectRepo;
	
	@Autowired
	TaskRepository taskRepo;
	
	@RequestMapping("projecthome")
	public String projectHome(Model m)
	{
		List<Project> list=projectRepo.findAll();
		m.addAttribute("project", list);
		return "projecthome.jsp";
		
	}
	@RequestMapping("addproject")
	public String addProject(Model m)
	{
		Project project=new Project();
		m.addAttribute("project", project);
		return "addproject.jsp";
		
	}
	@RequestMapping("saveProject")
	public String saveProject(Project project)
	{
		projectRepo.save(project);
		return "redirect:projecthome";
	}
	@RequestMapping("updateproject{id}")
	public String updateProject(Model m,@PathVariable int id)
	{
		Project project=projectRepo.findById(id).get();
		m.addAttribute("project", project);
		return "addproject.jsp";
	}
	@RequestMapping("deleteproject{id}")
	public String deleteProject(@PathVariable int id)
	{
		projectRepo.deleteById(id);
		return "redirect:projecthome";
	}
	@RequestMapping("viewtask{idp}")
	public String viewTask(@PathVariable int idp,Model m)
	{
		
		Project project =projectRepo.findById(idp).get();
		m.addAttribute("project", project);
		return "taskhome.jsp";
	}
	
	@RequestMapping("addtask{id}")
	public String addTask(Model m,@PathVariable int id)
	{
		Project project=projectRepo.findById(id).get();
		Task task=new Task();
		m.addAttribute("project", project);
		m.addAttribute("task",task);
		return "addtask.jsp";
		
	}
	@RequestMapping("saveTask{idb}")
	public String saveTask(@PathVariable int idb,Task task)
	{
	    Project project=projectRepo.findById(idb).get();
	    System.out.println("hello in save");
	    project.getTask().add(task);
	    projectRepo.save(project);
	    Project project2=projectRepo.findById(idb).get();
		return "redirect:viewtask"+idb;
	}
	@RequestMapping("closetask{tid}close{pid}")
	public String closeTask(@PathVariable int tid,@PathVariable int pid)
	{
		Project project=projectRepo.findById(pid).get();
		for(Task t:project.getTask())
		{
			if(t.getId()==tid)
			{
				t.setStatus(false);
			}
		}
		projectRepo.save(project);
		return "redirect:viewtask"+pid;
	}
	@RequestMapping("deletetask{tid}delete{pid}")
	public String deleteTask(@PathVariable int tid,@PathVariable int pid)
	{
		Project project=projectRepo.findById(pid).get();
		Task deleteTask=null;
		for(Task t:project.getTask())
		{
			if(t.getId()==tid)
			{
				deleteTask=t;
			}
		}
		project.getTask().remove(deleteTask);
		projectRepo.save(project);
		Project project1=projectRepo.findById(pid).get();
		return "redirect:viewtask"+pid;
	}
	@RequestMapping("updatetask{idt}update{idp}")
	public String updateTask(Model m,@PathVariable int idt,@PathVariable int idp)
	{
		Project project=projectRepo.findById(idp).get();
		Task updateTask=null;
		for(Task t:project.getTask())
		{
			if(t.getId()==idt)
			{
				updateTask=t;
			}
		}
		m.addAttribute("task", updateTask);
		return "addtask.jsp";
	}

}
