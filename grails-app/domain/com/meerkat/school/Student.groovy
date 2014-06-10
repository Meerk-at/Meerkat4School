package com.meerkat.school

class Student {
String url

    static constraints = {
        url(nullable: false,blank: false,unique: true)
    }
}
