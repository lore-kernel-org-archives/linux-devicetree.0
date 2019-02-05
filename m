From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/2] ARM: dts: stm32: add initial support of stm32mp157a-dk1 board
Date: Tue, 5 Feb 2019 10:07:04 +0100
Message-ID: <1549357625-7229-2-git-send-email-alexandre.torgue@st.com>
References: <1549357625-7229-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549357625-7229-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support of stm32mp157a discovery1 board (part number: STM32MP157A-DK1).
This board embeds a STM32MP157a SOC with AC package (TFBGA361, 148 ios)
and 512MB of DDR3. Several connections are available on this boards:
4*USB2.0, 1*USB2.0 typeC, SDcard, RJ45, HDMI, Arduino connector, ...

This patch enables basic support for a kernel boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148..a1ca713 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -951,6 +951,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
+	stm32mp157a-dk1.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ev1.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
new file mode 100644
index 0000000..873a80e
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c.dtsi"
+#include "stm32mp157-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "STMicroelectronics STM32MP157A-DK1 Discovery Board";
+	compatible = "st,stm32mp157a-dk1", "st,stm32mp157";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@c0000000 {
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	led {
+		compatible = "gpio-leds";
+		blue {
+			label = "heartbeat";
+			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
-- 
2.7.4
