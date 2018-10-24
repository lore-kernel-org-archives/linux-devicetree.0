From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V1] ARM: dts: sabreauto: Remove reg property from fixed
 regulator
Date: Wed, 24 Oct 2018 10:25:12 +0000
Message-ID: <20181024102255.25640-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

Remove reg property from fixed regulator as upstream has no longer
needed this property.

Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 53 ++++++++++--------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/i=
mx6qdl-sabreauto.dtsi
index a6dc5c42c632..a10f0ad0bfb1 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -75,39 +75,30 @@
 		};
 	};
=20
-	regulators {
-		compatible =3D "simple-bus";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
+	reg_audio: regulator-audio {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "cs42888_supply";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
+	};
=20
-		reg_audio: regulator@0 {
-			compatible =3D "regulator-fixed";
-			reg =3D <0>;
-			regulator-name =3D "cs42888_supply";
-			regulator-min-microvolt =3D <3300000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-always-on;
-		};
+	reg_usb_h1_vbus: regulator-usb-h1-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usb_h1_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&max7310_b 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
=20
-		reg_usb_h1_vbus: regulator@1 {
-			compatible =3D "regulator-fixed";
-			reg =3D <1>;
-			regulator-name =3D "usb_h1_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&max7310_b 7 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
-
-		reg_usb_otg_vbus: regulator@2 {
-			compatible =3D "regulator-fixed";
-			reg =3D <2>;
-			regulator-name =3D "usb_otg_vbus";
-			regulator-min-microvolt =3D <5000000>;
-			regulator-max-microvolt =3D <5000000>;
-			gpio =3D <&max7310_c 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_usb_otg_vbus: regulator-usb-otg-vbus {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "usb_otg_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&max7310_c 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
=20
 	sound-cs42888 {
--=20
2.17.1
