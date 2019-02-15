From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mq: Add the opp table and cores opp
 properties
Date: Fri, 15 Feb 2019 18:07:24 +0000
Message-ID: <1550254032-16451-4-git-send-email-abel.vesa@nxp.com>
References: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the 0.8GHz and 1GHz opps. According to the datasheet:
https://www.nxp.com/docs/en/data-sheet/IMX8MDQLQIEC.pdf
section 3.1.3 Operating ranges.

The 0.8GHz opp runs in nominal mode with the regulator set to 0.9V.
The 1GHz runs in overdrive mode with the regulator set to 1V.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 1a89062..ebdec9e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -91,6 +91,7 @@
 			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
+			operating-points-v2 =3D <&a53_0_opp_table>;
 		};
=20
 		A53_1: cpu@1 {
@@ -101,6 +102,7 @@
 			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
+			operating-points-v2 =3D <&a53_0_opp_table>;
 		};
=20
 		A53_2: cpu@2 {
@@ -111,6 +113,7 @@
 			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
+			operating-points-v2 =3D <&a53_0_opp_table>;
 		};
=20
 		A53_3: cpu@3 {
@@ -121,6 +124,7 @@
 			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
+			operating-points-v2 =3D <&a53_0_opp_table>;
 		};
=20
 		A53_L2: l2-cache0 {
@@ -666,6 +670,25 @@
 			status =3D "disabled";
 		};
=20
+
+		a53_0_opp_table: opp-table {
+			compatible =3D "operating-points-v2";
+			opp-shared;
+
+			opp-800000000 {
+				opp-hz =3D /bits/ 64 <800000000>;
+				opp-microvolt =3D <900000>;
+				clock-latency-ns =3D <150000>;
+			};
+
+			opp-1000000000 {
+				opp-hz =3D /bits/ 64 <1000000000>;
+				opp-microvolt =3D <1000000>;
+				clock-latency-ns =3D <150000>;
+				opp-suspend;
+			};
+		};
+
 		gic: interrupt-controller@38800000 {
 			compatible =3D "arm,gic-v3";
 			reg =3D <0x38800000 0x10000>,	/* GIC Dist */
--=20
2.7.4
