# Ft_linux

As the 42 subject guideline states:
```
    In this project we have to build a basic, but functional, linux
    distribution.
    This project is not about Kernel programming, but it’s highly related.
    This distro will be the base for all our kernel projects, because all our kernel-code will
    be executed here, on this distro.
```

## Resources
[The bibile](https://www.linuxfromscratch.org/lfs/downloads/stable-systemd/LFS-SYSD-BOOK-13.1.pdf):  \
This book is more than enough to get it all done, up and running. be very careful about the ***packages***, ***versions!*** \

[Guide article by tonybtw](https://tonybtw.com/tutorial/linux-from-scratch/):  \
A more simplified guide, with tips, but the books should not be overlooked. this one serves as notes from the book and should not replace it.

## Genearl instruction
First You must set a virtual machine using a linux distribution as a host system where you can build and create your own.
I would recommand using Gentoo since it has all the packages needed, preinstalled so you can get into the work without losing any time.

### Resources allocation
Try Allocating the neccessary resources for the VM, like:
* 20G of disk space (At least).
* 4G or RAM, 8 is perfect.
* As many CPU cores as you can spare, it would be very useful when compiling the packages and would definitely afford you lots of time

### Environment setup

When you boot up into your Gento live gui/cli, The first things you want to do are:
* Setup a user and root password since it comes without a password for both
` sudo passwd /root/gentoo`
* launch the sshd daemon so you can connect from another terminal, it'll be easier that way
`/etc/init.d/sshd start`
