
import from mtllm.llms { Gemini }
glob llm =  Gemini(model_name="gemini-1.5-flash", verbose=False);

"""Generate a short description for the task"""
def describe_task(label: str) -> str by llm();

"""Suggest dependent tasks for a given task"""
def suggest_dependencies(label: str) -> list[str] by llm();

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
    # root spawn TaskTracker("Test");
    # root spawn TaskTracker("Build");

}