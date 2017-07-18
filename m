From: <sean.wang@mediatek.com>
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
Date: Tue, 18 Jul 2017 17:49:21 +0800
Message-ID: <fff9908edae7da7958ac43dfe9fa98b26c03a4e3.1500368529.git.sean.wang@mediatek.com>
References: <cover.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1500368529.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 107700d..2d6d4a9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -35,6 +35,10 @@ Required properties in pwrap device node.
   "wrap": Main module clock
 - clocks: Must contain an entry for each entry in clock-names.
 
+Required properties in pwrap device node
+- compatible:
+	"mediatek,mt7622-pwrap" for MT7622 SoCs
+
 Optional properities:
 - pmic: Mediatek PMIC MFD is the child device of pwrap
   See the following for child node definitions:
-- 
2.7.4
