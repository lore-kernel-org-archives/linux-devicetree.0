From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 3/9] dt-bindings: i2c: Add P8 OCC hwmon device documentation
Date: Wed, 11 Jul 2018 16:01:32 -0500
Message-ID: <1531342898-15790-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, benh@kernel.crashing.org, linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Document the bindings for I2C-based OCC hwmon device.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
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
