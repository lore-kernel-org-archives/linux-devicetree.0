From: Ashish Kumar <Ashish.Kumar@nxp.com>
Subject: [PATCH] arm64: dts: ls208x: Remove non-compatible driver device from qspi node
Date: Tue, 10 Sep 2019 17:50:55 +0530
Message-ID: <1568118055-9740-5-git-send-email-Ashish.Kumar@nxp.com>
References: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ashish Kumar <Ashish.Kumar@nxp.com>, Kuldeep Singh <kuldeep.singh@nxp.com>
List-Id: devicetree@vger.kernel.org

Since device properties are different, so remove fsl, ls1021a-qspi.
ls1021a-qspi is to be used only for Big-endian verion of QSPI controller

Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
Signed-off-by: Ashish Kumar <Ashish.Kumar@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 64101c9..8e42ac9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -619,7 +619,7 @@
 
 		qspi: spi@20c0000 {
 			status = "disabled";
-			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
+			compatible = "fsl,ls2080a-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x20c0000 0x0 0x10000>,
-- 
2.7.4
