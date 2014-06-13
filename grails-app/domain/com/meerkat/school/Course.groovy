package com.meerkat.school

class Course {
String name;
Integer ects;
Integer semester;
    String toString(){
        return name
    }
    static constraints = {
        name(nullable: false,blank: false,unique: true)
        ects(nullable: true)
        semester(nullable: true)
    }
}
