Return-Path: <SRS0=gutI=H6=mediatek.com=erin.lo@kernel.org>
From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: arm: Add bindings for Mediatek MT8183 SoC Platform
Date: Fri, 11 May 2018 14:11:22 +0800
Message-ID: <1526019083-20237-2-git-send-email-erin.lo@mediatek.com>
In-Reply-To: <1526019083-20237-1-git-send-email-erin.lo@mediatek.com>
References: <1526019083-20237-1-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, Erin Lo <erin.lo@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

This adds dt-binding documentation for Mediatek MT8183.
Only include very basic items: cpu, gic and uart.

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt                    | 4 ++++
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt      | 1 +
 Documentation/devicetree/bindings/serial/mtk-uart.txt                 | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 7d21ab3..2754535 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -19,6 +19,7 @@ compatible: Must contain one of
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
+   "mediatek,mt8183"
 
 
 Supported boards:
@@ -73,3 +74,6 @@ Supported boards:
 - MTK mt8173 tablet EVB:
     Required root node properties:
       - compatible = "mediatek,mt8173-evb", "mediatek,mt8173";
+- Evaluation board for MT8183:
+    Required root node properties:
+      - compatible = "mediatek,mt8183-evb", "mediatek,mt8183";
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 07bf0b9..5ff48a8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -5,6 +5,7 @@ interrupt.
 
 Required properties:
 - compatible: should be
+	"mediatek,mt8183-sysirq", "mediatek,mt6577-sysirq": for MT8183
 	"mediatek,mt8173-sysirq", "mediatek,mt6577-sysirq": for MT8173
 	"mediatek,mt8135-sysirq", "mediatek,mt6577-sysirq": for MT8135
 	"mediatek,mt8127-sysirq", "mediatek,mt6577-sysirq": for MT8127
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index f73abff..6e6d168 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -15,6 +15,7 @@ Required properties:
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
+  * "mediatek,mt8183-uart" for MT8183 compatible UARTS
   * "mediatek,mt6577-uart" for MT6577 and all of the above
 
 - reg: The base address of the UART register bank.
-- 
1.9.1
