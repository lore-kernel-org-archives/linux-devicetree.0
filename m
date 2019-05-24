From: Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH] arm64: dts: ls1028a: Add temperature sensor node
Date: Fri, 24 May 2019 09:21:51 +0800
Message-ID: <20190524012151.31840-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add nxp sa56004 chip node for temperature monitor.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index b359068d9605..31fd626dd344 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -131,6 +131,11 @@
 				compatible = "atmel,24c512";
 				reg = <0x57>;
 			};
+
+			temp@4c {
+				compatible = "nxp,sa56004";
+				reg = <0x4c>;
+			};
 		};
 
 		i2c@5 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index f9c272fb0738..012b3f8696b7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -119,6 +119,11 @@
 				compatible = "nxp,pcf2129";
 				reg = <0x51>;
 			};
+
+			temp@4c {
+				compatible = "nxp,sa56004";
+				reg = <0x4c>;
+			};
 		};
 	};
 };
-- 
2.17.1
