From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v4 1/2] Document: DT: Add bindings for mediatek MT6580 SoC Platform
Date: Tue, 14 Jul 2015 14:07:08 +0800
Message-ID: <1436854029-16599-2-git-send-email-mars.cheng@mediatek.com>
References: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds a DT binding documentation for the MT6580 SoC from Mediatek.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt                 | 4 ++++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt | 1 +
 Documentation/devicetree/bindings/serial/mtk-uart.txt              | 3 ++-
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt     | 6 +++++-
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index dd7550a..2daa424 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -5,6 +5,7 @@ Boards with a MediaTek mt65xx/mt81xx SoC shall have the following property:
 Required root node property:
 
 compatible: Must contain one of
+   "mediatek,mt6580"
    "mediatek,mt6589"
    "mediatek,mt6592"
    "mediatek,mt8127"
@@ -14,6 +15,9 @@ compatible: Must contain one of
 
 Supported boards:
 
+- Evaluation board for MT6580:
+    Required root node properties:
+      - compatible = "mediatek,mt6580-evbp1", "mediatek,mt6580";
 - bq Aquaris5 smart phone:
     Required root node properties:
       - compatible = "mundoreader,bq-aquaris5", "mediatek,mt6589";
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
index 4f5a535..3c9c3a7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
@@ -11,6 +11,7 @@ Required properties:
 	"mediatek,mt6592-sysirq"
 	"mediatek,mt6589-sysirq"
 	"mediatek,mt6582-sysirq"
+	"mediatek,mt6580-sysirq"
 	"mediatek,mt6577-sysirq"
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 8d63f1d..a875997 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -7,8 +7,9 @@ Required properties:
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
   * "mediatek,mt6582-uart" for MT6582 compatible UARTS
+  * "mediatek,mt6580-uart" for MT6580 compatible UARTS
   * "mediatek,mt6577-uart" for all compatible UARTS (MT8173, MT6589, MT6582, 
-	MT6577)
+	MT6580, MT6577)
 
 - reg: The base address of the UART register bank.
 
diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 7c4408f..53a3029 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -2,7 +2,11 @@ Mediatek MT6577, MT6572 and MT6589 Timers
 ---------------------------------------
 
 Required properties:
-- compatible: Should be "mediatek,mt6577-timer"
+- compatible should contain:
+	* "mediatek,mt6589-timer" for MT6589 compatible timers
+	* "mediatek,mt6580-timer" for MT6580 compatible timers
+	* "mediatek,mt6577-timer" for all compatible timers (MT6589, MT6580,
+		MT6577)
 - reg: Should contain location and length for timers register.
 - clocks: Clocks driving the timer hardware. This list should include two
 	clocks. The order is system clock and as second clock the RTC clock.
-- 
1.8.1.1.dirty
