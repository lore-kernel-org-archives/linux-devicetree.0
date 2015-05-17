From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 5/7] mtd: brcmnand: add bcma driver
Date: Sun, 17 May 2015 17:41:04 +0200
Message-ID: <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver registers at the bcma bus and drives the NAND core if it
was found on this bus. The bcma bus with this NAND core is used on the
bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory ranges
are automatically detected by bcma and the irq numbers read from device
tree by bcma bus driver.

This is based on the iproc driver.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/mtd/nand/Kconfig              |   8 ++
 drivers/mtd/nand/brcmnand/Makefile    |   1 +
 drivers/mtd/nand/brcmnand/bcma_nand.c | 153 ++++++++++++++++++++++++++=
++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/bcma_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 376b538..b698212 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -402,6 +402,14 @@ config MTD_NAND_BRCMNAND
 	  originally designed for Set-Top Box but is used on various BCM7xxx,
 	  BCM3xxx, BCM63xxx, iProc/Cygnus and more.
=20
+config MTD_NAND_BRCMNAND_BCMA
+	tristate "Broadcom BCMA NAND controller"
+	depends on ARM || MIPS
+	select MTD_NAND_BRCMNAND
+	help
+	  Enables the driver which registers Broadcom NAND controller against
+	  bcma.
+
 config MTD_NAND_BCM47XXNFLASH
 	tristate "Support for NAND flash on BCM4706 BCMA bus"
 	depends on BCMA_NFLASH
diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcm=
nand/Makefile
index 3b1fbfd..8483984 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1,6 +1,7 @@
 # link order matters; don't link the more generic brcmstb_nand.o befor=
e the
 # more specific iproc_nand.o, for instance
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D iproc_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND_BCMA)	+=3D bcma_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D bcm63138_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/bcma_nand.c b/drivers/mtd/nand/b=
rcmnand/bcma_nand.c
new file mode 100644
index 0000000..58380bd
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcma_nand.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright =C2=A9 2015 Broadcom Corporation
+ * Copyright 2015 Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
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
+#include <linux/bcma/bcma.h>
+#include <linux/slab.h>
+
+#include "brcmnand.h"
+
+struct bcma_nand_soc_priv {
+	struct brcmnand_soc soc;
+	struct bcma_device *core;
+	spinlock_t idm_lock;
+};
+
+#define BCMA_NAND_CTLR_READY_OFFSET       0x0f10
+#define BCMA_NAND_CTLR_READY              BIT(0)
+
+#define BCMA_NAND_APB_LE_MODE             BIT(24)
+#define BCMA_NAND_INT_CTRL_READ_ENABLE    BIT(6)
+
+static bool bcma_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcma_nand_soc_priv *priv =3D soc->priv;
+	struct bcma_device *core =3D priv->core;
+
+	u32 val =3D bcma_read32(core, BCMA_NAND_CTLR_READY_OFFSET);
+
+	if (val & BCMA_NAND_CTLR_READY) {
+		bcma_write32(core, BCMA_NAND_CTLR_READY_OFFSET,
+			     BCMA_NAND_CTLR_READY);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcma_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcma_nand_soc_priv *priv =3D soc->priv;
+	struct bcma_device *core =3D priv->core;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val =3D bcma_aread32(core, BCMA_IOCTL);
+
+	if (en)
+		val |=3D BCMA_NAND_INT_CTRL_READ_ENABLE;
+	else
+		val &=3D ~BCMA_NAND_INT_CTRL_READ_ENABLE;
+
+	bcma_awrite32(core, BCMA_IOCTL, val);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static void bcma_nand_apb_access(struct brcmnand_soc *soc, bool prepar=
e)
+{
+	struct bcma_nand_soc_priv *priv =3D soc->priv;
+	struct bcma_device *core =3D priv->core;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val =3D bcma_aread32(core, BCMA_IOCTL);
+
+	if (prepare)
+		val |=3D BCMA_NAND_APB_LE_MODE;
+	else
+		val &=3D ~BCMA_NAND_APB_LE_MODE;
+
+	bcma_awrite32(core, BCMA_IOCTL, val);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static int bcma_nand_probe(struct bcma_device *core)
+{
+	struct device *dev =3D &core->dev;
+	struct bcma_nand_soc_priv *priv;
+	struct brcmnand_soc *soc;
+
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->core =3D core;
+
+	soc =3D &priv->soc;
+	soc->nand_base =3D core->io_addr;
+	soc->irq =3D bcma_core_irq(core, 4);
+
+	soc->dev =3D dev;
+	soc->priv =3D priv;
+	soc->ctlrdy_ack =3D bcma_nand_intc_ack;
+	soc->ctlrdy_set_enabled =3D bcma_nand_intc_set;
+	soc->prepare_data_bus =3D bcma_nand_apb_access;
+
+	bcma_core_enable(core, 0);
+	return brcmnand_probe_dev(dev, soc);
+}
+
+static void bcma_nand_remove(struct bcma_device *core)
+{
+	brcmnand_remove_dev(&core->dev);
+}
+
+static const struct bcma_device_id bcma_nand_tbl[] =3D {
+	BCMA_CORE(BCMA_MANUF_BCM, BCMA_CORE_NS_NAND, BCMA_ANY_REV, BCMA_ANY_C=
LASS),
+	{},
+};
+MODULE_DEVICE_TABLE(bcma, bcma_nand_tbl);
+
+static struct bcma_driver bcma_nand_driver =3D {
+	.name		=3D KBUILD_MODNAME,
+	.id_table	=3D bcma_nand_tbl,
+	.probe		=3D bcma_nand_probe,
+	.remove		=3D bcma_nand_remove,
+};
+
+static int __init bcma_nand_init(void)
+{
+	return bcma_driver_register(&bcma_nand_driver);
+}
+
+static void __exit bcma_nand_exit(void)
+{
+	bcma_driver_unregister(&bcma_nand_driver);
+}
+
+module_init(bcma_nand_init)
+module_exit(bcma_nand_exit)
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Hauke Mehrtens");
+MODULE_DESCRIPTION("NAND driver for Broadcom bcma based SoCs");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
