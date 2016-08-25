From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 1/2] pwm: sun4i: Add Allwinner H3 support
Date: Thu, 25 Aug 2016 15:44:53 +0900
Message-ID: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <woogyom.kim@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

According to the latest datasheet (v1.2), H3 has single PWM channel.
H3 PWM controller has same register layout as sun4i driver, so it works 
by adding H3 specific data.
And the second PWM channel is not supported, so the pinctrl function is removed.

Datasheet:
  http://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf

Test environment:
  Tested on Nano Pi M1 board, but PA5 pin is assigned for UART0.
  So the debug console should be changed to other port like UART1.

  Ex)
	aliases {
		serial0 = &uart1;
	};

	&uart1 {
        	pinctrl-names = "default";
	        pinctrl-0 = <&uart1_pins_a>;
        	status = "okay";
	};

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-sun4i.txt |  1 +
 arch/arm/boot/dts/sun8i-h3.dtsi                     | 15 +++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c            |  1 -
 drivers/pwm/pwm-sun4i.c                             |  9 +++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
index cf6068b..f1cbeef 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
@@ -6,6 +6,7 @@ Required properties:
     - "allwinner,sun5i-a10s-pwm"
     - "allwinner,sun5i-a13-pwm"
     - "allwinner,sun7i-a20-pwm"
+    - "allwinner,sun8i-h3-pwm"
   - reg: physical base address and length of the controller's registers
   - #pwm-cells: should be 3. See pwm.txt in this directory for a description of
     the cells format.
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b44bc48..3a965fb 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -512,6 +512,13 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			pwm0_pin_a: pwm0@0 {
+				allwinner,pins = "PA5";
+				allwinner,function = "pwm0";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PA4", "PA5";
 				allwinner,function = "uart0";
@@ -585,6 +592,14 @@
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pwm: pwm@01c21400 {
+			compatible = "allwinner,sun8i-h3-pwm";
+			reg = <0x01c21400 0x8>;
+			clocks = <&osc24M>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		uart0: serial@01c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
index 11760bb..087f231 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
@@ -60,7 +60,6 @@ static const struct sunxi_desc_pin sun8i_h3_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "sim"),		/* PWREN */
-		  SUNXI_FUNCTION(0x3, "pwm1"),
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PA_EINT6 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 03a99a5..b0803f6 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -284,6 +284,12 @@ static const struct sun4i_pwm_data sun4i_pwm_data_a20 = {
 	.npwm = 2,
 };
 
+static const struct sun4i_pwm_data sun4i_pwm_data_h3 = {
+	.has_prescaler_bypass = true,
+	.has_rdy = true,
+	.npwm = 1,
+};
+
 static const struct of_device_id sun4i_pwm_dt_ids[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-pwm",
@@ -298,6 +304,9 @@ static const struct of_device_id sun4i_pwm_dt_ids[] = {
 		.compatible = "allwinner,sun7i-a20-pwm",
 		.data = &sun4i_pwm_data_a20,
 	}, {
+		.compatible = "allwinner,sun8i-h3-pwm",
+		.data = &sun4i_pwm_data_h3,
+	}, {
 		/* sentinel */
 	},
 };
-- 
1.9.1
