From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v5 10/12] ARM: dts: sun6i: hummingbird: Add
 AXP221 regulator nodes
Date: Tue, 10 Mar 2015 19:59:21 +0800
Message-ID: <1425988764-23618-11-git-send-email-wens@csie.org>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLNZ7OTQKGQEUXRBN7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425988764-23618-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the AXP221 regulators. Only the ones directly used
on the board are added.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts | 56 ++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
index 486ffc69ac96..d13c88c6509a 100644
--- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
@@ -115,7 +115,7 @@
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_hummingbird>;
-	vmmc-supply = <&reg_vcc3v0>;
+	vmmc-supply = <&vcc_3v0>;
 	bus-width = <4>;
 	cd-gpios = <&pio 0 8 GPIO_ACTIVE_HIGH>; /* PA8 */
 	cd-inverted;
@@ -150,6 +150,60 @@
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <1>;
+		dcdc1-supply = <&vcc_3v0>;
+		dcdc5-supply = <&vcc_dram>;
+
+		regulators {
+			x-powers,dcdc-freq = <3000>;
+
+			vcc_3v0: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "vcc-3v0";
+			};
+
+			vdd_cpu: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1320000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			vdd_gpu: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1320000>;
+				regulator-name = "vdd-gpu";
+			};
+
+			vdd_sys_dll: dcdc4 {
+				regulator-always-on;
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-sys-dll";
+			};
+
+			vcc_dram: dcdc5 {
+				regulator-always-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-name = "vcc-dram";
+			};
+
+			vcc_wifi: aldo1 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_wifi";
+			};
+
+			avcc: aldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "avcc";
+			};
+		};
 	};
 };
 
-- 
2.1.4
