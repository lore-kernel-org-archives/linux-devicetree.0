From: p v sukesh <putta.pv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] pcm051 inital support uart mmc pmic
Date: Sat, 14 Dec 2013 12:40:20 +0530
Message-ID: <1387005020-9739-1-git-send-email-putta.pv@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: p v sukesh <putta.pv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

---
 arch/arm/boot/dts/Makefile             |    1 +
 arch/arm/boot/dts/am335x-openboard.dts |  169 ++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-openboard.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d57c1a6..d88b525 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_OMAP2PLUS) += omap2420-h4.dtb \
 	omap4-sdp-es23plus.dtb \
 	omap5-uevm.dtb \
 	am335x-evm.dtb \
+	am335x-openboard.dtb\
 	am335x-evmsk.dtb \
 	am335x-bone.dtb \
 	am335x-boneblack.dtb \
diff --git a/arch/arm/boot/dts/am335x-openboard.dts b/arch/arm/boot/dts/am335x-openboard.dts
new file mode 100644
index 0000000..4cc1fc9
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-openboard.dts
@@ -0,0 +1,169 @@
+/*
+ *Device tree support for Phytec phyCORE-AM335x Board.
+ *
+ * Copyright (C) 2013 Phytec Embedded Pvt. Ltd
+ *
+ * Author: P VENKATA SUKESH<putta.pv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * Based on arch/arm/boot/dts/am335x-evm.dts
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+
+/ {
+	model = "phytec phyCORE-AM3359";
+	compatible = "ti,pcm051", "ti,am33xx";
+
+        cpus {
+                cpu@0 {
+                        cpu0-supply = <&vdd1_reg>;
+                };
+        };
+
+        memory {
+                device_type = "memory";
+                reg = <0x80000000 0x20000000>; /* 512MB */
+        };
+
+        vbat: fixedregulator@0 {
+                compatible = "regulator-fixed";
+                regulator-name = "vbat";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                regulator-boot-on;
+        };
+
+};
+
+&am33xx_pinmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc_s0>;
+
+	uart0_pins: pinmux_uart0_pins {
+		pinctrl-single,pins = <
+			0x170 (PIN_INPUT_PULLUP | MUX_MODE0)	/* uart0_rxd.uart0_rxd */
+			0x174 (PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
+		>;
+	};
+
+	mmc_s0: mmc_s0 {
+		pinctrl-single,pins = <
+			0xF0 0x30       /* mmc0_dat3.mmc0_dat3, INPUT_PULLUP | MODE0 */
+			0xF4 0x30       /* mmc0_dat2.mmc0_dat2, INPUT_PULLUP | MODE0 */
+			0xF8 0x30       /* mmc0_dat1.mmc0_dat1, INPUT_PULLUP | MODE0 */
+			0xFC 0x30       /* mmc0_dat0.mmc0_dat0, INPUT_PULLUP | MODE0 */
+			0x100 0x30      /* mmc0_clk.mmc0_clk, INPUT_PULLUP | MODE0 */
+			0x104 0x30      /* mmc0_cmd.mmc0_cmd, INPUT_PULLUP | MODE0 */
+			0x160 0x37      /* spi0_cs1.mmc0_sdcd, INPUT_PULLUP | MODE5 */
+                        >;
+                };
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tps: tps@2d {
+		reg = <0x2d>;
+	};
+};
+
+#include "tps65910.dtsi"
+
+&tps {
+	vcc1-supply = <&vbat>;
+	vcc2-supply = <&vbat>;
+	vcc3-supply = <&vbat>;
+	vcc4-supply = <&vbat>;
+	vcc5-supply = <&vbat>;
+	vcc6-supply = <&vbat>;
+	vcc7-supply = <&vbat>;
+	vccio-supply = <&vbat>;
+
+	regulators {
+		vrtc_reg: regulator@0 {
+			regulator-always-on;
+		};
+
+		vio_reg: regulator@1 {
+			regulator-always-on;
+		};
+
+		vdd1_reg: regulator@2 {
+			/* VDD_MPU voltage limits 0.95V - 1.26V with +/-4% tolerance */
+			regulator-name = "vdd_mpu";
+			regulator-min-microvolt = <912500>;
+			regulator-max-microvolt = <1312500>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vdd2_reg: regulator@3 {
+			/* VDD_CORE voltage limits 0.95V - 1.1V with +/-4% tolerance */
+			regulator-name = "vdd_core";
+			regulator-min-microvolt = <912500>;
+			regulator-max-microvolt = <1150000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vdd3_reg: regulator@4 {
+			regulator-always-on;
+		};
+
+		vdig1_reg: regulator@5 {
+			regulator-always-on;
+		};
+
+		vdig2_reg: regulator@6 {
+			regulator-always-on;
+		};
+
+		vpll_reg: regulator@7 {
+			regulator-always-on;
+		};
+
+		vdac_reg: regulator@8 {
+			regulator-always-on;
+		};
+
+		vaux1_reg: regulator@9 {
+			regulator-always-on;
+		};
+
+		vaux2_reg: regulator@10 {
+			regulator-always-on;
+		};
+
+		vaux33_reg: regulator@11 {
+			regulator-always-on;
+		};
+
+		vmmc_reg: regulator@12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+	};
+};
+
+&mmc1 {
+	status = "okay";
+	cd-gpios = <&gpio1 6 0>;
+	vmmc-supply = <&vmmc_reg>;
+	bus-width = <4>;
+};
+
+
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
