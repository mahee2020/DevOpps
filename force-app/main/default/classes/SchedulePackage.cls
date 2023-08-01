public with sharing class SchedulePackage implements Schedulable {
    public SchedulePackage() {

    }
    public void execute(SchedulableContext sc)
    {
     PackageSchedule b = new PackageSchedule(); //ur batch class
      database.executebatch(b);

    }

}