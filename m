From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH 1/4] dt-bindings: mediatek: add compatible for mt8183 pwrap
Date: Wed, 19 Sep 2018 15:25:58 +0800
Message-ID: <1537341961-20736-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: argus.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, srv_heupstream@mediatek.com, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds dt-binding documentation of pwrap for Mediatek MT8183 SoC
Platform.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index f9987c3..012fe3f 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -23,6 +23,7 @@ Required properties in pwrap device node.
 	"mediatek,mt7622-pwrap" for MT7622 SoCs
 	"mediatek,mt8135-pwrap" for MT8135 SoCs
 	"mediatek,mt8173-pwrap" for MT8173 SoCs
+	"mediatek,mt8183-pwrap" for MT8183 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: Must include the following entries:
   "pwrap": Main registers base
-- 
1.9.1
