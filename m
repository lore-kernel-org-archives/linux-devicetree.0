From: Anson.Huang@nxp.com
Subject: [PATCH 2/2] arm64: dts: imx8mm: Correct OPP table according to latest datasheet
Date: Fri, 28 Jun 2019 11:28:00 +0800
Message-ID: <20190628032800.8428-2-Anson.Huang@nxp.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628032800.8428-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, viresh.kumar@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

According to latest datasheet (Rev.0.2, 04/2019) from below links,
1.8GHz is ONLY available for consumer part, so the market segment
bits for 1.8GHz opp should ONLY available for consumer part accordingly.

https://www.nxp.com/docs/en/data-sheet/IMX8MMIEC.pdf
https://www.nxp.com/docs/en/data-sheet/IMX8MMCEC.pdf

Fixes: f403a26c865b (arm64: dts: imx8mm: Add cpu speed grading and all OPPs)
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c38813d..ab0d135 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -135,7 +135,7 @@
 			opp-hz = /bits/ 64 <1800000000>;
 			opp-microvolt = <1000000>;
 			/* Consumer only but rely on speed grading */
-			opp-supported-hw = <0x8>, <0x7>;
+			opp-supported-hw = <0x8>, <0x3>;
 			clock-latency-ns = <150000>;
 		};
 	};
-- 
2.7.4
