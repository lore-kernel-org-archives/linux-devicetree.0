From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v3 01/21] ARM: dts: imx7-colibri: make sure module supplies
 are always on
Date: Wed, 7 Aug 2019 08:26:07 +0000
Message-ID: <20190807082556.5013-2-philippe.schenker@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Prevent regulators from being switched off.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/imx7-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-c=
olibri.dtsi
index 895fbde4d433..f1c1971f2160 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -54,6 +54,7 @@
 		regulator-name =3D "+V3.3";
 		regulator-min-microvolt =3D <3300000>;
 		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
 	};
=20
 	reg_module_3v3_avdd: regulator-module-3v3-avdd {
@@ -61,6 +62,7 @@
 		regulator-name =3D "+V3.3_AVDD_AUDIO";
 		regulator-min-microvolt =3D <3300000>;
 		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
 	};
=20
 	sound {
--=20
2.22.0
