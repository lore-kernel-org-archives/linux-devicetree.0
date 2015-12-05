From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 7/7] mtd: partitions: add Google's FMAP partition parser
Date: Fri,  4 Dec 2015 21:19:23 -0800
Message-ID: <1449292763-129421-8-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Arlott <simon@fire.lp0.eu>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonas Gorski <jogo@openwrt.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>, David Hendricks <dhendrix@chromium.org>
List-Id: devicetree@vger.kernel.org

Cc: David Hendricks <dhendrix@chromium.org>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/partitions/Kconfig       |   7 ++
 drivers/mtd/partitions/Makefile      |   1 +
 drivers/mtd/partitions/google_fmap.c | 226 +++++++++++++++++++++++++++=
++++++++
 3 files changed, 234 insertions(+)
 create mode 100644 drivers/mtd/partitions/google_fmap.c

diff --git a/drivers/mtd/partitions/Kconfig b/drivers/mtd/partitions/Kc=
onfig
index 0827d7a8be4e..98783f1d3a36 100644
--- a/drivers/mtd/partitions/Kconfig
+++ b/drivers/mtd/partitions/Kconfig
@@ -129,3 +129,10 @@ config MTD_BCM47XX_PARTS
 	help
 	  This provides partitions parser for devices based on BCM47xx
 	  boards.
+
+config MTD_GOOGLE_FMAP_PARTS
+	tristate "Google's Flash Map (FMAP) partition support"
+	help
+	  This provides partition parsing for Google's flash map layout, used
+	  primarily on the boot flash of Chrome OS hardware (e.g., Chromebook=
s
+	  and Chromeboxes).
diff --git a/drivers/mtd/partitions/Makefile b/drivers/mtd/partitions/M=
akefile
index 89822f2bfa59..ab398c7f4d01 100644
--- a/drivers/mtd/partitions/Makefile
+++ b/drivers/mtd/partitions/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+=3D afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+=3D ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+=3D bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+=3D bcm47xxpart.o
+obj-$(CONFIG_MTD_GOOGLE_FMAP_PARTS) +=3D google_fmap.o
diff --git a/drivers/mtd/partitions/google_fmap.c b/drivers/mtd/partiti=
ons/google_fmap.c
new file mode 100644
index 000000000000..abd10eb65c84
--- /dev/null
+++ b/drivers/mtd/partitions/google_fmap.c
@@ -0,0 +1,226 @@
+/*
+ * Parse Google FMAP partitions
+ *
+ * Author: Brian Norris <briannorris@chromium.org>
+ *
+ * Copyright =C2=A9 2015 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * See:
+ *   https://github.com/dhendrix/flashmap/blob/wiki/FmapSpec.md
+ *
+ * Notes:
+ *   - scans only at block boundaries; this is not guaranteed for FMAP=
 (the
+ *     Chrome OS tools do a kind of stride search, of decreasing size)=
, but
+ *     seems like a decent start
+ *   - at worst, scans (beginning of) every block on an unformatted fl=
ash
+ *   - only validates the "__FMAP__" signature, just like the Chrome O=
S tools;
+ *     however, this seems (theoretically) easy to produce false match=
es
+ *   - major/minor version numbers are currently unused
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/compiler.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
+static const char fmap_signature[] =3D "__FMAP__";
+
+struct fmap_layout {
+	uint8_t signature[8];		/* "__FMAP__" (0x5F5F50414D465F5F) */
+	uint8_t ver_major;		/* major version number of this structure */
+	uint8_t ver_minor;		/* minor version of this structure */
+	__le64 base;			/* physical memory-mapped address of the flash chip */
+	__le32 size;			/* size of the flash chip in bytes */
+	uint8_t name[32];		/* descriptive name of this flash device, 0 termin=
ated */
+	__le16 nareas;			/* number of areas described by areas[] below */
+	struct fmap_area {
+		__le32 offset;		/* offset of this area in the flash device */
+		__le32 size;		/* size of this area in bytes */
+		uint8_t name[32];	/* descriptive name of this area, 0 terminated */
+		__le16 flags;		/* flags for this area */
+	} __packed areas[0];
+} __packed;
+
+/* mtd_read() helper */
+static int fmap_mtd_read(struct mtd_info *mtd, loff_t offset, size_t l=
en,
+			 void *buf)
+{
+	size_t retlen;
+	int ret;
+
+	ret =3D mtd_read(mtd, offset, len, &retlen, buf);
+	if (ret)
+		return ret;
+	if (retlen !=3D len)
+		return -EIO;
+	return 0;
+}
+
+/* Return 0 on no match, non-zero on match */
+static inline int fmap_check_signature(struct fmap_layout *fmap)
+{
+	return !strncmp(fmap->signature, fmap_signature,
+			sizeof(fmap->signature));
+}
+
+static int fmap_parse_block(struct mtd_info *master,
+			    const struct mtd_partition **pparts,
+			    struct fmap_layout *fmap, size_t maxlen)
+{
+	struct mtd_partition *parts;
+	char *names;
+	int nparts;
+	int ret, i, namelen =3D 0;
+
+	if (!fmap_check_signature(fmap))
+		return 0;
+
+	nparts =3D le16_to_cpu(fmap->nareas);
+
+	if (!nparts) {
+		pr_err("found FMAP, but no FMAP areas; skipping\n");
+		return -EINVAL;
+	}
+
+	/* pre-process names */
+	for (i =3D 0; i < nparts; i++) {
+		struct fmap_area *area =3D &fmap->areas[i];
+
+		/* Terminate */
+		area->name[sizeof(area->name) - 1] =3D '\0';
+
+		namelen +=3D strlen(area->name);
+	}
+
+	/* partitions + name strings + string terminators */
+	parts =3D kzalloc(sizeof(*parts) * nparts + namelen + nparts, GFP_KER=
NEL);
+	if (!parts) {
+		ret =3D -ENOMEM;
+		goto err;
+	}
+	names =3D (char *)(parts + nparts);
+
+	for (i =3D 0; i < nparts; i++) {
+		struct mtd_partition *part =3D &parts[i];
+		struct fmap_area *area =3D &fmap->areas[i];
+
+		strcpy(names, area->name);
+		part->name =3D names;
+		names +=3D strlen(names) + 1;
+
+		part->offset =3D le32_to_cpu(area->offset);
+		part->size =3D le32_to_cpu(area->size);
+	}
+
+	*pparts =3D parts;
+	return nparts;
+
+err:
+	kfree(parts);
+	return ret;
+}
+
+static int fmap_peek_header(struct mtd_info *master, loff_t offs, void=
 *buf)
