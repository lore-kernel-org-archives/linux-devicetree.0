From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv3 1/5] ARM: dts: imx6-tx6: remove regulator bus
Date: Thu, 31 Mar 2016 14:33:41 +0200
Message-ID: <1459427625-15568-2-git-send-email-LW@KARO-electronics.de>
References: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

DT maintainers don't like the 'simple-bus' container around the
regulator nodes. So remove it.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 166 +++++++++++++++++------------=
--------
 1 file changed, 75 insertions(+), 91 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
index afc6022..a3e37a7 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -93,104 +93,88 @@
 		};
 	};
=20
-	regulators {
-		compatible =3D "simple-bus";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
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
+	reg_3v3_etn: regulator-3v3-etn {
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
-		reg_2v5: regulator@1 {
-			compatible =3D "regulator-fixed";
-			reg =3D <1>;
-			regulator-name =3D "2V5";
-			regulator-min-microvolt =3D <2500000>;
-			regulator-max-microvolt =3D <2500000>;
-			regulator-always-on;
-		};
+	reg_2v5: regulator-2v5 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "2V5";
+		regulator-min-microvolt =3D <2500000>;
+		regulator-max-microvolt =3D <2500000>;
+		regulator-always-on;
+	};
=20
-		reg_3v3: regulator@2 {
-			compatible =3D "regulator-fixed";
-			reg =3D <2>;
-			regulator-name =3D "3V3";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-always-on;
-		};
+	reg_3v3: regulator-3v3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "3V3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
+	};
=20
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
+	reg_can_xcvr: regulator-can-xcvr {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "CAN XCVR";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_flexcan_xcvr>;
+		gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-low;
+	};
=20
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
+	reg_lcd0_pwr: regulator-lcd0-pwr {
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
=20
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
+	reg_lcd1_pwr: regulator-lcd1-pwr {
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
=20
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
+	reg_usbh1_vbus: regulator-usbh1-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usbh1_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_usbh1_vbus>;
+		gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
=20
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
+	reg_usbotg_vbus: regulator-usbotg-vbus {
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
