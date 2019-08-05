From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 03/11] dt-bindings: irq: mtk,sysirq: add support for mt6779
Date: Mon, 5 Aug 2019 17:11:52 +0800
Message-ID: <1564996320-10897-4-git-send-email-mars.cheng@mediatek.com>
References: <1564996320-10897-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564996320-10897-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Wendell Lin <wendell.lin@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation of mediatek,sysirq for mt6779 SoC.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 0e312fe..84ced3f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -15,6 +15,7 @@ Required properties:
 	"mediatek,mt7629-sysirq", "mediatek,mt6577-sysirq": for MT7629
 	"mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
 	"mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
+	"mediatek,mt6779-sysirq", "mediatek,mt6577-sysirq": for MT6779
 	"mediatek,mt6765-sysirq", "mediatek,mt6577-sysirq": for MT6765
 	"mediatek,mt6755-sysirq", "mediatek,mt6577-sysirq": for MT6755
 	"mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq": for MT6592
-- 
1.7.9.5
