From: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCHv3 1/3] arm64: dts: ls2088a: add pcie support
Date: Mon, 18 Sep 2017 17:32:21 +0800
Message-ID: <20170918093223.33364-2-Zhiqiang.Hou@nxp.com>
References: <20170918093223.33364-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918093223.33364-1-Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org
Cc: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>

The physical memory map address and CCSR registers map address are
different between LS2088A and other LS2080A series SoCs.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
---
V3:
 - added 'arm64: ' prefix to the subject

 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
index 6aa319dae396..aeaef01d375f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
@@ -151,6 +151,7 @@
 };
 
 &pcie1 {
+	compatible = "fsl,ls2088a-pcie", "snps,dw-pcie";
 	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 	       0x20 0x00000000 0x0 0x00002000>; /* configuration space */
 
@@ -159,6 +160,7 @@
 };
 
 &pcie2 {
+	compatible = "fsl,ls2088a-pcie", "snps,dw-pcie";
 	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 	       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
 
@@ -167,6 +169,7 @@
 };
 
 &pcie3 {
+	compatible = "fsl,ls2088a-pcie", "snps,dw-pcie";
 	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 	       0x30 0x00000000 0x0 0x00002000>; /* configuration space */
 
@@ -175,6 +178,7 @@
 };
 
 &pcie4 {
+	compatible = "fsl,ls2088a-pcie", "snps,dw-pcie";
 	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
 	       0x38 0x00000000 0x0 0x00002000>; /* configuration space */
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
