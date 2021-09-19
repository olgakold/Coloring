"use strict"
var colorsElem={clockCir:'white'}
localStorage.setItem('clockDiv', JSON.stringify(colorsElem))
var radius=150;
var clockWidth=2*radius;
var clockHeight=2*radius;
var hours=12;
var angle=0;//угол для цифр
var angleDif=30;//угол между двумя цифрами на циферблате в градусах
var radiusHours=0.8*radius;//радиус для расчета размещения цифр на циферблате
var radiusClockCircle=0.12*radius;//радиус для контейнера цифр на циферблате  
var a=0.035*radius;//смещение цифр от 1 до 9 на циферблате относительно зеленого круга по оси X
var a2=0.07*radius;//смещение цифр от 10 до 12 на циферблате относительно зеленого круга по оси X
var b=0.04*radius;//смещение цифр на циферблате относительно зеленого круга по оси Y
var numberClockSize=0.13*radius;//размер цифр на циферблате
var secundStrelaY1=1.15*radius;//координата Y начала секундной стрелки
var secundStrelaY2=0.25*radius;//координата Y конца секундной стрелки
var minutStrelaY1=1.15*radius;//координата Y начала минутной стрелки
var minutStrelaY2=0.35*radius;//координата Y конца минутной стрелки
var minutStrelaWidth=0.03*radius;//толщина минутной стрелки
var hourStrelaY1=1.15*radius;//координата Y начала часовой стрелки
var hourStrelaY2=0.5*radius;//координата Y конца часовой стрелки
var hourStrelaWidth=0.05*radius//толщина часовой стрелки

var picS=document.getElementById('clockDiv');
var clock=document.createElementNS ( "http://www.w3.org/2000/svg" , "svg" );
picS.appendChild (clock);
clock.setAttribute ('width', clockWidth);
clock.setAttribute ('height',clockHeight);


var clockCircle=document.createElementNS("http://www.w3.org/2000/svg",'circle');
clockCircle.setAttribute("stroke","black");
clockCircle.setAttribute("fill",colorsElem.clockCir);
clockCircle.setAttribute("cx",radius);
clockCircle.setAttribute("cy",radius);
clockCircle.setAttribute("r",radius);
clockCircle.setAttribute("id","clockCir");
clock.appendChild(clockCircle);

for (var i=1; i<=hours; i++){
var clockCircles=document.createElementNS("http://www.w3.org/2000/svg",'circle');
clockCircles.setAttribute("fill","white");
clockCircles.setAttribute("stroke","black");
angle+=angleDif; 
var angleHour=angle/180*Math.PI;////угол между двумя цифрами на циферблате в радианах
var clockCircleCenterX=radius+radiusHours*Math.sin(angleHour);
var clockCircleCenterY=radius-radiusHours*Math.cos(angleHour);  
clockCircles.setAttribute("cx",clockCircleCenterX);
clockCircles.setAttribute("cy",clockCircleCenterY);
clockCircles.setAttribute("r",radiusClockCircle);
clockCircles.setAttribute("id",'clockCircles'+i);
colorsElem['clockCircles'+i]='white'
localStorage.setItem('clockDiv', JSON.stringify(colorsElem))
clock.appendChild(clockCircles);

var numberClock=document.createElementNS("http://www.w3.org/2000/svg",'text');
numberClock.setAttribute("font-size",numberClockSize)
numberClock.setAttribute("y",clockCircleCenterY+b);
if (i<10){
numberClock.setAttribute("x", clockCircleCenterX-a);
}
else {
numberClock.setAttribute("x", clockCircleCenterX-a2);
}
numberClock.textContent=i;
clock.appendChild(numberClock);
}

var secundStrela=document.createElementNS("http://www.w3.org/2000/svg",'line');
secundStrela.setAttribute ("x1", radius);
secundStrela.setAttribute ("x2", radius);
secundStrela.setAttribute ("y1", secundStrelaY1);
secundStrela.setAttribute ("y2", secundStrelaY2);
secundStrela.setAttribute ("stroke", "black");
secundStrela.setAttribute ("transform", "rotate (150 150 150)");
clock.appendChild (secundStrela);

var minutStrela=document.createElementNS("http://www.w3.org/2000/svg",'line');
minutStrela.setAttribute ("x1", radius);
minutStrela.setAttribute ("x2", radius);
minutStrela.setAttribute ("y1", minutStrelaY1);
minutStrela.setAttribute ("y2", minutStrelaY2);
minutStrela.setAttribute ("stroke", "black");
minutStrela.setAttribute ("stroke-width", minutStrelaWidth);
minutStrela.setAttribute ("transform", "rotate (60 150 150)");
minutStrela.setAttribute ("stroke-linecap","round" )
clock.appendChild (minutStrela);

var hourStrela=document.createElementNS("http://www.w3.org/2000/svg",'line');
hourStrela.setAttribute ("x1", radius);
hourStrela.setAttribute ("x2", radius);
hourStrela.setAttribute ("y1", hourStrelaY1);
hourStrela.setAttribute ("y2", hourStrelaY2);
hourStrela.setAttribute ("stroke", "black");
hourStrela.setAttribute ("stroke-width", hourStrelaWidth);
hourStrela.setAttribute ("stroke-linecap","round" )
clock.appendChild (hourStrela);

var colorsElemJson=JSON.stringify(colorsElem)
