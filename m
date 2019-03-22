From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx7ulp: add ocotp support
Date: Fri, 22 Mar 2019 06:31:56 +0000
Message-ID: <1553236008-28407-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX7ULP OCOTP support, its clock source is from
M4 BUS clock which is NOT available in Linux clock tree,
but M4 BUS clock is always ON when A7 (Linux) is alive,
so just use dummy clock here.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dts=
i
index eb349fd..d6b7110 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -365,5 +365,11 @@
 			compatible =3D "fsl,imx7ulp-sim", "syscon";
 			reg =3D <0x410a3000 0x1000>;
 		};
+
+		ocotp: ocotp-ctrl@410a6000 {
+			compatible =3D "fsl,imx7ulp-ocotp", "syscon";
+			reg =3D <0x410a6000 0x4000>;
+			clocks =3D <&scg1 IMX7ULP_CLK_DUMMY>;
+		};
 	};
 };
--=20
2.7.4
