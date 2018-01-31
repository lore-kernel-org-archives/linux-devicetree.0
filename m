From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 4/5] dt-bindings: clock: mediatek: update audsys documentation to adapt MFD device
Date: Wed, 31 Jan 2018 15:42:44 +0800
Message-ID: <8651585c91ee40f6ab3e30b893bcfb90fe5c2c25.1515639336.git.ryder.lee@mediatek.com>
References: <cover.1515639336.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1515639336.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

As the MediaTek audio hardware block that expose functionalities that are
handled by separate subsystems in the kernel, and there are registers that
are shared between related drivers.

Switch the current device to an MFD device, add more descriptions about the
subsystem and modify example accordingly.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.txt      | 37 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 9b8f578..677af40 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -1,22 +1,45 @@
-MediaTek AUDSYS controller
+MediaTek Audio Subsystem
 ============================
+The audio subsystem is one of the multi-function blocks of MediaTek SoCs.
+It contains a system controller, which provides a number registers giving
+access to two features: AUDSYS clocks and Audio Front End (AFE) components.
 
+For the top level node:
+- compatible: must be: "syscon", "simple-mfd";
+- reg: register area of the Audio Subsystem
+
+Required sub-nodes:
+
+AUDSYS clocks:
+-------
 The MediaTek AUDSYS controller provides various clocks to the system.
 
 Required Properties:
 
 - compatible: Should be one of:
-	- "mediatek,mt7622-audsys", "syscon"
+	- "mediatek,mt2701-audsys";
+	- "mediatek,mt7622-audsys";
 - #clock-cells: Must be 1
 
 The AUDSYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
 The available clocks are defined in dt-bindings/clock/mt*-clk.h.
 
+AFE components:
+-------
+For common binding part and usage, refer to
+../sonud/mt2701-afe-pcm.txt.
+
 Example:
 
-audsys: audsys@11220000 {
-	compatible = "mediatek,mt7622-audsys", "syscon";
-	reg = <0 0x11220000 0 0x1000>;
-	#clock-cells = <1>;
-};
+	audio-subsystem@11220000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0 0x11220000 0 0x2000>;
+
+		audsys: clock {
+			compatible = "mediatek,mt2701-audsys";
+			#clock-cells = <1>;
+		};
+
+		...
+	};
-- 
1.9.1
