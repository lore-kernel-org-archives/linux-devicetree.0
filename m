From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 14/16] MIPS: BMIPS: Document the firmware->kernel DTB interface
Date: Thu, 27 Nov 2014 20:32:20 -0800
Message-ID: <1417149142-3756-15-git-send-email-cernekee@gmail.com>
References: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new section covering the Generic BMIPS machine type.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 Documentation/devicetree/booting-without-of.txt | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 77685185cf3b..e49e423268c0 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -15,6 +15,7 @@ Table of Contents
     1) Entry point for arch/arm
     2) Entry point for arch/powerpc
     3) Entry point for arch/x86
+    4) Entry point for arch/mips/bmips
 
   II - The DT block format
     1) Header
@@ -288,6 +289,33 @@ it with special cases.
   or initrd address. It simply holds information which can not be retrieved
   otherwise like interrupt routing or a list of devices behind an I2C bus.
 
+4) Entry point for arch/mips/bmips
+----------------------------------
+
+  Some bootloaders only support a single entry point, at the start of the
+  kernel image.  Other bootloaders will jump to the ELF start address.
+  Both schemes are supported; CONFIG_BOOT_RAW=y and CONFIG_NO_EXCEPT_FILL=y,
+  so the first instruction immediately jumps to kernel_entry().
+
+  Similar to the arch/arm case (b), a DT-aware bootloader is expected to
+  set up the following registers:
+
+         a0 : 0
+
+         a1 : 0xffffffff
+
+         a2 : Physical pointer to the device tree block (defined in chapter
+         II) in RAM.  The device tree can be located anywhere in the first
+         512MB of the physical address space (0x00000000 - 0x1fffffff),
+         aligned on a 64 bit boundary.
+
+  Legacy bootloaders do not use this convention, and they do not pass in a
+  DT block.  In this case, Linux will look for a builtin DTB, selected via
+  CONFIG_DT_*.
+
+  This convention is defined for 32-bit systems only, as there are not
+  currently any 64-bit BMIPS implementations.
+
 II - The DT block format
 ========================
 
-- 
2.1.0
