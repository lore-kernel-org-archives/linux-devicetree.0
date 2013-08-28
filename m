From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH 6/9] ARM: at91/dt: add spi0 support to at91rm9200ek board
Date: Wed, 28 Aug 2013 13:07:32 +0200
Message-ID: <1377688052-10794-1-git-send-email-b.brezillon@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Add spi0 cs3 switch pinctrl pin definitions: this pin is used to select
between mmc0 slot0 and spi dataflash connected to cs3.

Enable spi0 controller and define the mtd_dataflash connected to cs0.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/at91rm9200ek.dts |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
index 2bad423..b3e7425 100644
--- a/arch/arm/boot/dts/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/at91rm9200ek.dts
@@ -56,6 +56,13 @@
 							<AT91_PIOB 22 AT91_PERIPH_GPIO (AT91_PINCTRL_OUTPUT | AT91_PINCTRL_OUTPUT_VAL(1))>;
 					};
 				};
+
+				spi0 {
+					pinctrl_spi0_cs3_switch: spi0_cs3_switch-0 {
+						atmel,pins =
+							<AT91_PIOB 22 AT91_PERIPH_GPIO (AT91_PINCTRL_OUTPUT | AT91_PINCTRL_OUTPUT_VAL(0))>;
+					};
+				};
 			};
 
 			dbgu: serial@fffff200 {
@@ -119,6 +126,19 @@
 					wp-gpios = <&pioA 17 GPIO_ACTIVE_HIGH>;
 				};
 			};
+
+			spi0: spi@fffe0000 {
+				pinctrl-0 = <&pinctrl_spi0 &pinctrl_spi0_cs0>;
+				cs-gpios = <&pioA 3 GPIO_ACTIVE_HIGH>, <0>,
+					   <0>, <0>;
+				status = "okay";
+
+				mtd_dataflash@0 {
+					compatible = "atmel,at45", "atmel,dataflash";
+					spi-max-frequency = <15000000>;
+					reg = <0>;
+				};
+			};
 		};
 
 		usb0: ohci@00300000 {
-- 
1.7.9.5
