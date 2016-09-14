From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 14/19] pinctrl: st: Remove obsolete platforms from pinctrl-st dt doc
Date: Wed, 14 Sep 2016 14:27:52 +0100
Message-ID: <1473859677-9231-15-git-send-email-peter.griffin@linaro.org>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

STiH415/6 SoC support is being removed from the kernel.
This patch updates the ST pinctrl dt doc and removes
references to these obsolete platforms. It also updates
the dt example to the currently supported STiH407
platform.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: <linus.walleij@linaro.org>
Cc: <robh+dt@kernel.org>
Cc: <linux-gpio@vger.kernel.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-st.txt     | 33 +++++++++++-----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
index 26bcb18..78160cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
@@ -30,8 +30,7 @@ Second type has a dedicated interrupt per gpio bank.
 
 Pin controller node:
 Required properties:
-- compatible	: should be "st,<SOC>-<pio-block>-pinctrl"
-	like st,stih415-sbc-pinctrl, st,stih415-front-pinctrl and so on.
+- compatible	: should be "st,stih407-<pio-block>-pinctrl"
 - st,syscfg		: Should be a phandle of the syscfg node.
 - st,retime-pin-mask	: Should be mask to specify which pins can be retimed.
 	If the property is not present, it is assumed that all the pins in the
@@ -76,23 +75,23 @@ include/dt-bindings/interrupt-controller/irq.h
 
 Example:
 	pin-controller-sbc {
-		#address-cells	= <1>;
-		#size-cells	= <1>;
-		compatible	= "st,stih415-sbc-pinctrl";
-		st,syscfg	= <&syscfg_sbc>;
-		reg 		= <0xfe61f080 0x4>;
-		reg-names	= "irqmux";
-		interrupts 	= <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names	= "irqmux";
-		ranges 		= <0 0xfe610000 0x5000>;
-
-		PIO0: gpio@fe610000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "st,stih407-sbc-pinctrl";
+		st,syscfg = <&syscfg_sbc>;
+		reg = <0x0961f080 0x4>;
+		reg-names = "irqmux";
+		interrupts = <GIC_SPI 188 IRQ_TYPE_NONE>;
+		interrupt-names = "irqmux";
+		ranges = <0 0x09610000 0x6000>;
+
+		pio0: gpio@09610000 {
 			gpio-controller;
-			#gpio-cells	= <1>;
+			#gpio-cells = <1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg		= <0 0x100>;
-			st,bank-name	= "PIO0";
+			reg = <0x0 0x100>;
+			st,bank-name = "PIO0";
 		};
 		...
 		pin-functions nodes follow...
@@ -162,7 +161,7 @@ pin-controller {
 
 sdhci0:sdhci@fe810000{
 	...
-	interrupt-parent = <&PIO3>;
+	interrupt-parent = <&pio3>;
 	#interrupt-cells = <2>;
 	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>; /* Interrupt line via PIO3-3 */
 	interrupt-names = "card-detect";
-- 
1.9.1

