From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/2] ARM: dts: imx7ulp: add sim node
Date: Fri, 14 Dec 2018 08:20:22 +0000
Message-ID: <1544775260-25458-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP SoC revision info is inside the SIM mode's JTAG_ID
register, add sim node to support SoC revision check.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dts=
i
index b86daf7..fca6e50 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -347,4 +347,17 @@
 			gpio-ranges =3D <&iomuxc1 0 96 32>;
 		};
 	};
+
+	m4aips1: bus@41080000 {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		reg =3D <0x41080000 0x80000>;
+		ranges;
+
+		sim: sim@410a3000 {
+			compatible =3D "fsl,imx7ulp-sim", "syscon";
+			reg =3D <0x410a3000 0x1000>;
+		};
+	};
 };
--=20
2.7.4
