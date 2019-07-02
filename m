Return-Path: <SRS0=J/Os=U7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva020.nxp.com ([92.121.34.13]:38586 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfGBPQd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 2 Jul 2019 11:16:33 -0400
From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2] arm64: dts: add the console node for DPAA2 platforms
Date: Tue,  2 Jul 2019 18:16:18 +0300
Message-Id: <1562080578-31677-1-git-send-email-ioana.ciornei@nxp.com>
Reply-to: ioana.ciornei@nxp.com
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: leoyang.li@nxp.com, devicetree@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add the console device tree node for the following
DPAA2 based platforms: LS1088A, LS2080A, LS2088A and LX2160A.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
 - use a generic node name
 - remove leading zeros and 0x from the unit-address

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 661137ffa319..d190d5490e31 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -665,6 +665,11 @@
 			clock-names = "apb_pclk", "wdog_clk";
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index d7e78dcd153d..229d7f7d293d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -321,6 +321,11 @@
 			};
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 125a8cc2c5b3..0426e2230447 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -848,6 +848,11 @@
 			dma-coherent;
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,
-- 
1.9.1
