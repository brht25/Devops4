package com.example.demo.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MovieController {

    @GetMapping({"/", "/api/movies"})
    public List<String> getMovies() {
        return List.of("The Godfather", "Inception", "Interstellar");
    }
}
