From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 1/4] ARM: dts: imx53: add ethernet PHY supply regulator
Date: Wed, 20 Jan 2016 14:09:19 +0100
Message-ID: <1453295362-18798-2-git-send-email-LW@KARO-electronics.de>
References: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx53-tx53.dtsi | 40 ++++++++++++++++++++++++++++++-=
--------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx5=
3-tx53.dtsi
index d3e50b2..8f08389 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -87,9 +87,20 @@
 			regulator-max-microvolt =3D <3300000>;
 		};
=20
-		reg_can_xcvr: regulator@2 {
+		reg_3v3_etn: regulator@2 {
 			compatible =3D "regulator-fixed";
 			reg =3D <2>;
+			regulator-name =3D "ETN 3V3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_etn_phy>;
+			gpio =3D <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		reg_can_xcvr: regulator@3 {
+			compatible =3D "regulator-fixed";
+			reg =3D <3>;
 			regulator-name =3D "CAN XCVR";
 			regulator-min-microvolt =3D <3300000>;
 			regulator-max-microvolt =3D <3300000>;
@@ -98,9 +109,9 @@
 			gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
 		};
=20
-		reg_usbh1_vbus: regulator@3 {
+		reg_usbh1_vbus: regulator@4 {
 			compatible =3D "regulator-fixed";
-			reg =3D <3>;
+			reg =3D <4>;
 			regulator-name =3D "usbh1_vbus";
 			regulator-min-microvolt =3D <5000000>;
 			regulator-max-microvolt =3D <5000000>;
@@ -110,9 +121,9 @@
 			enable-active-high;
 		};
=20
-		reg_usbotg_vbus: regulator@4 {
+		reg_usbotg_vbus: regulator@5 {
 			compatible =3D "regulator-fixed";
-			reg =3D <4>;
+			reg =3D <5>;
 			regulator-name =3D "usbotg_vbus";
 			regulator-min-microvolt =3D <5000000>;
 			regulator-max-microvolt =3D <5000000>;
@@ -204,13 +215,20 @@
 	phy-mode =3D "rmii";
 	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
 	phy-handle =3D <&phy0>;
+	phy-supply =3D <&reg_3v3_etn>;
 	mac-address =3D [000000000000]; /* placeholder; will be overwritten b=
y bootloader */
 	status =3D "okay";
=20
-	phy0: ethernet-phy@0 {
-		interrupt-parent =3D <&gpio2>;
-		interrupts =3D <4>;
-		device_type =3D "ethernet-phy";
+	mdio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		phy0: ethernet-phy@0 {
+			compatible =3D "ethernet-phy-id0007.c0f1", "ethernet-phy-ieee802.3-=
c22";
+			reg =3D <0>;
+			interrupt-parent =3D <&gpio2>;
+			interrupts =3D <4>;
+		};
 	};
 };
=20
@@ -309,6 +327,10 @@
 			fsl,pins =3D <MX53_PAD_DISP0_DAT0__GPIO4_21 0xe0>; /* Flexcan XCVR =
enable */
 		};
=20
+		pinctrl_etn_phy: etn-phygrp {
+			fsl,pins =3D <MX53_PAD_EIM_D20__GPIO3_20 0xe0>; /* ETN PHY Power en=
able */
+		};
+
 		pinctrl_ds1339: ds1339grp {
 			fsl,pins =3D <MX53_PAD_DI0_PIN4__GPIO4_20 0xe0>;
 		};
--=20
2.1.4
