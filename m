From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [RFC/PATCH 1/2] doc: bindings: Add bindings documentation for mtd otp nvmem
Date: Wed, 25 May 2016 14:26:46 -0700
Message-ID: <1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464211607-8843-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds documentation describing the bindings for
exposing mtd flash otp regions as nvmem providers via devicetree.

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/otp-nvmem.txt          | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/otp-nvmem.txt

diff --git a/Documentation/devicetree/bindings/mtd/otp-nvmem.txt b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
new file mode 100644
index 0000000..a83a7da
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
@@ -0,0 +1,62 @@
+Representing OTP regions in devicetree
+
+OTP regions can be represented by sub-nodes of an mtd device.
+
+The partition table should be a subnode of the mtd node and should be names
+'otp-partitions'. This node should have the following property:
+
+- compatible: (required) must be 'fixed-partitions'
+
+OTP regions are then defined in subnodes of the partitions node.
+
+Required properties for OTP regions:
+- reg: The region's offset and size within the mtd device
+
+Optional properties:
+- label: The label / name for this region. If ommited, the label is taken
+  from the node name (excluding the unit address).
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "uboot-spl";
+			reg = <0x0 0xe0000>;
+		};
+		partition@1 {
+			label = "uboot-env";
+			reg = <0xe0000 0x20000>;
+		};
+		partition@2 {
+			label = "uboot";
+			reg = <0x100000 0x100000>;
+		};
+	};
+
+	otp-partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		region@0 {
+			label = "factory-data";
+			reg = <0x0 0x40>;
+
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+
+			product: nvmem@0 {
+				reg = <0x0 0x2>;
+			};
+
+			revision: nvmem@3 {
+				reg = <0x3 0x2>;
+			};
+		};
+	};
+}
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
