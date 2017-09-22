From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 4/6] dt-bindings: fsi: Add OCC documentation
Date: Fri, 22 Sep 2017 16:06:00 -0500
Message-ID: <1506114362-492-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the P9 OCC device. OCC devices are accessed
through the SBEFIFO.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..bcaefc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,15 @@
+Device-tree bindings for P9 On-Chip Controller
+----------------------------------------------
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
-- 
1.8.3.1
