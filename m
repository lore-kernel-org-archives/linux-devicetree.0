From: Maxime COQUELIN <maxime.coquelin@st.com>
Subject: [PATCH 3/3] ARM: dts: STiH418: Add B2199 board support
Date: Fri,  9 Jan 2015 16:11:46 +0100
Message-ID: <1420816306-11305-4-git-send-email-maxime.coquelin@st.com>
References: <1420816306-11305-1-git-send-email-maxime.coquelin@st.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1420816306-11305-1-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
Cc: lee.jones@linaro.org, peter.griffin@linaro.org
List-Id: devicetree@vger.kernel.org

B2199 HDK is the reference board for STiH418 SoC.
It has the following characteristics:
 - 3GB DDR3
 - 8GB eMMC / SD-Card slot
 - 32MB NOR Flash
 - 1 x Gbit Ethernet
 - 1 x USB3.0 port
 - 2 x USB2.0 ports
 - 1 x Sata or Mini-PCIe port
 - 1 x WiFi 802.11ac (Quantenna)
 - 1 x HDMI out
 - 1 x HDMI in
 - 1 x SPDIF

Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 arch/arm/boot/dts/Makefile          |  3 +-
 arch/arm/boot/dts/stih418-b2199.dts | 78 +++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stih418-b2199.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 91bd5bd..cb37b5e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -441,7 +441,8 @@ dtb-$(CONFIG_ARCH_STI)+= stih407-b2120.dtb \
 	stih415-b2020.dtb \
 	stih416-b2000.dtb \
 	stih416-b2020.dtb \
-	stih416-b2020e.dtb
+	stih416-b2020e.dtb \
+	stih418-b2199.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-a1000.dtb \
 	sun4i-a10-ba10-tvbox.dtb \
diff --git a/arch/arm/boot/dts/stih418-b2199.dts b/arch/arm/boot/dts/stih418-b2199.dts
new file mode 100644
index 0000000..926235c
--- /dev/null
+++ b/arch/arm/boot/dts/stih418-b2199.dts
@@ -0,0 +1,78 @@
+/*
+ * Copyright (C) 2015 STMicroelectronics (R&D) Limited.
+ * Author: Maxime Coquelin <maxime.coquelin@st.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+/dts-v1/;
+#include "stih418.dtsi"
+/ {
+	model = "STiH418 B2199";
+	compatible = "st,stih418-b2199", "st,stih418";
+
+	chosen {
+		bootargs = "console=ttyAS0,115200 clk_ignore_unused";
+		linux,stdout-path = &sbc_serial0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x40000000 0xc0000000>;
+	};
+
+	aliases {
+		ttyAS0 = &sbc_serial0;
+	};
+
+	soc {
+		sbc_serial0: serial@9530000 {
+			status = "okay";
+		};
+
+		leds {
+			compatible = "gpio-leds";
+			red {
+				#gpio-cells = <2>;
+				label = "Front Panel LED";
+				gpios = <&pio4 1 0>;
+				linux,default-trigger = "heartbeat";
+			};
+			green {
+				#gpio-cells = <2>;
+				gpios = <&pio1 3 0>;
+				default-state = "off";
+			};
+		};
+
+		i2c@9842000 {
+			status = "okay";
+		};
+
+		i2c@9843000 {
+			status = "okay";
+		};
+
+		i2c@9844000 {
+			status = "okay";
+		};
+
+		i2c@9845000 {
+			status = "okay";
+		};
+
+		i2c@9540000 {
+			status = "okay";
+		};
+
+		/* SSC11 to HDMI */
+		i2c@9541000 {
+			status = "okay";
+			/* HDMI V1.3a supports Standard mode only */
+			clock-frequency = <100000>;
+			st,i2c-min-scl-pulse-width-us = <0>;
+			st,i2c-min-sda-pulse-width-us = <5>;
+		};
+	};
+};
-- 
1.9.1

