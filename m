From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v6 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Date: Thu,  8 Nov 2018 15:05:20 -0600
Message-ID: <1541711129-26631-2-git-send-email-eajames@linux.ibm.com>
References: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@roeck-us.net, rdunlap@infradead.org, benh@kernel.crashing.org, Eddie James <eajames@linux.vnet.ibm.com>, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Eddie James <eajames@linux.vnet.ibm.com>

Document the bindings for the FSI-attached POWER9 On-Chip Controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..99ca986
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,16 @@
+Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
+---------------------------------------------------------------------
+
+This is the binding for the P9 On-Chip Controller accessed over FSI from a
+service processor. See fsi.txt for details on bindings for FSI slave and CFAM
+nodes. The OCC is not an FSI slave device itself, rather it is accessed
+through the SBE fifo.
+
+Required properties:
+ - compatible = "ibm,p9-occ"
+
+Examples:
+
+    occ {
+        compatible = "ibm,p9-occ";
+    };
-- 
1.8.3.1
