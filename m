From: Dan Streetman <ddstreet-EkmVulN54Sk@public.gmane.org>
Subject: [PATCH] devicetree: add ibm-nx-powernv details
Date: Wed,  8 Apr 2015 23:05:56 -0400
Message-ID: <1428548756-16485-1-git-send-email-ddstreet@ieee.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Streetman <ddstreet-EkmVulN54Sk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a devicetree description for property nodes for the NX Coprocessor
in an IBM PowerPC processor.

Signed-off-by: Dan Streetman <ddstreet-EkmVulN54Sk@public.gmane.org>
---

Is this the right location/naming for this file?
And did I get the content format right?

Should this file be called "ibm-nx-opal.txt" instead of "ibm-nx-powernv.txt",
since it's the Opal firmware that provides the nodes (although they are
used by the PowerNV platform kernel)?

The 842 properties are used by the PowerNV 842 driver patch set I
sent out yesterday, and which I'll send a v2 of soon.

.../devicetree/bindings/crypto/ibm-nx-powernv.txt  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/ibm-nx-powernv.txt

diff --git a/Documentation/devicetree/bindings/crypto/ibm-nx-powernv.txt b/Documentation/devicetree/bindings/crypto/ibm-nx-powernv.txt
new file mode 100644
index 0000000..e031636
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/ibm-nx-powernv.txt
@@ -0,0 +1,40 @@
+Device-tree bindings for PowerNV platform IBM Nest (NX) Coprocessor
+-------------------------------------------------------------------
+
+Required properties:
+
+- compatible: must contain "ibm,power-nx"; may also contain the processor
+              version, e.g. "ibm,power8-nx"
+
+Optional properties:
+
+- ibm,842-coprocessor-type: CT of this NX 842 coprocessor
+- ibm,842-coprocessor-instance: CI of this NX 842 coprocessor
+
+If present, the NX-842 Coprocessor Type (CT) and Coprocessor Instance (CI)
+can be used in an ICSWX instruction to communicate with the NX-842
+coprocessor, to perform hardware compression/decompression.
+
+Additionally, there must be an "ibm,chip-id" node at some point in the
+direct devicetree hierarchy leading to the nx node; typically the nx
+node's parent is an xscom node, which contains the "ibm,chip-id" property.
+
+Example:
+
+nx@2010000 {
+	compatible = "ibm,power-nx", "ibm,power8-nx";
+	ibm,842-coprocessor-type = <0x3>;
+	ibm,842-coprocessor-instance = <0x1>;
+	name = "nx";
+	reg = <0x2010000 0x4000>;
+	linux,phandle = <0x85>;
+	phandle = <0x85>;
+};
+
+with a parent of:
+
+xscom@3fc0000000000 {
+	ibm,chip-id = <0x0>;
+	nx@2010000;
+	...
+};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
