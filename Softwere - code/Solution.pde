static class Solution {

  private static Step FirstStep=null;
  private static Step LastStep=null;
  public static void AddStep(char face, int dir) {
    Step next=new Step(null, face, dir);
    if (FirstStep==null) FirstStep=next;
    else LastStep.next=next;
    LastStep=next;
  }

  public static boolean PlayNext() {
    if (FirstStep==null) return true;
    ArduinoInterfejs.RotateFace(FirstStep.face, FirstStep.dir);
    FirstStep=FirstStep.next;
    return FirstStep==null;
  }

  public static boolean Optimize() {
    Step prev=null;
    if(FirstStep==null) return true;
    for (Step curr=FirstStep; curr.next!=null; prev=curr, curr=curr.next) {
      if (curr.IsOpposite(curr.next)) {
        RemoveNext(prev);
        RemoveNext(prev);
        return true;
      }
      if (curr.next.next!=null) {
        if (curr.next.IsEqual(curr.next.next) && curr.IsEqual(curr.next)) {
          RemoveNext(curr);
          RemoveNext(curr);
          curr.dir=1-curr.dir;
          return true;
        }
      }
    }
    return false;
  }

  public static String Print() {
    String s="";
    for (Step curr=FirstStep; curr!=null; curr=curr.next) {
      s=s+" ("+curr.face+curr.dir+")\n";
    }
    return s;
  }

  private static void RemoveNext(Step step) {
    if (step!=null) {
      step.next=step.next.next;
      return;
    }
    FirstStep=FirstStep.next;
  }
}

static class Step {
  Step next;
  char face;
  int dir;
  Step(Step next, char face, int dir) {
    this.next=next;
    this.face=face;
    this.dir=dir;
  }
  boolean IsEqual(Step step) {
    if (step==null) return false;
    return (step.face==face && step.dir==dir);
  }
  boolean IsOpposite(Step step) {
    if (step==null) return false;
    return (step.face==face && step.dir!=dir);
  }
}