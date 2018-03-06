Return-Path: <SRS0=URon=F4=gmail.com=tossel@kernel.org>
From: tossel@gmail.com
Subject: [PATCH] arm: dts: zynq: Add support for Z-turn board
Date: Tue,  6 Mar 2018 22:30:08 +0100
Message-Id: <20180306213008.32448-1-tossel@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, michal.simek@xilinx.com, Anton Gerasimov <tossel@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Anton Gerasimov <tossel@gmail.com>

Add a DTS for MYIR Z-turn board and the respective target in the
Makefile.

Signed-off-by: Anton Gerasimov <tossel@gmail.com>
---
 arch/arm/boot/dts/Makefile            |   1 +
 arch/arm/boot/dts/zynq-zturn-myir.dts | 151 ++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-zturn-myir.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ade7a38543dc..db20a4266936 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1067,6 +1067,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
 	zynq-zc702.dtb \
 	zynq-zc706.dtb \
 	zynq-zed.dtb \
+	zynq-zynq-myir.dtb \
 	zynq-zybo.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += \
 	armada-370-db.dtb \
diff --git a/arch/arm/boot/dts/zynq-zturn-myir.dts b/arch/arm/boot/dts/zynq-zturn-myir.dts
new file mode 100644
index 000000000000..427248d70e05
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-zturn-myir.dts
@@ -0,0 +1,151 @@
+/*
+ *  Copyright (C) 2015 Andrea Merello <adnrea.merello@gmail.com>
+ *
+ *  Based on zynq-zed.dts which is:
+ *  Copyright (C) 2011 - 2014 Xilinx
+ *  Copyright (C) 2012 National Instruments Corp.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq Z-Turn MYIR Board";
+	compatible = "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+		serial1 = &uart0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait";
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		led_r {
+			label = "led_r";
+			gpios = <&gpio0 0x72 0x1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+
+		led_g {
+			label = "led_g";
+			gpios = <&gpio0 0x73 0x1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+
+		led_b {
+			label = "led_b";
+			gpios = <&gpio0 0x74 0x1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+
+		usr_led1 {
+			label = "usr_led1";
+			gpios = <&gpio0 0x0 0x1>;
+			default-state = "off";
+			linux,default-trigger = "none";
+		};
+
+		usr_led2 {
+			label = "usr_led2";
+			gpios = <&gpio0 0x9 0x1>;
+			default-state = "off";
+			linux,default-trigger = "none";
+		};
+	};
+
+	gpio-beep {
+		compatible = "gpio-beeper";
+		label = "pl-beep";
+		gpios = <&gpio0 0x75 0x0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		autorepeat;
+		K1 {
+			label = "K1";
+			gpios = <&gpio0 0x32 0x1>;
+			linux,code = <0x66>;
+			gpio-key,wakeup;
+			autorepeat;
+		};
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+	fclk-enable = <0xf>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	ethernet_phy: ethernet-phy@0 {
+		reg = <0x0>;
+	};
+};
+
+&sdhci0 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&can0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	stlm75@49 {
+		status = "okay";
+		compatible = "lm75";
+		reg = <0x49>;
+	};
+
+	adxl345@53 {
+		compatible = "adi,adxl345", "adxl345";
+		reg = <0x53>;
+		interrupt-parent = <&intc>;
+		interrupts = <0x0 0x1e 0x4>;
+	};
+};
+
-- 
2.16.2
