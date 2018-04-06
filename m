From: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/4] doc/devicetree: Persistent memory region bindings
Date: Fri,  6 Apr 2018 15:21:15 +1000
Message-ID: <20180406052116.31483-3-oohall@gmail.com>
References: <20180406052116.31483-1-oohall@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20180406052116.31483-1-oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device-tree binding documentation for the nvdimm region driver.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: Changed name from nvdimm-region to pmem-region.
    Cleaned up the example binding and fixed the overlapping regions.
    Added support for multiple regions in a single reg.
v3: Removed platform bus boilerplate from the example.
    Changed description of the volatile and reg properties
    to make them more clear.
---
 .../devicetree/bindings/pmem/pmem-region.txt       | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.txt

diff --git a/Documentation/devicetree/bindings/pmem/pmem-region.txt b/Documentation/devicetree/bindings/pmem/pmem-region.txt
new file mode 100644
index 000000000000..5cfa4f016a00
--- /dev/null
+++ b/Documentation/devicetree/bindings/pmem/pmem-region.txt
@@ -0,0 +1,65 @@
+Device-tree bindings for persistent memory regions
+-----------------------------------------------------
+
+Persistent memory refers to a class of memory devices that are:
+
+	a) Usable as main system memory (i.e. cacheable), and
+	b) Retain their contents across power failure.
+
+Given b) it is best to think of persistent memory as a kind of memory mapped
+storage device. To ensure data integrity the operating system needs to manage
+persistent regions separately to the normal memory pool. To aid with that this
+binding provides a standardised interface for discovering where persistent
+memory regions exist inside the physical address space.
+
+Bindings for the region nodes:
+-----------------------------
+
+Required properties:
+	- compatible = "pmem-region"
+
+	- reg = <base, size>;
+		The reg property should specificy an address range that is
+		translatable to a system physical address range. This address
+		range should be mappable as normal system memory would be
+		(i.e cacheable).
+
+		If the reg property contains multiple address ranges
+		each address range will be treated as though it was specified
+		in a separate device node. Having multiple address ranges in a
+		node implies no special relationship between the two ranges.
+
+Optional properties:
+	- Any relevant NUMA assocativity properties for the target platform.
+
+	- volatile; This property indicates that this region is actually
+	  backed by non-persistent memory. This lets the OS know that it
+	  may skip the cache flushes required to ensure data is made
+	  persistent after a write.
+
+	  If this property is absent then the OS must assume that the region
+	  is backed by non-volatile memory.
+
+Examples:
+--------------------
+
+	/*
+	 * This node specifies one 4KB region spanning from
+	 * 0x5000 to 0x5fff that is backed by non-volatile memory.
+	 */
+	pmem@5000 {
+		compatible = "pmem-region";
+		reg = <0x00005000 0x00001000>;
+	};
+
+	/*
+	 * This node specifies two 4KB regions that are backed by
+	 * volatile (normal) memory.
+	 */
+	pmem@6000 {
+		compatible = "pmem-region";
+		reg = < 0x00006000 0x00001000
+			0x00008000 0x00001000 >;
+		volatile;
+	};
+
diff --git a/MAINTAINERS b/MAINTAINERS
index df240740ca78..cbd289d58644 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8020,6 +8020,7 @@ L:	linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 S:	Supported
 F:	drivers/nvdimm/of_pmem.c
+F:	Documentation/devicetree/bindings/pmem/pmem-region.txt
 
 LIBNVDIMM: NON-VOLATILE MEMORY DEVICE SUBSYSTEM
 M:	Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
-- 
2.9.5
