From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 037/203] arm64: dts: imx8mq: Correct OPP table according to latest datasheet
Date: Sun, 22 Sep 2019 14:41:03 -0400
Message-ID: <20190922184350.30563-37-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Anson Huang <Anson.Huang@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

[ Upstream commit 9eced3a2f224a62a233761e8af18c907c532e192 ]

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
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 52aae341d0da5..d1f4eb197af26 100644
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
2.20.1
