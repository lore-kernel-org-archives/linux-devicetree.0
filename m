From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 12/12] dt-bindings: clock: mediatek: update audsys bindings to adapt the wrapper
Date: Tue, 2 Jan 2018 19:47:54 +0800
Message-ID: <afba726556ad492a8d9edf461168e5bd67bae8c9.1514881870.git.ryder.lee@mediatek.com>
References: <cover.1514881870.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1514881870.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Update the DT binding to adapt the new audio subsystem wrapper.
Also add a compatible string for MT2701.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.txt         | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 9b8f578..106defa 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -6,17 +6,24 @@ The MediaTek AUDSYS controller provides various clocks to the system.
 Required Properties:
 
 - compatible: Should be one of:
-	- "mediatek,mt7622-audsys", "syscon"
+	- "mediatek,mt2701-audsys",
+	- "mediatek,mt7622-audsys",
 - #clock-cells: Must be 1
 
 The AUDSYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
 The available clocks are defined in dt-bindings/clock/mt*-clk.h.
 
+Must be a subnode of MediaTek audio subsystem device tree node.
+See ../mfd/mtk-audsys.txt for details about the parent node.
+
 Example:
 
-audsys: audsys@11220000 {
-	compatible = "mediatek,mt7622-audsys", "syscon";
-	reg = <0 0x11220000 0 0x1000>;
-	#clock-cells = <1>;
-};
+	audio-subsystm@11220000 {
+		compatible = "mediatek,mt2701-audsys-core";
+		...
+		audsys: clock {
+			compatible = "mediatek,mt2701-audsys";
+			#clock-cells = <1>;
+		};
+	};
-- 
1.9.1
