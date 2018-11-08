From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v6 04/10] dt-bindings: i2c: Add P8 OCC hwmon device documentation
Date: Thu,  8 Nov 2018 15:05:23 -0600
Message-ID: <1541711129-26631-5-git-send-email-eajames@linux.ibm.com>
References: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@roeck-us.net, rdunlap@infradead.org, benh@kernel.crashing.org, Eddie James <eajames@linux.vnet.ibm.com>, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Eddie James <eajames@linux.vnet.ibm.com>

Document the bindings for I2C-based OCC hwmon device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
new file mode 100644
index 0000000..5dc5d2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
@@ -0,0 +1,25 @@
+Device-tree bindings for I2C-based On-Chip Controller hwmon device
+------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p8-occ-hwmon";
+ - reg = <I2C address>;			: I2C bus address
+
+Examples:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clock-frequency = <100000>;
+        < more properties >
+
+        occ-hwmon@1 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x50>;
+        };
+
+        occ-hwmon@2 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x51>;
+        };
+    };
-- 
1.8.3.1
