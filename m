From: Anson.Huang@nxp.com
Subject: [PATCH V2 4/4] arm64: dts: imx8mm: Add opp-suspend property to OPP table
Date: Tue,  9 Jul 2019 16:00:15 +0800
Message-ID: <20190709080015.43442-4-Anson.Huang@nxp.com>
References: <20190709080015.43442-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709080015.43442-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, p.zabel@pengutronix.de, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, angus@akkea.ca, andrew.smirnov@gmail.com, ccaione@baylibre.com, agx@sigxcpu.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add opp-suspend property to each OPP, the of opp core will
select the OPP HW supported and with highest rate to be
suspend opp, it will speed up the suspend/resume process.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 398318b..973f457 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -108,6 +108,7 @@
 			opp-microvolt = <850000>;
 			opp-supported-hw = <0xe>, <0x7>;
 			clock-latency-ns = <150000>;
+			opp-suspend;
 		};
 
 		opp-1600000000 {
@@ -115,6 +116,7 @@
 			opp-microvolt = <900000>;
 			opp-supported-hw = <0xc>, <0x7>;
 			clock-latency-ns = <150000>;
+			opp-suspend;
 		};
 
 		opp-1800000000 {
@@ -122,6 +124,7 @@
 			opp-microvolt = <1000000>;
 			opp-supported-hw = <0x8>, <0x3>;
 			clock-latency-ns = <150000>;
+			opp-suspend;
 		};
 	};
 
-- 
2.7.4
