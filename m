From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Devicetree fixes for v3.15
Date: Fri, 16 May 2014 15:27:39 +0100
Message-ID: <CACxGe6v5vAXypkOcX7ZLqpsDaVNxCGanYCuytWrLzu_6pRXFuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull the following bug fix branch.

Thanks,
g.

The following changes since commit 14186fea0cb06bc43181ce239efe0df6f1af260a:

  Merge tag 'locks-v3.15-4' of git://git.samba.org/jlayton/linux
(2014-05-13 11:33:09 +0900)

are available in the git repository at:


  git://git.secretlab.ca/git/linux tags/dt-for-linus

for you to fetch changes up to dfc44f8030653b345fc6fb337558c3a07536823f:

  mips: dts: Fix missing device_type="memory" property in memory nodes
(2014-05-16 15:22:53 +0100)

----------------------------------------------------------------
Drivercore bugfixes for v3.15

This branch contains bug fixes important to get into v3.15. There is a
fix for modifying properties seen during early boot, a fix for an
incorrect prototype when CONFIG_OF=n, and a couple of corrections to
device tree memory nodes on  a few platforms.

----------------------------------------------------------------
Leif Lindholm (2):
      arm: dts: Fix missing device_type="memory" for ste-ccu8540
      mips: dts: Fix missing device_type="memory" property in memory nodes

Stephen Rothwell (1):
      of: fix CONFIG_OF=n prototype of of_node_full_name()

Thomas Petazzoni (1):
      of: make of_update_property() usable earlier in the boot process

 arch/arm/boot/dts/ste-ccu8540.dts     | 1 +
 arch/mips/lantiq/dts/easy50712.dts    | 1 +
 arch/mips/ralink/dts/mt7620a_eval.dts | 1 +
 arch/mips/ralink/dts/rt2880_eval.dts  | 1 +
 arch/mips/ralink/dts/rt3052_eval.dts  | 1 +
 arch/mips/ralink/dts/rt3883_eval.dts  | 1 +
 drivers/of/base.c                     | 4 ++++
 include/linux/of.h                    | 2 +-
 8 files changed, 11 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
