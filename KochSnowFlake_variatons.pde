KochLines lines1;
KochLines lines2;
KochLines lines3;

void setup() {
  size(800, 800);
  lines1 = new KochLines();
  lines2 = new KochLines();
  lines3 = new KochLines();
  lines1.add(new KochLine(new PVector(10, 300), new PVector(width-10, 300)));
  lines2.add(new KochLine(new PVector(width-10, 300), new PVector(width/2, 600)));
  lines3.add(new KochLine(new PVector(width/2, 600), new PVector(10, 300)));

  for (int i = 0; i< 4; i++) {
    lines1.generate();
    lines2.generate();
    lines3.generate();
  }
}

void draw() {
  background(255);
  lines1.display();
  lines2.display();
  lines3.display();
}




class KochLine {

  PVector start;
  PVector end;

  KochLine(PVector s, PVector e) {
    start = s.get();
    end = e.get();
  }

  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }

  PVector kochA() {
    return start.get();
  }

  PVector kochE() {
    return end.get();
  }

  PVector kochB() {

    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }

  PVector kochD() {

    PVector v = PVector.sub(end, start);
    v.mult(2.0/3);
    v.add(start);
    return v;
  }

  PVector kochC() {
    PVector a = start.get();

    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v);

    v.rotate(-radians(60));
    a.add(v);

    return a;
  }
}


class KochLines {

  ArrayList<KochLine> lines;

  KochLines() {
    lines = new ArrayList<>();
  }

  void add(KochLine line) {

    lines.add(line);
  }

  void generate() {


    ArrayList<KochLine> newLines = new ArrayList<>();

    for (int i = 0; i<lines.size(); i++) {

      PVector a = lines.get(i).kochA();
      PVector b = lines.get(i).kochB();
      PVector c = lines.get(i).kochC();
      PVector d = lines.get(i).kochD();
      PVector e = lines.get(i).kochE();

      newLines.add(new KochLine(a, b));
      newLines.add(new KochLine(b, c));
      newLines.add(new KochLine(c, d));
      newLines.add(new KochLine(d, e));
    }
    lines = newLines;
  }

  void display() {
    for (int i = 0; i<lines.size(); i++) {
      lines.get(i).display();
    }
  }
}
