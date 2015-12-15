From: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
Date: Tue, 15 Dec 2015 21:58:53 +0300
Message-ID: <1450205941-15593-1-git-send-email-ynvich@gmail.com>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397668667-27328-4-git-send-email-ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:MEMORY TECHNOLOGY DEVICES
	MTD" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This provides an MTD device driver for 512kB of battery backed up SRAM
on ICPDAS LP-8X4X programmable automation controllers.

SRAM chip is connected via FPGA and is not accessible without a driver,
unlike flash memory which is wired to CPU MMU.

This SRAM becomes an excellent persisent storage of volatile process
data like counter values and sensor statuses. Storing those data in
flash or mmc card is not a viable solution.

Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
   v4..v5
   * remove .owner from struct platform_driver
   * constify struct of_device_id
    for further Brian Norris comments:
   * drop unused property from doc file
   * move defconfig update to a different file
   * drop extra match w/ of_match_device()

   v3..v4 for Brian Norris 'Reviewed-by'
   * add doc file for DT binding
   * move DTS binding to a different patch (8/21)
   * drop unused include directive
   * drop safely unused callback
   * drop non-default partion probe types
   * drop duplicate error checks
   * drop duplicate error reporting
   * fixed error message on MTD registeration
   * fixed module removal routine

   v2..v3
   * no changes (except number 08/16 -> 10/21)

   v0..v2
   * use device tree
   * use devm helpers where possible

 .../devicetree/bindings/mtd/sram-lp8x4x.txt        |  20 +++
 drivers/mtd/devices/Kconfig                        |  14 ++
 drivers/mtd/devices/Makefile                       |   1 +
 drivers/mtd/devices/sram_lp8x4x.c                  | 199 +++++++++++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
 create mode 100644 drivers/mtd/devices/sram_lp8x4x.c

diff --git a/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
new file mode 100644
index 0000000..476934f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
@@ -0,0 +1,20 @@
+512kB battery backed up SRAM on LP-8x4x industrial computers
+
+Required properties:
+- compatible : should be "icpdas,sram-lp8x4x"
+
+- reg: physical base addresses and region lengths of
+       * IO memory range
+       * SRAM page selector
+
+SRAM chip is connected via FPGA and is not accessible without a driver,
+unlike flash memory which is wired to CPU MMU. Driver is essentially
+an address translation routine.
+
+Example:
+
+	sram@a000 {
+		compatible = "icpdas,sram-lp8x4x";
+		reg = <0xa000 0x1000
+		       0x901e 0x1>;
+	};
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f73c416..a4573f6 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -233,4 +233,18 @@ config BCH_CONST_T
 	default 4
 endif
 
+config MTD_SRAM_LP8X4X
+	tristate "SRAM on ICPDAS LP-8X4X"
+	depends on OF && ARCH_PXA
+       ---help---
+	 This provides an MTD device driver for 512kiB of battery backed up SRAM
+	 on ICPDAS LP-8X4X programmable automation controllers.
+
+	 SRAM chip is connected via FPGA and is not accessible without a driver,
+	 unlike flash memory which is wired to CPU MMU.
+
+	 Say N, unless you plan to run this kernel on LP-8X4X.
+
+	 If you say M, the module will be called sram_lp8x4x.
+
 endmenu
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index 7912d3a..2fd5b7a 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
 obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
+obj-$(CONFIG_MTD_SRAM_LP8X4X)	+= sram_lp8x4x.o
 
 
 CFLAGS_docg3.o			+= -I$(src)
