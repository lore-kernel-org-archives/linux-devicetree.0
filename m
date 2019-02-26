From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 2/2] arm64: allwinner: a64: Add Oceanic A64-5inMFD initial support
Date: Tue, 26 Feb 2019 11:32:40 +0530
Message-ID: <20190226060240.8783-2-jagan@amarulasolutions.com>
References: <20190226060240.8783-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226060240.8783-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Pannell <ryan@osukl.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Oceanic A64-5inMFD is a 5 inch Multi function display baseboard
designed to mount SoPine SOM.

Key features:
- Allwinner A64 Cortex-A53
- Mali-400MP2 GPU
- AXP803 PMIC
- 2GB DDR3 RAM
- SD Slot
- SPI-NOR flash
- EMAC, RTL8211E
- MCP2515 CAN
- MIPI-DSI
- Goodix 911 CTP
- USB Host
- 12V DC power supply

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-a64-oceanic-5inmfd.dts   | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index a5fb1eaa8acf..ec39fe856117 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-amarula-relic.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb sun50i-a64-bananapi-m64-icn6211.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-oceanic-5inmfd.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
new file mode 100644
index 000000000000..d73d1f55acb9
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 Oceanic Systems (UK) Ltd.
+ * Copyright (C) 2019 Amarula Solutions B.V.
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+/dts-v1/;
+
+#include "sun50i-a64-sopine.dtsi"
+
+/ {
+	model = "Oceanic A64-5inMFD";
+	compatible = "oceanic,a64-5inmfd", "allwinner,sun50i-a64";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.18.0.321.gffc6fa0e3
