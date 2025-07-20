
edge depends_on;

walker TaskTracker {
    has name: str;

    can start with `root entry;
    can link_tasks with task entry;
}

node task {
    has label: str;
}

# Deploy → Test → Build → Design
with entry:__main__ {
    root spawn TaskTracker("Deploy");
    root spawn TaskTracker("Test");
    root spawn TaskTracker("Build");

}