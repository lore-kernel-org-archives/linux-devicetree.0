From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 1/4] ARM: dts: imx6qdl-sabresd: Move regulators outside of
 "simple-bus"
Date: Thu, 6 Dec 2018 01:42:30 +0000
Message-ID: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

It is not recommended to place regulators inside "simple-bus", so move
them out to make it cleaner the addition of new regulators.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 82 +++++++++++++++---------------=
----
 1 file changed, 36 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index d7389b5..66972e8 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -16,52 +16,42 @@
 		reg =3D <0x10000000 0x40000000>;
 	};
=20
-	regulators {
-		compatible =3D "simple-bus";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		reg_usb_otg_vbus: regulator@0 {
-			compatible =3D "regulator-fixed";
-			reg =3D <0>;
-			regulator-name =3D "usb_otg_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&gpio3 22 0>;
-			enable-active-high;
-			vin-supply =3D <&swbst_reg>;
-		};
-
-		reg_usb_h1_vbus: regulator@1 {
-			compatible =3D "regulator-fixed";
-			reg =3D <1>;
-			regulator-name =3D "usb_h1_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&gpio1 29 0>;
-			enable-active-high;
-			vin-supply =3D <&swbst_reg>;
-		};
-
-		reg_audio: regulator@2 {
-			compatible =3D "regulator-fixed";
-			reg =3D <2>;
-			regulator-name =3D "wm8962-supply";
-			gpio =3D <&gpio4 10 0>;
-			enable-active-high;
-		};
-
-		reg_pcie: regulator@3 {
-			compatible =3D "regulator-fixed";
-			reg =3D <3>;
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_pcie_reg>;
-			regulator-name =3D "MPCIE_3V3";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			gpio =3D <&gpio3 19 0>;
-			enable-active-high;
-		};
+	reg_usb_otg_vbus: regulator-usb-otg-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usb_otg_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&gpio3 22 0>;
+		enable-active-high;
+		vin-supply =3D <&swbst_reg>;
+	};
+
+	reg_usb_h1_vbus: regulator-usb-h1-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usb_h1_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&gpio1 29 0>;
+		enable-active-high;
+		vin-supply =3D <&swbst_reg>;
+	};
+
+	reg_audio: regulator-audio {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "wm8962-supply";
+		gpio =3D <&gpio4 10 0>;
+		enable-active-high;
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible =3D "regulator-fixed";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_pcie_reg>;
+		regulator-name =3D "MPCIE_3V3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&gpio3 19 0>;
+		enable-active-high;
 	};
=20
 	gpio-keys {
--=20
2.7.4
