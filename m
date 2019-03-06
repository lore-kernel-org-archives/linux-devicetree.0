From: Alison Wang <alison.wang@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1028a: Add pmu dt nodes
Date: Wed,  6 Mar 2019 16:20:05 +0800
Message-ID: <20190306082005.46751-1-alison.wang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alison.wang@nxp.com
List-Id: devicetree@vger.kernel.org

This patch adds pmu dt nodes for LS1028A.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
---
Changes in v2:
  - Update compatible property.

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 2896bbc..b1cd5fd 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -89,6 +89,11 @@
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	gic: interrupt-controller@6000000 {
 		compatible= "arm,gic-v3";
 		#address-cells = <2>;
-- 
1.7.1
