From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH v3 2/5] dt-bindings: mediatek: Modify pinctrl bindings for mt2701
Date: Mon, 28 Dec 2015 15:09:03 +0800
Message-ID: <1451286546-5920-3-git-send-email-biao.huang@mediatek.com>
References: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, Biao Huang <biao.huang@mediatek.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 0480bc3..9ffb0b2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -4,10 +4,11 @@ The Mediatek's Pin controller is used to control SoC pins.
 
 Required properties:
 - compatible: value should be one of the following.
-    (a) "mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
-    (b) "mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
-    (c) "mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
-    (d) "mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
+	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
+	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
+	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
+	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
+	"mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
 - pins-are-numbered: Specify the subnodes are using numbered pinmux to
   specify pins.
 - gpio-controller : Marks the device node as a gpio controller.
-- 
1.7.9.5
