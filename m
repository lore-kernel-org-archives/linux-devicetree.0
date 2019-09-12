From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 2/2] ARM: dts: imx7d: Add opp-suspend property
Date: Thu, 12 Sep 2019 10:56:32 +0800
Message-ID: <1568256992-31707-2-git-send-email-Anson.Huang@nxp.com>
References: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Add "opp-suspend" property for i.MX7D to make sure system
suspend with max available opp.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 0083272..2792767 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -44,6 +44,7 @@
 			opp-microvolt = <1000000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xd>, <0xf>;
+			opp-suspend;
 		};
 
 		opp-996000000 {
@@ -51,6 +52,7 @@
 			opp-microvolt = <1100000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xc>, <0xf>;
+			opp-suspend;
 		};
 
 		opp-1200000000 {
@@ -58,6 +60,7 @@
 			opp-microvolt = <1225000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0x8>, <0xf>;
+			opp-suspend;
 		};
 	};
 
-- 
2.7.4
