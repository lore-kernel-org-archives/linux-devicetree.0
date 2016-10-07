From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 1/6] mfd: Add support for the PTX1K CBC FPGA
Date: Fri,  7 Oct 2016 18:20:09 +0300
Message-ID: <1475853614-22409-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

The CBC intergrates CB and SAM on single FPGA. This is a PCI MFD driver
and provides support for the following functions as subdrivers:

* SAM I2C accelerator
* SAM MTD flash
* CBC spare GPIOs
* CBC JNX infrastructure

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
Signed-off-by: Rajat Jain <rajatjain@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/mfd/Kconfig          |  16 +
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/cbc-core.c       | 971 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/cbc-core.h | 181 ++++++++
 4 files changed, 1169 insertions(+)
 create mode 100644 drivers/mfd/cbc-core.c
 create mode 100644 include/linux/mfd/cbc-core.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7e1fa14..6107f7a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1384,6 +1384,22 @@ config MFD_JUNIPER_EXT_CPLD
 	  called "ptxpmb-ext-cpld"
 
 
+config MFD_JUNIPER_CBC
+	tristate "Juniper PTX1K CBC FPGA"
+	depends on JNX_PTX1K_RCB
+	default y if JNX_PTX1K_RCB
+	select MFD_CORE
+	select MTD
+	select MTD_SAM_FLASH
+	select I2C_SAM
+	select GPIO_CBC_PRESENCE if JNX_CONNECTOR
+	help
+	  Select this to enable the CBC FPGA multi-function kernel driver.
+	  This FPGA is present on the PTX1K RCB Juniper platform.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "cbc-core"
+
 config MFD_TWL4030_AUDIO
 	bool "TI TWL4030 Audio"
 	depends on TWL4030_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index da94482..0ea6dc6 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_AB8500_GPADC)	+= ab8500-gpadc.o
 obj-$(CONFIG_MFD_JUNIPER_CPLD)	+= ptxpmb-cpld-core.o
 obj-$(CONFIG_MFD_JUNIPER_SAM)	+= sam-core.o
 obj-$(CONFIG_MFD_JUNIPER_EXT_CPLD) += ptxpmb-ext-cpld-core.o
+obj-$(CONFIG_MFD_JUNIPER_CBC)	+= cbc-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
 # ab8500-core need to come after db8500-prcmu (which provides the channel)
 obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
