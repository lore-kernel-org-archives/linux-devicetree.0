From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 4/7] dt-bindings: mediatek: update bindings for MT7629 SoC
Date: Tue, 29 Jan 2019 12:31:16 +0800
Message-ID: <30465fff4cfe17cceddc5d468627c11f1a3935b7.1548735271.git.ryder.lee@mediatek.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

This updates bindings for MT7629 SoC, which includes very basic items
such as system timer, UART, sysirq and scpsys unit.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt   | 5 +++--
 Documentation/devicetree/bindings/serial/mtk-uart.txt              | 3 ++-
 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt          | 5 +++--
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt     | 7 ++++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 33a98eb..8da481c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -1,6 +1,6 @@
-+Mediatek MT65xx/MT67xx/MT81xx sysirq
+MediaTek sysirq
 
-Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
+MediaTek SOCs sysirq support controllable irq inverter for each GIC SPI
 interrupt.
 
 Required properties:
@@ -9,6 +9,7 @@ Required properties:
 	"mediatek,mt8135-sysirq", "mediatek,mt6577-sysirq": for MT8135
 	"mediatek,mt8127-sysirq", "mediatek,mt6577-sysirq": for MT8127
 	"mediatek,mt7622-sysirq", "mediatek,mt6577-sysirq": for MT7622
+	"mediatek,mt7629-sysirq", "mediatek,mt6577-sysirq": for MT7629
 	"mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
 	"mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
 	"mediatek,mt6765-sysirq", "mediatek,mt6577-sysirq": for MT6765
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 742cb47..4910f63 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -1,4 +1,4 @@
-* Mediatek Universal Asynchronous Receiver/Transmitter (UART)
+* MediaTek Universal Asynchronous Receiver/Transmitter (UART)
 
 Required properties:
 - compatible should contain:
@@ -13,6 +13,7 @@ Required properties:
   * "mediatek,mt6797-uart" for MT6797 compatible UARTS
   * "mediatek,mt7622-uart" for MT7622 compatible UARTS
   * "mediatek,mt7623-uart" for MT7623 compatible UARTS
+  * "mediatek,mt7629-uart" for MT7629 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index d6fe16f..876693a 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -23,6 +23,7 @@ Required properties:
 	- "mediatek,mt7622-scpsys"
 	- "mediatek,mt7623-scpsys", "mediatek,mt2701-scpsys": For MT7623 SoC
 	- "mediatek,mt7623a-scpsys": For MT7623A SoC
+	- "mediatek,mt7629-scpsys", "mediatek,mt7622-scpsys": For MT7629 SoC
 	- "mediatek,mt8173-scpsys"
 - #power-domain-cells: Must be 1
 - reg: Address range of the SCPSYS unit
@@ -33,8 +34,8 @@ Required properties:
 	Required clocks for MT2701 or MT7623: "mm", "mfg", "ethif"
 	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
 	Required clocks for MT6797: "mm", "mfg", "vdec"
-	Required clocks for MT7622: "hif_sel"
-	Required clocks for MT7622A: "ethif"
+	Required clocks for MT7622 or MT7629: "hif_sel"
+	Required clocks for MT7623A: "ethif"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
 Optional properties:
diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 18d4d01..12b6d06 100644
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
 
@@ -17,7 +17,8 @@ Required properties:
 	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
 	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
 	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
-	* "mediatek,mt6765-timer" for MT6765 compatible timers (SYST)
+	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
+	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
 
-- 
1.9.1
