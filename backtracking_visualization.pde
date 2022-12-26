import java.util.*;
int height=500,width=800;
void setup(){
  size(800,600);
  stack.push(new State(0));
}
int a[]=new int[9];
Stack<State> stack=new Stack<>();
boolean once=false,solved=false;
//drawarraystructure vars
float l=(width-20)/9;
float x1=10,y1=(height/2)-(l/2);
//drawnumebr vars
int fontsize=width/10;
double time=(1.0/60)*Math.pow((new State(0)).arrval.length,a.length);
void draw(){
  if(solved){
    return;
  }
  if(stack.isEmpty()){
    solved=true;
  }else{
    display();
    State currstate=stack.peek();
    int ind=currstate.index;
    int k=currstate.currval;
    a[ind]=currstate.arrval[currstate.currval];
    if(ind>=8){
      State popping=stack.pop();
     if(k>=9){
       //print("here");
       a[popping.index]=0;
       State temp=stack.pop();
       while(!stack.isEmpty()&&temp.currval>=9){
         a[temp.index]=0;
         temp=stack.pop();
       }
      stack.push(new State(temp.index,temp.currval+1));
     }else{
     stack.push(new State(popping.index,popping.currval+1));
     }
    }else{
    ++ind;
    stack.push(new State(ind));
    }
  }
  
}
void counter(){
  
}
void display(){
  background(0);
  drawArrayStructure();
  drawNumbers();
  textAlign(CENTER,CENTER);
  stroke(255);
  textSize(30);
  text("Time required by to reach 999999999 : \n6 months 12 days 21 hours 37 minutes 47 seconds",width/2,3.0*height/4);
}
void drawNumbers(){
  textAlign(CENTER,CENTER);
  stroke(255);
  textSize(fontsize);
  for(int i=0; i<9; i++){
    text(a[i],10+(l/2)+(l*i),height/2-10);
    //print(a[i]+" ");
  }
}
void drawArrayStructure(){
  stroke(255);
  strokeWeight(5);
 line(x1,y1,width-15,y1);
 line(x1,y1+l,width-15,y1+l);
 for(int i=0; i<=9; i++){
  line(x1+i*l,y1,x1+i*l,y1+l);
 }
}
class State{
 int index;
 int arrval[]=new int[]{0,1,2,3,4,5,6,7,8,9};
 int currval=0;
 State(int i){
   this.index=i;
 }
 State(int i,int k){
   this.index=i;
   this.currval=k;
 }
}
