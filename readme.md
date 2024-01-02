<div align="center">
<h1>
   <br>
   WEB-ASSEMBLY
</h1>
<h3>◦ <code>►This is a simple webserver written in Assembly </code></h3>
<h3>◦ Developed with the software and tools below.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GitHub-181717.svg?style=flat&logo=GitHub&logoColor=white" alt="GitHub">
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" alt="Markdown">
</p>

![license](https://img.shields.io/github/license/dev-seek/Web-Assembly.git?style=flat&labelColor=E5E4E2&color=869BB3)
![repo-language-count](https://img.shields.io/github/languages/count/dev-seek/Web-Assembly.git?style=flat&labelColor=E5E4E2&color=869BB3)
![repo-top-language](https://img.shields.io/github/languages/top/dev-seek/Web-Assembly.git?style=flat&labelColor=E5E4E2&color=869BB3)
![last-commit](https://img.shields.io/github/last-commit/dev-seek/Web-Assembly.git?style=flat&labelColor=E5E4E2&color=869BB3)
</div>

---

##  Quick Links
- [ Quick Links](#-quick-links)
- [ Overview](#-overview)
- [ Features](#-features)
- [ Repository Structure](#-repository-structure)
- [ Modules](#modules)
- [ Getting Started](#-getting-started)
    - [ Installation](#-installation)
    - [ Running Web-Assembly.git](#-running-Web-Assembly.git)
    - [ Tests](#-tests)
- [ Roadmap](#-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)

---

##  Overview

<code>► This is a sinmple webserver written in an Asssembly</code>

##  Repository Structure

```sh
└── Web-Assembly/
    └── web_s.asm

```

---

##  Getting Started

***Prerequisites***

Ensure you have the following dependencies installed on your system:

- `► flat assembler`

###  Installation

1. Clone the Web-Assembly.git repository:
```sh
git clone https://github.com/dev-seek/Web-Assembly.git
```

2. Change to the project directory:
```sh
cd Web-Assembly
```

3. Install the dependencies:
```sh
apt install fasm
## For debian based system 
```

###  Running Web-Server
Use the following command to run Web-Server:
```sh
► fasm  web_s.asm
```
### Result
You can see the result by doing :
```sh
► localhost:6969
## as we are using port 6969 here 
```
##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/dev-seek/Web-Assembly/pulls)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/dev-seek/Web-Assembly/discussions/1)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/dev-seek/Web-Assembly/issues)**: Submit bugs found or log feature requests for Web-Assembly.git.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone <your-forked-repo-url>
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear and concise message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

##  License


This project is protected under the <b><i>MIT License</b>. For more details, refer to the [LICENSE](LICENSE) file.

---

##  Acknowledgments

I used <b>Beej’s Guide to Network Programming(https://beej.us/guide/bgnet/pdf/bgnet_a4_c_1.pdf)</b> as referance 


---
