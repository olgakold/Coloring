"use strict"

 var palitra=document.getElementById('palitra')
 var colors=['purple', 'blue', 'yellow',  'white', 'teal', 'red', 'silver', 'orange', 'olive', 'navy', 'maroon','lime',  'green', 'fuchsia', 'aqua', 'black',]//цвета доступные к выбору
 var palitraDivLeft=150;//координата X палитры
 var palitraDivTop;//координата Y палитры
 var colorsNumber=colors.length//количество цветов
 var palitraHeight=130;//высота блока с палитрой
 var palitraBlockWidth=40;//ширина квадратика с цветом
 var palitraBlockHeight=40;//высота квадратика с цветом
 var palitraBlockLeft=0;//координата X блока с цветом
 var palitraBlockLeft2=0;//координата X блока с цветом
 var palitraBlockTop//координата Y блока с цветом
 var aktBlockDivTop=10//координата Y блока с активным цветом
 var ramka=2;//рамка блока с цветом
 var buttSTopY// координата Y блока с кнопками
 var buttSTopX// координата Y блока с кнопками
 var picsElemX//координата X блока с картинками
 var picsElemY//координата Y блока с картинками
 var aktPX//координата X выбранной картинки
 var aktPY//координата Y выбранной картинки

var palitraDiv=document.getElementById('palitraDiv');
palitraDiv.style.top=palitraDivTop+'px'

  for (var i=0; i<colorsNumber/2; i++){
   var palitraBlock=document.createElement ('div')
   palitra.appendChild(palitraBlock);
   palitraBlock.style.width=palitraBlockWidth+'px';
   palitraBlock.style.height=palitraBlockHeight+'px';
   palitraBlock.style.backgroundColor=colors[i];
   palitraBlock.setAttribute('id','palBlock');
   palitraBlock.style.left=palitraBlockLeft+'px';
   palitraBlockLeft+=palitraBlockHeight+ramka;
   palitraBlock.style.top=0+'px'

 }
 for (var i=Math.round(colorsNumber/2); i<colorsNumber;i++){
   var palitraBlock=document.createElement ('div')
   palitra.appendChild(palitraBlock);
   palitraBlock.style.width=palitraBlockWidth+'px';
   palitraBlock.style.height=palitraBlockHeight+'px';
   palitraBlock.style.backgroundColor=colors[i];
   palitraBlock.setAttribute('id','palBlock');   
   palitraBlock.style.left=palitraBlockLeft2+'px';
   palitraBlockLeft2+= palitraBlockWidth+ramka;
   palitraBlock.style.top=palitraBlockHeight+ramka+'px'
 }

var aktBlockDiv=document.getElementById('aktColorDiv');
var aktBlock=document.getElementById('aktColor');
aktBlock.style.width=palitraBlockWidth+'px';
aktBlock.style.height=palitraBlockHeight+'px';
aktBlock.style.backgroundColor=localStorage.getItem('choiceColor');
var buttS=document.getElementById('buttons');
var buttElem=buttS.getElementsByTagName('button');
var picsElem=document.getElementById('pictures');
var aktP=document.getElementById('aktPic')

//функция, подклющая стилевой файл в зависимости от ориентации и размера экрана
function changeView(href) {
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.href = href;
    document.head.appendChild(link);
    }
//функция, меняющая вид страницы в зависимости от размера окна
function view (x) {
  if (x.matches) { //маленький размер
    changeView("styleLitl.css");
  }    
  else {//большой размер
    changeView("styleBig.css");
  }
  }

var x = window.matchMedia("(max-width: 750px)")
view(x) 
x.addListener(view) 

//функция, меняющая вид страницы в зависимости от ориентации экрана
function viewOrient (y) {
  if (y.matches) { //вертикальная ориентация
    changeView("styleVert.css");
  }    
  else {//горизонтальная ориентация
    changeView("styleBig.css");
    
  }
}
var y = window.matchMedia("(orientation: portrait)");
viewOrient(y) 
y.addListener(viewOrient)

//выбираем цвет рисования и сохраняем в local storage
localStorage.setItem('choiceColor', "white")
aktBlock.style.backgroundColor=localStorage.getItem('choiceColor'); 
var picElem=picsElem.getElementsByTagName('div');
for (var l=0;l<picElem.length;l++){
let pElem=picElem[l];
var divelem=document.getElementById('palitra')
var elem=divelem.getElementsByTagName('div');
for (var k=0;k<colorsNumber;k++){
let colorElem=elem[k];
colorElem.onclick=function (EO){
    EO=EO||window.event;
    var choiceColor=window.getComputedStyle(colorElem).backgroundColor;
    aktBlock.style.backgroundColor=choiceColor; 
    localStorage.setItem('choiceColor', choiceColor)  
}
}
}

