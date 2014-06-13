package com.meerkat.school

class CalculateController {
    def simpleCaptchaService
    def index() {
            boolean captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)
            if(captchaValid) {
                def student = new Student()
                def generator = { String alphabet, int n ->
                    new Random().with {
                        (1..n).collect { alphabet[nextInt(alphabet.length())] }.join()
                    }
                }
                student.url = generator((('A'..'Z') + ('0'..'9')).join(), 9)
                student.overall = params.overall_grade.toInteger()
                if (params.diplwmatiki_grade) {
                    student.diplwmatiki = params.diplwmatiki_grade.toInteger()
                }
                student.save(flush: true)
                Course.all.each { c ->
                    String p = 'check' + c.id
                    if (params.get(p)) {
                        println 'in'
                        def g = new Grade()
                        g.course = c
                        g.student = student
                        if (g.final_grade) {
                            g.final_grade = params.get(p).toInteger()
                        }
                        if (g.validate()) {
                            g.save(flush: true)
                        } else {
                            g.errors.allErrors.each {
                                println it
                            }
                        }

                    }
                }
                redirect(action: 'user', id: student.url)
            }
        else {
                redirect(url: "/")
            }
    }

def user(){
def user=Student.findByUrl(params.id)
    println user
[user:user]
}
}
