From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 3/3] soc: fsl: add DPAA2 console support
Date: Fri, 21 Dec 2018 15:31:13 +0000
Message-ID: <1545406240-3061-4-git-send-email-ioana.ciornei@nxp.com>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch adds DPAA2 MC and AIOP console log support.

The platform driver probes on the "dpaa2-console" device tree node
which describes the base firmware address needed in order to infer the
start address of both firmware logs: MC and AIOP.
It then exports two misc char devices which can be used to dump
the needed logs.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/Kconfig         |  10 ++
 drivers/soc/fsl/Makefile        |   1 +
 drivers/soc/fsl/dpaa2-console.c | 306 ++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 317 insertions(+)
 create mode 100644 drivers/soc/fsl/dpaa2-console.c

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index 8f80e8b..94229a0 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -28,4 +28,14 @@ config FSL_MC_DPIO
 	  other DPAA2 objects. This driver does not expose the DPIO
 	  objects individually, but groups them under a service layer
 	  API.
+
+config DPAA2_CONSOLE
+	tristate "QorIQ DPAA2 console driver"
+	depends on OF && (ARCH_LAYERSCAPE || (COMPILE_TEST && (ARM || ARM64 || X8=
6_LOCAL_APIC || PPC)))
+	default y
+	help
+	  Console driver for DPAA2 platforms. Exports 2 char devices,
+	  /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
+	  which can be used to dump the Management Complex and AIOP
+	  firmware logs.
 endmenu
diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile
index 803ef1b..57762c9 100644
--- a/drivers/soc/fsl/Makefile
+++ b/drivers/soc/fsl/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_QUICC_ENGINE)		+=3D qe/
 obj-$(CONFIG_CPM)			+=3D qe/
 obj-$(CONFIG_FSL_GUTS)			+=3D guts.o
 obj-$(CONFIG_FSL_MC_DPIO) 		+=3D dpio/
