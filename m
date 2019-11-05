Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC89C5DF63
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C160321A49
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbfKEVWp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 16:22:45 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49045 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729952AbfKEVWo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 16:22:44 -0500
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B6EF3200006;
        Tue,  5 Nov 2019 21:22:41 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        =?UTF-8?q?K=C3=A9vin=20RAYMOND?= <k.raymond@overkiz.com>,
        Mickael GARDET <m.gardet@overkiz.com>
Subject: [PATCH v3 2/2] ARM: dts: at91: add a dts and dtsi file for kizbox2 based boards
Date:   Tue,  5 Nov 2019 22:22:34 +0100
Message-Id: <20191105212234.22999-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105212234.22999-1-kamel.bouhara@bootlin.com>
References: <20191105212234.22999-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There are several boards available depending on the PCB
(3 antennas support and several revison). Add a dtsi file to share
common binding between all kizbox2 boards. This patch also add support
for the kizbox2-2 variant.

Signed-off-by: Kévin RAYMOND <k.raymond@overkiz.com>
Signed-off-by: Mickael GARDET <m.gardet@overkiz.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes in v2:
==============
	- Replaced "_" by "-" in dts/dtsi file names
	- Fixed unusual C++ Style comments

Changes in v3:
==============
	- Removed the kizbox changes from this patch

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 arch/arm/boot/dts/Makefile                 |   2 +-
 arch/arm/boot/dts/at91-kizbox2-2.dts       |  26 +++
 arch/arm/boot/dts/at91-kizbox2-common.dtsi | 258 +++++++++++++++++++++
 arch/arm/boot/dts/at91-kizbox2.dts         | 244 -------------------
 4 files changed, 285 insertions(+), 245 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-kizbox2-2.dts
 create mode 100644 arch/arm/boot/dts/at91-kizbox2-common.dtsi
 delete mode 100644 arch/arm/boot/dts/at91-kizbox2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3bda216c41be..4ac053115a8e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -45,7 +45,7 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 	at91sam9x25ek.dtb \
 	at91sam9x35ek.dtb
 dtb-$(CONFIG_SOC_SAM_V7) += \
-	at91-kizbox2.dtb \
+	at91-kizbox2-2.dtb \
 	at91-kizbox3-hs.dtb \
 	at91-nattis-2-natte-2.dtb \
 	at91-sama5d27_som1_ek.dtb \
