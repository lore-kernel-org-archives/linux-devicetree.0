From: Alison Wang <alison.wang@nxp.com>
Subject: [PATCH] arm64: dts: ls1028a: add pmu dt nodes
Date: Wed, 27 Feb 2019 09:57:52 +0800
Message-ID: <20190227015752.18342-1-alison.wang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alison.wang@nxp.com
List-Id: devicetree@vger.kernel.org

This patch adds pmu dt nodes for LS1028A.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index a8cf92a..36ef9c5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -89,6 +89,11 @@
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	gic: interrupt-controller@6000000 {
 		compatible= "arm,gic-v3";
 		#address-cells = <2>;
-- 
1.7.1
