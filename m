From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 1/8] dt-bindings: fsi: Add SBEFIFO documentation
Date: Mon, 20 Nov 2017 13:46:50 -0600
Message-ID: <1511207217-14075-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the SBE CFAM device. SBE devices are
located on a CFAM off an FSI bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
new file mode 100644
index 0000000..e69b0c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
@@ -0,0 +1,35 @@
+Device-tree bindings for P9 SBEFIFO CFAM device
+-----------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p9-sbefifo";
+ - reg = < address size >;		: FSI CFAM address for the SBE engine
+					  and address space size.
+ - #address-cells = <1>;		: Number of address cells in child
+					  nodes.
+ - #size-cells = <0>;			: Number of size cells in child nodes.
+
+Optional properties:
+ - <child nodes>			: Devices that are accessible through
+					  the SBEFIFO. Child nodes are "opaque"
+					  to the SBEFIFO; the SBEFIFO needs no
+					  information about a child node other
+					  than if it exists or not.
+
+Child node optional properties:
+ - compatible = "dts-name"
+ - reg = < address >;			: Meaningful only for the child node
+
+Examples:
+
+    sbefifo@2400 {
+        compatible = "ibm,p9-sbefifo";
+        reg = < 0x2400 0x400 >;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        occ@1 {
+            compatible = "ibm,p9-occ";
+            reg = < 1 >;
+        };
+    };
-- 
1.8.3.1
