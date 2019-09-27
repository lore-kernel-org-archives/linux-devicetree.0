From: Rob Herring <robh@kernel.org>
Subject: [PATCH 04/11] of/unittest: Add dma-ranges address translation tests
Date: Thu, 26 Sep 2019 19:24:48 -0500
Message-ID: <20190927002455.13169-5-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

The functions for parsing 'dma-ranges' ranges are buggy and fail to
handle several conditions. Add new tests for of_dma_get_range() and
for_each_of_pci_range().

With this test, we get 5 new failures which are fixed in subsequent
commits:

OF: translation of DMA address(0) to CPU address failed node(/testcase-data/address-tests/device@70000000)
FAIL of_unittest_dma_ranges_one():798 of_dma_get_range failed on node /testcase-data/address-tests/device@70000000 rc=-22
OF: translation of DMA address(10000000) to CPU address failed node(/testcase-data/address-tests/bus@80000000/device@1000)
FAIL of_unittest_dma_ranges_one():798 of_dma_get_range failed on node /testcase-data/address-tests/bus@80000000/device@1000 rc=-22
OF: translation of DMA address(0) to CPU address failed node(/testcase-data/address-tests/pci@90000000)
FAIL of_unittest_dma_ranges_one():798 of_dma_get_range failed on node /testcase-data/address-tests/pci@90000000 rc=-22
FAIL of_unittest_pci_dma_ranges():851 for_each_of_pci_range wrong CPU addr (d0000000) on node /testcase-data/address-tests/pci@90000000
FAIL of_unittest_pci_dma_ranges():861 for_each_of_pci_range wrong CPU addr (ffffffffffffffff) on node /testcase-data/address-tests/pci@90000000

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest-data/testcases.dts      |  1 +
 drivers/of/unittest-data/tests-address.dtsi | 48 +++++++++++
 drivers/of/unittest.c                       | 92 +++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/of/unittest-data/tests-address.dtsi

diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
index 55fe0ee20109..a85b5e1c381a 100644
--- a/drivers/of/unittest-data/testcases.dts
+++ b/drivers/of/unittest-data/testcases.dts
@@ -15,5 +15,6 @@
 #include "tests-phandle.dtsi"
 #include "tests-interrupts.dtsi"
 #include "tests-match.dtsi"
+#include "tests-address.dtsi"
 #include "tests-platform.dtsi"
 #include "tests-overlay.dtsi"
diff --git a/drivers/of/unittest-data/tests-address.dtsi b/drivers/of/unittest-data/tests-address.dtsi
new file mode 100644
index 000000000000..3fe5d3987beb
--- /dev/null
+++ b/drivers/of/unittest-data/tests-address.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	testcase-data {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		address-tests {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			/* ranges here is to make sure we don't use it for
+			 * dma-ranges translation */
+			ranges = <0x70000000 0x70000000 0x40000000>,
+				 <0x00000000 0xd0000000 0x20000000>;
+			dma-ranges = <0x0 0x20000000 0x40000000>;
+
+			device@70000000 {
+				reg = <0x70000000 0x1000>;
+			};
+
+			bus@80000000 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x80000000 0x100000>;
+				dma-ranges = <0x10000000 0x0 0x40000000>;
+
+				device@1000 {
+					reg = <0x1000 0x1000>;
+				};
+			};
+
+			pci@90000000 {
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x90000000 0x1000>;
+				ranges = <0x42000000 0x0 0x40000000 0x40000000 0x0 0x10000000>;
+				dma-ranges = <0x42000000 0x0 0x80000000 0x00000000 0x0 0x10000000>,
+					     <0x42000000 0x0 0xc0000000 0x20000000 0x0 0x10000000>;
+			};
+
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e6b175370f2e..3969075194c5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -12,6 +12,7 @@
 #include <linux/hashtable.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
@@ -779,6 +780,95 @@ static void __init of_unittest_changeset(void)
 #endif
 }
 
+static void __init of_unittest_dma_ranges_one(const char *path,
+		u64 expect_dma_addr, u64 expect_paddr, u64 expect_size)
+{
+	struct device_node *np;
+	u64 dma_addr, paddr, size;
+	int rc;
+
+	np = of_find_node_by_path(path);
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	rc = of_dma_get_range(np, &dma_addr, &paddr, &size);
+
+	unittest(!rc, "of_dma_get_range failed on node %pOF rc=%i\n", np, rc);
+	if (!rc) {
+		unittest(size == expect_size,
+			 "of_dma_get_range wrong size on node %pOF size=%llx\n", np, size);
+		unittest(paddr == expect_paddr,
+			 "of_dma_get_range wrong phys addr (%llx) on node %pOF", paddr, np);
+		unittest(dma_addr == expect_dma_addr,
+			 "of_dma_get_range wrong DMA addr (%llx) on node %pOF", dma_addr, np);
+	}
+	of_node_put(np);
+}
+
+static void __init of_unittest_parse_dma_ranges(void)
+{
+	of_unittest_dma_ranges_one("/testcase-data/address-tests/device@70000000",
+		0x0, 0x20000000, 0x40000000);
+	of_unittest_dma_ranges_one("/testcase-data/address-tests/bus@80000000/device@1000",
+		0x10000000, 0x20000000, 0x40000000);
+	of_unittest_dma_ranges_one("/testcase-data/address-tests/pci@90000000",
+		0x80000000, 0x20000000, 0x10000000);
+}
+
+static void __init of_unittest_pci_dma_ranges(void)
+{
+	struct device_node *np;
+	struct of_pci_range range;
+	struct of_pci_range_parser parser;
+	int i = 0;
+
+	if (!IS_ENABLED(CONFIG_PCI))
+		return;
+
+	np = of_find_node_by_path("/testcase-data/address-tests/pci@90000000");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	if (of_pci_dma_range_parser_init(&parser, np)) {
+		pr_err("missing dma-ranges property\n");
+		return;
+	}
+
+	/*
+	 * Get the dma-ranges from the device tree
+	 */
+	for_each_of_pci_range(&parser, &range) {
+		if (!i) {
+			unittest(range.size == 0x10000000,
+				 "for_each_of_pci_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0x20000000,
+				 "for_each_of_pci_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.pci_addr == 0x80000000,
+				 "for_each_of_pci_range wrong DMA addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		} else {
+			unittest(range.size == 0x10000000,
+				 "for_each_of_pci_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0x40000000,
+				 "for_each_of_pci_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.pci_addr == 0xc0000000,
+				 "for_each_of_pci_range wrong DMA addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		}
+		i++;
+	}
+
+	of_node_put(np);
+}
+
 static void __init of_unittest_parse_interrupts(void)
 {
 	struct device_node *np;
@@ -2552,6 +2642,8 @@ static int __init of_unittest(void)
 	of_unittest_changeset();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
+	of_unittest_parse_dma_ranges();
+	of_unittest_pci_dma_ranges();
 	of_unittest_match_node();
 	of_unittest_platform_populate();
 	of_unittest_overlay();
-- 
2.20.1
