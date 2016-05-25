From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC/PATCH 2/2] mtd: otp: Expose mtd flash otp regions as nvmem providers
Date: Wed, 25 May 2016 14:26:47 -0700
Message-ID: <1464211607-8843-3-git-send-email-moritz.fischer@ettus.com>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

This commit introduces support for exposing otp regions
in mtd flash devices as nvmem providers, allowing them to provide
information such as serial numbers, calibration data or
product ids.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 drivers/mtd/Kconfig    |   8 ++++
 drivers/mtd/Makefile   |   1 +
 drivers/mtd/mtdcore.c  |  35 ++++++++++++++
 drivers/mtd/mtdcore.h  |   1 +
 drivers/mtd/mtdnvmem.c | 127 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdnvmem.h |  25 ++++++++++
 drivers/mtd/mtdpart.c  | 112 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ofpart.c   | 102 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 411 insertions(+)
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index e83a279..4d99b64 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -309,6 +309,14 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
 
+config MTD_NVMEM
+	tristate "Expose OTP regions as NVMEM providers"
+	depends on MTD && NVMEM
+	help
+	  Allows exposing OTP regions in mtd devices via nvmem.
+	  This is useful for storing information like calibration data,
+	  serial numbers, or mac addresses.
+
 config MTD_PARTITIONED_MASTER
 	bool "Retain master device when partitioned"
 	default n
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1..f62f50b 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_SSFDC)		+= ssfdc.o
 obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
+obj-$(CONFIG_MTD_NVMEM)		+= mtdnvmem.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8965ffa..9f187bc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -46,6 +46,7 @@
 #include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
+#include "mtdnvmem.h"
 
 static struct backing_dev_info mtd_bdi = {
 };
@@ -566,6 +567,30 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
 	return 0;
 }
 
