From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 2/6] arm: dts: at91: add labels to soc dtsi for derivative boards
Date: Fri, 15 Jun 2018 14:40:51 +0100
Message-ID: <1529070055-18701-2-git-send-email-ben.whitten@lairdtech.com>
References: <1529070055-18701-1-git-send-email-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529070055-18701-1-git-send-email-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com, Ben Whitten <ben.whitten@lairdtech.com>
List-Id: devicetree@vger.kernel.org

This adds labels to commonly used device-tree nodes so that derivative
boards can avoid ahb/apb hierarchy.

Signed-off-by: Ben Whitten <ben.whitten@lairdtech.com>
---
 arch/arm/boot/dts/at91sam9x5.dtsi | 8 ++++----
 arch/arm/boot/dts/sama5d3.dtsi    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index a3c3c31..11c0ef1 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -389,13 +389,13 @@
 				};
 			};
 
-			rstc@fffffe00 {
+			reset_controller: rstc@fffffe00 {
 				compatible = "atmel,at91sam9g45-rstc";
 				reg = <0xfffffe00 0x10>;
 				clocks = <&clk32k>;
 			};
 
-			shdwc@fffffe10 {
+			shutdown_controller: shdwc@fffffe10 {
 				compatible = "atmel,at91sam9x5-shdwc";
 				reg = <0xfffffe10 0x10>;
 				clocks = <&clk32k>;
@@ -470,7 +470,7 @@
 				clock-names = "dma_clk";
 			};
 
-			pinctrl@fffff400 {
+			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-bus";
@@ -1206,7 +1206,7 @@
 				};
 			};
 
-			watchdog@fffffe40 {
+			watchdog: watchdog@fffffe40 {
 				compatible = "atmel,at91sam9260-wdt";
 				reg = <0xfffffe40 0x10>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index eae5e1e..1408fa4 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -494,7 +494,7 @@
 				atmel,external-irqs = <47>;
 			};
 
-			pinctrl@fffff200 {
+			pinctrl: pinctrl@fffff200 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-bus";
@@ -1340,13 +1340,13 @@
 				};
 			};
 
-			rstc@fffffe00 {
+			reset_controller: rstc@fffffe00 {
 				compatible = "atmel,sama5d3-rstc", "atmel,at91sam9g45-rstc";
 				reg = <0xfffffe00 0x10>;
 				clocks = <&clk32k>;
 			};
 
-			shutdown-controller@fffffe10 {
+			shutdown_controller: shutdown-controller@fffffe10 {
 				compatible = "atmel,at91sam9x5-shdwc";
 				reg = <0xfffffe10 0x10>;
 				clocks = <&clk32k>;
@@ -1359,7 +1359,7 @@
 				clocks = <&mck>;
 			};
 
-			watchdog@fffffe40 {
+			watchdog: watchdog@fffffe40 {
 				compatible = "atmel,at91sam9260-wdt";
 				reg = <0xfffffe40 0x10>;
 				interrupts = <4 IRQ_TYPE_LEVEL_HIGH 7>;
-- 
2.7.4
