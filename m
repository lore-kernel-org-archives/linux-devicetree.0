From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 01/11] of: document bindings for reserved-memory nodes
Date: Fri, 28 Feb 2014 14:42:46 +0100
Message-ID: <1393594976-16728-2-git-send-email-m.szyprowski@samsung.com>
References: <1393594976-16728-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1393594976-16728-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Reserved memory nodes allow for the reservation of static (fixed
address) regions, or dynamically allocated regions for a specific
purpose.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[joshc: Based on binding document proposed (in non-patch form) here:
 http://lkml.kernel.org/g/20131030134702.19B57C402A0-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org
 adapted to support #memory-region-cells]
Signed-off-by: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
[mszyprow: removed #memory-region-cells property]
Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/reserved-memory/reserved-memory.txt   |  136 ++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
new file mode 100644
index 000000000000..8b0d747a38e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -0,0 +1,136 @@
+*** Reserved memory regions ***
+
+Reserved memory is specified as a node under the /reserved-memory node.
+The operating system shall exclude reserved memory from normal usage
+one can create child nodes describing particular reserved (excluded from
+normal use) memory regions. Such memory regions are usually designed for
+the special usage by various device drivers.
+
+Parameters for each memory region can be encoded into the device tree
+with the following nodes:
+
+/reserved-memory node
+---------------------
+#address-cells, #size-cells (required) - standard definition
+    - Should use the same values as the root node
+ranges (required) - standard definition
+    - Should be empty
+
+/reserved-memory/ child nodes
+-----------------------------
+Each child of the reserved-memory node specifies one or more regions of
+reserved memory. Each child node may either use a 'reg' property to
+specify a specific range of reserved memory, or a 'size' property with
+optional constraints to request a dynamically allocated block of memory.
+
+Following the generic-names recommended practice, node names should
+reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
+address (@<address>) should be appended to the name if the node is a
+static allocation.
+
+Properties:
+Requires either a) or b) below.
+a) static allocation
+   reg (required) - standard definition
+b) dynamic allocation
+   size (required) - length based on parent's #size-cells
+                   - Size in bytes of memory to reserve.
+   alignment (optional) - length based on parent's #size-cells
+                        - Address boundary for alignment of allocation.
+   alloc-ranges (optional) - prop-encoded-array (address, length pairs).
+                           - Specifies regions of memory that are
+                             acceptable to allocate from.
+
+If both reg and size are present, then the reg property takes precedence
+and size is ignored.
+
+Additional properties:
+compatible (optional) - standard definition
+    - may contain the following strings:
+        - shared-dma-pool: This indicates a region of memory meant to be
+          used as a shared pool of DMA buffers for a set of devices. It can
+          be used by an operating system to instanciate the necessary pool
+          management subsystem if necessary.
+        - vendor specific string in the form <vendor>,[<device>-]<usage>
+no-map (optional) - empty property
+    - Indicates the operating system must not create a virtual mapping
+      of the region as part of its standard mapping of system memory,
+      nor permit speculative access to it under any circumstances other
+      than under the control of the device driver using the region.
+reusable (optional) - empty property
+    - The operating system can use the memory in this region with the
+      limitation that the device driver(s) owning the region need to be
+      able to reclaim it back. Typically that means that the operating
+      system can use that region to store volatile or cached data that
+      can be otherwise regenerated or migrated elsewhere.
+
+Linux implementation note:
+- If a "linux,cma-default" property is present, then Linux will use the
+  region for the default pool of the contiguous memory allocator.
+
+Device node references to reserved memory
+-----------------------------------------
+Regions in the /reserved-memory node may be referenced by other device
+nodes by adding a memory-region property to the device node.
+
+memory-region (optional) - phandle, specifier pairs to children of /reserved-memory
+
+Example
+-------
+This example defines 3 contiguous regions are defined for Linux kernel:
+one default of all device drivers (named linux,cma@72000000 and 64MiB in size),
+one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB), and
+one for multimedia processing (named multimedia-memory@77000000, 64MiB).
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory {
+		reg = <0x40000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			#memory-region-cells = <0>;
+			size = <0x4000000>;
+			alignment = <0x2000>;
+			linux,cma-default;
+		};
+
+		display_reserved: framebuffer@78000000 {
+			#memory-region-cells = <0>;
+			reg = <0x78000000 0x800000>;
+		};
+
+		multimedia_reserved: multimedia@77000000 {
+			compatible = "acme,multimedia-memory";
+			#memory-region-cells = <1>;
+			reg = <0x77000000 0x4000000>;
+		};
+	};
+
+	/* ... */
+
+	fb0: video@12300000 {
+		memory-region = <&display_reserved>;
+		/* ... */
+	};
+
+	scaler: scaler@12500000 {
+		memory-region = <&multimedia_reserved 0xdeadbeef>;
+		/* ... */
+	};
+
+	codec: codec@12600000 {
+		memory-region = <&multimedia_reserved 0xfeebdaed>;
+		/* ... */
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