+#ifdef CONFIG_MTD_NVMEM
+static int mtd_add_device_otp_regions(struct mtd_info *mtd,
+				      struct mtd_partitions *parts)
+{
+	const struct mtd_partition *real_parts = parts->parts;
+	int nbparts = parts->nr_parts;
+	int ret;
+
+	if (nbparts > 0) {
+		ret = add_otp_regions(mtd, real_parts, nbparts);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#else
+static int mtd_add_device_otp_regions(struct mtd_info *mtd,
+				      struct mtd_partitions *parts)
+{
+	return 0;
+}
+#endif
+
 /*
  * Set a few defaults based on the parent devices, if not provided by the
  * driver
@@ -582,6 +607,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	}
 }
 
+static const char const *otp_types[] = {"ofotp", NULL};
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -642,6 +669,14 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	ret = parse_mtd_partitions(mtd, otp_types, &parsed, parser_data);
+	if (ret)
+		goto out;
+
+	ret = mtd_add_device_otp_regions(mtd, &parsed);
+	if (ret)
+		goto out;
+
 	/*
 	 * FIXME: some drivers unfortunately call this function more than once.
 	 * So we have to check if we've already assigned the reboot notifier.
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 55fdb8e..11ccb90 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -9,6 +9,7 @@ struct mtd_info *__mtd_next_device(int i);
 int add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
+int add_otp_regions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 
 struct mtd_partitions;
diff --git a/drivers/mtd/mtdnvmem.c b/drivers/mtd/mtdnvmem.c
new file mode 100644
index 0000000..e99a95e
--- /dev/null
+++ b/drivers/mtd/mtdnvmem.c
@@ -0,0 +1,127 @@
+/*
+ * Copyright (c) 2016, National Instruments Corp.
+ *
+ * Generic NVMEM support for OTP regions in MTD devices
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+
+struct mtd_nvmem {
+	struct mtd_info *info;
+	struct nvmem_device *dev;
+	struct regmap *regmap;
+};
+
+static int mtd_otp_regmap_read(void *context, const void *reg, size_t reg_size,
+			       void *val, size_t val_size)
+{
+	struct mtd_info *info = context;
+	const u8 *offset = reg;
+	int err;
+	size_t retlen;
+
+	if (reg_size != 1)
+		return -EINVAL;
+
+	err = mtd_read_user_prot_reg(info, *offset, val_size > info->size
+				     ? info->size : val_size, &retlen,
+				     (u_char *)val);
+
+	return 0;
+}
+
+static int mtd_otp_regmap_write(void *context, const void *data, size_t count)
+{
+	/* Not implemented */
+	return 0;
+}
+
+static const struct regmap_bus mtd_otp_bus = {
+	.read = mtd_otp_regmap_read,
+	.write = mtd_otp_regmap_write,
+	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
+	.val_format_endian_default = REGMAP_ENDIAN_NATIVE,
+};
+
+static bool mtd_otp_nvmem_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
+static struct regmap_config mtd_otp_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.writeable_reg = mtd_otp_nvmem_writeable_reg,
+	.name = "mtd-otp",
+};
+
+static struct nvmem_config mtd_otp_nvmem_config = {
+	.read_only = true,
+	.owner = THIS_MODULE,
+};
+
+struct mtd_nvmem *mtd_otp_nvmem_register(struct mtd_info *info)
+{
+	struct mtd_nvmem *nvmem;
+	struct device *dev = &info->dev;
+
+	nvmem = kzalloc(sizeof(*nvmem), GFP_KERNEL);
+	if (!nvmem)
+		return ERR_PTR(-ENOMEM);
+
+	mtd_otp_regmap_config.max_register = info->size;
+
+	nvmem->regmap = regmap_init(dev, &mtd_otp_bus, info,
+				  &mtd_otp_regmap_config);
+	if (IS_ERR(nvmem->regmap)) {
+		dev_err(dev, "regmap init failed");
+		goto out_free;
+	}
+
+	mtd_otp_nvmem_config.dev = dev;
+	mtd_otp_nvmem_config.name = info->name;
+
+	nvmem->dev = nvmem_register(&mtd_otp_nvmem_config);
+
+	if (!nvmem->dev) {
+		dev_err(dev, "failed to register nvmem");
+		goto out_regmap;
+	}
+
+	return nvmem;
+
+out_regmap:
+	regmap_exit(nvmem->regmap);
+
+out_free:
+	kfree(nvmem);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(mtd_otp_nvmem_register);
+
+void mtd_otp_nvmem_remove(struct mtd_nvmem *nvmem)
+{
+	nvmem_unregister(nvmem->dev);
+	regmap_exit(nvmem->regmap);
+	kfree(nvmem);
+}
+EXPORT_SYMBOL_GPL(mtd_otp_nvmem_remove);
diff --git a/drivers/mtd/mtdnvmem.h b/drivers/mtd/mtdnvmem.h
new file mode 100644
index 0000000..1003c5f
--- /dev/null
+++ b/drivers/mtd/mtdnvmem.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2016, National Instruments Corp.
+ *
+ * Generic NVMEM support for OTP regions in MTD devices
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef MTDNVMEM_H
+#define MTDNVMEM_H
+
+struct mtd_nvmem;
+
+struct mtd_nvmem *mtd_otp_nvmem_register(struct mtd_info *info);
+
+void mtd_otp_nvmem_remove(struct mtd_nvmem *mem);
+
+#endif /* MTDNVMEM_H */
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6ef118d..7acf82bf 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -33,6 +33,7 @@
 #include <linux/kconfig.h>
 
 #include "mtdcore.h"
+#include "mtdnvmem.h"
 
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
@@ -44,6 +45,7 @@ struct mtd_part {
 	struct mtd_info *master;
 	uint64_t offset;
 	struct list_head list;
+	struct mtd_nvmem *nv;
 };
 
 /*
@@ -319,6 +321,10 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 static inline void free_partition(struct mtd_part *p)
 {
+#ifdef CONFIG_MTD_NVMEM
+	if (p->nv)
+		mtd_otp_nvmem_remove(p->nv);
+#endif
 	kfree(p->mtd.name);
 	kfree(p);
 }
@@ -349,6 +355,72 @@ int del_mtd_partitions(struct mtd_info *master)
 	return err;
 }
 
+#ifdef CONFIG_MTD_NVMEM
+static struct mtd_part *allocate_otp_region(struct mtd_info *master,
+					    const struct mtd_partition *part,
+					    int partno, uint64_t cur_offset)
+{
+	struct mtd_part *slave;
+	char *name;
+
+	/* allocate the partition structure */
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	name = kstrdup(part->name, GFP_KERNEL);
+	if (!name || !slave) {
+		pr_err("memory allocation error while creating partitions for \"%s\"\n",
+		       master->name);
+		kfree(name);
+		kfree(slave);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* set up the MTD object for this partition */
+	slave->mtd.type = master->type;
+	slave->mtd.flags = master->flags & ~part->mask_flags;
+	slave->mtd.size = part->size;
+	slave->mtd.writesize = 1;
+	slave->mtd.writebufsize = 1;
+	slave->mtd.erasesize = 1;
+	slave->mtd.oobsize = 0;
+	slave->mtd.oobavail = 0;
+	slave->mtd.subpage_sft = master->subpage_sft;
+
+	slave->mtd.name = name;
+	slave->mtd.owner = master->owner;
+	slave->mtd.dev.of_node = part->node;
+
+	if (master->_read_user_prot_reg)
+		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
+	if (master->_read_fact_prot_reg)
+		slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
+	if (master->_write_user_prot_reg)
+		slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
+	if (master->_lock_user_prot_reg)
+		slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
+	if (master->_get_user_prot_info)
+		slave->mtd._get_user_prot_info = part_get_user_prot_info;
+	if (master->_get_fact_prot_info)
+		slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
+
+	if (!partno && !master->dev.class && master->_suspend &&
+	    master->_resume) {
+		slave->mtd._suspend = part_suspend;
+		slave->mtd._resume = part_resume;
+	}
+
+	slave->master = master;
+	slave->offset = part->offset;
+	slave->mtd.size = part->size;
+
+	pr_notice("0x%012llx-0x%012llx : \"%s\"\n",
+		  (unsigned long long)slave->offset,
+		  (unsigned long long)(slave->offset + slave->mtd.size),
+		  slave->mtd.name);
+
+	return slave;
+}
+#endif
+
 static struct mtd_part *allocate_partition(struct mtd_info *master,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
@@ -682,6 +754,46 @@ int add_mtd_partitions(struct mtd_info *master,
 	return 0;
 }
 
+#ifdef CONFIG_MTD_NVMEM
+int add_otp_regions(struct mtd_info *master,
+		    const struct mtd_partition *parts, int nbparts)
+{
+	struct mtd_part *slave;
+	u64 cur_offset = 0;
+	int i;
+
+	pr_notice("Creating %d MTD OTP region(s) on \"%s\":\n", nbparts,
+		  master->name);
+
+	for (i = 0; i < nbparts; i++) {
+		slave = allocate_otp_region(master, parts + i, i, cur_offset);
+		if (IS_ERR(slave)) {
+			del_mtd_partitions(master);
+			return PTR_ERR(slave);
+		}
+
+		mutex_lock(&mtd_partitions_mutex);
+		list_add(&slave->list, &mtd_partitions);
+		mutex_unlock(&mtd_partitions_mutex);
+
+		add_mtd_device(&slave->mtd);
+		mtd_add_partition_attrs(slave);
+
+		slave->nv = mtd_otp_nvmem_register(&slave->mtd);
+
+		cur_offset = slave->offset + slave->mtd.size;
+	}
+
+	return 0;
+}
+#else
+int add_otp_regions(struct mtd_info *master,
+		    const struct mtd_partition *parts, int nbparts)
+{
+	return 0;
+}
+#endif
+
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
 
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 9a68bff..3a0d14d 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -145,6 +145,106 @@ static struct mtd_part_parser ofpart_parser = {
 	.name = "ofpart",
 };
 
+static int parse_ofotp_partitions(struct mtd_info *master,
+				  const struct mtd_partition **pparts,
+				  struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	struct device_node *mtd_node;
+	struct device_node *ofpart_node;
+	const char *partname;
+	struct device_node *pp;
+	int nr_parts, i, ret = 0;
+
+	/* Pull of_node from the master device node */
+	mtd_node = mtd_get_of_node(master);
+	if (!mtd_node)
+		return 0;
+
+	ofpart_node = of_get_child_by_name(mtd_node, "otp-partitions");
+	if (!ofpart_node) {
+		/*
+		 * We might get here even when ofpart isn't used at all (e.g.,
+		 * when using another parser), so don't be louder than
+		 * KERN_DEBUG
+		 */
+		pr_debug("%s: 'otp-partitions' subnode not found on %s\n",
+			 master->name, mtd_node->full_name);
+		return 0;
+	} else if (!of_device_is_compatible(ofpart_node, "fixed-partitions")) {
+		/* The 'partitions' subnode might be used by another parser */
+		return 0;
+	}
+
+	/* First count the subnodes */
+	nr_parts = 0;
+	for_each_child_of_node(ofpart_node,  pp)
+		nr_parts++;
+
+	if (nr_parts == 0)
+		return 0;
+
+	parts = kcalloc(nr_parts, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node(ofpart_node,  pp) {
+		const __be32 *reg;
+		int len;
+		int a_cells, s_cells;
+
+		reg = of_get_property(pp, "reg", &len);
+		if (!reg) {
+			nr_parts--;
+			continue;
+		}
+
+		a_cells = of_n_addr_cells(pp);
+		s_cells = of_n_size_cells(pp);
+		if (len / 4 != a_cells + s_cells) {
+			pr_debug("%s: ofpart partition %s (%s) error parsing reg property.\n",
+				 master->name, pp->full_name,
+				 mtd_node->full_name);
+			goto ofpart_fail;
+		}
+
+		parts[i].offset = of_read_number(reg, a_cells);
+		parts[i].size = of_read_number(reg + a_cells, s_cells);
+		parts[i].node = pp;
+
+		partname = of_get_property(pp, "label", &len);
+		if (!partname)
+			partname = of_get_property(pp, "name", &len);
+		parts[i].name = partname;
+
+		if (of_get_property(pp, "read-only", &len))
+			parts[i].mask_flags |= MTD_WRITEABLE;
+
+		i++;
+	}
+
+	if (!nr_parts)
+		goto ofpart_none;
+
+	*pparts = parts;
+	return nr_parts;
+
+ofpart_fail:
+	pr_err("%s: error parsing ofotp partition %s (%s)\n",
+	       master->name, pp->full_name, mtd_node->full_name);
+	ret = -EINVAL;
+ofpart_none:
+	of_node_put(pp);
+	kfree(parts);
+	return ret;
+}
+
+static struct mtd_part_parser ofotp_parser = {
+	.parse_fn = parse_ofotp_partitions,
+	.name = "ofotp",
+};
+
 static int parse_ofoldpart_partitions(struct mtd_info *master,
 				      const struct mtd_partition **pparts,
 				      struct mtd_part_parser_data *data)
@@ -210,6 +310,7 @@ static int __init ofpart_parser_init(void)
 {
 	register_mtd_parser(&ofpart_parser);
 	register_mtd_parser(&ofoldpart_parser);
+	register_mtd_parser(&ofotp_parser);
 	return 0;
 }
 
@@ -217,6 +318,7 @@ static void __exit ofpart_parser_exit(void)
 {
 	deregister_mtd_parser(&ofpart_parser);
 	deregister_mtd_parser(&ofoldpart_parser);
+	deregister_mtd_parser(&ofotp_parser);
 }
 
 module_init(ofpart_parser_init);
-- 
2.5.5
