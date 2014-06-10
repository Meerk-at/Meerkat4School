package com.meerkat.school

class Course {
String name;
int ects;
    String toString(){
        return name
    }
    static constraints = {
        name(nullable: false,blank: false,unique: true)
        ects(nullable: true)
    }
}
