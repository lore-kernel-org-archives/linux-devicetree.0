From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH v4] arm64: dts: ls1028a: Add USB dt nodes
Date: Fri, 17 May 2019 13:16:24 +0800
Message-ID: <20190517051624.4930-1-ran.wang_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch adds USB dt nodes for LS1028A.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Changes in v4:
  - Move nodes to follow rule of unit-address in the address.
  - Use macro to replace 'interrupts' values.

Changes in v3:
  - Add space between label and node name.
  - Add spcae with properties and '='.
  - Add SoC specific compatible.

Changes in v2:
  - Rename node from usb3@... to usb@... to meet DTSpec

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 8dd3501..e4ed17f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -294,6 +294,26 @@
 			status = "disabled";
 		};
 
+		usb0: usb@3100000 {
+			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			reg = <0x0 0x3100000 0x0 0x10000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			snps,dis_rxdet_inp3_quirk;
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+		};
+
+		usb1: usb@3110000 {
+			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			reg = <0x0 0x3110000 0x0 0x10000>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			snps,dis_rxdet_inp3_quirk;
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+		};
+
 		sata: sata@3200000 {
 			compatible = "fsl,ls1028a-ahci";
 			reg = <0x0 0x3200000 0x0 0x10000>,
-- 
1.7.1
