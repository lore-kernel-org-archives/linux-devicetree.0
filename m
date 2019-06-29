From: Anson.Huang@nxp.com
Subject: [PATCH V2 2/2] arm64: dts: imx8mq: Correct OPP table according to latest datasheet
Date: Sat, 29 Jun 2019 18:21:57 +0800
Message-ID: <20190629102157.8026-2-Anson.Huang@nxp.com>
References: <20190629102157.8026-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190629102157.8026-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, viresh.kumar@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

According to latest datasheet (Rev.1, 10/2018) from below links,
in the consumer datasheet, 1.5GHz is mentioned as highest opp but
depends on speed grading fuse, and in the industrial datasheet,
1.3GHz is mentioned as highest opp but depends on speed grading
fuse. 1.5GHz and 1.3GHz opp use same voltage, so no need for
consumer part to support 1.3GHz opp, with same voltage, CPU should
run at highest frequency in order to go into idle as quick as
possible, this can save power.

That means for consumer part, 1GHz/1.5GHz are supported, for
industrial part, 800MHz/1.3GHz are supported, and then check the
speed grading fuse to limit the highest CPU frequency further.
Correct the market segment bits in opp table to make them work
according to datasheets.

https://www.nxp.com/docs/en/data-sheet/IMX8MDQLQIEC.pdf
https://www.nxp.com/docs/en/data-sheet/IMX8MDQLQCEC.pdf

Fixes: 12629c5c3749 ("arm64: dts: imx8mq: Add cpu speed grading and all OPPs")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- remove the comment to avoid any confusion.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 9d99191..477c523 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -169,15 +169,14 @@
 		opp-1300000000 {
 			opp-hz = /bits/ 64 <1300000000>;
 			opp-microvolt = <1000000>;
-			opp-supported-hw = <0xc>, <0x7>;
+			opp-supported-hw = <0xc>, <0x4>;
 			clock-latency-ns = <150000>;
 		};
 
 		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
 			opp-microvolt = <1000000>;
-			/* Consumer only but rely on speed grading */
-			opp-supported-hw = <0x8>, <0x7>;
+			opp-supported-hw = <0x8>, <0x3>;
 			clock-latency-ns = <150000>;
 		};
 	};
-- 
2.7.4
