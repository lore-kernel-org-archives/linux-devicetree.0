From: Wen He <wen.he_1@nxp.com>
Subject: [v2 3/3] dts: arm64: ls1028a: Add optional property node for Mali DP500
Date: Fri, 19 Jul 2019 17:59:56 +0800
Message-ID: <20190719095956.11774-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, liviu.dudau@arm.com, robh+dt@kernel.org
Cc: leoyang.li@nxp.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch use the optional property node "arm,malidp-arqos-value" to
can be dynamic configure QoS signaling.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 7975519b4f56..aef5b06a98d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -554,6 +554,7 @@
 		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
 		clock-names = "pxlclk", "mclk", "aclk", "pclk";
 		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
+		arm,malidp-arqos-value = <0xd000d000>;
 
 		port {
 			dp0_out: endpoint {
-- 
2.17.1
