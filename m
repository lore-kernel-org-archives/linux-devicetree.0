From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH v2 10/12] ARM: dts: Berlin: enable USB on the BG2Q DMP
Date: Tue, 24 Jun 2014 12:35:19 +0200
Message-ID: <1403606121-6368-11-git-send-email-antoine.tenart@free-electrons.com>
References: <1403606121-6368-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403606121-6368-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the 2 available USB PHY and USB nodes on the Marvell Berlin BG2Q
DMP.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 53 ++++++++++++++++++++++=
++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot=
/dts/berlin2q-marvell-dmp.dts
index 995150f93795..0d515046f5f5 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -7,6 +7,8 @@
  */
=20
 /dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
 #include "berlin2q.dtsi"
=20
 / {
@@ -21,6 +23,39 @@
 	choosen {
 		bootargs =3D "console=3DttyS0,115200 earlyprintk";
 	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_usb0_vbus: regulator@0 {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "usb0_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&portb 8 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb1_vbus: regulator@1 {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "usb1_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&portb 10 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb2_vbus: regulator@2 {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "usb2_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&portb 12 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
 };
=20
 &sdhci1 {
@@ -37,3 +72,21 @@
 &uart0 {
 	status =3D "okay";
 };
+
+&usb_phy0 {
+	status =3D "okay";
+};
+
+&usb_phy2 {
+	status =3D "okay";
+};
+
+&usb0 {
+	vbus-supply =3D <&reg_usb0_vbus>;
+	status =3D "okay";
+};
+
+&usb2 {
+	vbus-supply =3D <&reg_usb2_vbus>;
+	status =3D "okay";
+};
--=20
1.9.1
