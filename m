From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v2 02/11] dt-bindings: mtk-uart: add mt6779 uart bindings
Date: Mon, 19 Aug 2019 17:21:33 +0800
Message-ID: <1566206502-4347-3-git-send-email-mars.cheng@mediatek.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add documentation for mt6779 uart dt-bindings

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 6fdffb7..3a3b570 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -9,6 +9,7 @@ Required properties:
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
   * "mediatek,mt6755-uart" for MT6755 compatible UARTS
   * "mediatek,mt6765-uart" for MT6765 compatible UARTS
+  * "mediatek,mt6779-uart" for MT6779 compatible UARTS
   * "mediatek,mt6795-uart" for MT6795 compatible UARTS
   * "mediatek,mt6797-uart" for MT6797 compatible UARTS
   * "mediatek,mt7622-uart" for MT7622 compatible UARTS
-- 
1.7.9.5
