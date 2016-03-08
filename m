From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCHv2 3/8] ARM: dts: imx6-tx6: remove regulator bus
Date: Tue,  8 Mar 2016 09:03:59 +0100
Message-ID: <1457424244-14549-4-git-send-email-LW@KARO-electronics.de>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457424244-14549-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT maintainers don't like the 'simple-bus' container around the
regulator nodes. So remove it.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 178 +++++++++++++++++------------=
--------
 1 file changed, 81 insertions(+), 97 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
index 912f284..ec374f5 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -97,104 +97,88 @@
 		};
 	};
=20
-	regulators {
-		compatible =3D "simple-bus";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
+	reg_3v3_etn: reg-3v3-etn {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "3V3_ETN";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_etnphy_power>;
+		gpio =3D <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
=20
-		reg_3v3_etn: regulator@0 {
-			compatible =3D "regulator-fixed";
-			reg =3D <0>;
-			regulator-name =3D "3V3_ETN";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_etnphy_power>;
-			gpio =3D <&gpio3 20 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
-
-		reg_2v5: regulator@1 {
-			compatible =3D "regulator-fixed";
-			reg =3D <1>;
-			regulator-name =3D "2V5";
-			regulator-min-microvolt =3D <2500000>;
-			regulator-max-microvolt =3D <2500000>;
-			regulator-always-on;
-		};
-
-		reg_3v3: regulator@2 {
-			compatible =3D "regulator-fixed";
-			reg =3D <2>;
-			regulator-name =3D "3V3";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-always-on;
-		};
-
-		reg_can_xcvr: regulator@3 {
-			compatible =3D "regulator-fixed";
-			reg =3D <3>;
-			regulator-name =3D "CAN XCVR";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_flexcan_xcvr>;
-			gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
-			enable-active-low;
-		};
-
-		reg_lcd0_pwr: regulator@4 {
-			compatible =3D "regulator-fixed";
-			reg =3D <4>;
-			regulator-name =3D "LCD0 POWER";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
-			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-
-		reg_lcd1_pwr: regulator@5 {
-			compatible =3D "regulator-fixed";
-			reg =3D <5>;
-			regulator-name =3D "LCD1 POWER";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_lcd1_pwr>;
-			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-
-		reg_usbh1_vbus: regulator@6 {
-			compatible =3D "regulator-fixed";
-			reg =3D <6>;
-			regulator-name =3D "usbh1_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_usbh1_vbus>;
-			gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
-
-		reg_usbotg_vbus: regulator@7 {
-			compatible =3D "regulator-fixed";
-			reg =3D <7>;
-			regulator-name =3D "usbotg_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_usbotg_vbus>;
-			gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_2v5: reg-2v5 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "2V5";
+		regulator-min-microvolt =3D <2500000>;
+		regulator-max-microvolt =3D <2500000>;
+		regulator-always-on;
+	};
+
+	reg_3v3: reg-3v3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "3V3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
+	};
+
+	reg_can_xcvr: reg-can-xcvr {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "CAN XCVR";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_flexcan_xcvr>;
+		gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-low;
+	};
+
+	reg_lcd0_pwr: reg-lcd0-pwr {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "LCD0 POWER";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+		gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	reg_lcd1_pwr: reg-lcd1-pwr {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "LCD1 POWER";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd1_pwr>;
+		gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	reg_usbh1_vbus: reg-usbh1-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usbh1_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_usbh1_vbus>;
+		gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usbotg_vbus: reg-usbotg-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usbotg_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_usbotg_vbus>;
+		gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
=20
 	sound {
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
