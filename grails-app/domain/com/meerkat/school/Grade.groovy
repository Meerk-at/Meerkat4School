package com.meerkat.school

class Grade {
Course course
float final_grade
static belongsTo = [student:Student]
    String toString(){
        return course
    }
    static constraints = {
        course(nullable: false)
        final_grade(nullable:true,range: 0..10)
        student(nullable: false)
    }
}
