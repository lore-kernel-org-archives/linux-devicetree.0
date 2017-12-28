From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v4 15/15] MIPS: ingenic: Initial GCW Zero support
Date: Thu, 28 Dec 2017 14:56:34 +0100
Message-ID: <20171228135634.30000-16-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228135634.30000-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GCW Zero (http://www.gcw-zero.com) is a retro-gaming focused
handheld game console, successfully kickstarted in ~2012, running Linux.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
---
 arch/mips/boot/dts/ingenic/Makefile |  1 +
 arch/mips/boot/dts/ingenic/gcw0.dts | 60 +++++++++++++++++++++++++++++++++++++
 arch/mips/configs/gcw0_defconfig    | 28 +++++++++++++++++
 arch/mips/jz4740/Kconfig            |  4 +++
 arch/mips/jz4740/boards.c           |  1 +
 5 files changed, 94 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/gcw0.dts
 create mode 100644 arch/mips/configs/gcw0_defconfig

 v2: No change
 v3: No change
 v4: No change

diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index 6a31759839b4..5b1361a89e02 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
+dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
new file mode 100644
index 000000000000..9c9a0137ccdf
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -0,0 +1,60 @@
+/dts-v1/;
+
+#include "jz4770.dtsi"
+
+/ {
+	compatible = "gcw,zero", "ingenic,jz4770";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial2:57600n8";
+	};
+
+	board {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <>;
+
+		otg_phy: otg-phy {
+			compatible = "usb-nop-xceiv";
+			clocks = <&cgu JZ4770_CLK_OTG_PHY>;
+			clock-names = "main_clk";
+		};
+	};
+};
+
+&ext {
+	clock-frequency = <12000000>;
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&cgu {
+	/* Put high-speed peripherals under PLL1, such that we can change the
+	 * PLL0 frequency on demand without having to suspend peripherals.
+	 * We use a rate of 432 MHz, which is the least common multiple of
+	 * 27 MHz (required by TV encoder) and 48 MHz (required by USB host).
+	 */
+	assigned-clocks =
+		<&cgu JZ4770_CLK_PLL1>,
+		<&cgu JZ4770_CLK_UHC>;
+	assigned-clock-parents =
+		<0>,
+		<&cgu JZ4770_CLK_PLL1>;
+	assigned-clock-rates =
+		<432000000>;
+};
+
+&uhc {
+	/* The WiFi module is connected to the UHC. */
+	status = "okay";
+};
diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
new file mode 100644
index 000000000000..471497033855
--- /dev/null
+++ b/arch/mips/configs/gcw0_defconfig
@@ -0,0 +1,28 @@
+CONFIG_MACH_INGENIC=y
+CONFIG_JZ4770_GCW0=y
+CONFIG_HIGHMEM=y
+# CONFIG_BOUNCE is not set
+CONFIG_PREEMPT_VOLUNTARY=y
+# CONFIG_SECCOMP is not set
+CONFIG_CROSS_COMPILE="mipsel-gcw0-linux-uclibc-"
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_EMBEDDED=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_SUSPEND is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_INGENIC=y
+CONFIG_USB=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_TMPFS=y
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 29a9361a2b77..4dd0c446ecec 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -8,6 +8,10 @@ config JZ4740_QI_LB60
 	bool "Qi Hardware Ben NanoNote"
 	select MACH_JZ4740
 
+config JZ4770_GCW0
+	bool "Game Consoles Worldwide GCW Zero"
+	select MACH_JZ4770
+
 config JZ4780_CI20
 	bool "MIPS Creator CI20"
 	select MACH_JZ4780
diff --git a/arch/mips/jz4740/boards.c b/arch/mips/jz4740/boards.c
index a3cf64cf004a..98a4d8e68cf0 100644
--- a/arch/mips/jz4740/boards.c
+++ b/arch/mips/jz4740/boards.c
@@ -12,5 +12,6 @@
 #include <asm/mips_machine.h>
 
 MIPS_MACHINE(MACH_INGENIC_JZ4740, "qi,lb60", "Qi Hardware Ben Nanonote", NULL);
+MIPS_MACHINE(MACH_INGENIC_JZ4770, "gcw,zero", "GCW Zero", NULL);
 MIPS_MACHINE(MACH_INGENIC_JZ4780, "img,ci20",
 			"Imagination Technologies CI20", NULL);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
