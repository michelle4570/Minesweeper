import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);

  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++)
    for (int c = 0; c < NUM_COLS; c++)
      buttons[r][c] = new MSButton(r, c);
  //for (int i = 0; i<5;i++);
  int i = 0;
  while (i<60){
  setMines();
  i++;
  }
}
public void setMines()
{
  //your code
  int row = (int)(Math.random()*NUM_ROWS);
  int col = (int)(Math.random()*NUM_COLS);
  if (!mines.contains(buttons[row][col]))
  {
    mines.add(buttons[row][col]);
  }
}
public void draw ()
{
  background(0);
  if (isWon()==true){
    displayWinningMessage();
  }
}
public boolean isWon()
{
  //your code here
  int marked=0;
  for(int i = 0;i<mines.size();i++){
    if(mines.get(i).isFlagged()){
      marked++;}
    }
  if (marked==mines.size()){
    return true;
    }
  return false;
}
public void displayLosingMessage()
{
  //your code here
      for(int i=0;i<mines.size();i++)
        if(mines.get(i).isClicked()==false)
            mines.get(i).mousePressed();
    buttons[9][6].setLabel("Y");
    buttons[9][7].setLabel("O");
    buttons[9][8].setLabel("U");
    buttons[9][9].setLabel("");
    buttons[9][10].setLabel("L");
    buttons[9][11].setLabel("O");
    buttons[9][12].setLabel("S");
    buttons[9][13].setLabel("E");
}
public void displayWinningMessage()
{
  //your code here
    buttons[9][7].setLabel("Y");
    buttons[9][8].setLabel("O");
    buttons[9][9].setLabel("U");
    buttons[9][10].setLabel("");
    buttons[9][11].setLabel("W");
    buttons[9][12].setLabel("I");
    buttons[9][13].setLabel("N");
}
public boolean isValid(int r, int c)
{
  if ((c< NUM_COLS)&&(r<NUM_ROWS)&&(r >=0)&&(c>=0))
    return true; 
  return false;
}
public int countMines(int row, int col)
{
  int numMines = 0;
  //your code here 
  /*
        if(isValid(row-1,col-1))
            if(mines.contains(buttons[row-1][col-1]))
                numMines++;
        if(isValid(row-1,col))
            if(mines.contains(buttons[row-1][col]))
                numMines++;
        if(isValid(row-1,col+1))
            if(mines.contains(buttons[row-1][col+1]))
                numMines++;
        if(isValid(row,col-1))
            if(mines.contains(buttons[row][col-1]))
                numMines++;
        if(isValid(row,col+1))
            if(mines.contains(buttons[row][col+1]))
                numMines++;
        if(isValid(row+1,col-1))
            if(mines.contains(buttons[row+1][col-1]))
                numMines++;
        if(isValid(row+1,col))
            if(mines.contains(buttons[row+1][col]))
                numMines++;
        if(isValid(row+1,col+1))
            if(mines.contains(buttons[row+1][col+1]))
                numMines++;
        return numMines;
  */
  for (int r = row-1; r<=row+1; r++) {
    for (int c = col-1; c<=col+1; c++) {
      if (isValid(r,c)){
        if (mines.contains(buttons[r][c])){
        numMines++;
    }
      }
  }
  }
  return numMines;
}
public class MSButton
{
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean clicked, flagged;
  private String myLabel;

  public MSButton ( int row, int col )
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    myLabel = "";
    flagged = clicked = false;
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () 
  {
    clicked = true;
    if(mouseButton==LEFT){
      if(clicked==false){ 
        if(keyPressed == true){
            flagged = !flagged;
          //if(flagged==true){ 
         //   flagged=false;
      // }
       }
      }
     }
       if(mouseButton==RIGHT){
         if (clicked==false){
             flagged=!flagged;
            // clicked = true;
        }
       }
      else if ( mines.contains(this)){
      displayLosingMessage();
      for(int i=0;i<mines.size();i++)
                if(mines.get(i).clicked==false)
                mines.get(i).mousePressed();
    }
    else if((countMines(myRow,myCol)>0)&&(!isFlagged())){
    fill(0);  
    strokeWeight(1);
    myLabel = ""+ (countMines(myRow,myCol));
    }
     else{
       if(isValid(myRow-1,myCol) && !buttons[myRow-1][myCol].clicked)
         buttons[myRow-1][myCol].mousePressed();
       if(isValid(myRow-1,myCol-1) && !buttons[myRow-1][myCol-1].clicked)
         buttons[myRow-1][myCol-1].mousePressed();
        if(isValid(myRow-1,myCol+1) && !buttons[myRow-1][myCol+1].clicked)
         buttons[myRow-1][myCol+1].mousePressed();
        if(isValid(myRow,myCol-1) && !buttons[myRow][myCol-1].clicked)
         buttons[myRow][myCol-1].mousePressed();
        if(isValid(myRow+1,myCol-1) && !buttons[myRow+1][myCol-1].clicked)
         buttons[myRow+1][myCol-1].mousePressed();
        if(isValid(myRow+1,myCol) && !buttons[myRow+1][myCol].clicked)
         buttons[myRow+1][myCol].mousePressed();
        if(isValid(myRow+1,myCol+1) && !buttons[myRow+1][myCol+1].clicked)
         buttons[myRow+1][myCol+1].mousePressed();
        if(isValid(myRow,myCol+1) && !buttons[myRow][myCol+1].clicked)
         buttons[myRow][myCol+1].mousePressed();
  /* for (int r = myRow-1; r<=myRow+1; r++) {
    for (int c = myCol-1; c<=myCol+1; c++) {
      if (isValid(r, c) && !buttons[r][c].clicked)
        buttons[r][c].mousePressed();
      //if (isValid(r, c) && !buttons[r][c].clicked)){
    }}}*/
    }
  }
public void draw () 
{    
  stroke(255);
  if (flagged)//problem with flagged
    fill(255,0,0);
   //fill(256,206,0);
    //triangle(x+10,y+4, x+8, y+13, x+12,y+13);
  else if ( clicked && mines.contains(this)) 
    fill(255, 0, 0);
  else if (clicked)
    fill( 200 );
  else 
    fill( 100 );

  rect(x, y, width, height);
  fill(0);
  text(myLabel, x+width/2, y+height/2);
}
public void setLabel(String newLabel)
{
  myLabel = newLabel;
}

public void setLabel(int newLabel){
  myLabel = ""+ newLabel;
}

public boolean isFlagged()
{
  return flagged;
}
    public boolean isClicked()
    {
        return clicked;
    }
}
