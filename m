From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 1/2] ARM: dts: imx7d: Correct speed grading fuse settings
Date: Thu, 12 Sep 2019 10:56:31 +0800
Message-ID: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

The 800MHz opp speed grading fuse mask should be 0xd instead
of 0xf according to fuse map definition:

SPEED_GRADING[1:0]	MHz
	00		800
	01		500
	10		1000
	11		1200

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 9c8dd32..0083272 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -43,7 +43,7 @@
 			opp-hz = /bits/ 64 <792000000>;
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <150000>;
-			opp-supported-hw = <0xf>, <0xf>;
+			opp-supported-hw = <0xd>, <0xf>;
 		};
 
 		opp-996000000 {
-- 
2.7.4
