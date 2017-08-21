From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [V2 2/3] MIPS: Add Onion Omega2+ board
Date: Mon, 21 Aug 2017 11:55:30 +0100
Message-ID: <1503312931-34416-2-git-send-email-harvey.hunt@imgtec.com>
References: <1503312931-34416-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503312931-34416-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

The Onion Omega2+ is an MT7688A based board that has 128MB RAM and
multiple peripherals.

The MT7688A is pin compatible with the MT7628A, although the former
supports a 1T1R antenna whereas the MT7628A supports a 2R2T antenna.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
Changes in V2:
- Use uart0 phandle for stdout-path
- Add MT7628 compatible string

 MAINTAINERS                           |  6 ++++++
 arch/mips/boot/dts/ralink/Makefile    |  1 +
 arch/mips/boot/dts/ralink/omega2p.dts | 18 ++++++++++++++++++
 arch/mips/ralink/Kconfig              |  5 +++++
 4 files changed, 30 insertions(+)
 create mode 100644 arch/mips/boot/dts/ralink/omega2p.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f7721d..33b6bd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9675,6 +9675,12 @@ F:	drivers/regulator/twl-regulator.c
 F:	drivers/regulator/twl6030-regulator.c
 F:	include/linux/i2c-omap.h
 
+ONION OMEGA2+ BOARD
+M:	Harvey Hunt <harveyhuntnexus@gmail.com>
+L:	linux-mips@linux-mips.org
+S:	Maintained
+F:	arch/mips/boot/dts/ralink/omega2p.dts
+
 OMFS FILESYSTEM
 M:	Bob Copeland <me@bobcopeland.com>
 L:	linux-karma-devel@lists.sourceforge.net
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index 2a72259..88da019 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_DTB_RT2880_EVAL)	+= rt2880_eval.dtb
 dtb-$(CONFIG_DTB_RT305X_EVAL)	+= rt3052_eval.dtb
 dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
 dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
+dtb-$(CONFIG_DTB_OMEGA2P)		+= omega2p.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/boot/dts/ralink/omega2p.dts b/arch/mips/boot/dts/ralink/omega2p.dts
new file mode 100644
index 0000000..5884fd4
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/omega2p.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/include/ "mt7628a.dtsi"
+
+/ {
+	compatible = "onion,omega2+", "ralink,mt7688a-soc", "ralink,mt7628a-soc";
+	model = "Onion Omega2+";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+		stdout-path = &uart0;
+	};
+};
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 710b04c..6ee52bc 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -82,6 +82,11 @@ choice
 		depends on SOC_MT7620
 		select BUILTIN_DTB
 
+	config DTB_OMEGA2P
+		bool "Onion Omega2+"
+		depends on SOC_MT7620
+		select BUILTIN_DTB
+
 endchoice
 
 endif
-- 
2.7.4