+{
+	struct fmap_layout *fmap;
+	int ret;
+
+	fmap =3D buf;
+
+	ret =3D fmap_mtd_read(master, offs, sizeof(*fmap), fmap);
+	if (ret)
+		return ret;
+
+	return fmap_check_signature(fmap);
+}
+
+static int fmap_parse_partitions(struct mtd_info *master,
+				 const struct mtd_partition **pparts,
+				 struct mtd_part_parser_data *data)
+{
+	void *buf;
+	struct fmap_layout *fmap;
+	int ret =3D 0;
+	size_t len;
+	loff_t offset =3D 0;
+
+	buf =3D vmalloc(master->erasesize);
+	if (!buf)
+		return -ENOMEM;
+
+	for (offset =3D 0; offset < master->size; offset +=3D master->erasesi=
ze) {
+		if (mtd_block_isbad(master, offset))
+			continue;
+
+		ret =3D fmap_peek_header(master, offset, buf);
+		if (ret < 0)
+			break;
+		if (!ret)
+			/* No match; don't read the rest */
+			continue;
+
+		len =3D master->erasesize;
+		ret =3D fmap_mtd_read(master, offset, len, buf);
+		if (ret)
+			break;
+
+		fmap =3D buf;
+
+		ret =3D fmap_parse_block(master, pparts, fmap, len);
+		if (ret < 0)
+			break;
+		if (ret) /* success */
+			break;
+	}
+
+	vfree(buf);
+
+	if (ret < 0) {
+		pr_err("error %d while searching for fmap\n", ret);
+		return ret;
+	} else if (ret) {
+		pr_info("found fmap @ offset %#llx\n", (u64)offset);
+		return ret;
+	} else {
+		pr_debug("no fmap found\n");
+		return 0;
+	}
+}
+
+static const struct of_device_id fmap_match[] =3D {
+	{ .compatible =3D "google,fmap" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fmap_match);
+
+static struct mtd_part_parser fmap_parser =3D {
+	.parse_fn =3D fmap_parse_partitions,
+	.name =3D "fmap",
+	.of_match_table =3D fmap_match,
+};
+module_mtd_part_parser(fmap_parser);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Brian Norris");
+MODULE_DESCRIPTION("Parsing code for Chrome OS FMAP tables");
+/* MTD parsers request the module by parser name */
+MODULE_ALIAS("fmap");
--=20
2.6.0.rc2.230.g3dd15c0
