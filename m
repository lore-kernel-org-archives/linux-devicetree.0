From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 3/9] ARM: dts: sun9i: a80-optimus: Add GPIO
 pin-bank regulator supplies
Date: Wed,  6 Feb 2019 11:32:33 +0800
Message-ID: <20190206033239.3619-4-wens@csie.org>
References: <20190206033239.3619-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYNK5HRAKGQELHBSDQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190206033239.3619-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A80 Optimus has the PMIC providing voltage to all the pin-bank
supply rails from its various regulator outputs. All pin-banks that
have supply rails are accounted for. PN pin-bank does not have a
supply rail.

Also remove any "regulator-always-on" properties from regulators that
were only marked to provide pin-bank power.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index 1ee2792b3a27..9c25176e69dc 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -172,10 +172,26 @@
 	clocks = <&ac100_rtc 0>;
 };
 
+&pio {
+	vcc-pa-supply = <&reg_ldo_io1>;
+	vcc-pb-supply = <&reg_aldo2>;
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_eldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_ldo_io0>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
 &r_ir {
 	status = "okay";
 };
 
+&r_pio {
+	vcc-pl-supply = <&reg_dldo2>;
+	vcc-pm-supply = <&reg_eldo3>;
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -264,7 +280,6 @@
 			};
 
 			reg_dldo2: dldo2 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pl";
@@ -283,14 +298,12 @@
 			};
 
 			reg_eldo3: eldo3 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pm-codec-io1";
 			};
 
 			reg_ldo_io0: ldo_io0 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pg";
-- 
2.20.1
