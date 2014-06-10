<%@ page import="com.meerkat.school.Grade" %>



<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="grade.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${com.meerkat.school.Course.list()}" optionKey="id" required="" value="${gradeInstance?.course?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'final_grade', 'error')} required">
	<label for="final_grade">
		<g:message code="grade.final_grade.label" default="Finalgrade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="final_grade" from="${0..10}" class="range" required="" value="${fieldValue(bean: gradeInstance, field: 'final_grade')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="grade.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${com.meerkat.school.Student.list()}" optionKey="id" required="" value="${gradeInstance?.student?.id}" class="many-to-one"/>

</div>

