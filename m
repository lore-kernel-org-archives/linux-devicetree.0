Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 07/13] ARM: dts: ti: add camera overlays
Date: Tue, 17 Apr 2018 12:10:09 +0300
Message-ID: <1523956215-28154-8-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk, Benoit Parrot <bparrot@ti.com>
List-ID: <devicetree@vger.kernel.org>

From: Benoit Parrot <bparrot@ti.com>

Add two different camera overlays for am57xx-evm, mt9t111 and ov10635.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/mt9t111.dtso | 44 ++++++++++++++++++++++++
 arch/arm/boot/dts/ti/ov10635.dtso | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/mt9t111.dtso
 create mode 100644 arch/arm/boot/dts/ti/ov10635.dtso

diff --git a/arch/arm/boot/dts/ti/mt9t111.dtso b/arch/arm/boot/dts/ti/mt9t111.dtso
new file mode 100644
index 0000000..80e77ae
--- /dev/null
+++ b/arch/arm/boot/dts/ti/mt9t111.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/gpio/gpio.h>
+
+&i2c5 {
+	mt9t11x@3C {
+		compatible = "aptina,mt9t111";
+		bufen-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+		camen-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+		oscen-gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
+		reg = <0x3C>;
+		reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+
+		port {
+			cam: endpoint {
+				hsync-active = <1>;
+				input-clock-freq = <32000000>;
+				pclk-sample = <0>;
+				pixel-clock-freq = <96000000>;
+				remote-endpoint = <&vin3a>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&vin3a {
+	status = "okay";
+
+	endpoint {
+		remote-endpoint = <&cam>;
+		slave-mode;
+	};
+};
+
+&vip2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/ti/ov10635.dtso b/arch/arm/boot/dts/ti/ov10635.dtso
new file mode 100644
index 0000000..856f5de
--- /dev/null
+++ b/arch/arm/boot/dts/ti/ov10635.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+  fragment@101 {
+	target-path = "/";
+
+	__overlay__ {
+		clk_ov10635: clk_ov10635 {
+			compatible = "gpio-gate-clock";
+			#clock-cells = <0>;
+			clocks = <&clk_ov10635_fixed>;
+			enable-gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		clk_ov10635_fixed: clk_ov10635_fixed {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
+	};
+  };
+};
+
+&i2c5 {
+	ov10635@30 {
+		compatible = "ovti,ov10635";
+		clock-names = "xvclk";
+		clocks = <&clk_ov10635>;
+		powerdown-gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;
+		reg = <0x30>;
+		reset-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
+
+		port {
+			cam: endpoint {
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&vin3a>;
+				vsync-active = <1>;
+			};
+		};
+	};
+};
+
+&vin3a {
+	status = "okay";
+
+	endpoint {
+		remote-endpoint = <&cam>;
+		slave-mode;
+	};
+};
+
+&vip2 {
+	status = "okay";
+};
+
+&gpio6 {
+	p11 {
+		gpio-hog;
+		gpios = <11 GPIO_ACTIVE_LOW>;
+		line-name = "cm-camen-gpio";
+		output-high;
+	};
+};
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
