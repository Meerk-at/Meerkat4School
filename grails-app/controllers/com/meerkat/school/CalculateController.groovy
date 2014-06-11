package com.meerkat.school

class CalculateController {

    def index() {
        def student=new Student()
        student.url=
        Course.all.each {c->
            String p='grade'+c.id
            println params.get(p)
        }
    }
}
