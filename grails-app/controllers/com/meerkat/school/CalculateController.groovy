package com.meerkat.school

class CalculateController {

    def index() {
//        def student=new Student()
//        student.url=
        def generator = { String alphabet, int n ->
            new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }
        println generator( (('A'..'Z')+('0'..'9')).join(), 9 )
        Course.all.each {c->
//            String p='grade'+c.id
//            println params.get(p)
        }
    }
}
