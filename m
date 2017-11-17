From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 1/4] dt-bindings: fsi: Add SBEFIFO documentation
Date: Fri, 17 Nov 2017 13:34:31 -0600
Message-ID: <1510947274-7519-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510947274-7519-1-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

Document the bindings for the SBE CFAM device. SBE devices are
located on a CFAM off an FSI bus.

Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
