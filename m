From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Tue, 12 May 2015 17:53:41 -0700
Message-ID: <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v4: split into its own proper platform driver

 drivers/mtd/nand/brcmnand/Makefile        |   1 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c | 111 ++++++++++++++++++++++=
++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/bcm63138_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcm=
nand/Makefile
index e78c3b932fd1..45a091e0550f 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1,5 +1,6 @@
 # link order matters; don't link the more generic brcmstb_nand.o befor=
e the
 # more specific iproc_nand.o, for instance
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D iproc_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D bcm63138_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/bcm63138_nand.c b/drivers/mtd/na=
nd/brcmnand/bcm63138_nand.c
new file mode 100644
index 000000000000..3f4c44c24e14
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
@@ -0,0 +1,111 @@
+/*
+ * Copyright =C2=A9 2015 Broadcom Corporation
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
+ */
+
+#include <linux/device.h>
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
+struct bcm63138_nand_soc_priv {
+	void __iomem *base;
+};
+
+#define BCM63138_NAND_INT_STATUS		0x00
+#define BCM63138_NAND_INT_EN			0x04
+
+enum {
+	BCM63138_CTLRDY		=3D BIT(4),
+};
+
+static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv =3D soc->priv;
+	void __iomem *mmio =3D priv->base + BCM63138_NAND_INT_STATUS;
+	u32 val =3D brcmnand_readl(mmio);
+
+	if (val & BCM63138_CTLRDY) {
+		brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm63138_nand_soc_priv *priv =3D soc->priv;
+	void __iomem *mmio =3D priv->base + BCM63138_NAND_INT_EN;
+	u32 val =3D brcmnand_readl(mmio);
+
+	if (en)
+		val |=3D BCM63138_CTLRDY;
+	else
+		val &=3D ~BCM63138_CTLRDY;
+
+	brcmnand_writel(val, mmio);
+}
+
+static int bcm63138_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct bcm63138_nand_soc_priv *priv;
+	struct brcmnand_soc *soc;
+	struct resource *res;
+
+	soc =3D devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
+	if (!soc)
+		return -ENOMEM;
+
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-int-=
base");
+	priv->base =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	soc->pdev =3D pdev;
+	soc->priv =3D priv;
+	soc->ctlrdy_ack =3D bcm63138_nand_intc_ack;
+	soc->ctlrdy_set_enabled =3D bcm63138_nand_intc_set;
+
+	return brcmnand_probe(pdev, soc);
+}
+
+static const struct of_device_id bcm63138_nand_of_match[] =3D {
+	{ .compatible =3D "brcm,nand-bcm63138" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm63138_nand_of_match);
+
+static struct platform_driver bcm63138_nand_driver =3D {
+	.probe			=3D bcm63138_nand_probe,
+	.remove			=3D brcmnand_remove,
+	.driver =3D {
+		.name		=3D "bcm63138_nand",
+		.pm		=3D &brcmnand_pm_ops,
+		.of_match_table	=3D bcm63138_nand_of_match,
+	}
+};
+module_platform_driver(bcm63138_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Brian Norris");
+MODULE_DESCRIPTION("NAND driver for BCM63138");
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
