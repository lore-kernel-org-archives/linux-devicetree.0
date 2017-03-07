From: Alban <albeu@free.fr>
Subject: [PATCH v2 2/2] mtd: Add support for reading MTD devices via the nvmem
 API
Date: Tue,  7 Mar 2017 09:26:04 +0100
Message-ID: <1488875164-30440-3-git-send-email-albeu@free.fr>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488875164-30440-1-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Alban <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

Allow drivers that use the nvmem API to read data stored on MTD devices.
Add an option to the MTD core that allow registering the MTD as
read-only NVMEM providers.

Signed-off-by: Alban <albeu@free.fr>
---
Changelog:
v2: * Moved to the MTD core instead of using notifiers
    * Fixed the Kconfig description
---
 drivers/mtd/Kconfig     |  9 +++++++
 drivers/mtd/Makefile    |  1 +
 drivers/mtd/mtdcore.c   | 13 +++++++++
 drivers/mtd/mtdnvmem.c  | 72 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdnvmem.h  | 25 +++++++++++++++++
 include/linux/mtd/mtd.h |  4 +++
 6 files changed, 124 insertions(+)
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index e83a279..5a34c6a 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -322,6 +322,15 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_NVMEM
+	bool "Register MTD devices as NVMEM providers"
+	default y
+	depends on NVMEM || COMPILE_TEST
+	help
+	  Provides support for reading config data from MTD devices. This can
+	  be used by drivers to read device specific data such as MAC addresses
+	  or calibration results.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1..879a542 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -5,6 +5,7 @@
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
+mtd-$(CONFIG_MTD_NVMEM)		+= mtdnvmem.o
 
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66a9ded..bb88997 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -45,6 +45,7 @@
 #include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
+#include "mtdnvmem.h"
 
 static struct backing_dev_info *mtd_bdi;
 
@@ -554,6 +555,11 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (error)
 		goto fail_added;
 
+	/* Add the nvmem provider */
+	error = mtd_nvmem_add(mtd);
+	if (error)
+		goto fail_nvmem_add;
+
 	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
 		      "mtd%dro", i);
 
@@ -571,6 +577,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	__module_get(THIS_MODULE);
 	return 0;
 
+fail_nvmem_add:
+	device_unregister(&mtd->dev);
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
 	idr_remove(&mtd_idr, i);
@@ -611,6 +619,11 @@ int del_mtd_device(struct mtd_info *mtd)
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
+		/* Try to remove the NVMEM provider */
+		ret = mtd_nvmem_remove(mtd);
+		if (ret)
+			goto out_error;
+
 		device_unregister(&mtd->dev);
 
 		idr_remove(&mtd_idr, mtd->index);
diff --git a/drivers/mtd/mtdnvmem.c b/drivers/mtd/mtdnvmem.c
new file mode 100644
index 0000000..d6bc402
--- /dev/null
+++ b/drivers/mtd/mtdnvmem.c
@@ -0,0 +1,72 @@
+/*
+ * Copyright (C) 2017 Alban Bedel <albeu@free.fr>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+
+static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
+			      void *val, size_t bytes)
+{
+	struct mtd_info *mtd = priv;
+	size_t retlen;
+	int err;
+
+	err = mtd_read(mtd, offset, bytes, &retlen, val);
+	if (err && err != -EUCLEAN)
+		return err;
+
+	return retlen == bytes ? 0 : -EIO;
+}
+
+int mtd_nvmem_add(struct mtd_info *mtd)
+{
+	struct device_node *np = dev_of_node(&mtd->dev);
+	struct nvmem_config config = {};
+
+	/* OF devices must have the nvmem-provider property */
+	if (np && !of_property_read_bool(np, "nvmem-provider"))
+		return 0;
+
+	config.dev = &mtd->dev;
+	config.owner = THIS_MODULE;
+	config.reg_read = mtd_nvmem_reg_read;
+	config.size = mtd->size;
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.priv = mtd;
+
+	mtd->nvmem = nvmem_register(&config);
+	if (IS_ERR(mtd->nvmem)) {
+		dev_err(&mtd->dev, "Failed to register NVMEM device\n");
+		return PTR_ERR(mtd->nvmem);
+	}
+
+	return 0;
+}
+
+int mtd_nvmem_remove(struct mtd_info *mtd)
+{
+	int ret;
+
+	if (!mtd->nvmem)
+		return 0;
+
+	ret = nvmem_unregister(mtd->nvmem);
+	if (ret)
+		dev_err(&mtd->dev, "Failed to unregister NVMEM device\n");
+
+	return ret;
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alban Bedel <albeu@free.fr>");
+MODULE_DESCRIPTION("Driver to read config data from MTD devices");
diff --git a/drivers/mtd/mtdnvmem.h b/drivers/mtd/mtdnvmem.h
new file mode 100644
index 0000000..a49d8bd
--- /dev/null
+++ b/drivers/mtd/mtdnvmem.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2017 Alban Bedel <albeu@free.fr>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef MTD_NVMEM_H
+#define MTD_NVMEM_H 1
+
+struct mtd_info;
+
+#ifdef CONFIG_MTD_NVMEM
+int mtd_nvmem_add(struct mtd_info *mtd);
+int mtd_nvmem_remove(struct mtd_info *mtd);
+#else
+static inline int mtd_nvmem_add(struct mtd_info *mtd)
+{ return 0; }
+
+static inline int mtd_nvmem_remove(struct mtd_info *mtd)
+{ return 0; }
+#endif
+
+#endif /* MTD_NVMEM_H */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index eebdc63..e06c6e6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -205,6 +205,7 @@ struct mtd_pairing_scheme {
 };
 
 struct module;	/* only needed for owner field in mtd_info */
+struct nvmem_device;
 
 struct mtd_info {
 	u_char type;
@@ -351,6 +352,9 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	int usecount;
+#if IS_ENABLED(CONFIG_MTD_NVMEM)
+	struct nvmem_device *nvmem;
+#endif
 };
 
 int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
