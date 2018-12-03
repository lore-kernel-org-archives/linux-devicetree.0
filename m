From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH RESEND V2 2/4] ARM: dts: imx6qdl: Add flexcan stop mode wakeup
 support
Date: Mon, 3 Dec 2018 05:20:23 +0000
Message-ID: <20181203051753.1532-3-qiangqing.zhang@nxp.com>
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
 arch/arm/boot/dts/imx6qdl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index 6d827b69ead0..7fb8be1c9cef 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -561,6 +561,7 @@
 				clocks =3D <&clks IMX6QDL_CLK_CAN1_IPG>,
 					 <&clks IMX6QDL_CLK_CAN1_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x34 28 0x10 17>;
 				status =3D "disabled";
 			};
=20
@@ -571,6 +572,7 @@
 				clocks =3D <&clks IMX6QDL_CLK_CAN2_IPG>,
 					 <&clks IMX6QDL_CLK_CAN2_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x34 29 0x10 18>;
 				status =3D "disabled";
 			};
=20
--=20
2.17.1
