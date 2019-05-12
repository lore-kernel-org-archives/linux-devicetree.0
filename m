From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 2/2] ARM: dts: imx6qdl: Assign corresponding clocks
 instead of dummy clock
Date: Sun, 12 May 2019 10:02:13 +0000
Message-ID: <1557655028-12654-2-git-send-email-Anson.Huang@nxp.com>
References: <1557655028-12654-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557655028-12654-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <690554EFBD99D94FBFE3185571A98004@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX6Q/DL's WDOGs use IMX6QDL_CLK_IPG as clock root, assign
IMX6QDL_CLK_IPG to them instead of IMX6QDL_CLK_DUMMY.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index b3a77bc..664f7b5 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -675,14 +675,14 @@
 				compatible =3D "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020bc000 0x4000>;
 				interrupts =3D <0 80 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6QDL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6QDL_CLK_IPG>;
 			};
=20
 			wdog2: wdog@20c0000 {
 				compatible =3D "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020c0000 0x4000>;
 				interrupts =3D <0 81 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6QDL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6QDL_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
--=20
2.7.4