//выбираем рисунок и зарисовыем элементы рисунка
for (var l=0;l<picElem.length;l++){
  let pElem=picElem[l];
  pElem.onclick=function (EO){
    var oldElem=aktP.childNodes[0];
    var localStName=pElem.getAttribute('id'); 
    window.location.hash=localStName;
    if (oldElem.childNodes.length>0){
      start (oldElem)
    }
    aktP.replaceChild(pElem.cloneNode(true), oldElem)
    var c=aktP.getElementsByTagName ('svg');
    var b=c[0].querySelectorAll ("[fill]")
    for (var n=0; n<b.length; n++){
    let paintElem=b[n]    
    paintElem.onclick=function (EO){
    EO=EO||window.event;
    paintElem.setAttribute("fill",localStorage.getItem('choiceColor'));   
    var localStName=pElem.getAttribute('id');
    var localSt=JSON.parse(localStorage.getItem(localStName));
    var localKey=paintElem.getAttribute('id');
    localSt[localKey]=localStorage.getItem('choiceColor')
    localStorage.setItem(localStName, JSON.stringify(localSt))       
}


}
}
}   

 aktP.onmouseover=function (EO) {
        EO=EO||window.event;
        var c=aktP.getElementsByTagName('div')
        var localStName=c[0].getAttribute('id');
        var paintSVG=c[0].getElementsByTagName('svg');
        var paintElemId=EO.target.id;
        if (paintElemId!=""){
        var paintElemHover=paintSVG[0].getElementById(paintElemId); 
        var localSt=JSON.parse(localStorage.getItem(localStName));
        var changeElemHover=document.createElementNS
        ("http://www.w3.org/2000/svg",'animate');
        paintElemHover.appendChild(changeElemHover);
        changeElemHover.setAttribute ("attributeName", "fill");
        changeElemHover.setAttribute ("from", localSt[paintElemId]);
        changeElemHover.setAttribute ("to", localStorage.getItem('choiceColor'));
        changeElemHover.setAttribute ("dur", "3s");
        changeElemHover.setAttribute ("fill", "freeze"); 
        changeElemHover.setAttribute ("begin", "indefinite");
        changeElemHover.setAttribute ("id", "anim");
        var animation = document.getElementById("anim")
        function showElemHover(){
         animation.beginElement();
        }
        showElemHover ()   
 }
 }
  aktP.onmouseout=function (EO) {
        EO=EO||window.event;
        var c=aktP.getElementsByTagName('div')
        var localStName=c[0].getAttribute('id');
        var paintSVG=c[0].getElementsByTagName('svg');
        var paintElemIdOut=EO.target.id;
        if (paintElemIdOut!=""){
        var paintElemHoverOut=paintSVG[0].getElementById(paintElemIdOut); 
        var localSt=JSON.parse(localStorage.getItem(localStName));
        var delAnimate=paintElemHoverOut.getElementsByTagName('animate');
        paintElemHoverOut.removeChild(delAnimate[0]);
        paintElemHoverOut.setAttribute("fill",localSt[paintElemIdOut]);     

          
 }  
  }        
 



//сохраняем в AJAX
function save(){  
    if (aktP.childNodes[0].childNodes.length==0){
     alert ('Выберите картинку')
    }

    else{
    var zzz=aktP.getElementsByTagName('div');
    var localStName=zzz[0].getAttribute('id');
    var ajaxHandlerScript="https://fe.it-academy.by/AjaxStringStorage2.php";
    var updatePassword;
    var stringName='KOLDENKOVA_PAINT_'+localStName;

  function Info() {
    updatePassword=Math.random();
    $.ajax( {
            url : ajaxHandlerScript, type : 'POST', cache : false, dataType:'json',
            data : { f : 'LOCKGET', n : stringName, p : updatePassword },
            success : lockGetReady, error : errorHandler
        }
    );
   }

  function lockGetReady(callresult) {
    if ( callresult.error!=undefined ){
        alert(callresult.error);}
    else {  
        $.ajax( {
                url : ajaxHandlerScript, type : 'POST', cache : false, dataType:'json',
                data : { f : 'UPDATE', n : stringName, v : localStorage.getItem(localStName), p : updatePassword },
                success : updateReady, error : errorHandler
            }
        );
    }
   }

  function updateReady(callresult) {
    if ( callresult.error!=undefined )
        alert(callresult.error);
  }

  function errorHandler(jqXHR,statusStr,errorStr) {
    alert(statusStr+' '+errorStr);
  }

  Info()
}
}

