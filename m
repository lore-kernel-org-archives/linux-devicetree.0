Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E05C5DF62
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41965214D8
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfKEVWG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 16:22:06 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:59947 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfKEVWG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 16:22:06 -0500
X-Originating-IP: 78.193.40.249
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 860E8240002;
        Tue,  5 Nov 2019 21:22:03 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH] ARM: dts: at91: rearrange kizbox dts using aliases nodes
Date:   Tue,  5 Nov 2019 22:21:58 +0100
Message-Id: <20191105212158.22907-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use aliases nodes to easy kizbox dts readability.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 arch/arm/boot/dts/at91-kizbox.dts | 172 +++++++++++++++---------------
 1 file changed, 84 insertions(+), 88 deletions(-)

diff --git a/arch/arm/boot/dts/at91-kizbox.dts b/arch/arm/boot/dts/at91-kizbox.dts
index 90996eaf73b2..644009a157d6 100644
--- a/arch/arm/boot/dts/at91-kizbox.dts
+++ b/arch/arm/boot/dts/at91-kizbox.dts
@@ -28,85 +28,6 @@
 		};
 	};
 
-	ahb {
-		apb {
-			tcb0: timer@fffa0000 {
-				timer@0 {
-					compatible = "atmel,tcb-timer";
-					reg = <0>, <1>;
-				};
-
-				timer@2 {
-					compatible = "atmel,tcb-timer";
-					reg = <2>;
-				};
-			};
-
-			macb0: ethernet@fffc4000 {
-				phy-mode = "mii";
-				pinctrl-0 = <&pinctrl_macb_rmii
-				             &pinctrl_macb_rmii_mii_alt>;
-				status = "okay";
-			};
-
-			usart3: serial@fffd0000 {
-				status = "okay";
-			};
-
-			dbgu: serial@fffff200 {
-				status = "okay";
-			};
-
-			watchdog@fffffd40 {
-				timeout-sec = <15>;
-				atmel,max-heartbeat-sec = <16>;
-				atmel,min-heartbeat-sec = <0>;
-				status = "okay";
-			};
-		};
-
-		usb0: ohci@500000 {
-			num-ports = <1>;
-			status = "okay";
-		};
-
-		ebi: ebi@10000000 {
-			status = "okay";
-
-			nand_controller: nand-controller {
-				status = "okay";
-				pinctrl-0 = <&pinctrl_nand_cs &pinctrl_nand_rb>;
-				pinctrl-names = "default";
-
-				nand@3 {
-					reg = <0x3 0x0 0x800000>;
-					rb-gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
-					cs-gpios = <&pioC 14 GPIO_ACTIVE_HIGH>;
-					nand-bus-width = <8>;
-					nand-ecc-mode = "soft";
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
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
@@ -127,15 +48,6 @@
 		};
 	};
 
-	i2c-gpio-0 {
-		status = "okay";
-
-		rtc: pcf8563@51 {
-			compatible = "nxp,pcf8563";
-			reg = <0x51>;
-		};
-	};
-
 	pwm_leds {
 		compatible = "pwm-leds";
 
@@ -179,3 +91,87 @@
 			     &pinctrl_tcb1_tiob0>;
 	};
 };
+
+&tcb0 {
+	timer@0 {
+		compatible = "atmel,tcb-timer";
+		reg = <0>, <1>;
+	};
+
+	timer@2 {
+		compatible = "atmel,tcb-timer";
+		reg = <2>;
+	};
+};
+
+&ebi {
+	status = "okay";
+};
+
+&nand_controller {
+	status = "okay";
+	pinctrl-0 = <&pinctrl_nand_cs &pinctrl_nand_rb>;
+	pinctrl-names = "default";
+
+	nand@3 {
+		reg = <0x3 0x0 0x800000>;
+		rb-gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&pioC 14 GPIO_ACTIVE_HIGH>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "soft";
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
+&macb0 {
+	phy-mode = "mii";
+	pinctrl-0 = <&pinctrl_macb_rmii
+		     &pinctrl_macb_rmii_mii_alt>;
+	status = "okay";
+};
+
+&usart3 {
+	status = "okay";
+};
+
+&dbgu {
+	status = "okay";
+};
+
+&watchdog {
+	timeout-sec = <15>;
+	atmel,max-heartbeat-sec = <16>;
+	atmel,min-heartbeat-sec = <0>;
+	status = "okay";
+};
+
+&usb0 {
+	num-ports = <1>;
+	status = "okay";
+};
+
+&i2c-gpio-0 {
+	status = "okay";
+
+	rtc: pcf8563@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
-- 
2.24.0.rc1

