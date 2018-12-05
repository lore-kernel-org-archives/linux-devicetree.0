From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/3] ARM: dts: imx6qdl-sabresd: add magnetometer sensor
 support
Date: Wed, 5 Dec 2018 09:19:52 +0000
Message-ID: <1544001240-18622-2-git-send-email-Anson.Huang@nxp.com>
References: <1544001240-18622-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544001240-18622-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add magnetometer sensor mag3110 support on i2c3 bus.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index f96ae54..141550a 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -434,6 +434,15 @@
 		wakeup-gpios =3D <&gpio6 7 0>;
 	};
=20
+	magnetometer@e {
+		compatible =3D "fsl,mag3110";
+		reg =3D <0x0e>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c3_mag3110_int>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <16 IRQ_TYPE_EDGE_RISING>;
+	};
+
 	isl29023@44 {
 		compatible =3D "isil,isl29023";
 		reg =3D <0x44>;
@@ -549,6 +558,12 @@
 			>;
 		};
=20
+		pinctrl_i2c3_mag3110_int: i2c3mag3110intgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D16__GPIO3_IO16		0xb0b1
+			>;
+		};
+
 		pinctrl_ipu1_csi0: ipu1csi0grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
--=20
2.7.4
