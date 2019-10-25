Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D619CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 09:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6159E2070B
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 09:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfJYJZ6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 05:25:58 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45983 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438439AbfJYJZ5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 05:25:57 -0400
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2BE3260002;
        Fri, 25 Oct 2019 09:25:54 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        =?UTF-8?q?K=C3=A9vin=20RAYMOND?= <k.raymond@overkiz.com>,
        Mickael GARDET <m.gardet@overkiz.com>
Subject: [PATCH v2 2/2] ARM: dts: at91: add smartkiz support and a common kizboxmini dtsi file
Date:   Fri, 25 Oct 2019 11:25:51 +0200
Message-Id: <20191025092551.25184-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025092551.25184-1-kamel.bouhara@bootlin.com>
References: <20191025092551.25184-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Split the existing Kizbox Mini boards into three board configuration,
the base board, the mother board and the RailDIN board.
Add a new dts file for the SmartKiz board support.

Signed-off-by: Kévin RAYMOND <k.raymond@overkiz.com>
Signed-off-by: Mickael GARDET <m.gardet@overkiz.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes in v2
=============
	- Renamed kizboxmini to make clear it is a board variant
	- Merged Smartkiz dts support that actually include the
	  kizboxmini dtsi.

 arch/arm/boot/dts/Makefile                    |   5 +-
 arch/arm/boot/dts/at91-kizboxmini-base.dts    |  24 +++
 ...oxmini.dts => at91-kizboxmini-common.dtsi} | 163 +++++++++---------
 arch/arm/boot/dts/at91-kizboxmini-mb.dts      |  26 +++
 arch/arm/boot/dts/at91-kizboxmini-rd.dts      |  49 ++++++
 arch/arm/boot/dts/at91-smartkiz.dts           | 109 ++++++++++++
 6 files changed, 293 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-kizboxmini-base.dts
 rename arch/arm/boot/dts/{at91-kizboxmini.dts => at91-kizboxmini-common.dtsi} (51%)
 create mode 100644 arch/arm/boot/dts/at91-kizboxmini-mb.dts
 create mode 100644 arch/arm/boot/dts/at91-kizboxmini-rd.dts
 create mode 100644 arch/arm/boot/dts/at91-smartkiz.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c976b72a4c94..7f34e668ed19 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -37,7 +37,10 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 	at91-ariag25.dtb \
 	at91-ariettag25.dtb \
 	at91-cosino_mega2560.dtb \
-	at91-kizboxmini.dtb \
+	at91-kizboxmini-base.dtb \
+	at91-kizboxmini-mb.dtb \
+	at91-kizboxmini-rd.dtb \
+	at91-smartkiz.dtb \
 	at91-wb45n.dtb \
 	at91sam9g15ek.dtb \
 	at91sam9g25ek.dtb \
diff --git a/arch/arm/boot/dts/at91-kizboxmini-base.dts b/arch/arm/boot/dts/at91-kizboxmini-base.dts
new file mode 100644
index 000000000000..81c29ca5cc1b
--- /dev/null
+++ b/arch/arm/boot/dts/at91-kizboxmini-base.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * at91-kizboxmini-base.dts - Device Tree file for Overkiz Kizbox mini
+ * base board
+ *
+ * Copyright (C) 2015 Overkiz SAS
+ *   Author: Antoine Aubert <a.aubert@overkiz.com>
+ *           Kévin Raymond <k.raymond@overkiz.com>
+ */
+/dts-v1/;
+#include "at91-kizboxmini-common.dtsi"
+
+/ {
+	model = "Overkiz Kizbox Mini";
+	compatible = "overkiz,kizboxmini-base", "atmel,at91sam9g25",
+		     "atmel,at91sam9x5", "atmel,at91sam9";
+};
+
+&pinctrl_usart0 {
+	atmel,pins =
+		<AT91_PIOA 0 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+		 AT91_PIOA 1 AT91_PERIPH_A AT91_PINCTRL_NONE
+		 AT91_PIOA 2 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
+};
diff --git a/arch/arm/boot/dts/at91-kizboxmini.dts b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
similarity index 51%
rename from arch/arm/boot/dts/at91-kizboxmini.dts
rename to arch/arm/boot/dts/at91-kizboxmini-common.dtsi
index cb22f5fb055f..fddf267b2d17 100644
--- a/arch/arm/boot/dts/at91-kizboxmini.dts
+++ b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
@@ -1,17 +1,16 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-License-Identifier: GPL-2.0
 /*
  * at91-kizboxmini.dts - Device Tree file for Overkiz Kizbox mini board
  *
- * Copyright (C) 2014 Gaël PORTAY <g.portay@overkiz.com>
+ * Copyright (C) 2014-2018 Overkiz SAS
+ *   Author: Antoine Aubert <a.aubert@overkiz.com>
+ *           Gaël Portay <g.portay@overkiz.com>
+ *           Kévin Raymond <k.raymond@overkiz.com>
+ *           Dorian Rocipon <d.rocipon@overkiz.com>
  */
