From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 14/14] dt-bindings: net: add bindings for ADIN PHY driver
Date: Fri, 9 Aug 2019 16:35:52 +0300
Message-ID: <20190809133552.21597-15-alexandru.ardelean@analog.com>
References: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This change adds bindings for the Analog Devices ADIN PHY driver, detailing
all the properties implemented by the driver.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 .../devicetree/bindings/net/adi,adin.yaml     | 73 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml

diff --git a/Documentation/devicetree/bindings/net/adi,adin.yaml b/Documentation/devicetree/bindings/net/adi,adin.yaml
new file mode 100644
index 000000000000..69375cb28e92
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/adi,adin.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/adi,adin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADIN1200/ADIN1300 PHY
+
+maintainers:
+  - Alexandru Ardelean <alexandru.ardelean@analog.com>
+
+description: |
+  Bindings for Analog Devices Industrial Ethernet PHYs
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  adi,rx-internal-delay-ps:
+    description: |
+      RGMII RX Clock Delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+    enum: [ 1600, 1800, 2000, 2200, 2400 ]
+    default: 2000
+
+  adi,tx-internal-delay-ps:
+    description: |
+      RGMII TX Clock Delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+    enum: [ 1600, 1800, 2000, 2200, 2400 ]
+    default: 2000
+
+  adi,fifo-depth-bits:
+    description: |
+      When operating in RMII mode, this option configures the FIFO depth.
+    enum: [ 4, 8, 12, 16, 20, 24 ]
+    default: 8
+
+  adi,disable-energy-detect:
+    description: |
+      Disables Energy Detect Powerdown Mode (default disabled, i.e energy detect
+      is enabled if this property is unspecified)
+    type: boolean
+
+examples:
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy-mode = "rgmii-id";
+
+        ethernet-phy@0 {
+            reg = <0>;
+
+            adi,rx-internal-delay-ps = <1800>;
+            adi,tx-internal-delay-ps = <2200>;
+        };
+    };
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy-mode = "rmii";
+
+        ethernet-phy@1 {
+            reg = <1>;
+
+            adi,fifo-depth-bits = <16>;
+            adi,disable-energy-detect;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e8aa8a667864..fd9ab61c2670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -944,6 +944,7 @@ L:	netdev@vger.kernel.org
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
 F:	drivers/net/phy/adin.c
+F:	Documentation/devicetree/bindings/net/adi,adin.yaml
 
 ANALOG DEVICES INC ADIS DRIVER LIBRARY
 M:	Alexandru Ardelean <alexandru.ardelean@analog.com>
-- 
2.20.1
