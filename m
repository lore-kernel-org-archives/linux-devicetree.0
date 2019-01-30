From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 02/10] ARM: dts: bananapi-m2-plus: Add CPU
 supply regulator
Date: Wed, 30 Jan 2019 16:41:55 +0800
Message-ID: <20190130084203.25053-3-wens@csie.org>
References: <20190130084203.25053-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3GGYXRAKGQEVM3BVAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190130084203.25053-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The original Bananapi M2+ uses a fixed regulator to supply the CPU
cores. According to Bananapi, the retail v1.1 version is designed to
supply 1.3V. Actual measurements show 1.310V. Earlier engineering
samples had it at 1.4V, but this is not covered here.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi | 30 +++++++------------
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi | 14 +++++++++
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi b/arch/arm/boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi
index a567567763f4..39834329b6ae 100644
--- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi
+++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi
@@ -5,27 +5,19 @@
 
 #include "sunxi-bananapi-m2-plus.dtsi"
 
-/ {
+&reg_vdd_cpux {
 	/*
 	 * Bananapi M2+ v1.2 uses a GPIO line to change the effective
 	 * resistance on the CPU regulator's feedback pin.
 	 */
-	reg_vdd_cpux: vdd-cpux {
-		compatible = "regulator-gpio";
-		regulator-name = "vdd-cpux";
-		regulator-type = "voltage";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <1108475>;
-		regulator-max-microvolt = <1308475>;
-		regulator-ramp-delay = <50>; /* 4ms */
-		gpios = <&r_pio 0 1 GPIO_ACTIVE_HIGH>; /* PL1 */
-		gpios-states = <0x1>;
-		states = <1108475 0x0
-			  1308475 0x1>;
-	};
-};
-
-&cpu0 {
-	cpu-supply = <&reg_vdd_cpux>;
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	regulator-min-microvolt = <1108475>;
+	regulator-max-microvolt = <1308475>;
+	regulator-ramp-delay = <50>; /* 4ms */
+	enable-gpios =  <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+	gpios = <&r_pio 0 1 GPIO_ACTIVE_HIGH>; /* PL1 */
+	gpios-states = <0x1>;
+	states = <1108475 0x0
+		  1308475 0x1>;
 };
diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
index 3bed375b9c03..eb90f53ae958 100644
--- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
@@ -99,6 +99,16 @@
 		      gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_vdd_cpux: vdd-cpux {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpux";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1310000>;
+		regulator-max-microvolt = <1310000>;
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -108,6 +118,10 @@
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpux>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.20.1
