# Task Dependency Tracker (Jac)

This project implements a simple **Task Dependency Tracker** using the [Jac programming language](https://www.jac-lang.org/). It demonstrates how to model and traverse task dependencies using node-edge graph logic.

## 📌 Features

- Define tasks as nodes with labels.
- Automatically create or reuse task nodes.
- Link tasks based on predefined dependency rules:
  - `Deploy → Test → Build → Design`
- Traverse the task graph and dynamically build dependency chains.
- Print trace logs of how tasks are connected and visited.

## 🛠️ Technologies

- **Language**: [Jac](https://www.jac-lang.org/) – a domain-specific language for graph-based programming.
- **Graph Model**: Nodes (`task`), Edges (`depends_on`), Walkers (`TaskTracker`).


## 🚀 Getting Started

1. Install Jac CLI (see [JAC install guide](https://www.jac-lang.org/learn/getting_started/))
2. Run the task.jac file using the JAC engine:

```bash
jac run task.jac
```

## 🧪 Output 

This will be the sample output in the terminal.

```bash
Processing new task node: Deploy
[Link] Deploy --> Test
Traversing existing connection from: Deploy
Processing new task node: Test
[Link] Test --> Build
Traversing existing connection from: Deploy
Traversing existing connection from: Test
Processing new task node: Build
[Link] Build --> Design
```

## 🤖 LLM Integration

This project integrates a Large Language Model (LLM) to enhance the task graph with AI-generated insights such as:

- Task descriptions
- Suggested dependencies
- Contextual hints for nodes

We use the [`mtllm.llm`](https://www.jac-lang.org/learn/mtllm/) module in JAC to access LLMs like **OpenAI GPT-4o** or **Gemini 2.0 Flash**.

### 🔌 LLM Setup

Ensure you have the required LLM setup in your environment.

1. Add this import at the top of your `.jac` file:

```jac
import from mtllm.llms { Gemini }

glob llm =  Gemini(model_name="gemini-1.5-flash", verbose=False);
```

## 🧪 Output for llm based task dependency

```bash
INFO - AFC is enabled with max remote calls: 10.
INFO - AFC remote call 1 is done.
[Info] Description: Deploying the application.
Processing new task node: Deploy
INFO - AFC is enabled with max remote calls: 10.
INFO - AFC remote call 1 is done.
[LLM Link] Deploy  -->  Prepare deployment environment
[LLM Link] Deploy  -->  Build artifacts
[LLM Link] Deploy  -->  Run tests
[LLM Link] Deploy  -->  Deploy to staging
[LLM Link] Deploy  -->  Verify deployment
[LLM Link] Deploy  -->  Deploy to production
```
