From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v9 RESEND 2/4] misc: Generic on-chip SRAM allocation driver
Date: Wed, 20 Mar 2013 11:52:45 +0100
Message-ID: <1363776767-2635-3-git-send-email-p.zabel@pengutronix.de>
References: <1363776767-2635-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363776767-2635-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Javier Martin <javier.martin-N4RbWZIug12MkV8/HQOAswC/G2K4zDHf@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver requests and remaps a memory region as configured in the
device tree. It serves memory from this region via the genalloc API.
It optionally enables the SRAM clock.

Other drivers can retrieve the genalloc pool from a phandle pointing
to this drivers' device node in the device tree.

The allocation granularity is hard-coded to 32 bytes for now,
to make the SRAM driver useful for the 6502 remoteproc driver.
There is overhead for bigger SRAMs, where only a much coarser
allocation granularity is needed: At 32 bytes minimum allocation
size, a 256 KiB SRAM needs a 1 KiB bitmap to track allocations.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Reviewed-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
Changes since v8:
 - Changed device tree compatible string to "mmio-sram"
---
 Documentation/devicetree/bindings/misc/sram.txt |   16 +++
 drivers/misc/Kconfig                            |    9 ++
 drivers/misc/Makefile                           |    1 +
 drivers/misc/sram.c                             |  121 +++++++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/sram.txt
 create mode 100644 drivers/misc/sram.c

diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/misc/sram.txt
new file mode 100644
index 0000000..4d0a00e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/sram.txt
@@ -0,0 +1,16 @@
+Generic on-chip SRAM
+
+Simple IO memory regions to be managed by the genalloc API.
+
+Required properties:
+
+- compatible : mmio-sram
+
+- reg : SRAM iomem address range
+
+Example:
+
+sram: sram@5c000000 {
+	compatible = "mmio-sram";
+	reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
+};
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index e83fdfe..4878507 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -510,6 +510,15 @@ config LATTICE_ECP3_CONFIG
 
 	  If unsure, say N.
 
+config SRAM
+	bool "Generic on-chip SRAM driver"
+	depends on HAS_IOMEM
+	select GENERIC_ALLOCATOR
+	help
+	  This driver allows to declare a memory region to be managed
+	  by the genalloc API. It is supposed to be used for small
+	  on-chip SRAM areas found on many SoCs.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 35a1463..08e2007 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -52,3 +52,4 @@ obj-$(CONFIG_INTEL_MEI)		+= mei/
 obj-$(CONFIG_MAX8997_MUIC)	+= max8997-muic.o
 obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
 obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
+obj-$(CONFIG_SRAM)		+= sram.o
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
new file mode 100644
index 0000000..7858c62
--- /dev/null
+++ b/drivers/misc/sram.c
@@ -0,0 +1,121 @@
+/*
+ * Generic on-chip SRAM allocation driver
+ *
+ * Copyright (C) 2012 Philipp Zabel, Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/genalloc.h>
+
+#define SRAM_GRANULARITY	32
+
+struct sram_dev {
+	struct gen_pool *pool;
+	struct clk *clk;
+};
+
+static int sram_probe(struct platform_device *pdev)
+{
+	void __iomem *virt_base;
+	struct sram_dev *sram;
+	struct resource *res;
+	unsigned long size;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	size = resource_size(res);
+
+	virt_base = devm_request_and_ioremap(&pdev->dev, res);
+	if (!virt_base)
+		return -EADDRNOTAVAIL;
+
+	sram = devm_kzalloc(&pdev->dev, sizeof(*sram), GFP_KERNEL);
+	if (!sram)
+		return -ENOMEM;
+
+	sram->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(sram->clk))
+		sram->clk = NULL;
+	else
+		clk_prepare_enable(sram->clk);
+
+	sram->pool = devm_gen_pool_create(&pdev->dev, ilog2(SRAM_GRANULARITY), -1);
+	if (!sram->pool)
+		return -ENOMEM;
+
+	ret = gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
+				res->start, size, -1);
+	if (ret < 0) {
+		gen_pool_destroy(sram->pool);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, sram);
+
+	dev_dbg(&pdev->dev, "SRAM pool: %ld KiB @ 0x%p\n", size / 1024, virt_base);
+
+	return 0;
+}
+
+static int sram_remove(struct platform_device *pdev)
+{
+	struct sram_dev *sram = platform_get_drvdata(pdev);
+
+	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
+		dev_dbg(&pdev->dev, "removed while SRAM allocated\n");
+
+	gen_pool_destroy(sram->pool);
+
+	if (sram->clk)
+		clk_disable_unprepare(sram->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static struct of_device_id sram_dt_ids[] = {
+	{ .compatible = "mmio-sram" },
+	{}
+};
+#endif
+
+static struct platform_driver sram_driver = {
+	.driver = {
+		.name = "sram",
+		.of_match_table = of_match_ptr(sram_dt_ids),
+	},
+	.probe = sram_probe,
+	.remove = sram_remove,
+};
+
+int __init sram_init(void)
+{
+	return platform_driver_register(&sram_driver);
+}
+
+postcore_initcall(sram_init);
-- 
1.7.10.4
