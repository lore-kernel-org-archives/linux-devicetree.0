From: <sean.wang@mediatek.com>
Subject: [PATCH 1/3] mmc: dt-bindings: add mmc support to MT7623 SoC
Date: Wed, 29 Nov 2017 18:10:35 +0800
Message-ID: <3e2c72d18bbe6d7c762fd820195f0fa0b5a45bbf.1511949769.git.sean.wang@mediatek.com>
References: <cover.1511949769.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1511949769.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add the devicetree binding for MT7623 SoC using MT2701 as the fallback.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
index 72d2a73..1732588 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
@@ -12,6 +12,8 @@ Required properties:
 	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
 	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
 	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
+	"mediatek,mt7623-mmc",
+	"mediatek,mt2701-mmc": for mmc host ip compatible with mt7623
 - reg: physical base address of the controller and length
 - interrupts: Should contain MSDC interrupt number
 - clocks: Should contain phandle for the clock feeding the MMC controller
-- 
2.7.4
