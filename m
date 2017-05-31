From: <sean.wang@mediatek.com>
Subject: [PATCH v3 1/3] dt-bindings: mediatek: add bindings for MediaTek
 MT7622 SoC
Date: Thu, 1 Jun 2017 01:28:59 +0800
Message-ID: <1b9dd0df077a59aea5a15e3cb7775f80224b0b06.1496250798.git.sean.wang@mediatek.com>
References: <cover.1496250798.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1496250798.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This adds dt-binding documentation for MediaTek MT7622 SoC
which currently only includes basic items such as ARM CPU,
MediaTek SYSIRQ and UART.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt                    | 4 ++++
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt      | 3 ++-
 Documentation/devicetree/bindings/serial/mtk-uart.txt                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index c860b24..fc68570 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -12,6 +12,7 @@ compatible: Must contain one of
    "mediatek,mt6592"
    "mediatek,mt6755"
    "mediatek,mt6795"
+   "mediatek,mt7622"
    "mediatek,mt7623"
    "mediatek,mt8127"
    "mediatek,mt8135"
@@ -38,6 +39,9 @@ Supported boards:
 - Evaluation board for MT6795(Helio X10):
     Required root node properties:
       - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
+- Reference board variant 1 for MT7622:
+    Required root node properties:
+      - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
 - Evaluation board for MT7623:
     Required root node properties:
       - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index a89c03b..eda1183 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -1,4 +1,4 @@
-+Mediatek 65xx/67xx/81xx sysirq
++Mediatek MT65xx/MT67xx/MT762x/MT81xx sysirq
 
 Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
 interrupt.
@@ -15,6 +15,7 @@ Required properties:
 	"mediatek,mt6582-sysirq"
 	"mediatek,mt6580-sysirq"
 	"mediatek,mt6577-sysirq"
+	"mediatek,mt7622-sysirq"
 	"mediatek,mt2701-sysirq"
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 0015c72..daa1eef 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -8,6 +8,7 @@ Required properties:
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
   * "mediatek,mt6755-uart" for MT6755 compatible UARTS
   * "mediatek,mt6795-uart" for MT6795 compatible UARTS
+  * "mediatek,mt7622-uart" for MT7622 compatible UARTS
   * "mediatek,mt7623-uart" for MT7623 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
-- 
1.9.1
