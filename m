From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 1/3] arm64: dts: imx8mq: Add the clocks and the latencies
 for the A53 cores
Date: Thu, 28 Feb 2019 21:42:44 +0000
Message-ID: <1551390149-15443-2-git-send-email-abel.vesa@nxp.com>
References: <1551390149-15443-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551390149-15443-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

The clocks and their latencies will be used by cpufreq-dt.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 9155bd4..1a89062 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -87,6 +87,8 @@
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a53";
 			reg =3D <0x0>;
+			clock-latency =3D <61036>; /* two CLK32 periods */
+			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
 		};
@@ -95,6 +97,8 @@
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a53";
 			reg =3D <0x1>;
+			clock-latency =3D <61036>; /* two CLK32 periods */
+			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
 		};
@@ -103,6 +107,8 @@
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a53";
 			reg =3D <0x2>;
+			clock-latency =3D <61036>; /* two CLK32 periods */
+			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
 		};
@@ -111,6 +117,8 @@
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a53";
 			reg =3D <0x3>;
+			clock-latency =3D <61036>; /* two CLK32 periods */
+			clocks =3D <&clk IMX8MQ_CLK_ARM>;
 			enable-method =3D "psci";
 			next-level-cache =3D <&A53_L2>;
 		};
--=20
2.7.4
