From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 3/4] ARM: dts: imx6qdl-sabresd: add regulators control for
 mma8451 sensor
Date: Thu, 7 Feb 2019 15:18:38 +0000
Message-ID: <1549552397-22798-3-git-send-email-Anson.Huang@nxp.com>
References: <1549552397-22798-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549552397-22798-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The mma8451 sensor driver has supported regulators control,
assign the power supplies for mma8451 to enable the control.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index 618f186a..80b9901 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -250,6 +250,8 @@
 		pinctrl-0 =3D <&pinctrl_i2c1_mma8451_int>;
 		interrupt-parent =3D <&gpio1>;
 		interrupts =3D <18 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply =3D <&reg_sensors>;
+		vddio-supply =3D <&reg_sensors>;
 	};
=20
 	ov5642: camera@3c {
--=20
2.7.4
