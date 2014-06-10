<%@ page import="com.meerkat.school.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${courseInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'ects', 'error')} required">
	<label for="ects">
		<g:message code="course.ects.label" default="Ects" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ects" type="number" value="${courseInstance.ects}" required=""/>

</div>

