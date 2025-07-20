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
    print("[Info] Description:", describe_task(here.label));

    if [-->] {
        visit [-->];
        print("Traversing existing connection from:", here.label);
    } else {
        print("Processing new task node:", here.label);
        deps = suggest_dependencies(here.label);
        for dep_label in deps {
            dep_task = task(label=dep_label);
            here ++> dep_task;
            print("[LLM Link]", here.label, " --> ", dep_label);
        }
        disengage;
    }
}