Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE768C2D0B1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3FEE21927
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgBFLdn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 06:33:43 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:37596 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgBFLdm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 06:33:42 -0500
Received: from [5.158.153.53] (helo=adam.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <bage@linutronix.de>)
        id 1izfPg-0001yw-H9; Thu, 06 Feb 2020 12:33:40 +0100
From:   bage@linutronix.de
To:     devicetree@vger.kernel.org
Cc:     Bastian Germann <bage@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: [PATCH 4/5] ARM: dts: sun7i: lamobo-r1: Split out commons
Date:   Thu,  6 Feb 2020 12:33:26 +0100
Message-Id: <20200206113328.7296-5-bage@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206113328.7296-1-bage@linutronix.de>
References: <20200206113328.7296-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Split out common parts of the Lamobo R1 board to enable using them for
Linutronix Testbox board integration.

Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 .../boot/dts/sun7i-a20-lamobo-r1-common.dtsi  | 271 ++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts     | 264 +----------------
 2 files changed, 272 insertions(+), 263 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-lamobo-r1-common.dtsi

diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1-common.dtsi b/arch/arm/boot/dts/sun7i-a20-lamobo-r1-common.dtsi
new file mode 100644
index 000000000000..ff9f7d99f5e0
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1-common.dtsi
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2015 Jelle de Jong <jelledejong@powercraft.nl>
+ */
+
+/dts-v1/;
+#include "sun7i-a20.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart3;
+		serial2 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+	};
+};
+
+&ahci {
+	target-supply = <&reg_ahci_5v>;
+	status = "okay";
+};
+
+&codec {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_rgmii_pins>;
+	phy-mode = "rgmii";
+	phy-supply = <&reg_gmac_3v3>;
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch: ethernet-switch@1e {
+			compatible = "brcm,bcm53125";
+			reg = <30>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port0: port@0 {
+					reg = <0>;
+					label = "lan2";
+				};
+
+				port1: port@1 {
+					reg = <1>;
+					label = "lan3";
+				};
+
+				port2: port@2 {
+					reg = <2>;
+					label = "lan4";
+				};
+
+				port3: port@3 {
+					reg = <3>;
+					label = "wan";
+				};
+
+				port4: port@4 {
+					reg = <4>;
+					label = "lan1";
+				};
+
+				port8: port@8 {
+					reg = <8>;
+					label = "cpu";
+					ethernet = <&gmac>;
+					phy-mode = "rgmii-txid";
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
+	};
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&ir0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir0_rx_pin>;
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 10 GPIO_ACTIVE_LOW>; /* PH10 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+#include "axp209.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&reg_ahci_5v {
+	gpio = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
+	status = "okay";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-int-dll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_usb0_vbus {
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pi_pins>,
+		    <&spi0_cs0_pi_pin>,
+		    <&spi0_cs1_pi_pin>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_ph_pins>;
+	status = "okay";
+};
+
+&uart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart7_pi_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
index 37cbd78ea07c..82013c7ddf84 100644
--- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
@@ -4,37 +4,12 @@
  */
 
 /dts-v1/;
-#include "sun7i-a20.dtsi"
-#include "sunxi-common-regulators.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
+#include "sun7i-a20-lamobo-r1-common.dtsi"
 
 / {
 	model = "Lamobo R1";
 	compatible = "lamobo,lamobo-r1", "allwinner,sun7i-a20";
 
-	aliases {
-		serial0 = &uart0;
-		serial1 = &uart3;
-		serial2 = &uart7;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&hdmi_out_con>;
-			};
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -43,241 +18,4 @@
 			gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
 		};
 	};
-
-	reg_gmac_3v3: gmac-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "gmac-3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <100000>;
-		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
-	};
-};
-
-&ahci {
-	target-supply = <&reg_ahci_5v>;
-	status = "okay";
-};
-
-&codec {
-	status = "okay";
-};
-
-&cpu0 {
-	cpu-supply = <&reg_dcdc2>;
-};
-
-&de {
-	status = "okay";
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-&gmac {
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac_rgmii_pins>;
-	phy-mode = "rgmii";
-	phy-supply = <&reg_gmac_3v3>;
-	status = "okay";
-
-	fixed-link {
-		speed = <1000>;
-		full-duplex;
-	};
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		switch: ethernet-switch@1e {
-			compatible = "brcm,bcm53125";
-			reg = <30>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port0: port@0 {
-					reg = <0>;
-					label = "lan2";
-				};
-
-				port1: port@1 {
-					reg = <1>;
-					label = "lan3";
-				};
-
-				port2: port@2 {
-					reg = <2>;
-					label = "lan4";
-				};
-
-				port3: port@3 {
-					reg = <3>;
-					label = "wan";
-				};
-
-				port4: port@4 {
-					reg = <4>;
-					label = "lan1";
-				};
-
-				port8: port@8 {
-					reg = <8>;
-					label = "cpu";
-					ethernet = <&gmac>;
-					phy-mode = "rgmii-txid";
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
-		};
-	};
-};
-
-&hdmi {
-	status = "okay";
-};
-
-&hdmi_out {
-	hdmi_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
-	};
-};
-
-&i2c0 {
-	status = "okay";
-
-	axp209: pmic@34 {
-		reg = <0x34>;
-		interrupt-parent = <&nmi_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-	};
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&ir0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&ir0_rx_pin>;
-	status = "okay";
-};
-
-&mmc0 {
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <4>;
-	cd-gpios = <&pio 7 10 GPIO_ACTIVE_LOW>; /* PH10 */
-	status = "okay";
-};
-
-&ohci0 {
-	status = "okay";
-};
-
-&otg_sram {
-	status = "okay";
-};
-
-#include "axp209.dtsi"
-
-&ac_power_supply {
-	status = "okay";
-};
-
-&battery_power_supply {
-	status = "okay";
-};
-
-&reg_ahci_5v {
-	gpio = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
-	status = "okay";
-};
-
-&reg_dcdc2 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1400000>;
-	regulator-name = "vdd-cpu";
-};
-
-&reg_dcdc3 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1400000>;
-	regulator-name = "vdd-int-dll";
-};
-
-&reg_ldo1 {
-	regulator-name = "vdd-rtc";
-};
-
-&reg_ldo2 {
-	regulator-always-on;
-	regulator-min-microvolt = <3000000>;
-	regulator-max-microvolt = <3000000>;
-	regulator-name = "avcc";
-};
-
-&reg_usb0_vbus {
-	status = "okay";
-};
-
-&reg_usb2_vbus {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
-	status = "okay";
-};
-
-&spi0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi0_pi_pins>,
-		    <&spi0_cs0_pi_pin>,
-		    <&spi0_cs1_pi_pin>;
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pb_pins>;
-	status = "okay";
-};
-
-&uart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart3_ph_pins>;
-	status = "okay";
-};
-
-&uart7 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart7_pi_pins>;
-	status = "okay";
-};
-
-&usb_otg {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&usb_power_supply {
-	status = "okay";
-};
-
-&usbphy {
-	usb0_id_det-gpios = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
-	usb0_vbus_power-supply = <&usb_power_supply>;
-	usb0_vbus-supply = <&reg_usb0_vbus>;
-	usb2_vbus-supply = <&reg_usb2_vbus>;
-	status = "okay";
 };
-- 
2.20.1

