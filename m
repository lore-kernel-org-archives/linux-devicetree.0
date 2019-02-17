From: Ryder Lee <ryder.lee@kernel.org>
Subject: [PATCH 3/3] dt-bindings: timer: mediatek: update bindings for MT7629 SoC
Date: Sun, 17 Feb 2019 21:50:32 +0800
Message-ID: <b145be98c1bfa71d0b9609b80c20c37177f45d6a.1550233614.git.ryder.lee@mediatek.com>
References: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

Update the binding for MT7629 SoC, which uses fallback compatible to
MT6765 SYST, so add more descriptions to distinguish it from the other
SoCs that use GPT.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 18d4d01..ff7c567 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -1,7 +1,7 @@
-Mediatek Timers
+MediaTek Timers
 ---------------
 
-Mediatek SoCs have two different timers on different platforms,
+MediaTek SoCs have two different timers on different platforms,
 - GPT (General Purpose Timer)
 - SYST (System Timer)
 
@@ -9,6 +9,7 @@ The proper timer will be selected automatically by driver.
 
 Required properties:
 - compatible should contain:
+	For those SoCs that use GPT
 	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
 	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
 	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
@@ -17,7 +18,11 @@ Required properties:
 	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
 	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
 	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
-	* "mediatek,mt6765-timer" for MT6765 compatible timers (SYST)
+
+	For those SoCs that use SYST
+	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
+	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
+
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
 
-- 
1.9.1
