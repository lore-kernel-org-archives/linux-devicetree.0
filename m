From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 2/3] MIPS: dts: Add VoCore2 board
Date: Tue, 15 Aug 2017 17:32:52 +0100
Message-ID: <1502814773-40842-2-git-send-email-harvey.hunt@imgtec.com>
References: <1502814773-40842-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502814773-40842-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

The VoCore2 board is a low cost MT7628A based board with 128MB RAM, 16MB
flash and multiple external peripherals.

This initial DTS provides enough support to get to userland and use the USB
port.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 MAINTAINERS                           |  6 ++++++
 arch/mips/boot/dts/ralink/Makefile    |  1 +
 arch/mips/boot/dts/ralink/vocore2.dts | 18 ++++++++++++++++++
 arch/mips/ralink/Kconfig              |  5 +++++
 4 files changed, 30 insertions(+)
 create mode 100644 arch/mips/boot/dts/ralink/vocore2.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f7721d..82dcc6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14127,6 +14127,12 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/vmxnet3/
 
+VOCORE VOCORE2 BOARD
+M:	Harvey Hunt <harveyhuntnexus@gmail.com>
+L:	linux-mips@linux-mips.org
+S:	Maintained
+F:	arch/mips/boot/dts/ralink/vocore2.dts
+
 VOLTAGE AND CURRENT REGULATOR FRAMEWORK
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Mark Brown <broonie@kernel.org>
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index 2a72259..a191788 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_DTB_RT2880_EVAL)	+= rt2880_eval.dtb
 dtb-$(CONFIG_DTB_RT305X_EVAL)	+= rt3052_eval.dtb
 dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
 dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
+dtb-$(CONFIG_DTB_VOCORE2)		+= vocore2.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/boot/dts/ralink/vocore2.dts b/arch/mips/boot/dts/ralink/vocore2.dts
new file mode 100644
index 0000000..7591340
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/vocore2.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+#include "mt7628a.dtsi"
+
+/ {
+	compatible = "vocore,vocore2", "ralink,mt7628a-soc";
+	model = "VoCore2";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS2,115200";
+		stdout-path = "serial2:115200";
+	};
+};
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 710b04c..c2b2c2d 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -82,6 +82,11 @@ choice
 		depends on SOC_MT7620
 		select BUILTIN_DTB
 
+	config DTB_VOCORE2
+		bool "VoCore2"
+		depends on SOC_MT7620
+		select BUILTIN_DTB
+
 endchoice
 
 endif
-- 
2.7.4
