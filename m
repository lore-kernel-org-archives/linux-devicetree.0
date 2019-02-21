From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: dmaengine: sprd: Change channel id to slave id for DMA cell specifier
Date: Thu, 21 Feb 2019 13:34:40 +0800
Message-ID: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

For Spreadtrum DMA engine, all channels are equal, which means slave can
request any channels with setting a unique slave id to trigger this channel.

Thus we can remove the channel id from device tree to assign the channel
dynamically, moreover we should add the slave id in device tree.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - Remove channel id from DT.
---
 Documentation/devicetree/bindings/dma/sprd-dma.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
index 7a10fea..adccea994 100644
--- a/Documentation/devicetree/bindings/dma/sprd-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
@@ -31,7 +31,7 @@ DMA clients connected to the Spreadtrum DMA controller must use the format
 described in the dma.txt file, using a two-cell specifier for each channel.
 The two cells in order are:
 1. A phandle pointing to the DMA controller.
-2. The channel id.
+2. The slave id.
 
 spi0: spi@70a00000{
 	...
-- 
1.7.9.5
