From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v13 01/12] dt-bindings: display: mediatek: update supported chips
Date: Fri, 31 Mar 2017 19:30:28 +0800
Message-ID: <1490959839-39816-2-git-send-email-yt.shen@mediatek.com>
References: <1490959839-39816-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490959839-39816-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com, emil.l.velikov@gmail.com, thierry.reding@gmail.com, Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add decriptions about supported chips, including MT2701 & MT8173

Signed-off-by: YT Shen <yt.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 2 ++
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 708f566..383183a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -40,6 +40,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" - display mutex
 	"mediatek,<chip>-disp-od"    - overdrive
+  the supported chips are mt2701 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
@@ -54,6 +55,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-ovl"
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
+  the supported chips are mt2701 and mt8173.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 - iommus: Should point to the respective IOMMU block with master port as
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 2b1585a..fadf327 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,6 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
+  the supported chips are mt2701 and mt8173.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -25,6 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
+  the supported chips are mt2701 and mt8173.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
-- 
1.9.1
