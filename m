From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v5 5/8] regulator: lochnagar: Add initial binding documentation
Date: Tue, 20 Nov 2018 14:16:28 +0000
Message-ID: <20181120141631.18949-5-ckeepax@opensource.cirrus.com>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 .../bindings/regulator/cirrus,lochnagar.txt        | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt

diff --git a/Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
new file mode 100644
index 000000000000..91974e6ee251
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
@@ -0,0 +1,82 @@
+Cirrus Logic Lochnagar Audio Development Board
+
+Lochnagar is an evaluation and development board for Cirrus Logic
+Smart CODEC and Amp devices. It allows the connection of most Cirrus
+Logic devices on mini-cards, as well as allowing connection of
+various application processor systems to provide a full evaluation
+platform.  Audio system topology, clocking and power can all be
+controlled through the Lochnagar, allowing the device under test
+to be used in a variety of possible use cases.
+
+This binding document describes the binding for the regulator portion
+of the driver.
+
+Also see these documents for generic binding information:
+  [1] Regulator: ../regulator/regulator.txt
+
+This binding must be part of the Lochnagar MFD binding:
+  [2] ../mfd/cirrus,lochnagar.txt
+
+Optional sub-nodes:
+
+  - VDDCORE : Initialisation data for the VDDCORE regulator, which
+    supplies the CODECs digital core if it has no build regulator for that
+    purpose.
+      Required Properties:
+      - compatible : One of the following strings:
+                     "cirrus,lochnagar2-vddcore"
+      - SYSVDD-supply: Primary power supply for the Lochnagar.
+
+  - MICVDD : Initialisation data for the MICVDD regulator, which
+    supplies the CODECs MICVDD.
+      Required Properties:
+      - compatible : One of the following strings:
+                     "cirrus,lochnagar2-micvdd"
+      - SYSVDD-supply: Primary power supply for the Lochnagar.
+
+  - MIC1VDD, MIC2VDD : Initialisation data for the MICxVDD supplies.
+      Required Properties:
+      - compatible : One of the following strings:
+                     "cirrus,lochnagar2-mic1vdd", "cirrus,lochnagar2-mic2vdd"
+      Optional Properties:
+      - cirrus,micbias-input : A property selecting which of the CODEC
+        minicard micbias outputs should be used, valid values are 1 - 4.
+      - MICBIAS1-supply, MICBIAS2-supply: Regulator supplies for the
+        MICxVDD outputs, supplying the digital microphones, normally
+        supplied from the attached CODEC.
+
+  - VDD1V8 : Recommended fixed regulator for the VDD1V8 regulator, which supplies the
+    CODECs analog and 1.8V digital supplies.
+      Required Properties:
+      - compatible : Should be set to "regulator-fixed"
+      - regulator-min-microvolt : Should be set to 1.8V
+      - regulator-max-microvolt : Should be set to 1.8V
+      - regulator-boot-on
+      - regulator-always-on
+      - vin-supply : Should be set to same supply as SYSVDD
+
+Example:
+
+lochnagar {
+	lochnagar-micvdd: MICVDD {
+		compatible = "cirrus,lochnagar2-micvdd";
+
+		SYSVDD-supply = <&wallvdd>;
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	lochnagar-vdd1v8: VDD1V8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+
+		vin-supply = <&wallvdd>;
+	};
+};
+
-- 
2.11.0
