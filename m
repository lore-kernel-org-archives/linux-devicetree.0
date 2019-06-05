From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v3, 03/27] dt-bindings: mediatek: add ccorr description for mt8183 display
Date: Wed, 5 Jun 2019 19:42:42 +0800
Message-ID: <1559734986-7379-4-git-send-email-yongqiang.niu@mediatek.com>
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
 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 2418c56..e149245 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -31,6 +31,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-disp-ovl-2l"           - overlay (2 layers, blending, csc)
 	"mediatek,<chip>-disp-rdma"  		- read DMA / line buffer
 	"mediatek,<chip>-disp-wdma"  		- write DMA
+	"mediatek,<chip>-disp-ccorr"            - color correction
 	"mediatek,<chip>-disp-color" 		- color processor
 	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
 	"mediatek,<chip>-disp-gamma" 		- gamma correction
-- 
1.8.1.1.dirty
