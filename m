From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v2 5/5] Documentation/devicetree/bindings: Add FSI device documentation
Date: Wed,  5 Jul 2017 16:36:57 -0500
Message-ID: <1499290617-2598-6-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499290617-2598-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499290617-2598-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the SBE and OCC devices. SBE devices are
located on a CFAM on an FSI bus, and OCC devices are accessed through
the SBEFIFO.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt       | 20 ++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..766b706
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,15 @@
+Device-tree bindings for FSI-based On-Chip Controller driver
+------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p9-occ";
+
+Optional properties:
+ - reg = <processor index>;	: Index for the processor this OCC is on.
+
+Examples:
+
+    occ@1 {
+        compatible = "ibm,p9-occ";
+        reg = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
new file mode 100644
index 0000000..d16ab9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
@@ -0,0 +1,20 @@
+Device-tree bindings for FSI-based SBEFIFO driver
+-------------------------------------------------
+
+Required properties:
+ - reg = < address size >		: FSI CFAM address for the SBE engine
+					  and address space size.
+
+Optional properties:
+ - <child nodes>			: Devices that are accessible through
+					  the SBEFIFO.
+
+Examples:
+
+    sbefifo@2400 {
+        reg = < 0x2400 0x400 >;
+
+        occ@1 {
+            ...
+        };
+    };
-- 
1.8.3.1
