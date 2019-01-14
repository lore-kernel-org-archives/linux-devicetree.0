From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v1 1/3] dt-bindings: mtd: mtk-quadspi: update bindings for MT7629 SoC
Date: Mon, 14 Jan 2019 13:12:18 +0800
Message-ID: <67e650ca4fcaaddbbc98bf4e1cbe04647c990dc3.1547442452.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

This updates bindings for the MT7629 SPI-NOR controller.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1: add a Reviewed-by tag. 
---
 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
index 56d3668..a12e3b5 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
@@ -1,4 +1,4 @@
-* Serial NOR flash controller for MTK MT81xx (and similar)
+* Serial NOR flash controller for MediaTek SoCs
 
 Required properties:
 - compatible: 	  For mt8173, compatible should be "mediatek,mt8173-nor",
@@ -10,6 +10,7 @@ Required properties:
 		  "mediatek,mt2712-nor", "mediatek,mt8173-nor"
 		  "mediatek,mt7622-nor", "mediatek,mt8173-nor"
 		  "mediatek,mt7623-nor", "mediatek,mt8173-nor"
+		  "mediatek,mt7629-nor", "mediatek,mt8173-nor"
 		  "mediatek,mt8173-nor"
 - reg: 		  physical base address and length of the controller's register
 - clocks: 	  the phandle of the clocks needed by the nor controller
-- 
1.9.1
