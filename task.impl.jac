# task.impl.jac

impl TaskTracker.start {
    if not [root --> (`?task)] {
        next = root ++> task(label=self.name);
        # print("Created task:", next);
    } else {
        next = [root --> (`?task)];
        #  print("Reusing existing task:", next);
    }
    visit next;
}


# Deploy → Test → Build → Design
impl TaskTracker.link_tasks {
    if [-->] {
        visit [-->];
         print("Traversing existing connection from:", here.label);
    } else {
        print("Processing new task node:", here.label);
        if here.label == "Build" {
            design_task = task(label="Design");
            here ++> design_task;
            print("[Link] Build --> Design");
        } elif here.label == "Test" {
            build_task = task(label="Build");
            here ++> build_task;
            print("[Link] Test --> Build");
        } elif here.label == "Deploy" {
            test_task = task(label="Test");
            here ++> test_task;
            print("[Link] Deploy --> Test");
        } elif here.label == "Design" {
            print("[Info] Design task is a ending point, no dependencies to link.");
        }else{
             print("[Info] No specific dependency rule for:", here.label);
        }
        # print("Finished linking task:", here.label, '\n');
        disengage;
    }
}