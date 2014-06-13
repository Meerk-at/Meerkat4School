package com.meerkat.school

class CalculateController {

    def index() {
        def student=new Student()
        def generator = { String alphabet, int n ->
            new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }
        student.url=generator( (('A'..'Z')+('0'..'9')).join(), 9 )
        student.save(flush: true)
        Course.all.each {c->
            String p='grade'+c.id
            if(params.get(p)){
               println 'in'
               def g=new Grade()
               g.course=c
               g.student=student
               g.final_grade=params.get(p).toInteger()
                if(g.validate()){
                    g.save(flush: true)
                }else{
                    g.errors.allErrors.each {
                        println it
                    }
                }

            }
        }
    }
    def test(){

    }
}
