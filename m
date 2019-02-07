From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/4] ARM: dts: imx6qdl-sabresd: add regulator control for
 isl29023 sensor
Date: Thu, 7 Feb 2019 15:18:30 +0000
Message-ID: <1549552397-22798-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The isl29023 light sensor driver has supported regulator control,
assign the power supply for isl29023 to enable the control.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index 8930aec..21e03b1 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -449,6 +449,7 @@
 		pinctrl-0 =3D <&pinctrl_i2c3_isl29023_int>;
 		interrupt-parent =3D <&gpio3>;
 		interrupts =3D <9 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply =3D <&reg_sensors>;
 	};
 };
=20
--=20
2.7.4
