From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx7d: add missing OPP property for cpu0
Date: Wed, 18 Jul 2018 14:54:49 +0800
Message-ID: <1531896889-21377-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Commit b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
added "operating-points" property for all CPUs, but missed i.MX7D's cpu0,
this patch adds it.

Fixes: b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 9a772fc..30a1a73 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -9,6 +9,11 @@
 / {
 	cpus {
 		cpu0: cpu@0 {
+			operating-points = <
+				/* KHz	uV */
+				996000	1075000
+				792000	975000
+			>;
 			clock-frequency = <996000000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>;
-- 
2.7.4
