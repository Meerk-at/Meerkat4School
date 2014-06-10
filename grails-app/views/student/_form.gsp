<%@ page import="com.meerkat.school.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="student.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${studentInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'grades', 'error')} ">
	<label for="grades">
		<g:message code="student.grades.label" default="Grades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.grades?}" var="g">
    <li><g:link controller="grade" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grade" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grade.label', default: 'Grade')])}</g:link>
</li>
</ul>


</div>

