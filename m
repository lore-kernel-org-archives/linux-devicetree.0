From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Date: Thu, 14 Feb 2019 08:02:51 +0000
Message-ID: <1550131046-2069-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX8QXP CPU opp table to support cpufreq.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V4:
	- remove redundant clock-latency property in A35_0;
	- add #cooling-cells for all A35 core.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 27 ++++++++++++++++++++++++++=
+
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4021f25..fad1259 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -34,6 +34,9 @@
 			reg =3D <0x0 0x0>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A35_L2>;
+			clocks =3D <&clk IMX_A35_CLK>;
+			operating-points-v2 =3D <&a35_0_opp_table>;
+			#cooling-cells =3D <2>;
 		};
=20
 		A35_1: cpu@1 {
@@ -42,6 +45,8 @@
 			reg =3D <0x0 0x1>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A35_L2>;
+			operating-points-v2 =3D <&a35_0_opp_table>;
+			#cooling-cells =3D <2>;
 		};
=20
 		A35_2: cpu@2 {
@@ -50,6 +55,8 @@
 			reg =3D <0x0 0x2>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A35_L2>;
+			operating-points-v2 =3D <&a35_0_opp_table>;
+			#cooling-cells =3D <2>;
 		};
=20
 		A35_3: cpu@3 {
@@ -58,6 +65,8 @@
 			reg =3D <0x0 0x3>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A35_L2>;
+			operating-points-v2 =3D <&a35_0_opp_table>;
+			#cooling-cells =3D <2>;
 		};
=20
 		A35_L2: l2-cache0 {
@@ -65,6 +74,24 @@
 		};
 	};
=20
+	a35_0_opp_table: opp-table {
+		compatible =3D "operating-points-v2";
+		opp-shared;
+
+		opp-900000000 {
+			opp-hz =3D /bits/ 64 <900000000>;
+			opp-microvolt =3D <1000000>;
+			clock-latency-ns =3D <150000>;
+		};
+
+		opp-1200000000 {
+			opp-hz =3D /bits/ 64 <1200000000>;
+			opp-microvolt =3D <1100000>;
+			clock-latency-ns =3D <150000>;
+			opp-suspend;
+		};
+	};
+
 	gic: interrupt-controller@51a00000 {
 		compatible =3D "arm,gic-v3";
 		reg =3D <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
--=20
2.7.4
