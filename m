From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 4/4] mfd: anatop-mfd: remove anatop driver
Date: Tue, 4 Sep 2012 11:20:11 +0800
Message-ID: <1346728811-25788-5-git-send-email-b29396@freescale.com>
References: <1346728811-25788-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1346728811-25788-1-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The anatop registers are accessed via syscon now, no one will use
mfd anatop driver anymore, remove it.

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/Kconfig        |    8 ---
 drivers/mfd/Makefile       |    1 -
 drivers/mfd/anatop-mfd.c   |  124 --------------------------------------------
 include/linux/mfd/anatop.h |   40 --------------
 4 files changed, 0 insertions(+), 173 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 82247b7..0b5c0cc 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -985,14 +985,6 @@ config MFD_STA2X11
 	depends on STA2X11
 	select MFD_CORE
 
-config MFD_ANATOP
-	bool "Support for Freescale i.MX on-chip ANATOP controller"
-	depends on SOC_IMX6Q
-	help
-	  Select this option to enable Freescale i.MX on-chip ANATOP
-	  MFD controller. This controller embeds regulator and
-	  thermal devices for Freescale i.MX platforms.
-
 config MFD_SYSCON
 	bool "System Controller Register R/W Based on Regmap"
 	depends on OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 8384bc9..0f10a95 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -130,6 +130,5 @@ obj-$(CONFIG_MFD_INTEL_MSIC)	+= intel_msic.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
-obj-$(CONFIG_MFD_ANATOP)	+= anatop-mfd.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
 obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
diff --git a/drivers/mfd/anatop-mfd.c b/drivers/mfd/anatop-mfd.c
deleted file mode 100644
index 5576e07..0000000
--- a/drivers/mfd/anatop-mfd.c
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- * Anatop MFD driver
- *
- * Copyright (C) 2012 Ying-Chun Liu (PaulLiu) <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
- * Copyright (C) 2012 Linaro
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
-#include <linux/mfd/anatop.h>
-
-u32 anatop_read_reg(struct anatop *adata, u32 addr)
-{
-	return readl(adata->ioreg + addr);
-}
-EXPORT_SYMBOL_GPL(anatop_read_reg);
-
-void anatop_write_reg(struct anatop *adata, u32 addr, u32 data, u32 mask)
-{
-	u32 val;
-
-	data &= mask;
-
-	spin_lock(&adata->reglock);
-	val = readl(adata->ioreg + addr);
-	val &= ~mask;
-	val |= data;
-	writel(val, adata->ioreg + addr);
-	spin_unlock(&adata->reglock);
-}
-EXPORT_SYMBOL_GPL(anatop_write_reg);
-
-static const struct of_device_id of_anatop_match[] = {
-	{ .compatible = "fsl,imx6q-anatop", },
-	{ },
-};
-
-static int __devinit of_anatop_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	void *ioreg;
-	struct anatop *drvdata;
-
-	ioreg = of_iomap(np, 0);
-	if (!ioreg)
-		return -EADDRNOTAVAIL;
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-	drvdata->ioreg = ioreg;
-	spin_lock_init(&drvdata->reglock);
-	platform_set_drvdata(pdev, drvdata);
-	of_platform_populate(np, NULL, NULL, dev);
-
-	return 0;
-}
-
-static int __devexit of_anatop_remove(struct platform_device *pdev)
-{
-	struct anatop *drvdata;
-	drvdata = platform_get_drvdata(pdev);
-	iounmap(drvdata->ioreg);
-
-	return 0;
-}
-
-static struct platform_driver anatop_of_driver = {
-	.driver = {
-		.name = "anatop-mfd",
-		.owner = THIS_MODULE,
-		.of_match_table = of_anatop_match,
-	},
-	.probe		= of_anatop_probe,
-	.remove		= of_anatop_remove,
-};
-
-static int __init anatop_init(void)
-{
-	return platform_driver_register(&anatop_of_driver);
-}
-postcore_initcall(anatop_init);
-
-static void __exit anatop_exit(void)
-{
-	platform_driver_unregister(&anatop_of_driver);
-}
-module_exit(anatop_exit);
-
-MODULE_AUTHOR("Ying-Chun Liu (PaulLiu) <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>");
-MODULE_DESCRIPTION("ANATOP MFD driver");
-MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/anatop.h b/include/linux/mfd/anatop.h
deleted file mode 100644
index 7f92acf..0000000
--- a/include/linux/mfd/anatop.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/*
- * anatop.h - Anatop MFD driver
- *
- *  Copyright (C) 2012 Ying-Chun Liu (PaulLiu) <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
- *  Copyright (C) 2012 Linaro
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
-
-#ifndef __LINUX_MFD_ANATOP_H
-#define __LINUX_MFD_ANATOP_H
-
-#include <linux/spinlock.h>
-
-/**
- * anatop - MFD data
- * @ioreg: ioremap register
- * @reglock: spinlock for register read/write
- */
-struct anatop {
-	void *ioreg;
-	spinlock_t reglock;
-};
-
-extern u32 anatop_read_reg(struct anatop *, u32);
-extern void anatop_write_reg(struct anatop *, u32, u32, u32);
-
-#endif /*  __LINUX_MFD_ANATOP_H */
-- 
1.7.0.4