diff --git a/drivers/mtd/devices/sram_lp8x4x.c b/drivers/mtd/devices/sram_lp8x4x.c
new file mode 100644
index 0000000..e43c7a7
--- /dev/null
+++ b/drivers/mtd/devices/sram_lp8x4x.c
@@ -0,0 +1,199 @@
+/*
+ *  linux/drivers/mtd/devices/lp8x4x_sram.c
+ *
+ *  MTD Driver for SRAM on ICPDAS LP-8x4x
+ *  Copyright (C) 2013 Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation or any later version.
+ */
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/string_helpers.h>
+#include <linux/types.h>
+
+struct lp8x4x_sram_info {
+	void __iomem	*bank;
+	void __iomem	*virt;
+	struct mutex	lock;
+	unsigned	active_bank;
+	struct mtd_info	mtd;
+};
+
+static int
+lp8x4x_sram_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	struct lp8x4x_sram_info *info = mtd->priv;
+	unsigned bank = instr->addr >> 11;
+	unsigned offset = (instr->addr & 0x7ff) << 1;
+	loff_t i;
+
+	mutex_lock(&info->lock);
+	if (unlikely(bank != info->active_bank)) {
+		info->active_bank = bank;
+		iowrite8(bank, info->bank);
+	}
+	for (i = 0; i < instr->len; i++) {
+		iowrite8(0xff, info->virt + offset);
+		offset += 2;
+		if (unlikely(offset == 0)) {
+			info->active_bank++;
+			iowrite8(info->active_bank, info->bank);
+		}
+	}
+	mutex_unlock(&info->lock);
+	instr->state = MTD_ERASE_DONE;
+	mtd_erase_callback(instr);
+
+	return 0;
+}
+
+static int
+lp8x4x_sram_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *b)
+{
+	struct lp8x4x_sram_info *info = mtd->priv;
+	unsigned bank = to >> 11;
+	unsigned offset = (to & 0x7ff) << 1;
+	loff_t i;
+
+	mutex_lock(&info->lock);
+	if (unlikely(bank != info->active_bank)) {
+		info->active_bank = bank;
+		iowrite8(bank, info->bank);
+	}
+	for (i = 0; i < len; i++) {
+		iowrite8(b[i], info->virt + offset);
+		offset += 2;
+		if (unlikely(offset == 0)) {
+			info->active_bank++;
+			iowrite8(info->active_bank, info->bank);
+		}
+	}
+	mutex_unlock(&info->lock);
+	*retlen = len;
+	return 0;
+}
+
+static int
+lp8x4x_sram_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *b)
+{
+	struct lp8x4x_sram_info *info = mtd->priv;
+	unsigned bank = from >> 11;
+	unsigned offset = (from & 0x7ff) << 1;
+	loff_t i;
+
+	mutex_lock(&info->lock);
+	if (unlikely(bank != info->active_bank)) {
+		info->active_bank = bank;
+		iowrite8(bank, info->bank);
+	}
+	for (i = 0; i < len; i++) {
+		b[i] = ioread8(info->virt + offset);
+		offset += 2;
+		if (unlikely(offset == 0)) {
+			info->active_bank++;
+			iowrite8(info->active_bank, info->bank);
+		}
+	}
+	mutex_unlock(&info->lock);
+	*retlen = len;
+	return 0;
+}
+
+static const struct of_device_id of_flash_match[] = {
+	{
+		.compatible	= "icpdas,sram-lp8x4x",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_flash_match);
+
+static int
+lp8x4x_sram_probe(struct platform_device *pdev)
+{
+	struct lp8x4x_sram_info *info;
+	struct resource *res_virt, *res_bank;
+	char sz_str[16];
+	struct mtd_part_parser_data ppdata;
+	int err = 0;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	res_virt = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	info->virt =  devm_ioremap_resource(&pdev->dev, res_virt);
+	if (IS_ERR(info->virt))
+		return PTR_ERR(info->virt);
+
+	res_bank = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	info->bank = devm_ioremap_resource(&pdev->dev, res_bank);
+	if (IS_ERR(info->bank))
+		return PTR_ERR(info->bank);
+
+	info->mtd.priv = info;
+	info->mtd.name = "SRAM";
+	info->mtd.type = MTD_RAM;
+	info->mtd.flags = MTD_CAP_RAM;
+	info->mtd.size = resource_size(res_virt) << 7;
+	info->mtd.erasesize = 512;
+	info->mtd.writesize = 4;
+	info->mtd._erase = lp8x4x_sram_erase;
+	info->mtd._write = lp8x4x_sram_write;
+	info->mtd._read = lp8x4x_sram_read;
+	info->mtd.owner = THIS_MODULE;
+
+	mutex_init(&info->lock);
+	iowrite8(info->active_bank, info->bank);
+	platform_set_drvdata(pdev, info);
+
+	ppdata.of_node = pdev->dev.of_node;
+	err = mtd_device_parse_register(&info->mtd, NULL, &ppdata,
+			NULL, 0);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to register MTD\n");
+		return err;
+	}
+
+	string_get_size(info->mtd.size, 1, STRING_UNITS_2, sz_str,
+			sizeof(sz_str));
+	dev_info(&pdev->dev, "using %s SRAM on LP-8X4X as %s\n", sz_str,
+			dev_name(&info->mtd.dev));
+	return 0;
+}
+
+static int
+lp8x4x_sram_remove(struct platform_device *dev)
+{
+	struct lp8x4x_sram_info *info = platform_get_drvdata(dev);
+
+	return mtd_device_unregister(&info->mtd);
+}
+
+static struct platform_driver lp8x4x_sram_driver = {
+	.driver = {
+		.name		= "sram-lp8x4x",
+		.of_match_table = of_flash_match,
+	},
+	.probe		= lp8x4x_sram_probe,
+	.remove		= lp8x4x_sram_remove,
+};
+
+module_platform_driver(lp8x4x_sram_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("MTD driver for SRAM on ICPDAS LP-8x4x");
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