//показываем последний сохранённый в AJAX
function showLast(){
    if (aktP.childNodes[0].childNodes.length==0){
      alert ('Выберите картинку')
    }

    else{
 
    var zzz=aktP.getElementsByTagName('div');
    var localStName=zzz[0].getAttribute('id');
    var ajaxHandlerScript="https://fe.it-academy.by/AjaxStringStorage2.php";
    var updatePassword;
    var stringName='KOLDENKOVA_PAINT_'+localStName;

    $.ajax(
        {
            url : ajaxHandlerScript, type : 'POST', cache : false, dataType:'json',
            data : { f : 'READ', n : stringName },
            success : readReady, error : errorHandler
        }
    );
    function readReady(callresult) {
      if ( callresult.error!=undefined )
        alert(callresult.error);
       else if ( callresult.result!="" ) {
        var colorsLast=JSON.parse(callresult.result);
      localStorage.setItem(localStName, callresult.result)
        var b=zzz[0].querySelectorAll ("[fill]")  
      for (var n=0; n<b.length; n++){
        var localKey=b[n].getAttribute('id');
        b[n].setAttribute("fill",colorsLast[localKey]);  
    }     

    }
   }

    function errorHandler(jqXHR,statusStr,errorStr) {
       alert(statusStr+' '+errorStr);
}
}
}
//начинаем заново рисовать выбранный рисунок
function start (el){
    if (aktP.childNodes[0].childNodes.length==0){
      alert ('Выберите картинку')
    }

    else{

    el=aktP.childNodes[0];
    var colorss={}
    var c=el.getElementsByTagName ('svg');
    var b=c[0].querySelectorAll ("[fill]")
    for (var n=0; n<b.length; n++){
    b[n].setAttribute("fill","white");   
    var localKey=b[n].getAttribute('id');
    colorss[localKey]='white';
    }
    var localStName=el.getAttribute('id');
    localStorage.setItem(localStName, JSON.stringify(colorss));

    }
}
//автовоспроизведение зарисовки

function show (){
    if (aktP.childNodes[0].childNodes.length==0){
      alert ('Выберите картинку')
    }

    else{

      var c=aktP.getElementsByTagName('div');
      var localStName=c[0].getAttribute('id');
      var localSt=JSON.parse(localStorage.getItem(localStName));
      var b=c[0].querySelectorAll ("[fill]")  
      for (var n=0; n<b.length; n++){
        b[n].setAttribute("fill","white"); 
      }

      var count=0;
      var intervalId = setInterval(function(){  
      count++
      if(count == (b.length)){
        clearInterval(intervalId);
        setInterval (deleteAnimate, 5000)
       }
      else {   
        showElem (count)
        var animation = document.getElementById("animate"+count) 
        function showElemAnim(){
         animation.beginElement();
        }
        showElemAnim () 
       }    
      }, 1000);



  function showElem (count){
    var c=aktP.getElementsByTagName('div');
    var localStName=c[0].getAttribute('id');
    var localSt=JSON.parse(localStorage.getItem(localStName));
    var localKey=b[count].getAttribute('id');
    var changeElem=document.createElementNS("http://www.w3.org/2000/svg",'animate');
    b[count].appendChild(changeElem);
    changeElem.setAttribute ("attributeName", "fill");
    changeElem.setAttribute ("from", "white");
    var localKey=b[count].getAttribute('id');
    changeElem.setAttribute ("to", localSt[localKey]);
    changeElem.setAttribute ("dur", "5s");
    changeElem.setAttribute ("fill", "freeze");
    changeElem.setAttribute ("begin", "indefinite");
    changeElem.setAttribute ("id", "animate"+count);
    }
    showElem (count)
        var animation = document.getElementById("animate0")

        function showElemAnim(){
         animation.beginElement();
        }
        showElemAnim () 
  function deleteAnimate (){
   for (var n=0; n<b.length; n++){
    var delAnimate=b[n].getElementsByTagName('animate');
    var localKey=b[n].getAttribute('id');
    b[n].removeChild(delAnimate[0]);
    b[n].setAttribute("fill",localSt[localKey]); 
    } 
  }
 }
 }



window.onhashchange=hashChange;
window.onload=hashChange;

function hashChange(){
  var eHash=window.location.hash
     if (eHash!=""){
     var elemHash=document.getElementById(eHash.substr(1))
     var oldElem=aktP.childNodes[0];
     aktP.replaceChild(elemHash.cloneNode(true), oldElem)
     var localStName=elemHash.getAttribute('id');
    var c=aktP.getElementsByTagName ('svg');
    var b=c[0].querySelectorAll ("[fill]")
    for (var n=0; n<b.length; n++){
    let paintElem=b[n]    
    paintElem.onclick=function (EO){
    EO=EO||window.event;
    paintElem.setAttribute("fill",localStorage.getItem('choiceColor'));   
    var localStName=elemHash.getAttribute('id');
    var localSt=JSON.parse(localStorage.getItem(localStName));
    var localKey=paintElem.getAttribute('id');
    localSt[localKey]=localStorage.getItem('choiceColor')
    localStorage.setItem(localStName, JSON.stringify(localSt))   

  }
    }
  }
 else {
   var oldElem=aktP.childNodes[0];
   var hashText=document.createTextNode('Выберите картинку')
   aktP.replaceChild(hashText.cloneNode(true), oldElem)
}

}
  window.onbeforeunload=befUnload;

  function befUnload(EO) {
    EO=EO||window.event;
    EO.returnValue='У Вас есть несохранненые данные';

    
  };
