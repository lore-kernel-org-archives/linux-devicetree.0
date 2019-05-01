From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] mfd: lochnagar: Add links to binding docs for sound and hwmon
Date: Wed, 1 May 2019 11:23:50 +0100
Message-ID: <20190501102350.3520-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Add links to the binding documents for the new sound and hardware
monitor parts of the driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 .../devicetree/bindings/mfd/cirrus,lochnagar.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
index 004b0158cf4d7..3bf92ad37fa1b 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
+++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
@@ -19,6 +19,8 @@ And these documents for the required sub-node binding details:
   [4] Clock: ../clock/cirrus,lochnagar.txt
   [5] Pinctrl: ../pinctrl/cirrus,lochnagar.txt
   [6] Regulator: ../regulator/cirrus,lochnagar.txt
+  [7] Sound: ../sound/cirrus,lochnagar.txt
+  [8] Hardware Monitor: ../hwmon/cirrus,lochnagar.txt
 
 Required properties:
 
@@ -41,6 +43,11 @@ Optional sub-nodes:
   - Bindings for the regulator components, see [6]. Only available on
     Lochnagar 2.
 
+  - lochnagar-sc : Binding for the sound card components, see [7].
+                   Only available on Lochnagar 2.
+  - lochnagar-hwmon : Binding for the hardware monitor components, see [8].
+                      Only available on Lochnagar 2.
+
 Optional properties:
 
   - present-gpios : Host present line, indicating the presence of a
@@ -65,4 +72,14 @@ lochnagar: lochnagar@22 {
 		compatible = "cirrus,lochnagar-pinctrl";
 		...
 	};
+
+	lochnagar-sc {
+		compatible = "cirrus,lochnagar2-soundcard";
+		...
+	};
+
+	lochnagar-hwmon {
+		compatible = "cirrus,lochnagar2-hwmon";
+		...
+	};
 };
-- 
2.11.0
