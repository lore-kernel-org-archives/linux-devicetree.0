From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH RESEND V2 3/4] ARM: dts: imx6ul: Add flexcan stop mode wakeup
 support
Date: Mon, 3 Dec 2018 05:20:27 +0000
Message-ID: <20181203051753.1532-4-qiangqing.zhang@nxp.com>
References: <20181203051753.1532-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203051753.1532-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Aisheng DONG <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Aisheng Dong <aisheng.dong@nxp.com>

Add stop-mode property which is required by stop mode wakeup
feature.

Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 99c366303d73..e14f46ec4d7e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -406,6 +406,7 @@
 				clocks =3D <&clks IMX6UL_CLK_CAN1_IPG>,
 					 <&clks IMX6UL_CLK_CAN1_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x10 1 0x10 17>;
 				status =3D "disabled";
 			};
=20
@@ -416,6 +417,7 @@
 				clocks =3D <&clks IMX6UL_CLK_CAN2_IPG>,
 					 <&clks IMX6UL_CLK_CAN2_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x10 2 0x10 18>;
 				status =3D "disabled";
 			};
=20
--=20
2.17.1
