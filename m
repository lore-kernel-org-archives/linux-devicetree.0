From: Matthias Kaehlcke <mka@chromium.org>
Subject: [RFC] dt-bindings: net: phy: Add subnode for LED configuration
Date: Mon, 22 Jul 2019 15:37:41 -0700
Message-ID: <20190722223741.113347-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
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
This RFC is a follow up of the discussion on "[PATCH v2 6/7]
dt-bindings: net: realtek: Add property to configure LED mode"
(https://lore.kernel.org/patchwork/patch/1097185/).

For now posting as RFC to get a basic agreement on the bindings
before proceding with the implementation in phylib and a specific
driver.
---
 Documentation/devicetree/bindings/net/phy.txt | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 9b9e5b1765dd..ad495d3abbbb 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -46,6 +46,25 @@ Optional Properties:
   Mark the corresponding energy efficient ethernet mode as broken and
   request the ethernet to stop advertising it.
 
+- leds: A sub-node which is a container of only LED nodes. Each child
+    node represents a PHY LED.
+
+  Required properties for LED child nodes:
+  - reg: The ID number of the LED, typically corresponds to a hardware ID.
+
+  Optional properties for child nodes:
+  - label: The label for this LED. If omitted, the label is taken from the node
+    name (excluding the unit address). It has to uniquely identify a device,
+    i.e. no other LED class device can be assigned the same label.
+
+  - linux,default-trigger: This parameter, if present, is a string defining
+    the trigger assigned to the LED. Current triggers are:
+      "phy_link_10m_active" - LED will be on when a 10Mb/s link is active
+      "phy_link_100m_active" - LED will be on when a 100Mb/s link is active
+      "phy_link_1g_active" - LED will be on when a 1Gb/s link is active
+      "phy_link_10g_active" - LED will be on when a 10Gb/s link is active
+      "phy_activity" - LED will blink when data is received or transmitted
+
 - phy-is-integrated: If set, indicates that the PHY is integrated into the same
   physical package as the Ethernet MAC. If needed, muxers should be configured
   to ensure the integrated PHY is used. The absence of this property indicates
@@ -76,4 +95,18 @@ ethernet-phy@0 {
 	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	reset-assert-us = <1000>;
 	reset-deassert-us = <2000>;
+
+	leds {
+		led@0 {
+			reg = <0>;
+			label = "ethphy0:left:green";
+			linux,default-trigger = "phy_link_1g_active";
+		};
+
+		led@1 {
+			reg = <1>;
+			label = "ethphy0:right:amber";
+			linux,default-trigger = "phy_activity";
+		};
+	};
 };
-- 
2.22.0.657.g960e92d24f-goog
