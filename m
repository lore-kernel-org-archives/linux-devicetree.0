From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v4 03/10] dt-bindings: arm: mediatek: document clk bindings for MT6797
Date: Sat, 8 Apr 2017 09:20:28 +0800
Message-ID: <1491614435-23754-4-git-send-email-mars.cheng@mediatek.com>
References: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Kevin-CW Chen <kevin-cw.chen@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Kevin-CW Chen <kevin-cw.chen@mediatek.com>

This patch adds the binding documentation for apmixedsys, imgsys,
infracfg, mmsys, topckgen, vdecsys and vencsys for MT6797.

Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |    3 ++-
 7 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index cb0054a..cd977db 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-apmixedsys"
+	- "mediatek,mt6797-apmixedsys"
 	- "mediatek,mt8135-apmixedsys"
 	- "mediatek,mt8173-apmixedsys"
 - #clock-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
index f6a9166..047b11a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-imgsys", "syscon"
+	- "mediatek,mt6797-imgsys", "syscon"
 	- "mediatek,mt8173-imgsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index 1620ec2..58d58e2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -8,6 +8,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-infracfg", "syscon"
+	- "mediatek,mt6797-infracfg", "syscon"
 	- "mediatek,mt8135-infracfg", "syscon"
 	- "mediatek,mt8173-infracfg", "syscon"
 - #clock-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index 67dd2e4..70529e0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-mmsys", "syscon"
+	- "mediatek,mt6797-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
index 9f2fe78..ec93ecb 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-topckgen"
+	- "mediatek,mt6797-topckgen"
 	- "mediatek,mt8135-topckgen"
 	- "mediatek,mt8173-topckgen"
 - #clock-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
index 2440f73..d150104 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt2701-vdecsys", "syscon"
+	- "mediatek,mt6797-vdecsys", "syscon"
 	- "mediatek,mt8173-vdecsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
index 5bb2866..8a93be6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
@@ -5,7 +5,8 @@ The Mediatek vencsys controller provides various clocks to the system.
 
 Required Properties:
 
-- compatible: Should be:
+- compatible: Should be one of:
+	- "mediatek,mt6797-vencsys", "syscon"
 	- "mediatek,mt8173-vencsys", "syscon"
 - #clock-cells: Must be 1
 
-- 
1.7.9.5

