From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFC v2 03/12] bus: mvebu-mbus: Add static window allocation to the
 DT binding
Date: Fri, 14 Jun 2013 13:07:43 -0300
Message-ID: <1371226072-28896-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1371226072-28896-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371226072-28896-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds static window allocation to the device tree binding.
Each first-child of the mbus-compatible node, with a suitable 'ranges'
property, declaring an address translation, will trigger an address
decoding window allocation.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/bus/mvebu-mbus.txt         | 161 +++++++++++++++++++++
 drivers/bus/mvebu-mbus.c                           | 119 ++++++++++++++-
 2 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/bus/mvebu-mbus.txt

diff --git a/Documentation/devicetree/bindings/bus/mvebu-mbus.txt b/Documentation/devicetree/bindings/bus/mvebu-mbus.txt
new file mode 100644
index 0000000..4f21e3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/mvebu-mbus.txt
@@ -0,0 +1,161 @@
+
+* Marvell MBus controller
+
+Required properties:
+
+- compatible:	 Should be set to one of the following:
+		 marvell,armada370-mbus
+		 marvell,armadaxp-mbus
+
+- reg:		 Device's register space.
+		 Two entries are expected, see the examples below.
+		 The first one controls the devices decoding window and
+		 the second one controls the SDRAM decoding window.
+
+- address-cells: Must be '2'. The first cell for the MBus ID encoding,
+                 the second cell for the address offset within the window.
+
+- size-cells:    Must be '1'.
+
+- ranges:        Must be set up to provide a proper translation for each child.
+	         See the examples below.
+
+Example:
+
+	soc {
+		compatible = "marvell,armada370-mbus", "simple-bus";
+		reg = <0xd0020000 0x100>, <0xd0020180 0x20>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+	};
+
+** MBus child device specification
+
+Each child device needs at least a 'ranges' property. If the child is avaiable
+(i.e. status not 'disabled'), then the MBus driver creates a decoding window
+for it. For instance, in the example below the BootROM child is specified:
+
+	soc {
+		compatible = "marvell,armada370-mbus", "simple-bus";
+		reg = <0xd0020000 0x100>, <0xd0020180 0x20>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ranges = < ... /* other entries */
+			   0x011d0000 0 0 0xfff00000 0x100000>;
+
+		bootrom {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x011d0000 0 0x100000>;
+		};
+
+		/* other children */
+		...
+	};
+
+In the shown example, the MBus child node together with the translation
+entry in the 'ranges' property is what makes the MBus driver creates
+a static decoding window for the given child device.
+
+Since each window is identified by its target ID and attribute ID there's
+a special macro that can be use to simplify the translation entries:
+
+#define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << 16))
+
+Using this macro, the bootrom child node can be written in a slightly
+more readable fashion:
+
+	bootrom {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 MBUS_ID(0x01, 0x1d) 0 0x100000>;
+	};
+
+** About the window base address
+
+Remember the MBus controller allows a great deal of flexibility for choosing
+the decoding window base address. When planning the device tree layout it's
+possible to choose any address as the base address, provided of course there's
+a region large enough available, and with the required alignment.
+
+Yet in other words: there's nothing preventing us from setting a base address
+of 0xf0000000, or 0xd0000000 for the NOR device shown above, if such region is
+unused.
+
+** About the special target ID and attribute ID
+
+As stated above, for each mbus-node first-level child, the MBus driver will
+allocate a decoding window. However, in some cases it's desirable to declare
+a translation entry but have the MBus driver skip it.
+
+This is currently the case for the internal-regs and the pcie-controller
+nodes.
+
+This is handled by using a target ID = 0xff and attribute = 0xff on those
+entries. It's possible to use the lower bytes to produce different
+translations. See the example below, where a more complete DT is shown:
+
+	soc {
+		compatible = "marvell,armadaxp-mbus";
+		reg = <0 0xd0020000 0 0x100>, <0 0xd0020180 0 0x20>;
+
+		ranges = <0xffff0001 0 0 0xd0000000 0x100000   /* internal-regs */
+			  0xffff0000 0 0 0xe0000000 0x8100000  /* pcie */
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x8000000>;
+
+		bootrom {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 MBUS_ID(0x01, 0x1d) 0 0x100000>;
+		};
+
+		devbus-bootcs {
+			status = "okay";
+			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0x8000000>;
+
+			/* NOR */
+			nor {
+				compatible = "cfi-flash";
+				reg = <0 0x8000000>;
+				bank-width = <2>;
+			};
+		};
+
+		pcie-controller {
+			compatible = "marvell,armada-xp-pcie";
+			status = "okay";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges =
+			       <0x82000000 0 0x40000 0xffff0001 0x40000 0 0x00002000   /* Port 0.0 registers */
+				0x82000000 0 0x42000 0xffff0001 0x42000 0 0x00002000   /* Port 2.0 registers */
+				0x82000000 0 0x44000 0xffff0001 0x44000 0 0x00002000   /* Port 0.1 registers */
+				0x82000000 0 0x48000 0xffff0001 0x48000 0 0x00002000   /* Port 0.2 registers */
+				0x82000000 0 0x4c000 0xffff0001 0x4c000 0 0x00002000   /* Port 0.3 registers */
+				0x82000000 0 0x80000 0xffff0001 0x80000 0 0x00002000   /* Port 1.0 registers */
+				0x82000000 0 0x82000 0xffff0001 0x82000 0 0x00002000   /* Port 3.0 registers */
+				0x82000000 0 0xe0000000 0xffff0000 0 0 0x08000000   /* non-prefetchable memory */
+				0x81000000 0 0 0xffff0000 0x8000000 0 0x00100000>; /* downstream I/O */
+
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status = "okay";
+			};
+		};
+
+		internal-regs {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xffff0001 0 0x100000>;
+
+			interrupt-controller@20000 {
+			      reg = <0x20a00 0x2d0>, <0x21070 0x58>;
+			};
+		};
+	};
diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 23f6ae6..3a27762 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -885,6 +885,119 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
 }
 
 #ifdef CONFIG_OF
