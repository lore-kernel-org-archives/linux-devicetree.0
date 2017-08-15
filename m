From: <sean.wang@mediatek.com>
Subject: [PATCH v3 1/9] dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
Date: Tue, 15 Aug 2017 17:09:13 +0800
Message-ID: <d019443230d1a6b64c8449aed078237c1ac4bd9b.1502779753.git.sean.wang@mediatek.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1502779753.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 107700d..bd97f22 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -19,6 +19,7 @@ IP Pairing
 Required properties in pwrap device node.
 - compatible:
 	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
+	"mediatek,mt7622-pwrap" for MT7622 SoCs
 	"mediatek,mt8135-pwrap" for MT8135 SoCs
 	"mediatek,mt8173-pwrap" for MT8173 SoCs
 - interrupts: IRQ for pwrap in SOC
-- 
2.7.4
