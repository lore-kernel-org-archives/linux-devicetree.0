From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: Document the POWER system power supply device
Date: Thu, 10 Aug 2017 17:19:44 -0500
Message-ID: <1502403586-20549-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net
Cc: robh+dt@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au, eajames@linux.vnet.ibm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/ibm,power-ps.txt        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
new file mode 100644
index 0000000..2ea8ea2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for IBM POWER system power supplies
+--------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,power-ps";
+ - reg = < I2C bus address >;		: Address of the power supply on the
+					  I2C bus.
+
+Example:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <1>;
+        < more properties >
+
+        power_ps@68 {
+            compatible = "ibm,power-ps";
+            reg = <0x68>;
+        };
+    };
-- 
1.8.3.1