diff --git a/arch/arm/boot/dts/at91-kizbox2-2.dts b/arch/arm/boot/dts/at91-kizbox2-2.dts
new file mode 100644
index 000000000000..cab8b3579efa
--- /dev/null
+++ b/arch/arm/boot/dts/at91-kizbox2-2.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * at91-kizbox2-2.dts - Device Tree file for the Kizbox2 with
+ * two head board
+ *
+ * Copyright (C) 2015 Overkiz SAS
+ *
+ * Authors: Antoine Aubert <a.aubert@overkiz.com>
+ *	    Kévin Raymond <k.raymond@overkiz.com>
+ */
+/dts-v1/;
+#include "at91-kizbox2-common.dtsi"
+
+/ {
+	model = "Overkiz Kizbox 2 with two heads";
+	compatible = "overkiz,kizbox2-2", "atmel,sama5d31",
+		     "atmel,sama5d3", "atmel,sama5";
+};
+
+&usart1 {
+	status = "okay";
+};
+
+&usart2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/at91-kizbox2-common.dtsi b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
new file mode 100644
index 000000000000..af38253a6e7a
--- /dev/null
+++ b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * at91-kizbox2_common.dtsi - Device Tree Include file for
+ * Overkiz Kizbox 2 family SoC
+ *
+ * Copyright (C) 2014-2018 Overkiz SAS
+ *
+ * Authors: Antoine Aubert <a.aubert@overkiz.com>
+ *          Gaël Portay <g.portay@overkiz.com>
+ *          Kévin Raymond <k.raymond@overkiz.com>
+ */
+#include "sama5d31.dtsi"
+
+/ {
+	chosen {
+		bootargs = "ubi.mtd=ubi";
+		stdout-path = &dbgu;
+	};
+
+	memory {
+		reg = <0x20000000 0x10000000>;
+	};
+
+	clocks {
+		slow_xtal {
+			clock-frequency = <32768>;
+		};
+
+		main_xtal {
+			clock-frequency = <12000000>;
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		prog {
+			label = "PB_PROG";
+			gpios = <&pioE 27 GPIO_ACTIVE_LOW>;
+			linux,code = <0x102>;
+			wakeup-source;
+		};
+
+		reset {
+			label = "PB_RST";
+			gpios = <&pioE 29 GPIO_ACTIVE_LOW>;
+			linux,code = <0x100>;
+			wakeup-source;
+		};
+
+		user {
+			label = "PB_USER";
+			gpios = <&pioE 31 GPIO_ACTIVE_HIGH>;
+			linux,code = <0x101>;
+			wakeup-source;
+		};
+	};
+
+	pwm_leds {
+		compatible = "pwm-leds";
+
+		blue {
+			label = "pwm:blue:user";
+			pwms = <&pwm0 2 10000000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "none";
+		};
+
+		green {
+			label = "pwm:green:user";
+			pwms = <&pwm0 1 10000000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "default-on";
+		};
+
+		red {
+			label = "pwm:red:user";
+			pwms = <&pwm0 0 10000000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "default-on";
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	pmic: act8865@5b {
+		compatible = "active-semi,act8865";
+		reg = <0x5b>;
+		status = "okay";
+
+		regulators {
+			vcc_1v8_reg: DCDC_REG1 {
+				regulator-name = "VCC_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcc_1v2_reg: DCDC_REG2 {
+				regulator-name = "VCC_1V2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vcc_3v3_reg: DCDC_REG3 {
+				regulator-name = "VCC_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vddfuse_reg: LDO_REG1 {
+				regulator-name = "FUSE_2V5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+			};
+
+			vddana_reg: LDO_REG2 {
+				regulator-name = "VDDANA";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vled_reg: LDO_REG3 {
+				regulator-name = "VLED";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			v3v8_rf_reg: LDO_REG4 {
+				regulator-name = "V3V8_RF";
+				regulator-min-microvolt = <3800000>;
+				regulator-max-microvolt = <3800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&usart0 {
+	atmel,use-dma-rx;
+	atmel,use-dma-tx;
+	status = "disabled";
+};
+
+&usart1 {
+	atmel,use-dma-rx;
+	atmel,use-dma-tx;
+	status = "disabled";
+};
+
+&usart2 {
+	atmel,use-dma-rx;
+	atmel,use-dma-tx;
+	status = "disabled";
+};
+
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_pwmh0_1
+		     &pinctrl_pwm0_pwmh1_1
+		     &pinctrl_pwm0_pwmh2_0>;
+	status = "okay";
+};
+
+&adc0 {
+	atmel,adc-vref = <3333>;
+	status = "okay";
+};
+
+&macb1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&dbgu {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&ebi {
+	pinctrl-0 = <&pinctrl_ebi_nand_addr>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&nand_controller {
+	status = "okay";
+
+	nand@3 {
+		reg = <0x3 0x0 0x2>;
+		atmel,rb = <0>;
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
+&usb1 {
+	status = "okay";
+};
+
+&usb2 {
+	status = "okay";
+};
+
+/* WMBUS (inverted with IO in the latest schematic) */
+&pinctrl_usart0 {
+	atmel,pins =
+		<AT91_PIOD 17 AT91_PERIPH_A AT91_PINCTRL_NONE
+		 AT91_PIOD 18 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+		 AT91_PIOE 2 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
+};
+
+/* RTS */
+&pinctrl_usart1 {
+	atmel,pins =
+		<AT91_PIOB 28 AT91_PERIPH_A AT91_PINCTRL_NONE
+		 AT91_PIOB 29 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+		 AT91_PIOE 7 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
+};
+
+/* IO (inverted with WMBUS in the latest schematic) */
+&pinctrl_usart2 {
+	atmel,pins =
+		<AT91_PIOE 25 AT91_PERIPH_B AT91_PINCTRL_NONE
+		 AT91_PIOE 26 AT91_PERIPH_B AT91_PINCTRL_PULL_UP
+		 AT91_PIOE 8 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
+};
diff --git a/arch/arm/boot/dts/at91-kizbox2.dts b/arch/arm/boot/dts/at91-kizbox2.dts
deleted file mode 100644
index 86d821884bd4..000000000000
--- a/arch/arm/boot/dts/at91-kizbox2.dts
+++ /dev/null
@@ -1,244 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * at91-kizbox2.dts - Device Tree file for Overkiz Kizbox 2 board
- *
- * Copyright (C) 2014 Gaël PORTAY <g.portay@overkiz.com>
- */
-/dts-v1/;
-#include "sama5d31.dtsi"
-#include <dt-bindings/pwm/pwm.h>
-
-/ {
-	model = "Overkiz Kizbox 2";
-	compatible = "overkiz,kizbox2", "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
-
-	chosen {
-		bootargs = "ubi.mtd=ubi";
-		stdout-path = &dbgu;
-	};
-
-	memory {
-		reg = <0x20000000 0x10000000>;
-	};
-
-	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
-		main_xtal {
-			clock-frequency = <12000000>;
-		};
-	};
-
-	ahb {
-		apb {
-			i2c1: i2c@f0018000 {
-				status = "okay";
-
-				pmic: act8865@5b {
-					compatible = "active-semi,act8865";
-					reg = <0x5b>;
-					status = "okay";
-
-					regulators {
-						vcc_1v8_reg: DCDC_REG1 {
-							regulator-name = "VCC_1V8";
-							regulator-min-microvolt = <1800000>;
-							regulator-max-microvolt = <1800000>;
-							regulator-always-on;
-						};
-
-						vcc_1v2_reg: DCDC_REG2 {
-							regulator-name = "VCC_1V2";
-							regulator-min-microvolt = <1200000>;
-							regulator-max-microvolt = <1200000>;
-							regulator-always-on;
-						};
-
-						vcc_3v3_reg: DCDC_REG3 {
-							regulator-name = "VCC_3V3";
-							regulator-min-microvolt = <3300000>;
-							regulator-max-microvolt = <3300000>;
-							regulator-always-on;
-						};
-
-						vddfuse_reg: LDO_REG1 {
-							regulator-name = "FUSE_2V5";
-							regulator-min-microvolt = <2500000>;
-							regulator-max-microvolt = <2500000>;
-						};
-
-						vddana_reg: LDO_REG2 {
-							regulator-name = "VDDANA";
-							regulator-min-microvolt = <3300000>;
-							regulator-max-microvolt = <3300000>;
-							regulator-always-on;
-						};
-
-						vled_reg: LDO_REG3 {
-							regulator-name = "VLED";
-							regulator-min-microvolt = <3300000>;
-							regulator-max-microvolt = <3300000>;
-							regulator-always-on;
-						};
-
-						v3v8_rf_reg: LDO_REG4 {
-							regulator-name = "V3V8_RF";
-							regulator-min-microvolt = <3800000>;
-							regulator-max-microvolt = <3800000>;
-							regulator-always-on;
-						};
-					};
-				};
-			};
-
-			tcb0: timer@f0010000 {
-				timer@0 {
-					compatible = "atmel,tcb-timer";
-					reg = <0>;
-				};
-
-				timer@1 {
-					compatible = "atmel,tcb-timer";
-					reg = <1>;
-				};
-			};
-
-			usart0: serial@f001c000 {
-				status = "okay";
-			};
-
-			usart1: serial@f0020000 {
-				status = "okay";
-			};
-
-			pwm0: pwm@f002c000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_pwm0_pwmh0_1
-					     &pinctrl_pwm0_pwmh1_1
-					     &pinctrl_pwm0_pwmh2_0>;
-				status = "okay";
-			};
-
-			adc0: adc@f8018000 {
-				atmel,adc-vref = <3333>;
-				status = "okay";
-			};
-
-			usart2: serial@f8020000 {
-				status = "okay";
-			};
-
-			macb1: ethernet@f802c000 {
-				phy-mode = "rmii";
-				status = "okay";
-			};
-
-			dbgu: serial@ffffee00 {
-				status = "okay";
-			};
-
-			watchdog@fffffe40 {
-				status = "okay";
-			};
-		};
-
-		usb1: ohci@600000 {
-			status = "okay";
-		};
-
-		usb2: ehci@700000 {
-			status = "okay";
-		};
-
-		ebi: ebi@10000000 {
-			pinctrl-0 = <&pinctrl_ebi_nand_addr>;
-			pinctrl-names = "default";
-			status = "okay";
-
-			nand_controller: nand-controller {
-				status = "okay";
-
-				nand@3 {
-					reg = <0x3 0x0 0x2>;
-					atmel,rb = <0>;
-					nand-bus-width = <8>;
-					nand-ecc-mode = "hw";
-					nand-ecc-strength = <4>;
-					nand-ecc-step-size = <512>;
-					nand-on-flash-bbt;
-					label = "atmel_nand";
-
-					partitions {
-						compatible = "fixed-partitions";
-						#address-cells = <1>;
-						#size-cells = <1>;
-
-						bootstrap@0 {
-							label = "bootstrap";
-							reg = <0x0 0x20000>;
-						};
-
-						ubi@20000 {
-							label = "ubi";
-							reg = <0x20000 0x7fe0000>;
-						};
-					};
-				};
-			};
-		};
-	};
-
-	gpio_keys {
-		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		prog {
-			label = "PB_PROG";
-			gpios = <&pioE 27 GPIO_ACTIVE_LOW>;
-			linux,code = <0x102>;
-			wakeup-source;
-		};
-
-		reset {
-			label = "PB_RST";
-			gpios = <&pioE 29 GPIO_ACTIVE_LOW>;
-			linux,code = <0x100>;
-			wakeup-source;
-		};
-
-		user {
-			label = "PB_USER";
-			gpios = <&pioE 31 GPIO_ACTIVE_HIGH>;
-			linux,code = <0x101>;
-			wakeup-source;
-		};
-	};
-
-	pwm_leds {
-		compatible = "pwm-leds";
-
-		blue {
-			label = "pwm:blue:user";
-			pwms = <&pwm0 2 10000000 0>;
-			max-brightness = <255>;
-			linux,default-trigger = "default-on";
-		};
-
-		green {
-			label = "pwm:green:user";
-			pwms = <&pwm0 1 10000000 0>;
-			max-brightness = <255>;
-			linux,default-trigger = "default-on";
-		};
-
-		red {
-			label = "pwm:red:user";
-			pwms = <&pwm0 0 10000000 0>;
-			max-brightness = <255>;
-			linux,default-trigger = "default-on";
-		};
-	};
-};
-- 
2.24.0.rc1

