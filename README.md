# Task Dependency Tracker (JAC)

This project implements a simple **Task Dependency Tracker** using the [JAC programming language](https://www.jac-lang.org/). It demonstrates how to model and traverse task dependencies using node-edge graph logic.

## 📌 Features

- Define tasks as nodes with labels.
- Automatically create or reuse task nodes.
- Link tasks based on predefined dependency rules:
  - `Deploy → Test → Build → Design`
- Traverse the task graph and dynamically build dependency chains.
- Print trace logs of how tasks are connected and visited.

## 🛠️ Technologies

- **Language**: [JAC](https://www.jac-lang.org/) – a domain-specific language for graph-based programming.
- **Graph Model**: Nodes (`task`), Edges (`depends_on`), Walkers (`TaskTracker`).


## 🚀 Getting Started

1. Install JAC CLI (see [JAC install guide](https://www.jac-lang.org/learn/getting_started/))
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



