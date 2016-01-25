From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V3 01/11] dt-bindings: ARM: Mediatek: add MT2701/7623 string to the PMIC wrapper doc
Date: Mon, 25 Jan 2016 10:53:14 +0100
Message-ID: <1453715604-36856-2-git-send-email-blogic@openwrt.org>
References: <1453715604-36856-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453715604-36856-1-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, John Crispin <blogic@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index ddeb5b6..107700d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -18,6 +18,7 @@ IP Pairing
 
 Required properties in pwrap device node.
 - compatible:
+	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
 	"mediatek,mt8135-pwrap" for MT8135 SoCs
 	"mediatek,mt8173-pwrap" for MT8173 SoCs
 - interrupts: IRQ for pwrap in SOC
-- 
1.7.10.4
