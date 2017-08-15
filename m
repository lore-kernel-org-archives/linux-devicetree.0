From: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] MIPS: Add Onion Omega2+ board
Date: Tue, 15 Aug 2017 17:35:44 +0100
Message-ID: <1502814945-41052-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
Cc: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Onion Omega2+ is an MT7688A based board that has 128MB RAM and
multiple peripherals.

The MT7688A is pin compatible with the MT7628A, although the former
supports a 1T1R antenna whereas the MT7628A supports a 2R2T antenna.

Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
---
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
+M:	Harvey Hunt <harveyhuntnexus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+L:	linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
+S:	Maintained
+F:	arch/mips/boot/dts/ralink/omega2p.dts
+
 OMFS FILESYSTEM
 M:	Bob Copeland <me-aXfl/3sk2vNUbtYUoyoikg@public.gmane.org>
 L:	linux-karma-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
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
index 0000000..e44dba3
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/omega2p.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/include/ "mt7628a.dtsi"
+
+/ {
+	compatible = "onion,omega2+", "ralink,mt7688a-soc";
+	model = "Onion Omega2+";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+		stdout-path = "serial0:115200";
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
