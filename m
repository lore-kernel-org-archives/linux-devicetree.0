From: Dehui Sun <dehui.sun@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: mediatek: update bindings for MT8183 systimer
Date: Tue, 11 Jun 2019 19:28:53 +0800
Message-ID: <1560252534-11412-2-git-send-email-dehui.sun@mediatek.com>
References: <1560252534-11412-1-git-send-email-dehui.sun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560252534-11412-1-git-send-email-dehui.sun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, erin.lo@mediatek.com, weiyi.lu@mediatek.com, dehui.sun@mediatek.com
List-Id: devicetree@vger.kernel.org

This commit adds mt8183 compatible node in mtk-timer binding document.

Signed-off-by: Dehui Sun <dehui.sun@mediatek.com>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 74c3ead..0d25648 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -21,6 +21,7 @@ Required properties:
 	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
 
 	For those SoCs that use SYST
+	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
 	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
 	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
 
-- 
2.1.0
