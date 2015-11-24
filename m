From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH (v5) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Tue, 24 Nov 2015 18:15:11 +0000
Message-ID: <5654A92F.9020703@simon.arlott.org.uk>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56541BD3.4070202-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BCM63268 has a NAND interrupt register with combined status and ena=
ble
registers. It also has a clock for the NAND controller that needs to be
enabled.

Set up the device by enabling the clock, disabling and acking all
interrupts, then handle the CTRL_READY interrupt.

Add a brcmnand_get_socdata() function so that bcm63268_nand can obtain =
its
data and disable the clock when the device is removed.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 drivers/mtd/nand/brcmnand/Makefile        |   1 +
 drivers/mtd/nand/brcmnand/bcm63268_nand.c | 179 ++++++++++++++++++++++=
++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c      |   7 ++
 drivers/mtd/nand/brcmnand/brcmnand.h      |   1 +
 4 files changed, 188 insertions(+)
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
index 0000000..91d8e4d
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcm63268_nand.c
@@ -0,0 +1,179 @@
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
+	priv->clk =3D devm_clk_get(&pdev->dev, "nand");
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	ret =3D clk_prepare_enable(priv->clk);
+	if (ret)
+		return ret;
+
+	soc->ctlrdy_ack =3D bcm63268_nand_intc_ack;
+	soc->ctlrdy_set_enabled =3D bcm63268_nand_intc_set;
+
+	/* Disable and ack all interrupts  */
+	brcmnand_writel(0, priv->base + BCM63268_NAND_INT);
+	brcmnand_writel(BCM63268_NAND_STATUS_MASK,
+			priv->base + BCM63268_NAND_INT);
+
+	ret =3D brcmnand_probe(pdev, soc);
+	if (ret)
+		clk_disable_unprepare(priv->clk);
+
+	return ret;
+}
+
+static int bcm63268_nand_remove(struct platform_device *pdev)
+{
+	struct brcmnand_soc *soc =3D brcmnand_get_socdata(pdev);
+	struct bcm63268_nand_soc *priv =3D NULL;
+	int ret;
+
+	if (soc)
+		priv =3D container_of(soc, struct bcm63268_nand_soc, soc);
+
+	ret =3D brcmnand_remove(pdev);
+	if (ret)
+		return ret;
+
+	if (priv)
+		clk_disable_unprepare(priv->clk);
+
+	return 0;
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
+	.remove			=3D bcm63268_nand_remove,
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
index 2c8f67f..99ca69e 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2262,6 +2262,13 @@ int brcmnand_probe(struct platform_device *pdev,=
 struct brcmnand_soc *soc)
 }
 EXPORT_SYMBOL_GPL(brcmnand_probe);
=20
+struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev=
)
+{
+	struct brcmnand_controller *ctrl =3D dev_get_drvdata(&pdev->dev);
+
+	return ctrl ? ctrl->soc : NULL;
+}
+
 int brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl =3D dev_get_drvdata(&pdev->dev);
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/br=
cmnand/brcmnand.h
index ef5eabb..6680419 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -65,6 +65,7 @@ static inline void brcmnand_writel(u32 val, void __io=
mem *addr)
=20
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *=
soc);
 int brcmnand_remove(struct platform_device *pdev);
+struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev=
);
=20
 extern const struct dev_pm_ops brcmnand_pm_ops;
=20
--=20
2.1.4

--=20
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
