package com.meerkat.school

class Student {
String url
static hasMany = [grades:Grade]
    static constraints = {
        url(nullable: false,blank: false,unique: true)
        grades(nullable: true)
    }
}
