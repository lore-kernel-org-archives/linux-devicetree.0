From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 3/3] ARM: dts: imx7ulp: add HSRUN mode clocks
Date: Fri, 7 Dec 2018 10:03:39 +0000
Message-ID: <1544176659-32022-3-git-send-email-Anson.Huang@nxp.com>
References: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP can switch CPU between RUN mode and HSRUN mode
by programming SMC1 register, different clock sources
will be used for CPU in different modes, so SMC1 can be
abstracted as a clock controller for CPU clock switch,
this patch adds support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
This patch is based on top of path series: [V5,1/6] dt-bindings: fsl: add c=
ompatible for imx7ulp evk,
https://patchwork.kernel.org/patch/10677263/
---
 arch/arm/boot/dts/imx7ulp.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dts=
i
index 931b275..b86daf7 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -199,9 +199,13 @@
 			assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
 		};
=20
-		smc1: smc1@40410000 {
+		smc1: clock-controller@40410000 {
 			compatible =3D "fsl,imx7ulp-smc1";
 			reg =3D <0x40410000 0x1000>;
+			#clock-cells =3D <1>;
+			clocks =3D <&scg1 IMX7ULP_CLK_CORE_DIV>,
+				 <&scg1 IMX7ULP_CLK_HSRUN_CORE_DIV>;
+			clock-names =3D "divcore", "hsrun_divcore";
 		};
=20
 		pcc3: clock-controller@40b30000 {
--=20
2.7.4
