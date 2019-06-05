From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v3, 01/27] dt-bindings: mediatek: add binding for mt8183 display
Date: Wed, 5 Jun 2019 19:42:40 +0800
Message-ID: <1559734986-7379-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Update device tree binding documention for the display subsystem for
Mediatek MT8183 SOCs

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.txt    | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 8469de5..70770fe 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -27,20 +27,20 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
-	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
-	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
-	"mediatek,<chip>-disp-wdma"  - write DMA
-	"mediatek,<chip>-disp-color" - color processor
-	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
-	"mediatek,<chip>-disp-gamma" - gamma correction
-	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
-	"mediatek,<chip>-disp-split" - split stream to two encoders
-	"mediatek,<chip>-disp-ufoe"  - data compression engine
-	"mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
-	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
-	"mediatek,<chip>-disp-mutex" - display mutex
-	"mediatek,<chip>-disp-od"    - overdrive
-  the supported chips are mt2701, mt2712 and mt8173.
+	"mediatek,<chip>-disp-ovl"   		- overlay (4 layers, blending, csc)
+	"mediatek,<chip>-disp-rdma"  		- read DMA / line buffer
+	"mediatek,<chip>-disp-wdma"  		- write DMA
+	"mediatek,<chip>-disp-color" 		- color processor
+	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
+	"mediatek,<chip>-disp-gamma" 		- gamma correction
+	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
+	"mediatek,<chip>-disp-split" 		- split stream to two encoders
+	"mediatek,<chip>-disp-ufoe"  		- data compression engine
+	"mediatek,<chip>-dsi"        		- DSI controller, see mediatek,dsi.txt
+	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
+	"mediatek,<chip>-disp-mutex" 		- display mutex
+	"mediatek,<chip>-disp-od"    		- overdrive
+  the supported chips are mt2701, mt2712, mt8173 and mt8183.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
@@ -71,6 +71,12 @@ mmsys: clock-controller@14000000 {
 	#clock-cells = <1>;
 };
 
+display_components: dispsys@14000000 {
+		compatible = "mediatek,mt8183-display";
+		reg = <0 0x14000000 0 0x1000>;
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+};
+
 ovl0: ovl@1400c000 {
 	compatible = "mediatek,mt8173-disp-ovl";
 	reg = <0 0x1400c000 0 0x1000>;
-- 
1.8.1.1.dirty
