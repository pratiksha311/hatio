package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {

}