+obj-$(CONFIG_DPAA2_CONSOLE)		+=3D dpaa2-console.o
diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-consol=
e.c
new file mode 100644
index 0000000..b088834
--- /dev/null
+++ b/drivers/soc/fsl/dpaa2-console.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/* Copyright 2015-2016 Freescale Semiconductor Inc.
+ * Copyright 2018 NXP
+ */
+
+#define pr_fmt(fmt) "dpaa2-console: " fmt
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_AUTHOR("Roy Pledge <roy.pledge@nxp.com>");
+MODULE_DESCRIPTION("DPAA2 console driver");
+
+/* MC firmware base low/high registers indexes */
+#define MCFBALR_OFFSET 0
+#define MCFBAHR_OFFSET 1
+
+/* Bit masks used to get the most/least significant part of the MC base ad=
dr */
+#define MC_FW_ADDR_MASK_HIGH 0x1FFFF
+#define MC_FW_ADDR_MASK_LOW  0xE0000000
+
+#define MC_BUFFER_OFFSET 0x01000000
+#define MC_BUFFER_SIZE   (1024 * 1024 * 16)
+#define MC_OFFSET_DELTA  MC_BUFFER_OFFSET
+
+#define AIOP_BUFFER_OFFSET 0x06000000
+#define AIOP_BUFFER_SIZE   (1024 * 1024 * 16)
+#define AIOP_OFFSET_DELTA  0
+
+#define LOG_HEADER_FLAG_BUFFER_WRAPAROUND 0x80000000
+#define LAST_BYTE(a) ((a) & ~(LOG_HEADER_FLAG_BUFFER_WRAPAROUND))
+
+/* MC and AIOP Magic words */
+#define MAGIC_MC   0x4d430100
+#define MAGIC_AIOP 0x41494F50
+
+struct log_header {
+	__le32 magic_word;
+	char reserved[4];
+	__le32 buf_start;
+	__le32 buf_length;
+	__le32 last_byte;
+};
+
+struct console_data {
+	char *map_addr;
+	struct log_header *hdr;
+	char *start_addr;
+	char *end_addr;
+	char *end_of_data;
+	char *cur_ptr;
+};
+
+struct resource mc_base_addr;
+
+static inline void adjust_end(struct console_data *cd)
+{
+	u32 last_byte =3D readl(&cd->hdr->last_byte);
+
+	cd->end_of_data =3D cd->start_addr + LAST_BYTE(last_byte);
+}
+
+static u64 get_mc_fw_base_address(void)
+{
+	u64 mcfwbase =3D 0ULL;
+	u32 *mcfbaregs;
+
+	mcfbaregs =3D (u32 *)ioremap(mc_base_addr.start,
+				   resource_size(&mc_base_addr));
+	if (!mcfbaregs) {
+		pr_err("could not map MC Firmaware Base registers\n");
+		return -EIO;
+	}
+
+	mcfwbase  =3D readl(mcfbaregs + MCFBAHR_OFFSET) & MC_FW_ADDR_MASK_HIGH;
+	mcfwbase <<=3D 32;
+	mcfwbase |=3D readl(mcfbaregs + MCFBALR_OFFSET) & MC_FW_ADDR_MASK_LOW;
+	iounmap(mcfbaregs);
+
+	pr_debug("MC base address at 0x%016llx\n", mcfwbase);
+	return mcfwbase;
+}
+
+static ssize_t dpaa2_console_size(struct console_data *cd)
+{
+	ssize_t size;
+
+	if (cd->cur_ptr <=3D cd->end_of_data)
+		size =3D cd->end_of_data - cd->cur_ptr;
+	else
+		size =3D (cd->end_addr - cd->cur_ptr) +
+			(cd->end_of_data - cd->start_addr);
+
+	return size;
+}
+
+static int dpaa2_generic_console_open(struct inode *node, struct file *fp,
+				      u64 offset, u64 size,
+				      u32 expected_magic,
+				      u32 offset_delta)
+{
+	u32 read_magic, wrapped, last_byte, buf_start, buf_length;
+	struct console_data *cd;
+	u64 base_addr;
+	int err;
+
+	cd =3D kmalloc(sizeof(*cd), GFP_KERNEL);
+	if (!cd)
+		return -ENOMEM;
+
+	base_addr =3D get_mc_fw_base_address();
+	if (base_addr < 0)
+		return -EIO;
+
+	cd->map_addr =3D ioremap(base_addr + offset, size);
+	if (!cd->map_addr) {
+		pr_err("cannot map console log memory\n");
+		err =3D -EIO;
+		goto err_ioremap;
+	}
+
+	cd->hdr =3D (struct log_header *)cd->map_addr;
+	read_magic =3D readl(&cd->hdr->magic_word);
+	last_byte =3D readl(&cd->hdr->last_byte);
+	buf_start =3D readl(&cd->hdr->buf_start);
+	buf_length =3D readl(&cd->hdr->buf_length);
+
+	if (read_magic !=3D expected_magic) {
+		pr_warn("expected =3D %08x, read =3D %08x\n",
+			expected_magic, read_magic);
+		err =3D -EIO;
+		goto err_magic;
+	}
+
+	cd->start_addr =3D cd->map_addr + buf_start - offset_delta;
+	cd->end_addr =3D cd->start_addr + buf_length;
+
+	wrapped =3D last_byte & LOG_HEADER_FLAG_BUFFER_WRAPAROUND;
+
+	adjust_end(cd);
+	if (wrapped && cd->end_of_data !=3D cd->end_addr)
+		cd->cur_ptr =3D cd->end_of_data + 1;
+	else
+		cd->cur_ptr =3D cd->start_addr;
+
+	fp->private_data =3D cd;
+
+	return 0;
+
+err_magic:
+	iounmap(cd->map_addr);
+
+err_ioremap:
+	kfree(cd);
+
+	return err;
+}
+
+static int dpaa2_mc_console_open(struct inode *node, struct file *fp)
+{
+	return dpaa2_generic_console_open(node, fp,
+					  MC_BUFFER_OFFSET, MC_BUFFER_SIZE,
+					  MAGIC_MC, MC_OFFSET_DELTA);
+}
+
+static int dpaa2_aiop_console_open(struct inode *node, struct file *fp)
+{
+	return dpaa2_generic_console_open(node, fp,
+					  AIOP_BUFFER_OFFSET, AIOP_BUFFER_SIZE,
+					  MAGIC_AIOP, AIOP_OFFSET_DELTA);
+}
+
+static int dpaa2_console_close(struct inode *node, struct file *fp)
+{
+	struct console_data *cd =3D fp->private_data;
+
+	iounmap(cd->map_addr);
+	kfree(cd);
+	return 0;
+}
+
+static ssize_t dpaa2_console_read(struct file *fp, char __user *buf,
+				  size_t count, loff_t *f_pos)
+{
+	struct console_data *cd =3D fp->private_data;
+	size_t bytes =3D dpaa2_console_size(cd);
+	size_t bytes_end =3D cd->end_addr - cd->cur_ptr;
+	size_t written =3D 0;
+
+	/* Check if we need to adjust the end of data addr */
+	adjust_end(cd);
+
+	if (cd->end_of_data =3D=3D cd->cur_ptr)
+		return 0;
+
+	if (count < bytes)
+		bytes =3D count;
+
+	if (bytes > bytes_end) {
+		if (copy_to_user(buf, cd->cur_ptr, bytes_end))
+			return -EFAULT;
+		buf +=3D bytes_end;
+		cd->cur_ptr =3D cd->start_addr;
+		bytes -=3D bytes_end;
+		written +=3D bytes_end;
+	}
+
+	if (copy_to_user(buf, cd->cur_ptr, bytes))
+		return -EFAULT;
+	cd->cur_ptr +=3D bytes;
+	written +=3D bytes;
+
+	return written;
+}
+
+static const struct file_operations dpaa2_mc_console_fops =3D {
+	.owner          =3D THIS_MODULE,
+	.open           =3D dpaa2_mc_console_open,
+	.release        =3D dpaa2_console_close,
+	.read           =3D dpaa2_console_read,
+};
+
+static struct miscdevice dpaa2_mc_console_dev =3D {
+	.minor =3D MISC_DYNAMIC_MINOR,
+	.name =3D "dpaa2_mc_console",
+	.fops =3D &dpaa2_mc_console_fops
+};
+
+static const struct file_operations dpaa2_aiop_console_fops =3D {
+	.owner          =3D THIS_MODULE,
+	.open           =3D dpaa2_aiop_console_open,
+	.release        =3D dpaa2_console_close,
+	.read           =3D dpaa2_console_read,
+};
+
+static struct miscdevice dpaa2_aiop_console_dev =3D {
+	.minor =3D MISC_DYNAMIC_MINOR,
+	.name =3D "dpaa2_aiop_console",
+	.fops =3D &dpaa2_aiop_console_fops
+};
+
+static int dpaa2_console_probe(struct platform_device *pdev)
+{
+	int error;
+
+	error =3D of_address_to_resource(pdev->dev.of_node, 0, &mc_base_addr);
+	if (error < 0) {
+		pr_err("of_address_to_resource() failed for %pOF with %d\n",
+		       pdev->dev.of_node, error);
+		return error;
+	}
+
+	error =3D misc_register(&dpaa2_mc_console_dev);
+	if (error) {
+		pr_err("dpaa2-console: cannot register device %s\n",
+		       dpaa2_mc_console_dev.name);
+		goto err_register_mc;
+	}
+
+	error =3D misc_register(&dpaa2_aiop_console_dev);
+	if (error) {
+		pr_err("dpaa2-console: cannot register device %s\n",
+		       dpaa2_aiop_console_dev.name);
+		goto err_register_aiop;
+	}
+
+	return 0;
+
+err_register_aiop:
+	misc_deregister(&dpaa2_mc_console_dev);
+err_register_mc:
+	return error;
+}
+
+static int dpaa2_console_remove(struct platform_device *pdev)
+{
+	misc_deregister(&dpaa2_mc_console_dev);
+	misc_deregister(&dpaa2_aiop_console_dev);
+
+	return 0;
+}
+
+static const struct of_device_id dpaa2_console_match_table[] =3D {
+	{ .compatible =3D "dpaa2-console",},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dpaa2_console_match_table);
+
+static struct platform_driver dpaa2_console_driver =3D {
+	.driver =3D {
+		   .name =3D "dpaa2-console",
+		   .pm =3D NULL,
+		   .of_match_table =3D dpaa2_console_match_table,
+		   },
+	.probe =3D dpaa2_console_probe,
+	.remove =3D dpaa2_console_remove,
+};
+module_platform_driver(dpaa2_console_driver);
--=20
1.9.1
