Return-Path: <SRS0=1YM6=R6=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 1/2] hwmon: lochnagar: Add device tree binding document
Date: Wed, 27 Mar 2019 15:13:27 +0000
Message-ID: <20190327151328.2491-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

Thanks,
Charles

 .../devicetree/bindings/hwmon/cirrus,lochnagar.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt

diff --git a/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
new file mode 100644
index 0000000000000..ffb79ccf51ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
@@ -0,0 +1,26 @@
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
+This binding document describes the binding for the hardware monitor
+portion of the driver.
+
+This binding must be part of the Lochnagar MFD binding:
+  [4] ../mfd/cirrus,lochnagar.txt
+
+Required properties:
+
+  - compatible : One of the following strings:
+                 "cirrus,lochnagar2-hwmon"
+
+Example:
+
+lochnagar-hwmon {
+	compatible = "cirrus,lochnagar2-hwmon";
+};
-- 
2.11.0
