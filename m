From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 1/4] dt-bindings: net: phy: Add subnode for LED configuration
Date: Thu,  1 Aug 2019 12:07:56 -0700
Message-ID: <20190801190759.28201-2-mka@chromium.org>
References: <20190801190759.28201-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801190759.28201-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The LED behavior of some Ethernet PHYs is configurable. Add an
optional 'leds' subnode with a child node for each LED to be
configured. The binding aims to be compatible with the common
LED binding (see devicetree/bindings/leds/common.txt).

A LED can be configured to be 'on' when a link with a certain speed
is active, or to blink on RX/TX activity. For the configuration to
be effective it needs to be supported by the hardware and the
corresponding PHY driver.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v4:
- patch added to the series
---
 .../devicetree/bindings/net/ethernet-phy.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index f70f18ff821f..81c5aacc89a5 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -153,6 +153,38 @@ properties:
       Delay after the reset was deasserted in microseconds. If
       this property is missing the delay will be skipped.
 
+patternProperties:
+  "^leds$":
+    type: object
+    description:
+      Subnode with configuration of the PHY LEDs.
+
+    patternProperties:
+      "^led@[0-9]+$":
+        type: object
+        description:
+          Subnode with the configuration of a single PHY LED.
+
+    properties:
+      reg:
+        description:
+          The ID number of the LED, typically corresponds to a hardware ID.
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+
+      linux,default-trigger:
+        description:
+          This parameter, if present, is a string specifying the trigger
+          assigned to the LED. Supported triggers are:
+            "phy_link_10m_active" - LED will be on when a 10Mb/s link is active
+            "phy_link_100m_active" - LED will be on when a 100Mb/s link is active
+            "phy_link_1g_active" - LED will be on when a 1Gb/s link is active
+            "phy_link_10g_active" - LED will be on when a 10Gb/s link is active
+            "phy_activity" - LED will blink when data is received or transmitted
+        $ref: "/schemas/types.yaml#/definitions/string"
+
+    required:
+      - reg
+
 required:
   - reg
 
@@ -173,5 +205,20 @@ examples:
             reset-gpios = <&gpio1 4 1>;
             reset-assert-us = <1000>;
             reset-deassert-us = <2000>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    linux,default-trigger = "phy_link_1g_active";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    linux,default-trigger = "phy_activity";
+                };
+            };
         };
     };
-- 
2.22.0.770.g0f2c4a37fd-goog
