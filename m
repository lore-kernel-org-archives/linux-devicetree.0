From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/3] dt-bindings: dmaengine: Add one new cell to present hardware slave id
Date: Tue, 22 Jan 2019 21:20:51 +0800
Message-ID: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: arnd@arndb.de, olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

The DMA engine clients can trigger DMA engine automatically by setting
the corresponding hardware slave id for the DMA engine. Thus add one
cell to present the hardware slave id for DMA clients.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 Documentation/devicetree/bindings/dma/sprd-dma.txt |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
index 7a10fea..7812cf0 100644
--- a/Documentation/devicetree/bindings/dma/sprd-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
@@ -6,8 +6,8 @@ Required properties:
 - compatible: Should be "sprd,sc9860-dma".
 - reg: Should contain DMA registers location and length.
 - interrupts: Should contain one interrupt shared by all channel.
-- #dma-cells: must be <1>. Used to represent the number of integer
-	cells in the dmas property of client device.
+- #dma-cells: must be <2>. Used to represent the channel id and slave id
+	of integer cells in the dmas property of client device.
 - #dma-channels : Number of DMA channels supported. Should be 32.
 - clock-names: Should contain the clock of the DMA controller.
 - clocks: Should contain a clock specifier for each entry in clock-names.
@@ -28,14 +28,16 @@ apdma: dma-controller@20100000 {
 
 Client:
 DMA clients connected to the Spreadtrum DMA controller must use the format
-described in the dma.txt file, using a two-cell specifier for each channel.
-The two cells in order are:
+described in the dma.txt file, using a three-cell specifier for each channel.
+The three cells in order are:
 1. A phandle pointing to the DMA controller.
 2. The channel id.
+3. The hardware slave id which is used for clients to trigger DMA engine
+automatically.
 
 spi0: spi@70a00000{
 	...
 	dma-names = "rx_chn", "tx_chn";
-	dmas = <&apdma 11>, <&apdma 12>;
+	dmas = <&apdma 11 11>, <&apdma 12 12>;
 	...
 };
-- 
1.7.9.5
