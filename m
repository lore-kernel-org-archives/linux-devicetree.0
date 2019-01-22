From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 3/3] arm64: dts: sprd: Change 2 cells to provide DMA controller specific information
Date: Tue, 22 Jan 2019 21:20:53 +0800
Message-ID: <44135b35c8a4fb1a68bb9c57013b672dd0fab3e7.1548158832.git.baolin.wang@linaro.org>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
In-Reply-To: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: arnd@arndb.de, olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Change to use 2 cells to provide the channel id and slave id for client.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 34b6ca0..dbd61f8 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -117,7 +117,7 @@
 				compatible = "sprd,sc9860-dma";
 				reg = <0 0x20100000 0 0x4000>;
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-				#dma-cells = <1>;
+				#dma-cells = <2>;
 				#dma-channels = <32>;
 				clock-names = "enable";
 				clocks = <&apahb_gate CLK_DMA_EB>;
@@ -273,7 +273,7 @@
 			agcp_dma: dma-controller@41580000 {
 				compatible = "sprd,sc9860-dma";
 				reg = <0 0x41580000 0 0x4000>;
-				#dma-cells = <1>;
+				#dma-cells = <2>;
 				#dma-channels = <32>;
 				clock-names = "enable", "ashb_eb";
 				clocks = <&agcp_gate CLK_AGCP_DMAAP_EB>,
-- 
1.7.9.5