-/dts-v1/;
 #include "at91sam9g25.dtsi"
-#include <dt-bindings/pwm/pwm.h>

 / {
-	model = "Overkiz Kizbox mini";
-	compatible = "overkiz,kizboxmini", "atmel,at91sam9g25", "atmel,at91sam9x5", "atmel,at91sam9";
-
 	chosen {
 		bootargs = "ubi.mtd=ubi";
 		stdout-path = &dbgu;
@@ -22,24 +21,16 @@
 	};

 	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
 		main_xtal {
 			clock-frequency = <12000000>;
 		};
-	};

-	ahb {
-		nand0: nand@40000000 {
-			nand-bus-width = <8>;
-			nand-ecc-mode = "hw";
-			atmel,has-pmecc;
-			atmel,pmecc-cap = <4>;
-			atmel,pmecc-sector-size = <512>;
-			nand-on-flash-bbt;
-			status = "okay";
+		slow_xtal {
+			clock-frequency = <32768>;
+		};
+
+		adc_op_clk {
+			status = "disabled";
 		};
 	};

@@ -63,17 +54,25 @@
 		};
 	};

-	pwm_leds {
+	leds: pwm_leds {
 		compatible = "pwm-leds";

-		green {
+		led_blue: pwm_blue {
+			label = "pwm:blue:user";
+			pwms = <&pwm0 2 10000000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "none";
+			status = "disabled";
+		};
+
+		led_green: pwm_green {
 			label = "pwm:green:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};

-		red {
+		led_red: pwm_red {
 			label = "pwm:red:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
@@ -82,53 +81,12 @@
 	};
 };

-&dbgu {
+&usart0 {
+	atmel,use-dma-rx;
+	atmel,use-dma-tx;
 	status = "okay";
 };

-&ebi {
-	pinctrl-0 = <&pinctrl_ebi_addr_nand
-		     &pinctrl_ebi_data_0_7>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	nand-controller {
-		pinctrl-0 = <&pinctrl_nand_oe_we
-			     &pinctrl_nand_cs
-			     &pinctrl_nand_rb>;
-		pinctrl-names = "default";
-		status = "okay";
-
-		nand@3 {
-			reg = <0x3 0x0 0x800000>;
-			rb-gpios = <&pioD 5 GPIO_ACTIVE_HIGH>;
-			cs-gpios = <&pioD 4 GPIO_ACTIVE_HIGH>;
-			nand-bus-width = <8>;
-			nand-ecc-mode = "hw";
-			nand-ecc-strength = <4>;
-			nand-ecc-step-size = <512>;
-			nand-on-flash-bbt;
-			label = "atmel_nand";
-
-			partitions {
-				compatible = "fixed-partitions";
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				bootstrap@0 {
-					label = "bootstrap";
-					reg = <0x0 0x20000>;
-				};
-
-				ubi@20000 {
-					label = "ubi";
-					reg = <0x20000 0x7fe0000>;
-				};
-			};
-		};
-	};
-};
-
 &macb0 {
 	phy-mode = "rmii";
 	status = "okay";
@@ -137,26 +95,70 @@
 &pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0_pwm0_1
-		     &pinctrl_pwm0_pwm1_1>;
+		     &pinctrl_pwm0_pwm1_1
+		     &pinctrl_pwm0_pwm2_1>;
 	status = "okay";
 };

-&tcb0 {
-	timer@0 {
-		compatible = "atmel,tcb-timer";
-		reg = <0>;
-	};
+&dbgu {
+	status = "okay";
+};

-	timer@1 {
-		compatible = "atmel,tcb-timer";
-		reg = <1>;
-	};
+&watchdog {
+	status = "okay";
 };

-&usart0 {
+&adc0 {
+	status = "disabled";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&ebi {
+	pinctrl-0 = <&pinctrl_ebi_addr_nand
+			&pinctrl_ebi_data_0_7>;
+	pinctrl-names = "default";
 	status = "okay";
 };

+&nand_controller {
+	status = "okay";
+	pinctrl-0 = <&pinctrl_nand_oe_we
+		     &pinctrl_nand_cs
+		     &pinctrl_nand_rb>;
+	pinctrl-names = "default";
+
+	nand@3 {
+		reg = <0x3 0x0 0x800000>;
+		rb-gpios = <&pioD 5 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&pioD 4 GPIO_ACTIVE_HIGH>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-on-flash-bbt;
+		label = "atmel_nand";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootstrap@0 {
+				label = "bootstrap";
+				reg = <0x0 0x20000>;
+			};
+
+			ubi@20000 {
+				label = "ubi";
+				reg = <0x20000 0x7fe0000>;
+			};
+		};
+	};
+};
+
 &usb0 {
 	num-ports = <1>;
 	status = "okay";
@@ -166,6 +168,3 @@
 	status = "okay";
 };

-&watchdog {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/at91-kizboxmini-mb.dts b/arch/arm/boot/dts/at91-kizboxmini-mb.dts
new file mode 100644
index 000000000000..c07d3076a9bc
--- /dev/null
+++ b/arch/arm/boot/dts/at91-kizboxmini-mb.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Overkiz SAS
+ *   Author: Mickael Gardet <m.gardet@overkiz.com>
+ *           Kévin Raymond <k.raymond@overkiz.com>
+ */
+/dts-v1/;
+#include "at91-kizboxmini-common.dtsi"
+
+/ {
+	model = "Overkiz Kizbox Mini Mother Board";
+	compatible = "overkiz,kizboxmini-mb", "atmel,at91sam9g25",
+		     "atmel,at91sam9x5", "atmel,at91sam9";
+};
+
+&usb0 {
+	num-ports = <2>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&led_blue {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/at91-kizboxmini-rd.dts b/arch/arm/boot/dts/at91-kizboxmini-rd.dts
new file mode 100644
index 000000000000..ab50f4d22387
--- /dev/null
+++ b/arch/arm/boot/dts/at91-kizboxmini-rd.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Overkiz SAS
+ *   Author: Mickael Gardet <m.gardet@overkiz.com>
+ *           Kévin Raymond <k.raymond@overkiz.com>
+ */
+/dts-v1/;
+#include "at91-kizboxmini-common.dtsi"
+
+/ {
+	model = "Overkiz Kizbox Mini RailDIN";
+	compatible = "overkiz,kizboxmini-rd", "atmel,at91sam9g25",
+		     "atmel,at91sam9x5", "atmel,at91sam9";
+
+	clocks {
+		adc_op_clk {
+			status = "okay";
+		};
+	};
+};
+
+&pinctrl {
+	adc0 {
+		pinctrl_adc0_ad5: adc0_ad5-0 {
+			/* pull-up disable */
+			atmel,pins = <AT91_PIOB 16 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+};
+
+&usart0 {
+	status = "disabled";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&led_blue {
+	status = "okay";
+};
+
+&adc0 {
+	atmel,adc-vref = <2500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_ad5>;
+	atmel,adc-channels-used = <0x0020>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
new file mode 100644
index 000000000000..2354385f9685
--- /dev/null
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017-2018 Overkiz SAS
+ *   Author: Mickael Gardet <m.gardet@overkiz.com>
+ *           Kévin Raymond <k.raymond@overkiz.com>
+ *           Dorian Rocipon <d.rocipon@overkiz.com>
+ */
+/dts-v1/;
+#include "at91-kizboxmini_common.dtsi"
+
+/ {
+	model = "Overkiz SmartKiz";
+	compatible = "overkiz,smartkiz", "atmel,at91sam9g25",
+		     "atmel,at91sam9x5", "atmel,at91sam9";
+
+	clocks {
+		adc_op_clk {
+			status = "okay";
+		};
+	};
+
+	aliases {
+		serial5 = &uart0;
+	};
+
+	pio_keys {
+		hk_reset {
+			label = "HK_RESET";
+			gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
+		};
+
+		power_rf {
+			label = "POWER_RF";
+			gpios = <&pioA 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		power_wifi {
+			label = "POWER_WIFI";
+			gpios = <&pioA 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&pinctrl {
+	i2c1 {
+		pinctrl_i2c1: i2c1-0 {
+			atmel,pins =
+				<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_PULL_UP
+				AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>;
+		};
+	};
+
+	adc0 {
+		pinctrl_adc0_ad0: adc0_ad0-0 {
+			/* pull-up disable */
+			atmel,pins = <AT91_PIOB 11 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+		pinctrl_adc0_ad5: adc0_ad5-0 {
+			/* pull-up disable */
+			atmel,pins = <AT91_PIOB 16 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+		pinctrl_adc0_ad6: adc0_ad6-0 {
+			/* pull-up disable */
+			atmel,pins = <AT91_PIOB 17 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+		pinctrl_adc0_ad11: adc0_ad11-0 {
+			/* pull-up disable */
+			atmel,pins = <AT91_PIOB 10 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+};
+
+&i2c1 {
+	dmas = <0>, <0>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "disabled";
+};
+
+&macb0 {
+	status = "disabled";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&leds {
+	blue {
+		status = "okay";
+	};
+};
+
+&adc0 {
+	atmel,adc-vref = <2500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <
+		&pinctrl_adc0_ad0
+		&pinctrl_adc0_ad5
+		&pinctrl_adc0_ad6
+		&pinctrl_adc0_ad11
+	>;
+	atmel,adc-channels-used = <0x0861>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
--
2.23.0