diff --git a/drivers/mfd/cbc-core.c b/drivers/mfd/cbc-core.c
new file mode 100644
index 0000000..1e6c95b
--- /dev/null
+++ b/drivers/mfd/cbc-core.c
@@ -0,0 +1,971 @@
+/*
+ * drivers/mfd/cbc-core.c
+ *
+ * Copyright (c) 2014, Juniper Networks
+ * Author: Georgi Vlaev <gvlaev@juniper.net>
+ * Based on: sam-core.c
+ *
+ * The CBC FPGA intergrates the PTX1K CB and some functions of
+ * the SAM FPGA on single device. We're reusing the SAM I2C,
+ * MTD flash drivers. The JNX CB logic is implemented in
+ * drivers/jnx/jnx-cbc-ptx1k.c and drivers/jnx/jnx-cbd-fpga-ptx1k.c
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/sam.h>
+#include <linux/jnx/pci_ids.h>
+#include <linux/debugfs.h>
+#include <linux/mfd/cbc-core.h>
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/string.h>
+#include <linux/ctype.h>
+#endif
+
+enum {
+	CBC_CELL_SAM_I2C,       /* SAM I2C accelerator */
+	CBC_CELL_SAM_MTD,       /* SAM EPCS64 config flash */
+	CBC_CELL_GPIO,          /* CBC spare GPIO */
+	CBC_CELL_JNX_CBD,       /* CBC CB JNX driver */
+	CBC_CELL_GPIO_PRS,      /* CBC presence as GPIO (CH_PRS) */
+	CBC_CELL_GPIO_PRS_OTHER,/* CBC presence ss GPIO (OTHER_CH_PRS) */
+	CBC_CELL_GPIO_PRS_SIB,  /* CBC presence as GPIO (CH_PRS_SIB) */
+	CBC_NUM_MFD_CELLS
+};
+
+#define CBC_IRQ_NR			31
+#define CBC_RES_NR			2 /* iomem, irq */
+#define CBC_RES_NR_NOIRQ		1 /* iomem */
+
+struct cbc_fpga_data {
+	void __iomem *membase;
+	struct pci_dev *pdev;
+	u32 fpga_rev;	/* CBC revision */
+	u32 fpga_date;	/* CBC revision date */
+	int i2c_mstr_count; /* CBC/I2C SAM master count */
+	struct irq_domain *irq_domain;
+	u32 int_src; /* interrupt src reg (MSI, legacy) */
+	u32 int_en; /* interrupt en reg (MSI, legacy) */
+	spinlock_t irq_lock;
+	struct mfd_cell mfd_cells[CBC_NUM_MFD_CELLS];
+	struct resource mfd_i2c_resources[CBC_RES_NR];
+	struct resource mfd_mtd_resources[CBC_RES_NR_NOIRQ];
+	struct resource mfd_gpio_resources[CBC_RES_NR_NOIRQ];
+	struct resource mfd_jnx_resources[CBC_RES_NR_NOIRQ];
+	struct resource mfd_gpio_prs_resources[CBC_RES_NR_NOIRQ];
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *cbc_debugfs_dir;
+	u32 debug_address; /* any register offsset */
+	struct debugfs_regset32 *regset; /* all regs */
+	u32 test_int_cnt; /* TEST_INT counter */
+	u32 i2c_accel_cnt; /* INT_I2C_ACCEL cnt */
+	u32 i2c_accel_empty_cnt; /* INT_I2C_ACCEL cnt && !CBC_STATUS_IRQ_EN */
+#endif
+};
+
+/* debugfs */
+/* TODO: split into a separate file */
+#ifdef CONFIG_DEBUG_FS
+
+#define dump_register(n)		\
+{					\
+	.name	= __stringify(n),	\
+	.offset = n,			\
+}
+
+static const struct debugfs_reg32 cbc_regs[] = {
+	dump_register(CBC_TOP_REGS_INT_SRC),
+	dump_register(CBC_TOP_REGS_INT_EN),
+	dump_register(CBC_TOP_REGS_I2C_SEL),
+	dump_register(CBC_TOP_REGS_CH_PRS),
+	dump_register(CBC_TOP_REGS_RTL_REVISION),
+	dump_register(CBC_TOP_REGS_PWR_STATUS),
+	dump_register(CBC_TOP_REGS_I2CS_INT),
+	dump_register(CBC_TOP_REGS_I2CS_INT_EN),
+	dump_register(CBC_TOP_REGS_MSTR_CONFIG),
+	dump_register(CBC_TOP_REGS_MSTR_ALIVE),
+	dump_register(CBC_TOP_REGS_MSTR_ALIVE_CNT),
+	dump_register(CBC_TOP_REGS_FPGA_REV),
+	dump_register(CBC_TOP_REGS_FPGA_DATE),
+	dump_register(CBC_TOP_REGS_DEVICE_CTRL),
+	dump_register(CBC_TOP_REGS_SLOT_ID),
+	dump_register(CBC_TOP_REGS_SCRATCH),
+	dump_register(CBC_TOP_REGS_RE_HALT),
+	dump_register(CBC_TOP_REGS_OTHER_CH_PRS_CHANGE),
+	dump_register(CBC_TOP_REGS_FPC_SPARE_A),
+	dump_register(CBC_TOP_REGS_FT_SPARE),
+	dump_register(CBC_TOP_REGS_CB_SPARE),
+	dump_register(CBC_TOP_REGS_MTTR_0),
+	dump_register(CBC_TOP_REGS_MTTR_1),
+	dump_register(CBC_TOP_REGS_MTTR_2),
+	dump_register(CBC_TOP_REGS_MSTR_FRC),
+	dump_register(CBC_TOP_REGS_MSTR_RSN),
+	dump_register(CBC_TOP_REGS_ME_WRITE_0),
+	dump_register(CBC_TOP_REGS_ME_WRITE_1),
+	dump_register(CBC_TOP_REGS_ME_WRITE_2),
+	dump_register(CBC_TOP_REGS_ME_WRITE_3),
+	dump_register(CBC_TOP_REGS_ME_WRITE_4),
+	dump_register(CBC_TOP_REGS_ME_WRITE_5),
+	dump_register(CBC_TOP_REGS_ME_READ_0),
+	dump_register(CBC_TOP_REGS_ME_READ_1),
+	dump_register(CBC_TOP_REGS_ME_READ_2),
+	dump_register(CBC_TOP_REGS_ME_READ_3),
+	dump_register(CBC_TOP_REGS_ME_READ_4),
+	dump_register(CBC_TOP_REGS_ME_READ_5),
+	dump_register(CBC_TOP_REGS_ME_STATUS),
+	dump_register(CBC_TOP_REGS_LIU_CONFIG),
+	dump_register(CBC_TOP_REGS_CBC_8112_8614_RST),
+	dump_register(CBC_TOP_REGS_CCG_CONFIG),
+	dump_register(CBC_TOP_REGS_SFPP_CONTROL),
+	dump_register(CBC_TOP_REGS_SFPP_PCIE_FT_STATUS),
+	dump_register(CBC_TOP_REGS_GPIO_CTRL),
+	dump_register(CBC_TOP_REGS_GPIO_OUTPUT_DATA),
+	dump_register(CBC_TOP_REGS_GPIO_INPUT_DATA),
+	dump_register(CBC_TOP_REGS_CCG_STATUS_RT),
+	dump_register(CBC_TOP_REGS_CCG_STATUS_LATCHED),
+	dump_register(CBC_TOP_REGS_CCG_STATUS_INTERRUPT_ENABLE),
+	dump_register(CBC_TOP_REGS_OTHER_LED),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_RW_CONTROL),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_REG_ADDRESS),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_WDATA),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_RDATA),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_STATUS),
+	dump_register(CBC_TOP_REGS_SFPP_I2C_DEV_ADDRESS),
+	dump_register(CBC_TOP_REGS_SIB_SPARE_OUTPUTENABLE),
+	dump_register(CBC_TOP_REGS_SIB_SPARE_OUTPUT),
+	dump_register(CBC_TOP_REGS_SIB_SPARE_INPUT),
+	dump_register(CBC_TOP_REGS_FPC_SPARE_OUTPUTENABLE),
+	dump_register(CBC_TOP_REGS_FPC_SPARE_OUTPUT),
+	dump_register(CBC_TOP_REGS_FPC_SPARE_INPUT),
+	dump_register(CBC_TOP_REGS_OTHER_SPARE_OUTPUTENABLE),
+	dump_register(CBC_TOP_REGS_OTHER_SPARE_OUTPUT),
+	dump_register(CBC_TOP_REGS_OTHER_SPARE_INPUT),
+	dump_register(CBC_TOP_REGS_MSI_INT_SRC),
+	dump_register(CBC_TOP_REGS_MSI_INT_EN),
+	dump_register(CBC_TOP_REGS_TOD_LOCK),
+	dump_register(CBC_TOP_REGS_TOD_TIME_79_48),
+	dump_register(CBC_TOP_REGS_TOD_TIME_47_16),
+	dump_register(CBC_TOP_REGS_TOD_TIME_15_0),
+	dump_register(CBC_TOP_REGS_TOD_CLKACC_CRC),
+	dump_register(CBC_TOP_REGS_APS_COMMAND_REGISTER),
+	dump_register(CBC_TOP_REGS_APS_STATUS_REGISTER),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA0),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA1),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA2),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA3),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA4),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA5),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA6),
+	dump_register(CBC_TOP_REGS_APS_FRAME_DATA7),
+	dump_register(CBC_TOP_REGS_APS_APS_REV_REG),
+	dump_register(CBC_TOP_REGS_APS_APS_DEBUG0),
+	dump_register(CBC_TOP_REGS_APS_COUNTER_GOOD_FRAMES),
+	dump_register(CBC_TOP_REGS_APS_COUNTER_BAD_FRAMES),
+	dump_register(CBC_TOP_REGS_APS_APS_LINK_STATUS),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG0),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG1),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG2),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG3),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG4),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG5),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG6),
+	dump_register(CBC_TOP_REGS_APS_INTERRUPT_LOG7),
+	dump_register(CBC_INFO_I2C_MASTER_COUNT),
+	dump_register(CBC_INFO_FAST_I2C_CONFIG_A),
+	dump_register(CBC_INFO_FAST_I2C_CONFIG_B),
+	dump_register(CBC_INFO_FEATURES),
+	dump_register(CBC_INFO_PMA_CONTROL),
+	dump_register(CBC_INFO_PMA_STATUS),
+	dump_register(CBC_STATUS_IRQ_EN),
+	dump_register(CBC_STATUS_IRQ_ST),
+	dump_register(CBC_REMOTE_UPGRADE_CONTROL),
+	dump_register(CBC_REMOTE_UPGRADE_STATUS),
+	dump_register(CBC_FLASH_IF_ADDRESS),
+	dump_register(CBC_FLASH_IF_BYTE_COUNT),
+	dump_register(CBC_FLASH_IF_CONTROL),
+	dump_register(CBC_FLASH_IF_STATUS),
+	dump_register(CBC_FLASH_IF_WRITE_DATA),
+	dump_register(CBC_FLASH_IF_READ_DATA),
+};
+
+/*
+ * Usage:
+ * #echo ADDR > <debugfs>/cbc-core/register-address
+ * #cat <debugfs>/cbc-core/register-value
+ *
+ */
+static int cbc_debugfs_addr_print(struct seq_file *s, void *p)
+{
+	struct cbc_fpga_data *cbc = (struct cbc_fpga_data *)s->private;
+
+	seq_printf(s, "0x%08X\n", cbc->debug_address);
+
+	return 0;
+}
+
+static int cbc_debugfs_addr_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cbc_debugfs_addr_print, inode->i_private);
+}
+
+static ssize_t cbc_debugfs_addr_write(struct file *file,
+	const char __user *user_buf, size_t count, loff_t *ppos)
+{
+	struct cbc_fpga_data *cbc =
+		((struct seq_file *)(file->private_data))->private;
+	unsigned long user_address;
+	int err;
+
+	err = kstrtoul_from_user(user_buf, count, 0, &user_address);
+	if (err)
+		return err;
+
+	if (user_address > 0xffffff) {
+		dev_err(&cbc->pdev->dev, "debugfs error input > 0xffffff\n");
+		return -EINVAL;
+	}
+	cbc->debug_address = user_address;
+
+	return count;
+}
+
+static const struct file_operations cbc_debugfs_addr_fops = {
+	.open = cbc_debugfs_addr_open,
+	.write = cbc_debugfs_addr_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.owner = THIS_MODULE,
+};
+
+static int cbc_debugfs_val_print(struct seq_file *s, void *p)
+{
+	struct cbc_fpga_data *cbc = (struct cbc_fpga_data *)s->private;
+
+	seq_printf(s, "0x%08X\n", ioread32(cbc->membase + cbc->debug_address));
+
+	return 0;
+}
+
+static int cbc_debugfs_val_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cbc_debugfs_val_print, inode->i_private);
+}
+
+static ssize_t cbc_debugfs_val_write(struct file *file,
+	const char __user *user_buf, size_t count, loff_t *ppos)
+{
+	struct cbc_fpga_data *cbc =
+		((struct seq_file *)(file->private_data))->private;
+	unsigned long user_val;
+	int err;
+
+	err = kstrtoul_from_user(user_buf, count, 0, &user_val);
+	if (err)
+		return err;
+
+	iowrite32(user_val, cbc->membase + cbc->debug_address);
+	ioread32(cbc->membase + cbc->debug_address);
+
+	return count;
+}
+
+static const struct file_operations cbc_debugfs_val_fops = {
+	.open = cbc_debugfs_val_open,
+	.write = cbc_debugfs_val_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.owner = THIS_MODULE,
+};
+
+/*
+ * Usage:
+ * #echo 1 > <debugfs>/cbc-core/test-int
+ * #cat <debugfs>/cbc-core/test-int
+ *
+ */
+static void cbc_fire_test_int(struct cbc_fpga_data *cbc)
+{
+	u32 int_en;
+
+	/* Disable and enable the TEST_INT bit  */
+	int_en = ioread32(cbc->membase + cbc->int_en);
+	iowrite32(int_en & ~BIT(INT_TEST), cbc->membase + cbc->int_en);
+	ioread32(cbc->membase + cbc->int_en);
+	iowrite32(int_en | BIT(INT_TEST), cbc->membase + cbc->int_en);
+	ioread32(cbc->membase + cbc->int_en);
+}
+
+static int cbc_debugfs_test_int_print(struct seq_file *s, void *p)
+{
+	struct cbc_fpga_data *cbc = (struct cbc_fpga_data *)s->private;
+
+	seq_printf(s, "0x%08X\n", cbc->test_int_cnt);
+	return 0;
+}
+
+static int cbc_debugfs_test_int_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cbc_debugfs_test_int_print, inode->i_private);
+}
+
+/* write address triggers a page read */
+static ssize_t cbc_debugfs_test_int_write(struct file *file,
+	const char __user *user_buf, size_t count, loff_t *ppos)
+{
+	struct cbc_fpga_data *cbc =
+		((struct seq_file *)(file->private_data))->private;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul_from_user(user_buf, count, 0, &val);
+	if (err)
+		return err;
+
+	if (val)
+		cbc_fire_test_int(cbc);
+
+	return count;
+}
+
+static const struct file_operations cbc_debugfs_test_int_fops = {
+	.open = cbc_debugfs_test_int_open,
+	.write = cbc_debugfs_test_int_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.owner = THIS_MODULE,
+};
+
+
+static int cbc_debugfs_i2c_accel_int_print(struct seq_file *s, void *p)
+{
+	struct cbc_fpga_data *cbc = (struct cbc_fpga_data *)s->private;
+
+	seq_printf(s, "%d:%d\n", cbc->i2c_accel_cnt,
+					cbc->i2c_accel_empty_cnt);
+
+	return 0;
+}
+
+static int cbc_debugfs_i2c_accel_int_open(struct inode *inode,
+				struct file *file)
+{
+	return single_open(file, cbc_debugfs_i2c_accel_int_print,
+				inode->i_private);
+}
+
+static const struct file_operations cbc_debugfs_i2c_accel_int_fops = {
+	.open = cbc_debugfs_i2c_accel_int_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.owner = THIS_MODULE,
+};
+
+static int cbc_debugfs_init(struct cbc_fpga_data *cbc)
+{
+	struct dentry *file;
+	struct device *dev = &cbc->pdev->dev;
+
+	cbc->cbc_debugfs_dir = debugfs_create_dir("cbc-core", NULL);
+	if (!cbc->cbc_debugfs_dir)
+		return -ENOMEM;
+/* regset dump */
+	cbc->regset = devm_kzalloc(dev, sizeof(*cbc->regset), GFP_KERNEL);
+	if (!cbc->regset)
+		goto err;
+
+	cbc->regset->regs = cbc_regs;
+	cbc->regset->nregs = ARRAY_SIZE(cbc_regs);
+	cbc->regset->base = cbc->membase;
+
+	file = debugfs_create_regset32("regdump", S_IRUGO,
+		cbc->cbc_debugfs_dir, cbc->regset);
+	if (!file)
+		goto err;
+
+/* Any register read/write */
+	file = debugfs_create_file("register-address",
+		(S_IRUGO | S_IWUSR | S_IWGRP),
+		cbc->cbc_debugfs_dir, cbc, &cbc_debugfs_addr_fops);
+	if (!file)
+		goto err;
+
+	file = debugfs_create_file("register-value",
+		(S_IRUGO | S_IWUSR | S_IWGRP),
+		cbc->cbc_debugfs_dir, cbc, &cbc_debugfs_val_fops);
+
+	if (!file)
+		goto err;
+
+/* TEST_INT */
+	file = debugfs_create_file("test-int",
+		(S_IRUGO | S_IWUSR | S_IWGRP),
+		cbc->cbc_debugfs_dir, cbc, &cbc_debugfs_test_int_fops);
+	if (!file)
+		goto err;
+
+/* I2C_ACCEL_INT */
+	file = debugfs_create_file("i2c-accel-int",
+		(S_IRUGO | S_IWUSR | S_IWGRP),
+		cbc->cbc_debugfs_dir, cbc, &cbc_debugfs_i2c_accel_int_fops);
+	if (!file)
+		goto err;
+
+	return 0;
+err:
+	debugfs_remove_recursive(cbc->cbc_debugfs_dir);
+	dev_err(dev, "failed to create debugfs entries.\n");
+
+	return -ENOMEM;
+}
+
+static void cbc_debugfs_remove(struct cbc_fpga_data *cbc)
+{
+	debugfs_remove_recursive(cbc->cbc_debugfs_dir);
+}
+#endif
+
+/*
+ * CBC/SAM interrupt handling
+ * The CBC_STATUS_IRQ_EN register is not used in the CBC
+ * The CBC_STATUS_IRQ_ST register just reports the pending
+ * interrupts for each master.
+ */
+static void sam_enable_irq(struct device *dev, enum sam_irq_type type,
+			   int irq, u32 mask)
+{
+}
+
+static void sam_disable_irq(struct device *dev, enum sam_irq_type type,
+			    int irq, u32 mask)
+{
+}
+
+static u32 sam_irq_status(struct device *dev, enum sam_irq_type type, int irq)
+{
+	struct cbc_fpga_data *cbc = dev_get_drvdata(dev);
+
+	return ioread32(cbc->membase + CBC_STATUS_IRQ_ST);
+}
+
+static void sam_irq_status_clear(struct device *dev, enum sam_irq_type type,
+				 int irq, u32 mask)
+{
+	struct cbc_fpga_data *cbc = dev_get_drvdata(dev);
+
+	iowrite32(mask, cbc->membase + CBC_STATUS_IRQ_ST);
+	ioread32(cbc->membase + CBC_STATUS_IRQ_ST);
+
+	/*
+	 * Clear the MSI INT_I2C_ACCEL interrupt.
+	 * This might cause additional interrupt, but we
+	 * won't miss the MSI in the windows from clearing the
+	 * CBC_STATUS_IRQ_ST and INT_I2C_ACCEL.
+	 */
+	iowrite32(BIT(INT_I2C_ACCEL), cbc->membase + cbc->int_src);
+	ioread32(cbc->membase + cbc->int_src);
+}
+
+static irqreturn_t cbc_irq_handler(int irq, void *data)
+{
+	struct cbc_fpga_data *cbc = data;
+	u32 int_src;
+	int i, iirq, ret = IRQ_NONE;
+
+	int_src = ioread32(cbc->membase + cbc->int_src);
+
+	/* (CBC) Test interrupt - just count */
+	if (int_src & BIT(INT_TEST)) {
+		cbc->test_int_cnt++;
+		iowrite32(BIT(INT_TEST), cbc->membase + cbc->int_src);
+		ioread32(cbc->membase + cbc->int_src);
+		ret = IRQ_HANDLED;
+	}
+
+#ifdef CONFIG_DEBUG_FS
+	if (int_src & BIT(INT_I2C_ACCEL)) {
+		u32 irq_st;
+
+		cbc->i2c_accel_cnt++;
+		irq_st = ioread32(cbc->membase + CBC_STATUS_IRQ_ST);
+		if (!irq_st)
+			cbc->i2c_accel_empty_cnt++;
+	}
+#endif
+
+	for (i = 0; i < CBC_IRQ_NR; i++) {
+		if (int_src & BIT(i)) {
+			iirq = irq_find_mapping(cbc->irq_domain, i);
+			if (iirq) {
+				generic_handle_irq(iirq);
+				ret = IRQ_HANDLED;
+			}
+		}
+	}
+
+	return ret;
+}
+
+/* irq_chip */
+static void cbc_irq_unmask(struct irq_data *data)
+{
+	struct cbc_fpga_data *cbc = irq_data_get_irq_chip_data(data);
+	unsigned long flags;
+	int irq = data->hwirq & 0x3f;
+	u32 int_en;
+
+	spin_lock_irqsave(&cbc->irq_lock, flags);
+
+	int_en = ioread32(cbc->membase + cbc->int_en);
+	iowrite32(int_en | BIT(irq), cbc->membase + cbc->int_en);
+	ioread32(cbc->membase + cbc->int_en);
+
+	spin_unlock_irqrestore(&cbc->irq_lock, flags);
+}
+
+static void cbc_irq_mask(struct irq_data *data)
+{
+	struct cbc_fpga_data *cbc = irq_data_get_irq_chip_data(data);
+	unsigned long flags;
+	int irq = data->hwirq & 0x3f;
+	u32 int_en;
+
+	spin_lock_irqsave(&cbc->irq_lock, flags);
+
+	int_en = ioread32(cbc->membase + cbc->int_en);
+	iowrite32(int_en & ~BIT(irq), cbc->membase + cbc->int_en);
+	ioread32(cbc->membase + cbc->int_en);
+
+	spin_unlock_irqrestore(&cbc->irq_lock, flags);
+}
+
+static void cbc_irq_ack(struct irq_data *data)
+{
+	struct cbc_fpga_data *cbc = irq_data_get_irq_chip_data(data);
+	int irq = data->hwirq & 0x3f;
+
+	iowrite32(BIT(irq), cbc->membase + cbc->int_src);
+	ioread32(cbc->membase + cbc->int_src);
+}
+
+struct irq_chip cbc_irq_chip = {
+	.name		= "cbc-core",
+	.irq_ack	= cbc_irq_ack,
+	.irq_mask	= cbc_irq_mask,
+	.irq_unmask	= cbc_irq_unmask,
+};
+
+/* irq_domain */
+static int cbc_irq_map(struct irq_domain *h, unsigned int virq,
+			irq_hw_number_t hw)
+{
+	irq_set_chip_data(virq, h->host_data);
+	irq_set_chip_and_handler(virq, &cbc_irq_chip, handle_level_irq);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static struct irq_domain_ops cbc_irq_domain_ops = {
+	.map	= cbc_irq_map,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+static int cbc_request_interrupt(struct cbc_fpga_data *cbc)
+{
+	int err;
+	struct pci_dev *pdev = cbc->pdev;
+	struct device *dev = &pdev->dev;
+
+	if (!pdev->irq)
+		return -ENODEV;
+
+	if (!pci_enable_msi(pdev)) {
+		cbc->int_src = CBC_TOP_REGS_MSI_INT_SRC;
+		cbc->int_en = CBC_TOP_REGS_MSI_INT_EN;
+	} else {
+		cbc->int_src = CBC_TOP_REGS_INT_SRC;
+		cbc->int_en = CBC_TOP_REGS_INT_EN;
+	}
+
+	cbc->irq_domain = irq_domain_add_linear(dev->of_node, CBC_IRQ_NR,
+						&cbc_irq_domain_ops, cbc);
+	if (!cbc->irq_domain) {
+		dev_err(dev, "could not create irq domain\n");
+		return -ENOMEM;
+	}
+
+	err = devm_request_irq(dev, pdev->irq, cbc_irq_handler,
+				0, dev_driver_string(dev), cbc);
+
+	if (err) {
+		dev_err(dev, "failed to request irq %d\n", pdev->irq);
+		irq_domain_remove(cbc->irq_domain);
+		pci_disable_msi(pdev);
+		return err;
+	}
+
+	return 0;
+}
+
+static void cbc_free_interrupt(struct cbc_fpga_data *cbc)
+{
+	struct pci_dev *pdev = cbc->pdev;
+
+	devm_free_irq(&pdev->dev, pdev->irq, cbc);
+	if (cbc->irq_domain)
+		irq_domain_remove(cbc->irq_domain);
+	pci_disable_msi(pdev);
+}
+
+/* scratch access test */
+static int cbc_test_scratch(struct cbc_fpga_data *cbc)
+{
+	struct pci_dev *pdev = cbc->pdev;
+	struct device *dev = &pdev->dev;
+	u32 acc, i;
+
+	/*
+	 * Check rw register access -> use the scratch reg.
+	 * Earlier revisions fail on scratch rw test
+	 */
+	iowrite32(0xA5A5A5A5, cbc->membase + CBC_TOP_REGS_SCRATCH);
+	acc = ioread32(cbc->membase + CBC_TOP_REGS_SCRATCH);
+	if (acc != 0xA5A5A5A5) {
+		dev_err(dev,
+			"CBC scratch write failed: %08x -> %08x",
+			0xA5A5A5A5, acc);
+		return -EIO;
+	}
+
+	for (i = 0; i < 0xf0000000; i += 0x01010101) {
+		iowrite32(i, cbc->membase + CBC_TOP_REGS_SCRATCH);
+		acc = ioread32(cbc->membase + CBC_TOP_REGS_SCRATCH);
+		if (acc != i) {
+			dev_err(dev, "CBC scratch write failed: %08x -> %08x",
+				i, acc);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Check if the CBC is capable of generating interrupts.
+ * Use the test interrupt bit. The counter is incremented
+ * from the interrupt handler. We want it > 0
+ */
+static int cbc_test_interrupts(struct cbc_fpga_data *cbc)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+
+	cbc->test_int_cnt = 0;
+	cbc_fire_test_int(cbc);
+
+	while (!cbc->test_int_cnt) {
+		if (time_after(jiffies, timeout))
+			break;
+		schedule_timeout_interruptible(msecs_to_jiffies(10));
+	}
+
+	return cbc->test_int_cnt;
+}
+
+/* sysfs entries */
+static ssize_t version_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct cbc_fpga_data *cbc = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", cbc->fpga_rev);
+}
+
+static ssize_t cbc_date_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct cbc_fpga_data *cbc = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%08x\n", cbc->fpga_date);
+}
+
+static DEVICE_ATTR(version, S_IRUGO, version_show, NULL);
+static DEVICE_ATTR(cbc_date, S_IRUGO, cbc_date_show, NULL);
+
+static struct attribute *cbc_attrs[] = {
+	&dev_attr_version.attr,
+	&dev_attr_cbc_date.attr,
+	NULL,
+};
+
+static struct attribute_group cbc_attr_group = {
+	.attrs  = cbc_attrs,
+};
+
+/* SAM drivers interrupt handling */
+static struct sam_platform_data cbc_sam_plat_data = {
+	.enable_irq = sam_enable_irq,
+	.disable_irq = sam_disable_irq,
+	.irq_status = sam_irq_status,
+	.irq_status_clear = sam_irq_status_clear,
+	.i2c_mux_channels = 4,
+};
+
+/*
+ * List of modules to be loaded. Should only be necessary if devicetree
+ * is not configured, but doesn't hurt otherwise.
+ */
+const char *cbc_modules[] = {
+	"i2c-sam",
+	"sam-flash",
+	"gpio-cbc",
+	NULL
+};
+
+static void cbc_request_modules(bool wait)
+{
+	struct module *m;
+	int i;
+
+	for (i = 0; cbc_modules[i]; i++) {
+		mutex_lock(&module_mutex);
+		m = find_module(cbc_modules[i]);
+		mutex_unlock(&module_mutex);
+		if (!m) {
+			if (wait)
+				request_module(cbc_modules[i]);
+			else
+				request_module_nowait(cbc_modules[i]);
+		}
+	}
+}
+
+static struct cbc_fpga_platdata cbc_fpga_platdata[] = {
+	[JNX_CBD_FPGA_PTX1K] = {
+		.board_type = JNX_CBD_FPGA_PTX1K,
+	},
+	[JNX_CBD_FPGA_PTX1K_P2] = {
+		.board_type = JNX_CBD_FPGA_PTX1K_P2,
+	},
+	[JNX_CBD_FPGA_PTX21K] = {
+		.board_type = JNX_CBD_FPGA_PTX21K,
+	},
+};
+
+static int cbc_fpga_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	int err;
+	struct cbc_fpga_data *cbc;
+	struct device *dev = &pdev->dev;
+
+	/* Request modules, but keep going */
+	cbc_request_modules(false);
+
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
+	err = pcim_iomap_regions(pdev, 1 << 0, "cbc-core");
+	if (err)
+		return err;
+
+	cbc = devm_kzalloc(dev, sizeof(*cbc), GFP_KERNEL);
+	if (cbc == NULL)
+		return -ENOMEM;
+
+	cbc->membase = pcim_iomap_table(pdev)[0];
+	cbc->pdev = pdev;
+	pci_set_drvdata(pdev, cbc);
+
+/* Check IO */
+	err = cbc_test_scratch(cbc);
+	if (err)
+		return err;
+
+/* CBC Revision ID */
+	cbc->fpga_rev = ioread32(cbc->membase + CBC_TOP_REGS_RTL_REVISION);
+	cbc->fpga_date = ioread32(cbc->membase + CBC_TOP_REGS_FPGA_DATE);
+	cbc->i2c_mstr_count =
+		ioread32(cbc->membase + CBC_INFO_I2C_MASTER_COUNT) & 0xff;
+
+	spin_lock_init(&cbc->irq_lock);
+
+	/* i2c accel */
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].name = "i2c-sam";
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].num_resources = CBC_RES_NR;
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].resources = cbc->mfd_i2c_resources;
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].of_compatible = "jnx,i2c-sam";
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].platform_data = &cbc_sam_plat_data;
+	cbc->mfd_cells[CBC_CELL_SAM_I2C].pdata_size =
+				sizeof(struct sam_platform_data);
+
+	cbc->mfd_i2c_resources[0].start = CBC_I2C_ACCEL_IF_MEM_START;
+	cbc->mfd_i2c_resources[0].end = CBC_I2C_ACCEL_IF_MEM_END;
+	cbc->mfd_i2c_resources[0].flags = IORESOURCE_MEM;
+	cbc->mfd_i2c_resources[1].start =
+			cbc->mfd_i2c_resources[1].end = INT_I2C_ACCEL;
+	cbc->mfd_i2c_resources[1].flags = IORESOURCE_IRQ;
+
+	/* epcs64,128 mtd flash */
+	cbc->mfd_cells[CBC_CELL_SAM_MTD].name = "flash-sam";
+	cbc->mfd_cells[CBC_CELL_SAM_MTD].num_resources = CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_SAM_MTD].resources = cbc->mfd_mtd_resources;
+	cbc->mfd_cells[CBC_CELL_SAM_MTD].of_compatible = "jnx,flash-sam";
+
+	cbc->mfd_mtd_resources[0].start = CBC_FLASH_IF_MEM_START;
+	cbc->mfd_mtd_resources[0].end = CBC_FLASH_IF_MEM_END;
+	cbc->mfd_mtd_resources[0].flags = IORESOURCE_MEM;
+
+	/* CBC GPIO  */
+	cbc->mfd_cells[CBC_CELL_GPIO].name = "gpio-cbc";
+	cbc->mfd_cells[CBC_CELL_GPIO].num_resources = CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_GPIO].resources = cbc->mfd_gpio_resources;
+	cbc->mfd_cells[CBC_CELL_GPIO].of_compatible = "jnx,gpio-cbc";
+	cbc->mfd_gpio_resources[0].flags = IORESOURCE_MEM;
+
+	/* CBC JNX  */
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].name = "jnx-cbd-fpga";
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].num_resources = CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].resources = cbc->mfd_jnx_resources;
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].of_compatible = "jnx,jnx-cbd-fpga";
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].platform_data =
+					&cbc_fpga_platdata[id->driver_data];
+	cbc->mfd_cells[CBC_CELL_JNX_CBD].pdata_size =
+					sizeof(struct cbc_fpga_platdata);
+
+	cbc->mfd_jnx_resources[0].flags = IORESOURCE_MEM;
+
+	/* CBC presence detect as GPIO  (CH_PRS) */
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS].name = "gpio-cbc-presence";
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS].id = 0;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS].num_resources =
+					CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS].resources =
+					cbc->mfd_gpio_prs_resources;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS].of_compatible =
+					"jnx,gpio-cbc-presence";
+	cbc->mfd_gpio_prs_resources[0].flags = IORESOURCE_MEM;
+
+	/* CBC presence detect as GPIO  (OTHER_CH_PRS) */
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_OTHER].name = "gpio-cbc-presence";
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_OTHER].id = 1;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_OTHER].num_resources =
+					CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_OTHER].resources =
+						cbc->mfd_gpio_prs_resources;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_OTHER].of_compatible =
+						"jnx,gpio-cbc-presence-other";
+	cbc->mfd_gpio_prs_resources[0].flags = IORESOURCE_MEM;
+
+       /* CBC presence detect as GPIO  (CH_PRS_SIB) */
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_SIB].name = "gpio-cbc-presence";
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_SIB].id = 2;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_SIB].num_resources =
+						CBC_RES_NR_NOIRQ;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_SIB].resources =
+						cbc->mfd_gpio_prs_resources;
+	cbc->mfd_cells[CBC_CELL_GPIO_PRS_SIB].of_compatible =
+						"jnx,gpio-cbc-presence-sib";
+	cbc->mfd_gpio_prs_resources[0].flags = IORESOURCE_MEM;
+
+	/* CBC is using MSI, make sure bus master is enabled */
+	pci_set_master(pdev);
+
+	/* Setup interrupts - MSI/INTx */
+	err = cbc_request_interrupt(cbc);
+	if (err < 0)
+		return err;
+
+	err = cbc_test_interrupts(cbc);
+	if (!err) {
+		dev_warn(dev, "Interrupt test failed, using poll mode");
+		cbc->mfd_cells[CBC_CELL_SAM_I2C].num_resources =
+						CBC_RES_NR_NOIRQ;
+	}
+
+	/* Request modules for good. */
+	cbc_request_modules(true);
+
+	err = mfd_add_devices(dev, pdev->bus->number, cbc->mfd_cells,
+			      ARRAY_SIZE(cbc->mfd_cells), &pdev->resource[0],
+			      0, cbc->irq_domain);
+	if (err < 0)
+		goto err_int;
+
+	err = sysfs_create_group(&pdev->dev.kobj, &cbc_attr_group);
+	if (err) {
+		sysfs_remove_group(&pdev->dev.kobj, &cbc_attr_group);
+		dev_err(&pdev->dev, "Failed to create attr group\n");
+		goto err_mfd;
+	}
+
+	dev_dbg(dev, "CBC/SAM I2C: Master count: %u\n", cbc->i2c_mstr_count);
+	dev_info(dev, "CBC FPGA Revision #%u (%02X/%02X/%04X)\n",
+		cbc->fpga_rev & 0xffff, (cbc->fpga_date >> 24) & 0xff,
+		(cbc->fpga_date >> 16) & 0xff, cbc->fpga_date & 0xffff);
+
+#ifdef CONFIG_DEBUG_FS
+	cbc_debugfs_init(cbc);
+#endif
+	return 0;
+
+err_mfd:
+	mfd_remove_devices(dev);
+
+err_int:
+	cbc_free_interrupt(cbc);
+
+	return err;
+}
+
+static void cbc_fpga_remove(struct pci_dev *pdev)
+{
+	struct cbc_fpga_data *cbc = pci_get_drvdata(pdev);
+
+#ifdef CONFIG_DEBUG_FS
+	cbc_debugfs_remove(cbc);
+#endif
+	sysfs_remove_group(&pdev->dev.kobj, &cbc_attr_group);
+	mfd_remove_devices(&pdev->dev);
+	cbc_free_interrupt(cbc);
+}
+
+static const struct pci_device_id cbc_fpga_id_tbl[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_JUNIPER, PCI_DEVICE_ID_JNX_CBC),
+	    .driver_data = JNX_CBD_FPGA_PTX1K },
+	{ PCI_DEVICE(PCI_VENDOR_ID_JUNIPER, PCI_DEVICE_ID_JNX_CBC_P2),
+	    .driver_data = JNX_CBD_FPGA_PTX1K_P2 },
+	{ PCI_DEVICE(PCI_VENDOR_ID_JUNIPER, PCI_DEVICE_ID_JNX_OMG_CBC),
+	    .driver_data = JNX_CBD_FPGA_PTX21K },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, cbc_fpga_id_tbl);
+
+static struct pci_driver cbc_fpga_driver = {
+	.name = "cbc-core",
+	.id_table = cbc_fpga_id_tbl,
+	.probe = cbc_fpga_probe,
+	.remove = cbc_fpga_remove,
+};
+
+module_pci_driver(cbc_fpga_driver);
+
+MODULE_DESCRIPTION("Juniper PTX1K RCB CBC MFD core driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/cbc-core.h b/include/linux/mfd/cbc-core.h
new file mode 100644
index 0000000..dc510a7
--- /dev/null
+++ b/include/linux/mfd/cbc-core.h
@@ -0,0 +1,181 @@
+/*
+ * PTX1K CBC FPGA registers
+ *
+ * Copyright (C) 2014 Juniper Networks
+ * Author: Georgi Vlaev <gvlaev@juniper.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __CBC_CORE_H__
+#define __CBC_CORE_H__
+
+enum jnx_cbd_fpga_board_types {
+	JNX_CBD_FPGA_PTX1K, JNX_CBD_FPGA_PTX1K_P2, JNX_CBD_FPGA_PTX21K };
+
+struct cbc_fpga_platdata {
+	enum jnx_cbd_fpga_board_types board_type;
+};
+
+#define CBC_TOP_REGS_INT_SRC			0x000
+#define CBC_TOP_REGS_INT_EN			0x004
+#define CBC_TOP_REGS_I2C_SEL			0x010
+#define CBC_TOP_REGS_CH_PRS			0x014
+#define CBC_TOP_REGS_RTL_REVISION		0x018
+#define CBC_TOP_REGS_PWR_STATUS			0x01c
+#define CBC_TOP_REGS_I2CS_INT			0x020
+#define CBC_TOP_REGS_I2CS_INT_EN		0x024
+#define CBC_TOP_REGS_MSTR_CONFIG		0x03c
+#define CBC_TOP_REGS_MSTR_ALIVE			0x040
+#define CBC_TOP_REGS_MSTR_ALIVE_CNT		0x044
+#define CBC_TOP_REGS_FPGA_REV			0x060
+#define CBC_TOP_REGS_FPGA_DATE			0x064
+#define CBC_TOP_REGS_DEVICE_CTRL		0x0c0
+#define CBC_TOP_REGS_SLOT_ID			0x0c4
+#define CBC_TOP_REGS_SCRATCH			0x0c8
+#define CBC_TOP_REGS_RE_HALT			0x0cc
+#define CBC_TOP_REGS_OTHER_CH_PRS_CHANGE	0x0d4
+#define CBC_TOP_REGS_FPC_SPARE_A		0x0dc
+#define CBC_TOP_REGS_FT_SPARE			0x0e4
+#define CBC_TOP_REGS_CB_SPARE			0x0e8
+#define CBC_TOP_REGS_MTTR_0			0x0ec
+#define CBC_TOP_REGS_MTTR_1			0x0f0
+#define CBC_TOP_REGS_MTTR_2			0x0f4
+#define CBC_TOP_REGS_MSTR_FRC			0x0f8
+#define CBC_TOP_REGS_MSTR_RSN			0x0fc
+#define CBC_TOP_REGS_ME_WRITE_0			0x100
+#define CBC_TOP_REGS_ME_WRITE_1			0x104
+#define CBC_TOP_REGS_ME_WRITE_2			0x108
+#define CBC_TOP_REGS_ME_WRITE_3			0x10c
+#define CBC_TOP_REGS_ME_WRITE_4			0x110
+#define CBC_TOP_REGS_ME_WRITE_5			0x114
+#define CBC_TOP_REGS_ME_READ_0			0x120
+#define CBC_TOP_REGS_ME_READ_1			0x124
+#define CBC_TOP_REGS_ME_READ_2			0x128
+#define CBC_TOP_REGS_ME_READ_3			0x12c
+#define CBC_TOP_REGS_ME_READ_4			0x130
+#define CBC_TOP_REGS_ME_READ_5			0x134
+#define CBC_TOP_REGS_ME_STATUS			0x13c
+#define CBC_TOP_REGS_LIU_CONFIG			0x140
+#define CBC_TOP_REGS_CBC_8112_8614_RST		0x144
+#define CBC_TOP_REGS_CCG_CONFIG			0x148
+#define CBC_TOP_REGS_SFPP_CONTROL		0x14c
+#define CBC_TOP_REGS_SFPP_PCIE_FT_STATUS	0x150
+#define CBC_TOP_REGS_GPIO_CTRL			0x168
+#define CBC_TOP_REGS_GPIO_OUTPUT_DATA		0x16c
+#define CBC_TOP_REGS_GPIO_INPUT_DATA		0x170
+#define CBC_TOP_REGS_CCG_STATUS_RT		0x174
+#define CBC_TOP_REGS_CCG_STATUS_LATCHED		0x178
+#define CBC_TOP_REGS_CCG_STATUS_INTERRUPT_ENABLE	0x17c
+#define CBC_TOP_REGS_OTHER_LED			0x180
+#define CBC_TOP_REGS_SFPP_I2C_RW_CONTROL	0x190
+#define CBC_TOP_REGS_SFPP_I2C_REG_ADDRESS	0x194
+#define CBC_TOP_REGS_SFPP_I2C_WDATA		0x198
+#define CBC_TOP_REGS_SFPP_I2C_RDATA		0x19c
+#define CBC_TOP_REGS_SFPP_I2C_STATUS		0x1a0
+#define CBC_TOP_REGS_SFPP_I2C_DEV_ADDRESS	0x1a4
+#define CBC_TOP_REGS_SIB_SPARE_OUTPUTENABLE	0x1a8
+#define CBC_TOP_REGS_SIB_SPARE_OUTPUT		0x1ac
+#define CBC_TOP_REGS_SIB_SPARE_INPUT		0x1c0
+#define CBC_TOP_REGS_FPC_SPARE_OUTPUTENABLE	0x1c4
+#define CBC_TOP_REGS_FPC_SPARE_OUTPUT		0x1c8
+#define CBC_TOP_REGS_FPC_SPARE_INPUT		0x1cc
+#define CBC_TOP_REGS_OTHER_SPARE_OUTPUTENABLE	0x1d0
+#define CBC_TOP_REGS_OTHER_SPARE_OUTPUT		0x1d4
+#define CBC_TOP_REGS_OTHER_SPARE_INPUT		0x1d8
+#define CBC_TOP_REGS_MSI_INT_SRC		0x1e0
+#define CBC_TOP_REGS_MSI_INT_EN			0x1e4
+#define CBC_TOP_REGS_TOD_LOCK			0x1f0
+#define CBC_TOP_REGS_TOD_TIME_79_48		0x1f4
+#define CBC_TOP_REGS_TOD_TIME_47_16		0x1f8
+#define CBC_TOP_REGS_TOD_TIME_15_0		0x1fc
+#define CBC_TOP_REGS_TOD_CLKACC_CRC		0x200
+#define CBC_TOP_REGS_APS_COMMAND_REGISTER	0x400
+#define CBC_TOP_REGS_APS_STATUS_REGISTER	0x404
+#define CBC_TOP_REGS_APS_FRAME_DATA0		0x420
+#define CBC_TOP_REGS_APS_FRAME_DATA1		0x424
+#define CBC_TOP_REGS_APS_FRAME_DATA2		0x428
+#define CBC_TOP_REGS_APS_FRAME_DATA3		0x42c
+#define CBC_TOP_REGS_APS_FRAME_DATA4		0x430
+#define CBC_TOP_REGS_APS_FRAME_DATA5		0x434
+#define CBC_TOP_REGS_APS_FRAME_DATA6		0x438
+#define CBC_TOP_REGS_APS_FRAME_DATA7		0x43c
+#define CBC_TOP_REGS_APS_APS_REV_REG		0x440
+#define CBC_TOP_REGS_APS_APS_DEBUG0		0x444
+#define CBC_TOP_REGS_APS_COUNTER_GOOD_FRAMES	0x448
+#define CBC_TOP_REGS_APS_COUNTER_BAD_FRAMES	0x44c
+#define CBC_TOP_REGS_APS_APS_LINK_STATUS	0x450
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG0		0x454
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG1		0x458
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG2		0x45c
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG3		0x460
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG4		0x464
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG5		0x468
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG6		0x46c
+#define CBC_TOP_REGS_APS_INTERRUPT_LOG7		0x470
+
+/* CBC: SAM register base is @0x1000 */
+#define CBC_SAM_BASE				0x1000
+#define CBC_INFO_I2C_MASTER_COUNT		(CBC_SAM_BASE + 0x00c)
+#define CBC_INFO_FAST_I2C_CONFIG_A		(CBC_SAM_BASE + 0x018)
+#define CBC_INFO_FAST_I2C_CONFIG_B		(CBC_SAM_BASE + 0x01c)
+#define CBC_INFO_FEATURES			(CBC_SAM_BASE + 0x020)
+#define CBC_INFO_PMA_CONTROL			(CBC_SAM_BASE + 0x040)
+#define CBC_INFO_PMA_STATUS			(CBC_SAM_BASE + 0x044)
+#define CBC_STATUS_IRQ_EN			(CBC_SAM_BASE + 0x104)
+#define CBC_STATUS_IRQ_ST			(CBC_SAM_BASE + 0x108)
+/* remote upgrade_if */
+#define CBC_REMOTE_UPGRADE_CONTROL		(CBC_SAM_BASE + 0x200)
+#define CBC_REMOTE_UPGRADE_STATUS		(CBC_SAM_BASE + 0x204)
+/* flash_if */
+#define CBC_FLASH_IF_ADDRESS			(CBC_SAM_BASE + 0x300)
+#define CBC_FLASH_IF_BYTE_COUNT			(CBC_SAM_BASE + 0x304)
+#define CBC_FLASH_IF_CONTROL			(CBC_SAM_BASE + 0x308)
+#define CBC_FLASH_IF_STATUS			(CBC_SAM_BASE + 0x30c)
+#define CBC_FLASH_IF_WRITE_DATA			(CBC_SAM_BASE + 0x400)
+#define CBC_FLASH_IF_READ_DATA			(CBC_SAM_BASE + 0x500)
+
+/* Constants used for FPGA upgrades */
+#define SAM_FPGA_FLASH_VALID_BIT		0xA5A5A5A5
+#define SAM_FPGA_FLASH_VALID_BIT_ADDR		0x7F0000 /* EPCS64 */
+
+/* FPGA remote upgrade registers */
+#define SAM_FPGA_REMOTE_UPGRADE_TRIG_BIT	0x08000000
+#define SAM_FPGA_REMOTE_UPGRADE_STATUS_BUSY	0x01000000
+#define SAM_FPGA_REMOTE_UPGRADE_READ_PARAM	0x80000000
+#define SAM_FPGA_REMOTE_UPGRADE_WRITE_PARAM	0x40000000
+#define SAM_FPGA_REMOTE_UPGRADE_CONTROL_RESET	0x10000000
+
+#define SAM_FPGA_REMOTE_UPGRADE_PAGE_SEL	(0x04 << 24)
+#define SAM_FPGA_REMOTE_UPGRADE_ANF		(0x05 << 24)
+#define SAM_FPGA_USER_IMAGE_BASE		0x400000
+
+/* CBC/SAM flash */
+#define FLASH_STATUS_BUSY			0x01
+#define SAM_FLASH_IF_CONTROL_READ		0x01
+#define SAM_FLASH_IF_CONTROL_READ_SID		0x80
+#define ECS64_PAGE_SIZE				0x100
+
+/* MFD resources */
+/* CBC/SAM flash - mtd/devices/flash-sam.c */
+#define CBC_FLASH_IF_MEM_START			(CBC_SAM_BASE)
+#define CBC_FLASH_IF_MEM_END			(CBC_SAM_BASE + 0x05ff)
+/* CBC/SAM I2C Accel - i2c/busses/i2c-sam.c */
+#define CBC_I2C_ACCEL_IF_MEM_START		(CBC_SAM_BASE)
+#define CBC_I2C_ACCEL_IF_MEM_END		(CBC_SAM_BASE + 0x1ffff)
+
+/* MSI & legacy nterrupts [W1C] */
+#define INT_TEST			31 /* Test interrupt */
+#define INT_MSTRSHIP_LOSS		30 /* Mastership loss */
+#define INT_I2C_ACCEL			25 /* Cascade I2C accel int */
+#define INT_CASI2CS			24 /* casI2CS_INT */
+#define INT_SFPP_PCIE_STATUS_CHANGE	23 /* SFPP status, PCIe status */
+#define INT_CCG				22 /* CCG INT */
+#define INT_PSM_STATUS_CHANGE		21 /* PSMSatusChange */
+#define INT_OTHERCH_PRS_CHANGE		18 /* OTHER_CH_PRS change */
+#define INT_CH_PRS_CHANGE		16 /* CH_PRS_change */
+#define INT_2C_CTRL			14 /* I2C_CTRL_INT */
+
+#endif /*__CBC_CORE_H__*/
-- 
1.9.1
