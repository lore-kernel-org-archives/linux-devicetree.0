From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V2 2/4] ARM: dts: imx6qdl: Add flexcan stop mode wakeup
 support
Date: Fri, 26 Oct 2018 09:47:06 +0000
Message-ID: <20181026094444.25305-3-qiangqing.zhang@nxp.com>
References: <20181026094444.25305-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026094444.25305-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

Add stop-mode property which is required by stop mode wakeup
feature.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index e4daf150881a..6ffaed0f0bdf 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -548,6 +548,7 @@
 				clocks =3D <&clks IMX6QDL_CLK_CAN1_IPG>,
 					 <&clks IMX6QDL_CLK_CAN1_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x34 28 0x10 17>;
 				status =3D "disabled";
 			};
=20
@@ -558,6 +559,7 @@
 				clocks =3D <&clks IMX6QDL_CLK_CAN2_IPG>,
 					 <&clks IMX6QDL_CLK_CAN2_SERIAL>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x34 29 0x10 18>;
 				status =3D "disabled";
 			};
=20
--=20
2.17.1
