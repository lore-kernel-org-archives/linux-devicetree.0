From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 1/2] Document: DT: Add bindings for mediatek MT6795 SoC Platform
Date: Wed, 8 Jul 2015 18:14:39 +0800
Message-ID: <1436350480-17276-2-git-send-email-mars.cheng@mediatek.com>
References: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds DT binding documentation for Mediatek MT6795.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt               | 9 +++++++--
 .../devicetree/bindings/arm/mediatek/mediatek,sysirq.txt         | 3 ++-
 Documentation/devicetree/bindings/serial/mtk-uart.txt            | 5 +++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 2daa424..618a919 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -1,6 +1,7 @@
-MediaTek mt65xx & mt81xx Platforms Device Tree Bindings
+MediaTek mt65xx, mt67xx & mt81xx Platforms Device Tree Bindings
 
-Boards with a MediaTek mt65xx/mt81xx SoC shall have the following property:
+Boards with a MediaTek mt65xx/mt67xx/mt81xx SoC shall have the
+following property:
 
 Required root node property:
 
@@ -8,6 +9,7 @@ compatible: Must contain one of
    "mediatek,mt6580"
    "mediatek,mt6589"
    "mediatek,mt6592"
+   "mediatek,mt6795"
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
@@ -24,6 +26,9 @@ Supported boards:
 - Evaluation board for MT6592:
     Required root node properties:
       - compatible = "mediatek,mt6592-evb", "mediatek,mt6592";
+- Evaluation board for MT6795(Helio X10):
+    Required root node properties:
+      - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
 - MTK mt8127 tablet moose EVB:
     Required root node properties:
       - compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
index 3c9c3a7..260cc1a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
@@ -1,4 +1,4 @@
-Mediatek 65xx/81xx sysirq
+Mediatek 65xx/67xx/81xx sysirq
 
 Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
 interrupt.
@@ -8,6 +8,7 @@ Required properties:
 	"mediatek,mt8173-sysirq"
 	"mediatek,mt8135-sysirq"
 	"mediatek,mt8127-sysirq"
+	"mediatek,mt6795-sysirq"
 	"mediatek,mt6592-sysirq"
 	"mediatek,mt6589-sysirq"
 	"mediatek,mt6582-sysirq"
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index a875997..c0a70f2 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -5,11 +5,12 @@ Required properties:
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
+  * "mediatek,mt6795-uart" for MT6795 compatible UARTS
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
   * "mediatek,mt6582-uart" for MT6582 compatible UARTS
   * "mediatek,mt6580-uart" for MT6580 compatible UARTS
-  * "mediatek,mt6577-uart" for all compatible UARTS (MT8173, MT6589, MT6582, 
-	MT6580, MT6577)
+  * "mediatek,mt6577-uart" for all compatible UARTS (MT8173, MT6795, MT6589,
+	MT6582, MT6580, MT6577)
 
 - reg: The base address of the UART register bank.
 
-- 
1.8.1.1.dirty
