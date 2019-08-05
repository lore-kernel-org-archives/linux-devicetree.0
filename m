From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 01/11] dt-bindings: mediatek: add support for mt6779 reference board
Date: Mon, 5 Aug 2019 17:11:50 +0800
Message-ID: <1564996320-10897-2-git-send-email-mars.cheng@mediatek.com>
References: <1564996320-10897-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564996320-10897-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Wendell Lin <wendell.lin@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Update binding document for mt6779 reference board

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek.yaml          |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a4ad2eb..4043c50 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -48,6 +48,10 @@ properties:
           - const: mediatek,mt6765
       - items:
           - enum:
+              - mediatek,mt6779-evb
+          - const: mediatek,mt6779
+      - items:
+          - enum:
               - mediatek,mt6795-evb
           - const: mediatek,mt6795
       - items:
-- 
1.7.9.5
