From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 1/6] dt-bindings: fsi: Add SBEFIFO documentation
Date: Fri, 22 Sep 2017 16:05:57 -0500
Message-ID: <1506114362-492-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the SBE CFAM device. SBE devices are
located on a CFAM off an FSI bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
new file mode 100644
index 0000000..07fbf29
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
@@ -0,0 +1,20 @@
+Device-tree bindings for P9 SBEFIFO CFAM device
+-----------------------------------------------
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