+/*
+ * The window IDs in the ranges DT property have the following format:
+ *  - bits 24 to 31: window target ID
+ *  - bits 16 to 23: window attribute ID
+ *  - bits  0 to 15: unused
+ */
+#define TARGET(id) (((id) & 0xFF000000) >> 24)
+#define ATTR(id)   (((id) & 0x00FF0000) >> 16)
+
+static int __init mbus_dt_setup_win(struct mvebu_mbus_state *mbus,
+				    u32 windowid, u32 base, u32 size,
+				    u8 target, u8 attr)
+{
+	const struct mvebu_mbus_mapping *map = mbus->soc->map;
+	const char *name;
+	int i;
+
+	/* Special case for the identity mapping */
+	if (target == 0xff && attr == 0xff)
+		return 0;
+
+	/* Search for a suitable window in the existing mappings */
+	for (i = 0; map[i].name; i++)
+		if (map[i].target == target &&
+		    map[i].attr == (attr & map[i].attrmask))
+			break;
+
+	name = map[i].name;
+	if (!name) {
+		pr_err("window 0x%x:0x%x is unknown, skipping\n",
+		       target, attr);
+		return -EINVAL;
+	}
+
+	if (!mvebu_mbus_window_conflicts(mbus, base, size, target, attr)) {
+		pr_err("cannot add window '%s', conflicts with another window\n",
+		       name);
+		return -EBUSY;
+	}
+
+	if (mvebu_mbus_alloc_window(mbus, base, size, MVEBU_MBUS_NO_REMAP,
+				    target, attr)) {
+		pr_err("cannot add window '%s', too many windows\n",
+		       name);
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static int __init mbus_dt_setup(struct mvebu_mbus_state *mbus,
+				struct device_node *np)
+{
+	struct device_node *child;
+	int ranges_len, tuple_len;
+	int addr_cells, c_addr_cells, c_size_cells;
+	int cell_count;
+	const __be32 *r, *ranges_start, *ranges_end, *prop;
+
+	for_each_available_child_of_node(np, child) {
+
+		addr_cells = of_n_addr_cells(child);
+
+		prop = of_get_property(child, "#address-cells", NULL);
+		c_addr_cells = be32_to_cpup(prop);
+
+		prop = of_get_property(child, "#size-cells", NULL);
+		c_size_cells = be32_to_cpup(prop);
+
+		cell_count = addr_cells + c_addr_cells + c_size_cells;
+		tuple_len = cell_count * sizeof(__be32);
+
+		ranges_start = of_get_property(child, "ranges", &ranges_len);
+		ranges_end = ranges_start + ranges_len / sizeof(__be32);
+
+		if (ranges_start == NULL || ranges_len % tuple_len) {
+			pr_warn("malformed ranges entry '%s'\n", child->name);
+			continue;
+		}
+
+		for (r = ranges_start; r < ranges_end; r += cell_count) {
+			u32 windowid, base, size;
+			u8 target, attr;
+			int ret;
+
+			/* The windowid is after the child address cells */
+			windowid = of_read_number(r + c_addr_cells, 1);
+
+			/*
+			 * The base address for the window is obtained by
+			 * translating the tuple {windowid,offset} into the
+			 * root address space.
+			 */
+			base = of_translate_address(child, r + c_addr_cells);
+
+			/*
+			 * The size is after the windowid and the base address.
+			 * TODO: However, the real size for the window needs to
+			 * be taken from the upstream ranges entry.
+			 */
+			size = of_read_number(r + addr_cells + c_addr_cells,
+					      c_size_cells);
+			target = TARGET(windowid);
+			attr = ATTR(windowid);
+
+			ret = mbus_dt_setup_win(mbus, windowid, base, size,
+						target, attr);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return 0;
+}
+
 int __init mvebu_mbus_dt_init(void)
 {
 	struct resource mbuswins_res, sdramwins_res;
@@ -916,6 +1029,10 @@ int __init mvebu_mbus_dt_init(void)
 				     resource_size(&mbuswins_res),
 				     sdramwins_res.start,
 				     resource_size(&sdramwins_res));
-	return ret;
+	if (ret)
+		return ret;
+
+	/* Setup statically declared windows in the DT */
+	return mbus_dt_setup(&mbus_state, np);
 }
 #endif
-- 
1.8.1.5
