From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv4 2/6] ARM: dts: Add initial LS1021A QDS board dts support
Date: Mon, 22 Sep 2014 15:45:48 +0800
Message-ID: <1411371952-5618-3-git-send-email-jingchang.lu@freescale.com>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411371952-5618-1-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jason Jin <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jaiprakash Singh <b44839-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Jason Jin <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Jaiprakash Singh <b44839-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/Makefile        |   1 +
 arch/arm/boot/dts/ls1021a-qds.dts | 285 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 286 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-qds.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e12fe46..384aa74 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -245,6 +245,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
 	imx6q-tx6q-1110.dtb \
 	imx6sl-evk.dtb \
 	imx6sx-sdb.dtb \
+	ls1021a-qds.dtb \
 	vf610-colibri-eval-v3.dtb \
 	vf610-cosmic.dtb \
 	vf610-twr.dtb
diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
new file mode 100644
index 0000000..a0a95f51
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -0,0 +1,285 @@
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+/dts-v1/;
+#include "ls1021a.dtsi"
+
+/ {
+	model = "LS1021A QDS Board";
+
+	aliases {
+		enet0_rgmii_phy = &rgmii_phy1;
+		enet1_rgmii_phy = &rgmii_phy2;
+		enet2_rgmii_phy = &rgmii_phy3;
+		enet0_sgmii_phy = &sgmii_phy1c;
+		enet1_sgmii_phy = &sgmii_phy1d;
+	};
+
+	soc {
+		leds {
+			compatible = "pwm-leds";
+			led0 {
+				label = "led0";
+				pwms = <&pwm3 0 150000 0>;
+				max-brightness = <100>;
+			};
+			led1 {
+				label = "led1";
+				pwms = <&pwm3 1 150000 0>;
+				max-brightness = <100>;
+			};
+			led2 {
+				label = "led2";
+				pwms = <&pwm3 2 150000 0>;
+				max-brightness = <100>;
+			};
+			led3 {
+				label = "led3";
+				pwms = <&pwm3 3 150000 0>;
+				max-brightness = <100>;
+			};
+			led4 {
+				label = "led4";
+				pwms = <&pwm3 4 150000 0>;
+				max-brightness = <100>;
+			};
+			led5 {
+				label = "led5";
+				pwms = <&pwm3 5 150000 0>;
+				max-brightness = <100>;
+			};
+			led6 {
+				label = "led6";
+				pwms = <&pwm3 6 150000 0>;
+				max-brightness = <100>;
+			};
+			led7 {
+				label = "led7";
+				pwms = <&pwm3 7 150000 0>;
+				max-brightness = <100>;
+			};
+		};
+	};
+};
+
+&dspi0 {
+	bus-num = <0>;
+	status = "okay";
+
+	dspiflash: at45db021d@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "atmel,at45db021d", "atmel,at45", "atmel,dataflash";
+		spi-max-frequency = <16000000>;
+		spi-cpol;
+		spi-cpha;
+		reg = <0>;
+	};
+};
+
+&enet0 {
+	tbi-handle = <&tbi0>;
+	phy-handle = <&sgmii_phy1c>;
+	phy-connection-type = "sgmii";
+	status = "okay";
+};
+
+&enet1 {
+	tbi-handle = <&tbi0>;
+	phy-handle = <&sgmii_phy1d>;
+	phy-connection-type = "sgmii";
+	status = "okay";
+};
+
+&enet2 {
+	phy-handle = <&rgmii_phy3>;
+	phy-connection-type = "rgmii-id";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	pca9547@77 {
+		compatible = "philips,pca9547";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			rtc@68 {
+				compatible = "dallas,ds3232";
+				reg = <0x68>;
+				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			ina220@40 {
+				compatible = "ti,ina220";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			ina220@41 {
+				compatible = "ti,ina220";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			eeprom@56 {
+				compatible = "at24,24c512";
+				reg = <0x56>;
+			};
+
+			eeprom@57 {
+				compatible = "at24,24c512";
+				reg = <0x57>;
+			};
+
+			adt7461a@4c {
+				compatible = "adt7461a";
+				reg = <0x4c>;
+			};
+		};
+
+		i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+	};
+};
+
+&ifc {
+	status = "okay";
+	#address-cells = <2>;
+	#size-cells = <1>;
+	/* NOR, NAND Flashes and FPGA on board */
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000
+		0x2 0x0 0x0 0x7e800000 0x00010000
+		0x3 0x0 0x0 0x7fb00000 0x00000100>;
+
+		nor@0,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "cfi-flash";
+			reg = <0x0 0x0 0x8000000>;
+			bank-width = <2>;
+			device-width = <1>;
+		};
+
+		nand@2,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "fsl,ifc-nand";
+			reg = <0x2 0x0 0x10000>;
+		};
+
+		fpga: board-control@3,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			reg = <0x3 0x0 0x0000100>;
+			bank-width = <1>;
+			device-width = <1>;
+			ranges = <0 3 0 0x100>;
+
+			mdio-mux-emi1 {
+				compatible = "mdio-mux-mmioreg";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x54 1>; /* BRDCFG4 */
+				mux-mask = <0xe0>; /* EMI1[2:0] */
+
+				/* Onboard PHYs */
+				ls1021amdio0: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					rgmii_phy1: ethernet-phy@1 {
+						reg = <0x1>;
+					};
+				};
+				ls1021amdio1: mdio@20 {
+					reg = <0x20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					rgmii_phy2: ethernet-phy@2 {
+						reg = <0x2>;
+					};
+				};
+				ls1021amdio2: mdio@40 {
+					reg = <0x40>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					rgmii_phy3: ethernet-phy@3 {
+						reg = <0x3>;
+					};
+				};
+				ls1021amdio3: mdio@60 {
+					reg = <0x60>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					sgmii_phy1c: ethernet-phy@1c {
+						reg = <0x1c>;
+					};
+				};
+				ls1021amdio4: mdio@80 {
+					reg = <0x80>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					sgmii_phy1d: ethernet-phy@1d {
+						reg = <0x1d>;
+					};
+				};
+			};
+		};
+};
+
+&lpuart0 {
+	status = "okay";
+};
+
+&mdio0 {
+	tbi0: tbi-phy@8 {
+		reg = <0x8>;
+		device_type = "tbi-phy";
+	};
+};
+
+&pwm3 {
+	status = "okay";
+};
+
+&pwm7 {
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
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
