package com.meerkat.school

class Grade {
Course course
float final_grade
    static constraints = {
        course(nullable: false)
        final_grade(nullable:true,range: 0..10)
    }
}
