From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH (v4) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Sun, 22 Nov 2015 22:17:35 +0000
Message-ID: <56523EFF.9050502@simon.arlott.org.uk>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56523E85.905@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

The BCM63268 has a NAND interrupt register with combined status and ena=
ble
registers. It also has a clock for the NAND controller that needs to be
enabled.

Set up the device by enabling the clock, disabling and acking all
interrupts, then handle the CTRL_READY interrupt.

Add a "device_remove" function to struct brcmnand_soc so that the clock
can be disabled when the device is removed.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
On 22/11/15 21:59, Rob Herring wrote:
>> >> + * "brcm,nand-bcm63268"
>> >> + - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-b=
cm63268"
> >
> > vendor,<soc>-device is preferred.

The existing two bindings use brcm,nand-<soc>, but I've changed this on=
e.

 drivers/mtd/nand/brcmnand/Makefile        |   1 +
 drivers/mtd/nand/brcmnand/bcm63268_nand.c | 174 ++++++++++++++++++++++=
++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c      |   3 +
 drivers/mtd/nand/brcmnand/brcmnand.h      |   1 +
 4 files changed, 179 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/bcm63268_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcm=
nand/Makefile
index 3b1fbfd..b83a9ae 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -2,5 +2,6 @@
 # more specific iproc_nand.o, for instance
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D iproc_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D bcm63138_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D bcm63268_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/bcm63268_nand.c b/drivers/mtd/na=
nd/brcmnand/bcm63268_nand.c
new file mode 100644
index 0000000..88b32fa
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcm63268_nand.c
@@ -0,0 +1,174 @@
+/*
+ * Copyright 2015 Simon Arlott
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * Derived from bcm63138_nand.c:
+ * Copyright =C2=A9 2015 Broadcom Corporation
+ *
+ * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/include/=
bcm963xx/63268_map_part.h:
+ * Copyright 2000-2010 Broadcom Corporation
+ *
+ * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/flash/na=
ndflash.c:
+ * Copyright 2000-2010 Broadcom Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "brcmnand.h"
+
+struct bcm63268_nand_soc {
+	struct brcmnand_soc soc;
+	void __iomem *base;
+	struct clk *clk;
+};
+
+#define BCM63268_NAND_INT		0x00
+#define  BCM63268_NAND_STATUS_SHIFT	0
+#define  BCM63268_NAND_STATUS_MASK	(0xfff << BCM63268_NAND_STATUS_SHIF=
T)
+#define  BCM63268_NAND_ENABLE_SHIFT	16
+#define  BCM63268_NAND_ENABLE_MASK	(0xffff << BCM63268_NAND_ENABLE_SHI=
=46T)
+#define BCM63268_NAND_BASE_ADDR0	0x04
+#define BCM63268_NAND_BASE_ADDR1	0x0c
+
+enum {
+	BCM63268_NP_READ	=3D BIT(0),
+	BCM63268_BLOCK_ERASE	=3D BIT(1),
+	BCM63268_COPY_BACK	=3D BIT(2),
+	BCM63268_PAGE_PGM	=3D BIT(3),
+	BCM63268_CTRL_READY	=3D BIT(4),
+	BCM63268_DEV_RBPIN	=3D BIT(5),
+	BCM63268_ECC_ERR_UNC	=3D BIT(6),
+	BCM63268_ECC_ERR_CORR	=3D BIT(7),
+};
+
+static bool bcm63268_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm63268_nand_soc *priv =3D
+			container_of(soc, struct bcm63268_nand_soc, soc);
+	void __iomem *mmio =3D priv->base + BCM63268_NAND_INT;
+	u32 val =3D brcmnand_readl(mmio);
+
+	if (val & (BCM63268_CTRL_READY << BCM63268_NAND_STATUS_SHIFT)) {
+		/* Ack interrupt */
+		val &=3D ~BCM63268_NAND_STATUS_MASK;
+		val |=3D BCM63268_CTRL_READY << BCM63268_NAND_STATUS_SHIFT;
+		brcmnand_writel(val, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm63268_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm63268_nand_soc *priv =3D
+			container_of(soc, struct bcm63268_nand_soc, soc);
+	void __iomem *mmio =3D priv->base + BCM63268_NAND_INT;
+	u32 val =3D brcmnand_readl(mmio);
+
+	/* Don't ack any interrupts */
+	val &=3D ~BCM63268_NAND_STATUS_MASK;
+
+	if (en)
+		val |=3D BCM63268_CTRL_READY << BCM63268_NAND_ENABLE_SHIFT;
+	else
+		val &=3D ~(BCM63268_CTRL_READY << BCM63268_NAND_ENABLE_SHIFT);
+
+	brcmnand_writel(val, mmio);
+}
+
+static void bcm63268_nand_remove(struct brcmnand_soc *soc)
+{
+	struct bcm63268_nand_soc *priv =3D
+			container_of(soc, struct bcm63268_nand_soc, soc);
+
+	clk_disable_unprepare(priv->clk);
+	clk_put(priv->clk);
+}
+
+static int bcm63268_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct bcm63268_nand_soc *priv;
+	struct brcmnand_soc *soc;
+	struct resource *res;
+	int ret;
+
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	soc =3D &priv->soc;
+
+	res =3D platform_get_resource_byname(pdev,
+		IORESOURCE_MEM, "nand-intr-base");
+	if (!res)
+		return -EINVAL;
+
+	priv->base =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk =3D of_clk_get(dev->of_node, 0);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	ret =3D clk_prepare_enable(priv->clk);
+	if (ret) {
+		clk_put(priv->clk);
+		return ret;
+	}
+
+	soc->ctlrdy_ack =3D bcm63268_nand_intc_ack;
+	soc->ctlrdy_set_enabled =3D bcm63268_nand_intc_set;
+	soc->remove_device =3D bcm63268_nand_remove;
+
+	/* Disable and ack all interrupts  */
+	brcmnand_writel(0, priv->base + BCM63268_NAND_INT);
+	brcmnand_writel(BCM63268_NAND_STATUS_MASK,
+			priv->base + BCM63268_NAND_INT);
+
+	ret =3D brcmnand_probe(pdev, soc);
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
+		clk_put(priv->clk);
+	}
+
+	return ret;
+}
+
+static const struct of_device_id bcm63268_nand_of_match[] =3D {
+	{ .compatible =3D "brcm,bcm63268-nand" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm63268_nand_of_match);
+
+static struct platform_driver bcm63268_nand_driver =3D {
+	.probe			=3D bcm63268_nand_probe,
+	.remove			=3D brcmnand_remove,
+	.driver =3D {
+		.name		=3D "bcm63268_nand",
+		.pm		=3D &brcmnand_pm_ops,
+		.of_match_table	=3D bcm63268_nand_of_match,
+	}
+};
+module_platform_driver(bcm63268_nand_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Simon Arlott");
+MODULE_DESCRIPTION("NAND driver for BCM63268");
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/br=
cmnand/brcmnand.c
index 2c8f67f..7b4988f 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2270,6 +2270,9 @@ int brcmnand_remove(struct platform_device *pdev)
 	list_for_each_entry(host, &ctrl->host_list, node)
 		nand_release(&host->mtd);
=20
+	if (ctrl->soc && ctrl->soc->remove_device)
+		ctrl->soc->remove_device(ctrl->soc);
+
 	dev_set_drvdata(&pdev->dev, NULL);
=20
 	return 0;
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/br=
cmnand/brcmnand.h
index ef5eabb..5c5dc2d 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -24,6 +24,7 @@ struct brcmnand_soc {
 	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
+	void (*remove_device)(struct brcmnand_soc *soc);
 };
=20
 static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *=
soc)
--=20
2.1.4

--=20
Simon Arlott
