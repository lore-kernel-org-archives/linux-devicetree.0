From: Liam Breck <liam@networkimprov.net>
Subject: [PATCH v6 3/8] devicetree: power: bq27xxx: Add monitored-battery documentation
Date: Fri, 10 Feb 2017 18:43:35 -0800
Message-ID: <20170211024340.19491-4-liam@networkimprov.net>
References: <20170211024340.19491-1-liam@networkimprov.net>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20170211024340.19491-1-liam@networkimprov.net>
Sender: linux-pm-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: "Andrew F . Davis" <afd@ti.com>, linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Matt Ranostay <matt@ranostay.consulting>, Liam Breck <kernel@networkimprov.net>
List-Id: devicetree@vger.kernel.org

From: Matt Ranostay <matt@ranostay.consulting>

Document monitored-battery = <&battery_node>

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
Signed-off-by: Liam Breck <kernel@networkimprov.net>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.txt b/Documentation/devicetree/bindings/power/supply/bq27xxx.txt
index b0c95ef..cf83371 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.txt
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.txt
@@ -28,9 +28,18 @@ Required properties:
  * "ti,bq27621" - BQ27621
 - reg: integer, i2c address of the device.
 
+Optional properties:
+- monitored-battery: phandle of battery information devicetree node
+
+  See Documentation/devicetree/bindings/power/supply/battery.txt
+  If either of the referenced battery's *-full-design-*-hours properties are set,
+  then both must be.
+
 Example:
 
-bq27510g3 {
+bq27510g3 : fuel-gauge@55 {
     compatible = "ti,bq27510g3";
     reg = <0x55>;
+
+    monitored-battery = <&bat>;
 };
-- 
2.9.3

