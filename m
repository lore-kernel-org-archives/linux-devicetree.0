From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: imx28-tx28: use GPIO flags
Date: Tue,  9 Sep 2014 13:26:01 +0200
Message-ID: <1410261963-27956-3-git-send-email-LW@KARO-electronics.de>
References: <1410261963-27956-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410261963-27956-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx28-tx28.dts |   36 ++++++++++++++++++------------=
------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28=
-tx28.dts
index 4e790c2..cfe6b31 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -37,7 +37,7 @@
=20
 	onewire {
 		compatible =3D "w1-gpio";
-		gpios =3D <&gpio2 7 0>;
+		gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
 		status =3D "disabled";
 	};
=20
@@ -52,7 +52,7 @@
 			regulator-name =3D "usb0_vbus";
 			regulator-min-microvolt =3D <5000000>;
 			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&gpio0 18 0>;
+			gpio =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
=20
@@ -62,7 +62,7 @@
 			regulator-name =3D "usb1_vbus";
 			regulator-min-microvolt =3D <5000000>;
 			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&gpio3 27 0>;
+			gpio =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
=20
@@ -90,7 +90,7 @@
 			regulator-name =3D "CAN XCVR";
 			regulator-min-microvolt =3D <3300000>;
 			regulator-max-microvolt =3D <3300000>;
-			gpio =3D <&gpio1 0 0>;
+			gpio =3D <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&tx28_flexcan_xcvr_pins>;
 		};
@@ -101,7 +101,7 @@
 			regulator-name =3D "LCD POWER";
 			regulator-min-microvolt =3D <3300000>;
 			regulator-max-microvolt =3D <3300000>;
-			gpio =3D <&gpio1 31 0>;
+			gpio =3D <&gpio1 31 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
=20
@@ -111,7 +111,7 @@
 			regulator-name =3D "LCD RESET";
 			regulator-min-microvolt =3D <3300000>;
 			regulator-max-microvolt =3D <3300000>;
-			gpio =3D <&gpio3 30 0>;
+			gpio =3D <&gpio3 30 GPIO_ACTIVE_HIGH>;
 			startup-delay-us =3D <300000>;
 			enable-active-high;
 			regulator-always-on;
@@ -143,7 +143,7 @@
=20
 		user_led: user {
 			label =3D "Heartbeat";
-			gpios =3D <&gpio4 10 0>;
+			gpios =3D <&gpio4 10 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger =3D "heartbeat";
 		};
 	};
@@ -172,16 +172,16 @@
 	matrix_keypad: matrix-keypad@0 {
 		compatible =3D "gpio-matrix-keypad";
 		col-gpios =3D <
-			&gpio5 0 0
-			&gpio5 1 0
-			&gpio5 2 0
-			&gpio5 3 0
+			&gpio5 0 GPIO_ACTIVE_HIGH
+			&gpio5 1 GPIO_ACTIVE_HIGH
+			&gpio5 2 GPIO_ACTIVE_HIGH
+			&gpio5 3 GPIO_ACTIVE_HIGH
 		>;
 		row-gpios =3D <
-			&gpio5 4 0
-			&gpio5 5 0
-			&gpio5 6 0
-			&gpio5 7 0
+			&gpio5 4 GPIO_ACTIVE_HIGH
+			&gpio5 5 GPIO_ACTIVE_HIGH
+			&gpio5 6 GPIO_ACTIVE_HIGH
+			&gpio5 7 GPIO_ACTIVE_HIGH
 		>;
 		/* sample keymap */
 		linux,keymap =3D <
@@ -284,8 +284,8 @@
 		pinctrl-0 =3D <&tx28_edt_ft5x06_pins>;
 		interrupt-parent =3D <&gpio2>;
 		interrupts =3D <5 0>;
-		reset-gpios =3D <&gpio2 6 1>;
-		wake-gpios =3D <&gpio4 9 0>;
+		reset-gpios =3D <&gpio2 6 GPIO_ACTIVE_LOW>;
+		wake-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
 	};
=20
 	touchscreen: tsc2007@48 {
@@ -295,7 +295,7 @@
 		pinctrl-0 =3D <&tx28_tsc2007_pins>;
 		interrupt-parent =3D <&gpio3>;
 		interrupts =3D <20 0>;
-		pendown-gpio =3D <&gpio3 20 1>;
+		pendown-gpio =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
 		ti,x-plate-ohms =3D /bits/ 16 <660>;
 	};
=20
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
