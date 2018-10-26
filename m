From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V2 4/4] ARM: dts: imx7s: Add flexcan stop mode wakeup support
Date: Fri, 26 Oct 2018 09:47:14 +0000
Message-ID: <20181026094444.25305-5-qiangqing.zhang@nxp.com>
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
 arch/arm/boot/dts/imx7s.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index aa8df7d93b2e..25571f31016c 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -875,6 +875,7 @@
 				clocks =3D <&clks IMX7D_CLK_DUMMY>,
 					<&clks IMX7D_CAN1_ROOT_CLK>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x10 1 0x10 17>;
 				status =3D "disabled";
 			};
=20
@@ -885,6 +886,7 @@
 				clocks =3D <&clks IMX7D_CLK_DUMMY>,
 					<&clks IMX7D_CAN2_ROOT_CLK>;
 				clock-names =3D "ipg", "per";
+				fsl,stop-mode =3D <&gpr 0x10 2 0x10 18>;
 				status =3D "disabled";
 			};
=20
--=20
2.17.1
