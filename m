From: Ryder Lee <ryder.lee@kernel.org>
Subject: [PATCH 1/3] dt-bindings: mediatek: update bindings for MT7629 SoC
Date: Sun, 17 Feb 2019 21:50:30 +0800
Message-ID: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marc Zyngier <marc.zyngier@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

This updates bindings for MT7629 SoC, which includes very basic items
such as system timer, UART, sysirq and scpsys unit.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt     | 5 +++--
 Documentation/devicetree/bindings/serial/mtk-uart.txt                | 3 ++-
 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt            | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index c5d5891..e8b3688 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -1,6 +1,6 @@
-+Mediatek MT65xx/MT67xx/MT81xx sysirq
+MediaTek sysirq
 
-Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
+MediaTek SOCs sysirq support controllable irq inverter for each GIC SPI
 interrupt.
 
 Required properties:
@@ -10,6 +10,7 @@ Required properties:
 	"mediatek,mt8127-sysirq", "mediatek,mt6577-sysirq": for MT8127
 	"mediatek,mt7622-sysirq", "mediatek,mt6577-sysirq": for MT7622
 	"mediatek,mt7623-sysirq", "mediatek,mt6577-sysirq": for MT7623
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
index d6fe16f..9a88d418 100644
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
@@ -33,7 +34,7 @@ Required properties:
 	Required clocks for MT2701 or MT7623: "mm", "mfg", "ethif"
 	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
 	Required clocks for MT6797: "mm", "mfg", "vdec"
-	Required clocks for MT7622: "hif_sel"
+	Required clocks for MT7622 or MT7629: "hif_sel"
 	Required clocks for MT7622A: "ethif"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
-- 
1.9.1
