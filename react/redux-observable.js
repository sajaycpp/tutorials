/*
https://stackblitz.com/edit/rxjs-cczzww?devtoolsheight=60

import { from } from 'rxjs';
import { mapTo, map, filter } from 'rxjs/operators';


const source = from([{ type: 'villages', payload: 'Trpa, Prvm, mvvtp' },
{ type: 'cities', payload: 'ekm, tcr, sbc' }
]).pipe(
  filter( x => x.type == 'cities'),
  map(x => ({type: 'mapped', payload: x.payload}) ),
  mapTo('H')
);

source.subscribe(x => console.log(x));

*/


function myObservable(aryToObserve){
	
	this.subject = aryToObserve;
	
}


myObservable.prototype.pipe = function(){
	var newSubject = this.subject;
	for(var x = 0; x < arguments.length; x++ ){
		if ( typeof(arguments[x]) == 'function' ){
			debugger;
			newSubject = arguments[x]( newSubject.slice(0) );
		}
	}
	
	//console.log(newSubject);
	return newSubject;
}

// Why we use higher order functions?
//	Ans:
//		As the filter functions here is a independent function or operator and is not running under the observable context, the observable context data will not be available for the filter function. Hence, the filter will return its  actual function body as a anonymous function and let the observable to execute it by passing the context data as function arguments. 
function filter(callBackfun){
	return function(subjectAry){
		var counter = 0;
		for(var x = 0; (x-counter) < subjectAry.length; x++ ){
			if( !callBackfun(subjectAry[x-counter]) ){
				subjectAry.splice(x-counter, 1);
				counter++;
			}
		}
		return subjectAry;
	}
}

function mapTo(mapToObj){
	
	return function(subjectAry){
		for(var x = 0; x < subjectAry.length; x++ ){
			subjectAry[x] = mapToObj;
		}
		return subjectAry;
	}
}

function map(callBackfun){
	
	return function(subjectAry){
		for(var x = 0; x < subjectAry.length; x++ ){
			
			subjectAry[x] = callBackfun(subjectAry[x]);
		}
		return subjectAry;
	}
}


new myObservable([{ type: 'villages', payload: 'Trpa, Prvm, mvvtp' },
{ type: 'cities', payload: 'ekm, tcr, sbc' }
]).pipe( filter( x => x.type == 'cities'),
  map(x => ({type: 'mapped', payload: x.payload}) ),
  mapTo('H'));
