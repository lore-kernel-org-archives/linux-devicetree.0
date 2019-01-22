From: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 2/2] uio: Add the UIO driver for Xilinx AI Engine
Date: Mon, 21 Jan 2019 17:12:17 -0800
Message-ID: <1548119537-1788-2-git-send-email-hyun.kwon@xilinx.com>
References: <1548119537-1788-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548119537-1788-1-git-send-email-hyun.kwon@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
List-Id: devicetree@vger.kernel.org

This adds the UIO driver for Xilinx AI Engine. The driver is
more or less a simple wrapper that enables the UIO dmem genirq
with some required configurations, because the UIO dmem driver
is not probed through DT compatible string. This driver initializes
the UIO dmem by adding it as a child device.

While doing it, any resources in this driver DT node is mirroed to
the child node so that those resources can be accessed by UIO
if needed. As a part of it, the child device is set up with parent
node DMA configuration.

In addition, this driver specifies some information that the UIO dmem
driver expects, which includes,
     - uioinfo: version, name, irq type, mem offsets,,,
     - memory allocation information: size and number of chunks

Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 MAINTAINERS                        |   1 +
 drivers/uio/Kconfig                |  10 +++
 drivers/uio/Makefile               |   1 +
 drivers/uio/uio_xilinx_ai_engine.c | 176 +++++++++++++++++++++++++++++++++++++
 4 files changed, 188 insertions(+)
 create mode 100644 drivers/uio/uio_xilinx_ai_engine.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d119d1d..bced6f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16044,6 +16044,7 @@ USERSPACE I/O (UIO) DRIVER FOR XILINX AI ENGINE
 M:	Hyun Kwon <hyun.kwon@xilinx.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
+F:	drivers/uio/uio_xilinx_ai_engine.c
 
 UTIL-LINUX PACKAGE
 M:	Karel Zak <kzak@redhat.com>
diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 7e8dc78..5a25241 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -164,4 +164,14 @@ config UIO_HV_GENERIC
 	  to network and storage devices from userspace.
 
 	  If you compile this as a module, it will be called uio_hv_generic.
+
+config UIO_XILINX_AI_ENGINE
+	tristate "Xilinx AI Engine driver"
+	select UIO_DMEM_GENIRQ
+	help
+	  The driver for Xilinx AI Engine that utilizes the uio_dmem_genirq.
+	  The userspace library will use this to interact with the AI Engine
+	  hardware, as well as for the memory allocation.
+	  Say 'y' only for platforms with the MathEngine IP.
+
 endif
diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
index c285dd2..26b2739 100644
--- a/drivers/uio/Makefile
+++ b/drivers/uio/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_UIO_PRUSS)         += uio_pruss.o
 obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
 obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
 obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
