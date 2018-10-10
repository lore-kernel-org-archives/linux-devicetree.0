From: laurentiu.tudor@nxp.com
Subject: [PATCH v3 19/22] arm64: dts: ls104x: add missing dma ranges property
Date: Wed, 10 Oct 2018 15:07:34 +0300
Message-ID: <20181010120737.30300-17-laurentiu.tudor@nxp.com>
References: <20181010120737.30300-1-laurentiu.tudor@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010120737.30300-1-laurentiu.tudor@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: roy.pledge@nxp.com, madalin.bucur@nxp.com, davem@davemloft.net, shawnguo@kernel.org, leoyang.li@nxp.com, robin.murphy@arm.com, bharat.bhushan@nxp.com, arnd@arndb.de, Laurentiu Tudor <laurentiu.tudor@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

These chips have a 48-bit address size so make sure that the dma-ranges
reflects this. Otherwise the linux kernel's dma sub-system will set
the default dma masks to full 64-bit, badly breaking dmas.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 1f9b385007a8..0e8fc8f29997 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -214,6 +214,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
 
 		clockgen: clocking@1ee1000 {
 			compatible = "fsl,ls1043a-clockgen";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 22bf3975492a..29b07bdd4207 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -187,6 +187,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
 
 		ddr: memory-controller@1080000 {
 			compatible = "fsl,qoriq-memory-controller";
-- 
2.17.1
