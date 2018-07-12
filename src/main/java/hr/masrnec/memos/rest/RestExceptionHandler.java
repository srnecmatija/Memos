package hr.masrnec.memos.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class RestExceptionHandler {

	@ExceptionHandler
	public ResponseEntity<RestResponseMessage> handleException(NotFoundException exc) {
		
		// not found message 404
		RestResponseMessage message = new RestResponseMessage();
		message.setStatus(HttpStatus.NOT_FOUND.value());
		message.setMessage(exc.getMessage());
		message.setTimestamp(System.currentTimeMillis());
		
		return new ResponseEntity<>(message, HttpStatus.NOT_FOUND);
	}
	
	@ExceptionHandler
	public ResponseEntity<RestResponseMessage> handleException(Exception exc) {
		
		// general error message 400
		RestResponseMessage message = new RestResponseMessage();
		message.setStatus(HttpStatus.BAD_REQUEST.value());
		message.setMessage(exc.getMessage());
		message.setTimestamp(System.currentTimeMillis());
		
		return new ResponseEntity<>(message, HttpStatus.BAD_REQUEST);
	}
	
}
