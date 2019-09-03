From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 2/3] ARM: dts: imx6ull-colibri: add phy-supply and respective
 regulator
Date: Tue, 3 Sep 2019 08:03:48 +0000
Message-ID: <20190903080336.32288-3-philippe.schenker@toradex.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903080336.32288-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This adds regulator-fixed-clock, a fixed-regulator that turns on and
off with a clock and add it to the phy.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 arch/arm/boot/dts/imx6ull-colibri.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx=
6ull-colibri.dtsi
index d56728f03c35..76021b842a97 100644
--- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
@@ -47,6 +47,17 @@
 		states =3D <1800000 0x1 3300000 0x0>;
 		vin-supply =3D <&reg_module_3v3>;
 	};
+
+	reg_eth_phy: regulator-eth-phy {
+		compatible =3D "regulator-fixed-clock";
+		regulator-boot-on;
+		regulator-name =3D "eth_phy";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		clocks =3D <&clks IMX6UL_CLK_ENET2_REF_125M>;
+		startup-delay-us =3D <150000>;
+		vin-supply =3D <&reg_module_3v3>;
+	};
 };
=20
 &adc1 {
@@ -66,6 +77,7 @@
 	pinctrl-0 =3D <&pinctrl_enet2>;
 	phy-mode =3D "rmii";
 	phy-handle =3D <&ethphy1>;
+	phy-supply =3D <&reg_eth_phy>;
 	status =3D "okay";
=20
 	mdio {
--=20
2.23.0
