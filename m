From: Hans de Goede <hdegoede@redhat.com>
Subject: [REGRESSION] "console: don't prefer first registered if DT specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Fri,  4 Nov 2016 13:11:34 +0100
Message-ID: <20161104121135.4780-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Burton <paul.burton@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi All,

While booting 4.9-rc# for the first time on an Allwinner A33 tablet,
I noticed that after u-boot the LCD display stayed black. It turns out
that there was an issue which caused X to never get up, and all kernel
(and other startup) messages prior to that only went to ttyS0 which
consists of 2 tiny testpads on the PCB with this tablet.

The same issue will also happen on any ARM boards which have a HDMI or
composite video output and which use a stdout-path pointing to their
serial console. I think this will e.g. also impact the Raspberry Pi,
I know for certain that this will impact the 99 different Allwinnner
boards currently supported by mainline u-boot + the mainline kernel.

This is a behavior changes from previous kernels and I consider this
a regression. Thus I propose to revert the commit in question, for more
info here is a partial copy of the commit message of the proposed revert:

The reverted commit changes existing behavior on which many ARM boards
rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
both a video output and a serial console. Depending on whether the user
is using the device as a more regular computer; or as a headless device
we need to have the console on either one or the other.

Many users rely on the kernel behavior of the console being present on
both outputs, before the reverted commit the console setup with no
console= kernel arguments on an ARM board which sets stdout-path in dt
would look like this:

[root@localhost ~]# cat /proc/consoles
ttyS0                -W- (EC p a)    4:64
tty0                 -WU (E  p  )    4:1

Where as after the reverted commit, it looks like this:

[root@localhost ~]# cat /proc/consoles
ttyS0                -W- (EC p a)    4:64

This commit reverts commit 05fd007e4629 ("console: don't prefer first
registered if DT specifies stdout-path") restoring the original behavior.

Regards,

Hans
