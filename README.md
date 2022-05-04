# PeLATIS

**Pe**ntesting **L**inux **A**utomation **T**ool **I**nstalling **S**oftware

---

## Usage

- Add Kali linux repos key

```bash
./pelatis.sh --key
```
> This step must executed only once.

- Enabling Kali linux repos

```bash
./pelatis.sh --enable
```
- Now you can install any Kali linux tool. After installing the tools you need disable the kali repos.

> **Warning DO NOT upgrade your system while the Kali repos are enabled**

- Disabling Kali linux repos

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
