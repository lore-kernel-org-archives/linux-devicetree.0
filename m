From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 2/2] ARM: dts: sunxi: Add Olimex A20-SOM204-EVB-eMMC board
Date: Mon, 29 Jan 2018 15:56:40 +0200
Message-ID: <1517234202-1892-2-git-send-email-stefan@olimex.com>
References: <1517234202-1892-1-git-send-email-stefan@olimex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517234202-1892-1-git-send-email-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

A20-SOM204 board has option with onboard 16GB eMMC.
The chip is wired to MMC2 slot.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 Changes for v2:
   - Replaced license header with SPDX-License-Identifier

 arch/arm/boot/dts/Makefile                         |  1 +
 .../boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts  | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d88f04d..c890042 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -919,6 +919,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-mk808c.dtb \
 	sun7i-a20-olimex-som-evb.dtb \
 	sun7i-a20-olimex-som204-evb.dtb \
+	sun7i-a20-olimex-som204-evb-emmc.dtb \
 	sun7i-a20-olinuxino-lime.dtb \
 	sun7i-a20-olinuxino-lime2.dtb \
 	sun7i-a20-olinuxino-lime2-emmc.dtb \
diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts
new file mode 100644
index 0000000..c56620a
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Source for A20-SOM204-EVB-eMMC Board
+ *
+ * Copyright (C) 2018 Olimex Ltd.
+ *   Author: Stefan Mavrodiev <stefan@olimex.com>
+ */
+
+/dts-v1/;
+#include "sun7i-a20-olimex-som204-evb.dts"
+
+/ {
+	model = "Olimex A20-SOM204-EVB-eMMC";
+	compatible = "olimex,a20-olimex-som204-evb-emmc", "allwinner,sun7i-a20";
+
+	mmc2_pwrseq: mmc2_pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&pio 2 16 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins_a>;
+	vmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&mmc2_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	emmc: emmc@0 {
+		reg = <0>;
+		compatible = "mmc-card";
+		broken-hpi;
+	};
+};
-- 
2.7.4
