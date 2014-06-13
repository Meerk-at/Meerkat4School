package com.meerkat.school

class Student {
String url
static hasMany = [grades:Grade]
float overall
float diplwmatiki
String toString(){
        return url
}
    static constraints = {
        url(nullable: false,blank: false,unique: true)
        grades(nullable: true)
        diplwmatiki(nullable:true)
    }
}
