From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH] dt-bindings: rng: mtk-rng: Add documentation for MT8516
Date: Mon,  5 Aug 2019 15:02:15 +0200
Message-ID: <20190805130215.20499-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
List-Id: devicetree@vger.kernel.org

This commit adds the device-tree documentation for the RNG IP on the
MediaTek MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/rng/mtk-rng.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
index 2bc89f133701..dfdcb5cd2ea8 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.txt
@@ -6,6 +6,7 @@ Required properties:
 			"mediatek,mt7622-rng", 	"mediatek,mt7623-rng" : for MT7622
 			"mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
 			"mediatek,mt7623-rng" : for MT7623
+			"mediatek,mt8516-rng", "mediatek,mt7623-rng" : for MT8516
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : Should contain "rng" entries;
-- 
2.23.0.rc1
