From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 10/11] ARM: dts: qcom-apq8060: Fix up interrupt parents
Date: Thu,  7 Feb 2019 21:16:30 -0500
Message-ID: <20190208021631.30252-11-masneyb@onstation.org>
References: <20190208021631.30252-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

Before we fixed up the interrupt hierarchy for the SSBI
GPIO controller, we had to use the PM8058 directly to pick
interrupts. After making the interrupt controller work properly,
we can reference the real interrupt parent.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is a new patch introduced in v2.

 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 497bb065eb9d..4e6c50d45cb2 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -93,9 +93,8 @@
 		vdd-supply = <&pm8058_l14>; // 2.85V
 		aset-gpios = <&pm8058_gpio 35 GPIO_ACTIVE_LOW>;
 		capella,aset-resistance-ohms = <100000>;
-		/* GPIO34 has interrupt 225 on the PM8058 */
 		/* Trig on both edges - getting close or far away */
-		interrupts-extended = <&pm8058 225 IRQ_TYPE_EDGE_BOTH>;
+		interrupts-extended = <&pm8058_gpio 34 IRQ_TYPE_EDGE_BOTH>;
 		/* MPP05 analog input to the XOADC */
 		io-channels = <&xoadc 0x00 0x05>;
 		io-channel-names = "aout";
@@ -515,9 +514,8 @@
 				ak8975@c {
 					compatible = "asahi-kasei,ak8975";
 					reg = <0x0c>;
-					/* FIXME: GPIO33 has interrupt 224 on the PM8058 */
-					interrupt-parent = <&pm8058>;
-					interrupts = <224 IRQ_TYPE_EDGE_RISING>;
+					interrupt-parent = <&pm8058_gpio>;
+					interrupts = <33 IRQ_TYPE_EDGE_RISING>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&dragon_ak8975_gpios>;
 					vid-supply = <&pm8058_lvs0>; // 1.8V
@@ -526,9 +524,8 @@
 				bmp085@77 {
 					compatible = "bosch,bmp085";
 					reg = <0x77>;
-					/* FIXME: GPIO16 has interrupt 207 on the PM8058 */
-					interrupt-parent = <&pm8058>;
-					interrupts = <207 IRQ_TYPE_EDGE_RISING>;
+					interrupt-parent = <&pm8058_gpio>;
+					interrupts = <16 IRQ_TYPE_EDGE_RISING>;
 					reset-gpios = <&tlmm 86 GPIO_ACTIVE_LOW>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&dragon_bmp085_gpios>;
@@ -539,12 +536,11 @@
 					compatible = "invensense,mpu3050";
 					reg = <0x68>;
 					/*
-					 * GPIO17 has interrupt 208 on the
-					 * PM8058, it is pulled high by a 10k
+					 * GPIO17 is pulled high by a 10k
 					 * resistor to VLOGIC so needs to be
 					 * active low/falling edge.
 					 */
-					interrupts-extended = <&pm8058 208 IRQ_TYPE_EDGE_FALLING>;
+					interrupts-extended = <&pm8058_gpio 17 IRQ_TYPE_EDGE_FALLING>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&dragon_mpu3050_gpios>;
 					vlogic-supply = <&pm8058_lvs0>; // 1.8V
@@ -589,11 +585,10 @@
 				compatible = "smsc,lan9221", "smsc,lan9115";
 				reg = <2 0x0 0x100>;
 				/*
-				 * GPIO7 has interrupt 198 on the PM8058
 				 * The second interrupt is the PME interrupt
 				 * for network wakeup, connected to the TLMM.
 				 */
-				interrupts-extended = <&pm8058 198 IRQ_TYPE_EDGE_FALLING>,
+				interrupts-extended = <&pm8058_gpio 7 IRQ_TYPE_EDGE_FALLING>,
 						    <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
 				reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 				vdd33a-supply = <&dragon_veth>;
-- 
2.17.2
