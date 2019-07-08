From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/7] dt-bindings: net: Add bindings for Realtek PHYs
Date: Mon,  8 Jul 2019 12:24:53 -0700
Message-ID: <20190708192459.187984-2-mka@chromium.org>
References: <20190708192459.187984-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190708192459.187984-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add the 'realtek,eee-led-mode-disable' property to disable EEE
LED mode on Realtek PHYs that support it.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
TODO: adapt PHY core to deal with optional compatible strings

Changes in v3:
- added entry for compatible string
- added compatible string to example
- mention that the new property is only available for RTL8211E

Changes in v2:
- document 'realtek,eee-led-mode-disable' instead of
  'realtek,enable-ssc' in the initial version
---
 .../devicetree/bindings/net/realtek.txt       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek.txt

diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
new file mode 100644
index 000000000000..db0333f23fec
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek.txt
@@ -0,0 +1,31 @@
+Realtek PHY properties.
+
+This document describes properties of Realtek PHYs.
+
+Optional properties:
+- compatible: should be one of the following:
+  "realtek,rtl8201cp", "realtek,rtl8201f", "realtek,rtl8211",
+  "realtek,rtl8211b", "realtek,rtl8211c", "realtek,rtl8211dn",
+  "realtek,rtl8211e", "realtek,rtl8211f", "rtl8366rb"
+
+  the property is required if any of the properties are specified that
+  are only supported for certain Realtek PHYs.
+
+- realtek,eee-led-mode-disable: Disable EEE LED mode on this port.
+
+  Only supported for "realtek,rtl8211e".
+
+
+Example:
+
+mdio0 {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy: ethernet-phy@1 {
+		compatible = "realtek,rtl8211e";
+		reg = <1>;
+		realtek,eee-led-mode-disable;
+	};
+};
-- 
2.22.0.410.gd8fdbe21b5-goog
