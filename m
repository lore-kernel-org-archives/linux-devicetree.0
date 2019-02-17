From: Ryder Lee <ryder.lee@kernel.org>
Subject: [PATCH 2/3] dt-bindings: soc: fix a typo for MT7623A
Date: Sun, 17 Feb 2019 21:50:31 +0800
Message-ID: <4dc5366741758441388ffd4c976135d28d2ed652.1550233614.git.ryder.lee@mediatek.com>
References: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

This fixes a typo for MT7623A

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 9a88d418..876693a 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -35,7 +35,7 @@ Required properties:
 	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
 	Required clocks for MT6797: "mm", "mfg", "vdec"
 	Required clocks for MT7622 or MT7629: "hif_sel"
-	Required clocks for MT7622A: "ethif"
+	Required clocks for MT7623A: "ethif"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
 Optional properties:
-- 
1.9.1