+obj-$(CONFIG_UIO_XILINX_AI_ENGINE) += uio_xilinx_ai_engine.o
diff --git a/drivers/uio/uio_xilinx_ai_engine.c b/drivers/uio/uio_xilinx_ai_engine.c
new file mode 100644
index 0000000..65dc99c
--- /dev/null
+++ b/drivers/uio/uio_xilinx_ai_engine.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx UIO driver for AI Engine
+ *
+ * Copyright (C) 2018 Xilinx, Inc.
+ *
+ * Author: Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ */
+
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/uio_dmem_genirq.h>
+#include <linux/platform_device.h>
+#include <linux/uio_driver.h>
+
+#define DRIVER_NAME "xilinx-aiengine"
+
+static uint xilinx_ai_engine_mem_cnt = 1;
+module_param_named(mem_cnt, xilinx_ai_engine_mem_cnt, uint, 0444);
+MODULE_PARM_DESC(mem_cnt, "Dynamic memory allocation count (default: 1)");
+
+static uint xilinx_ai_engine_mem_size = 32 * 1024 * 1024;
+module_param_named(mem_size, xilinx_ai_engine_mem_size, uint, 0444);
+MODULE_PARM_DESC(mem_size,
+		 "Dynamic memory allocation size in bytes (default: 32 MB)");
+
+static int xilinx_ai_engine_mem_index(struct uio_info *info,
+				      struct vm_area_struct *vma)
+{
+	if (vma->vm_pgoff < MAX_UIO_MAPS) {
+		if (info->mem[vma->vm_pgoff].size == 0)
+			return -1;
+		return (int)vma->vm_pgoff;
+	}
+	return -1;
+}
+
+static const struct vm_operations_struct xilinx_ai_engine_vm_ops = {
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
+};
+
+static int xilinx_ai_engine_mmap(struct uio_info *info,
+				 struct vm_area_struct *vma)
+{
+	int mi = xilinx_ai_engine_mem_index(info, vma);
+	struct uio_mem *mem;
+
+	if (mi < 0)
+		return -EINVAL;
+	mem = info->mem + mi;
+
+	if (mem->addr & ~PAGE_MASK)
+		return -ENODEV;
+	if (vma->vm_end - vma->vm_start > mem->size)
+		return -EINVAL;
+
+	vma->vm_ops = &xilinx_ai_engine_vm_ops;
+	/*
+	 * Make the dynamic memory mapping as write-combined. Only first one
+	 * will be the mmio region, which will be mapped as noncached.
+	 */
+	if (mi < 1)
+		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	else
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	/*
+	 * We cannot use the vm_iomap_memory() helper here,
+	 * because vma->vm_pgoff is the map index we looked
+	 * up above in uio_find_mem_index(), rather than an
+	 * actual page offset into the mmap.
+	 *
+	 * So we just do the physical mmap without a page
+	 * offset.
+	 */
+	return remap_pfn_range(vma,
+			       vma->vm_start,
+			       mem->addr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start,
+			       vma->vm_page_prot);
+}
+
+static int xilinx_ai_engine_probe(struct platform_device *pdev)
+{
+	struct platform_device *uio;
+	struct uio_dmem_genirq_pdata *pdata;
+	unsigned int i;
+	int ret;
+
+	uio = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
+	if (!uio)
+		return -ENOMEM;
+	uio->driver_override = "uio_dmem_genirq";
+	uio->dev.parent = &pdev->dev;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	pdata->num_dynamic_regions = xilinx_ai_engine_mem_cnt;
+	pdata->dynamic_region_sizes = &xilinx_ai_engine_mem_size;
+	pdata->uioinfo.name = DRIVER_NAME;
+	pdata->uioinfo.version = "devicetree";
+	pdata->uioinfo.irq = UIO_IRQ_CUSTOM;
+	pdata->uioinfo.mmap = xilinx_ai_engine_mmap;
+	/* Set the offset value as it's map index for each memory */
+	for (i = 0; i < MAX_UIO_MAPS; i++)
+		pdata->uioinfo.mem[i].offs = i << PAGE_SHIFT;
+	ret = platform_device_add_data(uio, pdata, sizeof(*pdata));
+	if (ret)
+		goto err_out;
+
+	/* Mirror the parent device resource to uio device */
+	ret = platform_device_add_resources(uio, pdev->resource,
+					    pdev->num_resources);
+	if (ret)
+		goto err_out;
+
+	/* Configure the dma for uio device using the parent of_node */
+	uio->dev.bus = &platform_bus_type;
+	ret = of_dma_configure(&uio->dev, of_node_get(pdev->dev.of_node), true);
+	of_node_put(pdev->dev.of_node);
+	if (ret)
+		goto err_out;
+
+	ret = platform_device_add(uio);
+	if (ret)
+		goto err_out;
+	platform_set_drvdata(uio, pdata);
+
+	dev_info(&pdev->dev, "Xilinx AI Engine UIO driver probed");
+	return 0;
+
+err_out:
+	platform_device_put(pdev);
+	dev_err(&pdev->dev,
+		"failed to probe Xilinx AI Engine UIO driver");
+	return ret;
+}
+
+static int xilinx_ai_engine_remove(struct platform_device *pdev)
+{
+	struct platform_device *uio = platform_get_drvdata(pdev);
+
+	platform_device_unregister(uio);
+	of_node_put(pdev->dev.of_node);
+
+	return 0;
+}
+
+static const struct of_device_id xilinx_ai_engine_of_match[] = {
+	{ .compatible = "xlnx,ai_engine", },
+	{ .compatible = "xlnx,mathengine", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, xilinx_ai_engine_of_match);
+
+static struct platform_driver xilinx_ai_engine_driver = {
+	.probe			= xilinx_ai_engine_probe,
+	.remove			= xilinx_ai_engine_remove,
+	.driver			= {
+		.name		= DRIVER_NAME,
+		.of_match_table	= xilinx_ai_engine_of_match,
+	},
+};
+
+module_platform_driver(xilinx_ai_engine_driver);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
