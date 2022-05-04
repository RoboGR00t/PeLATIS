# PeLATIS

**Pe**ntesting **L**inux **A**utomation **T**ool **I**nstalling **Software**

---

## Usage

- Add kali linux repos key

```bash
./pelatis.sh --key
```

- Enabling kali linux repos

```bash
./pelatis.sh --enable
```
- Now you can install any kali linux tool. After installing the tools you need disable kali repos.

> **Warning DO NOT upgrade your system while Kali repos are enabled**

- Disabling kali linux repos

```bash
./pelatis.sh --disable
```

- Installing tools safely

```
./pelatis.sh --install {tool1 tool2 tool3}

# example
./pelatis.sh --install burpsuit webshells john
```
- This flag automates the process of enabling and disabling the repos after the software is installed.
