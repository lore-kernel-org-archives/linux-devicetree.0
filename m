From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 04/12] dt-bindings: fsi: Add P9 OCC hwmon device documentation
Date: Mon, 20 Nov 2017 17:53:33 -0600
Message-ID: <1511222021-562-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the FSI-based OCC hwmon device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
new file mode 100644
index 0000000..086b1eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
@@ -0,0 +1,16 @@
+Device-tree bindings for FSI-based On-Chip Controller hwmon device
+------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p9-occ-hwmon";
+
+Examples:
+
+    occ@1 {
+        compatible = "ibm,p9-occ";
+        reg = <1>;
+
+        occ-hwmon@1 {
+            compatible = "ibm,p9-occ-hmwon";
+        }
+    };
-- 
1.8.3.1

