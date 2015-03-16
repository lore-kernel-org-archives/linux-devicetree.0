From: <vndao@altera.com>
Subject: [PATCH] [PATCH v3] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 16 Mar 2015 01:16:22 -0700
Message-ID: <1426493782-3791-1-git-send-email-vndao@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: computersforpeace@gmail.com
Cc: VIET NGA DAO <vndao@altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, dwmw2@infradead.org, ngachi86@gmail.com
List-Id: devicetree@vger.kernel.org

From: VIET NGA DAO <vndao@altera.com>

Altera Quad SPI Controller is a soft IP which enables access to Altera EPCQ and
EPCS flash chips. This patch adds driver for these devices.

Signed-off-by: VIET NGA DAO <vndao@altera.com>

---
v3:
- Change altera_epcq driver name to altera_quadspi for more generic name
- Implement flash name searching in altera_quadspi.c instead of spi-nor
- Edit the altra quadspi info table in spi-nor
- Remove wait_til_ready in all read,write, erase, lock, unlock functions
- Merge .h and .c into 1 file

v2:
- Change to spi_nor structure
- Add lock and unlock functions for spi_nor
- Simplify the altera_epcq_lock function
- Replace reg by compatible in device tree
---
 .../devicetree/bindings/mtd/altera_quadspi.txt     |  45 ++
 drivers/mtd/spi-nor/Kconfig                        |   8 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/altera_quadspi.c               | 608 +++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c                      |  11 +
 5 files changed, 673 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera_quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/altera_quadspi.c

diff --git a/Documentation/devicetree/bindings/mtd/altera_quadspi.txt b/Documentation/devicetree/bindings/mtd/altera_quadspi.txt
new file mode 100644
index 0000000..f5bdd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/altera_quadspi.txt
@@ -0,0 +1,45 @@
+* MTD Altera QUADSPI driver
+
+Required properties:
+- compatible: Should be "altr,quadspi-1.0"
+- reg: Address and length of the register set  for the device. It contains
+  the information of registers in the same order as described by reg-names
+- reg-names: Should contain the reg names
+  "csr_base": Should contain the register configuration base address
+  "data_base": Should contain the data base address
+- is-epcs: boolean type.
+		If present, the device contains EPCS flashes.
+		Otherwise, it contains EPCQ flashes.
+- #address-cells: Must be <1>.
+- #size-cells: Must be <0>.
+- flash device tree subnode, there must be a node with the following fields:
+	- compatible: Should contain the flash name
+	- #address-cells: please refer to /mtd/partition.txt
+	- #size-cells: please refer to /mtd/partition.txt
+	For partitions inside each flash, please refer to /mtd/partition.txt
+
+Example:
+
+			quadspi_controller_0: quadspi@0x000000000 {
+				compatible = "altr,quadspi-1.0";
+				reg = <0x00000001 0x00000000 0x00000020>,
+					<0x00000000 0x00000000 0x02000000>;
+				reg-names = "csr_base", "data_base";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				flash0: epcq256@0 {
+					compatible = "epcq256-nonjedec";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					partition@0 {
+						/* 16 MB for raw data. */
+						label = "EPCQ Flash 0 raw data";
+						reg = <0x0 0x1000000>;
+					};
+					partition@1000000 {
+						/* 16 MB for jffs2 data. */
+						label = "EPCQ Flash 0 JFFS 2";
+						reg = <0x1000000 0x1000000>;
+					};
+				};
+			}; //end quadspi@0x000000000 (quadspi_controller_0)
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 64a4f0e..b9eed6d 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -28,4 +28,12 @@ config SPI_FSL_QUADSPI
 	  This enables support for the Quad SPI controller in master mode.
 	  We only connect the NOR to this controller now.
 
+config SPI_ALTERA_QUADSPI
+	tristate "Support Altera EPCQ/EPCS Flash chips"
+	depends on OF
+	help
+	  This enables access to Altera EPCQ/EPCS flash chips, used for data
+	  storage. See the driver source for the current list,
+	  or to add other chips.
+
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6a7ce14..1a36a72 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
+obj-$(CONFIG_SPI_ALTERA_QUADSPI)	+= altera_quadspi.o
diff --git a/drivers/mtd/spi-nor/altera_quadspi.c b/drivers/mtd/spi-nor/altera_quadspi.c
new file mode 100644
index 0000000..1d178d9
--- /dev/null
+++ b/drivers/mtd/spi-nor/altera_quadspi.c
@@ -0,0 +1,608 @@
+/*
+ * Copyright (C) 2014 Altera Corporation. All rights reserved
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+
+#define ALTERA_QUADSPI_RESOURCE_NAME			"altera_quadspi"
+
+/* max possible slots for serial flash chip in the QUADSPI controller */
+#define MAX_NUM_FLASH_CHIP				3
+#define EPCS_OPCODE_ID					1
+#define EPCQ_OPCODE_ID					2
+#define WRITE_CHECK					1
+#define ERASE_CHECK					0
+
+/* Define max times to check status register before we give up. */
+#define QUADSPI_MAX_TIME_OUT				(40 * HZ)
+
+/* defines for status register */
+#define QUADSPI_SR_REG					0x0
+#define QUADSPI_SR_WIP_MASK				0x00000001
+#define QUADSPI_SR_WIP					0x1
+#define QUADSPI_SR_WEL					0x2
+#define QUADSPI_SR_BP0					0x4
+#define QUADSPI_SR_BP1					0x8
+#define QUADSPI_SR_BP2					0x10
+#define QUADSPI_SR_BP3					0x40
+#define QUADSPI_SR_TB					0x20
+#define QUADSPI_SR_MASK					0x0000000F
+
+/* defines for device id register */
+#define QUADSPI_SID_REG					0x4
+#define QUADSPI_RDID_REG				0x8
+#define QUADSPI_ID_MASK					0x000000FF
+
+/*
+ * QUADSPI_MEM_OP register offset
+ *
+ * The QUADSPI_MEM_OP register is used to do memory protect and erase operations
+ *
+ */
+#define QUADSPI_MEM_OP_REG				0xC
+
+#define QUADSPI_MEM_OP_CMD_MASK				0x00000003
+#define QUADSPI_MEM_OP_BULK_ERASE_CMD			0x00000001
+#define QUADSPI_MEM_OP_SECTOR_ERASE_CMD			0x00000002
+#define QUADSPI_MEM_OP_SECTOR_PROTECT_CMD		0x00000003
+#define QUADSPI_MEM_OP_SECTOR_VALUE_MASK		0x0003FF00
+#define QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK	0x00001F00
+#define QUADSPI_MEM_OP_SECTOR_PROTECT_SHIFT		8
+/*
+ * QUADSPI_ISR register offset
+ *
+ * The QUADSPI_ISR register is used to determine whether an invalid write or
+ * erase operation trigerred an interrupt
+ *
+ */
+#define QUADSPI_ISR_REG					0x10
+
+#define QUADSPI_ISR_ILLEGAL_ERASE_MASK			0x00000001
+#define QUADSPI_ISR_ILLEGAL_WRITE_MASK			0x00000002
+
+/*
+ * QUADSPI_IMR register offset
+ *
+ * The QUADSPI_IMR register is used to mask the invalid erase or the invalid
+ * write interrupts.
+ *
+ */
+#define QUADSPI_IMR_REG					0x14
+#define QUADSPI_IMR_ILLEGAL_ERASE_MASK			0x00000001
+
+#define QUADSPI_IMR_ILLEGAL_WRITE_MASK			0x00000002
+
+#define QUADSPI_CHIP_SELECT_REG				0x18
+#define QUADSPI_CHIP_SELECT_MASK			0x00000007
+#define QUADSPI_CHIP_SELECT_0				0x00000001
+#define QUADSPI_CHIP_SELECT_1				0x00000002
+#define QUADSPI_CHIP_SELECT_2				0x00000004
+
+struct altera_quadspi_plat {
+	void __iomem *csr_base;
+	void __iomem *data_base;
+	bool is_epcs;
+	u32 num_flashes;
+	struct device_node *np[MAX_NUM_FLASH_CHIP];
+};
+
+struct altera_quadspi {
+	struct clk *clk;
+	bool is_epcs;
+	void __iomem *csr_base;
+	void __iomem *data_base;
+	u32 num_flashes;
+	struct altera_quadspi_flash *flash[MAX_NUM_FLASH_CHIP];
+};
+
+struct altera_quadspi_flash {
+	struct mtd_info mtd;
+	struct spi_nor nor;
+	void *priv;
+};
+
+struct flash_device {
+	char *name;
+	u8 opcode_id;
+	u32 device_id;
+};
+
+#define FLASH_ID(_n, _opcode_id, _id)	\
+{					\
+	.name = (_n),			\
+	.opcode_id = (_opcode_id),	\
+	.device_id = (_id),		\
+}
+
+static struct flash_device flash_devices[] = {
+	FLASH_ID("epcq16-nonjedec",  2, 0x15),
+	FLASH_ID("epcq32-nonjedec",  2, 0x16),
+	FLASH_ID("epcq64-nonjedec",  2, 0x17),
+	FLASH_ID("epcq128-nonjedec", 2, 0x18),
+	FLASH_ID("epcq256-nonjedec", 2, 0x19),
+	FLASH_ID("epcq512-nonjedec", 2, 0x20),
+
+	FLASH_ID("epcs16-nonjedec",  1, 0x14),
+	FLASH_ID("epcs64-nonjedec",  1, 0x16),
+	FLASH_ID("epcs128-nonjedec", 1, 0x18),
+};
+
+static int altera_quadspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
+				    int len, int wr_en)
+{
+	return 0;
+}
+
+static int altera_quadspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
+				   int len)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	u32 data = 0;
+
+	switch (opcode) {
+	case SPINOR_OP_RDSR:
+		data = readl(dev->csr_base + QUADSPI_SR_REG);
+		*val = (u8)data & QUADSPI_SR_MASK;
+		break;
+	case SPINOR_OP_RDID:
+		/* opcode id */
+		if (dev->is_epcs)
+			data = readl(dev->csr_base + QUADSPI_SID_REG);
+		else
+			data = readl(dev->csr_base + QUADSPI_RDID_REG);
+
+		*val = (u8)data & QUADSPI_ID_MASK; /* device id */
+		break;
+	default:
+		*val = 0;
+		break;
+	}
+	return 0;
+}
+
+static int altera_quadspi_write_erase_check(struct spi_nor *nor,
+					    bool write_erase)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	u32 val;
+	u32 mask;
+
+	if (write_erase)
+		mask = QUADSPI_ISR_ILLEGAL_WRITE_MASK;
+	else
+		mask = QUADSPI_ISR_ILLEGAL_ERASE_MASK;
+
+	val = readl(dev->csr_base + QUADSPI_ISR_REG);
+	if (val & mask) {
+		dev_err(nor->dev,
+			"write/erase failed, sector might be protected\n");
+		/* clear this status for next use */
+		writel(val, dev->csr_base + QUADSPI_ISR_REG);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int altera_quadspi_addr_to_sector(struct mtd_info *mtd, int offset)
+{
+	if (mtd->erasesize_shift)
+		return offset >> mtd->erasesize_shift;
+	do_div(offset, mtd->erasesize);
+	return offset;
+}
+
+static int altera_quadspi_erase(struct spi_nor *nor, loff_t offset)
+{
+
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	struct mtd_info *mtd = &flash->mtd;
+	u32 val;
+	int ret;
+	int sector_value;
+
+	sector_value = altera_quadspi_addr_to_sector(mtd, offset);
+	/* sanity check that block_offset is a valid sector number */
+	if (sector_value < 0)
+		return -EINVAL;
+
+	/* sector value should occupy bits 17:8 */
+	val = (sector_value << 8) & QUADSPI_MEM_OP_SECTOR_VALUE_MASK;
+
+	/* sector erase commands occupies lower 2 bits */
+	val |= QUADSPI_MEM_OP_SECTOR_ERASE_CMD;
+
+	/* write sector erase command to QUADSPI_MEM_OP register */
+	writel(val, dev->csr_base + QUADSPI_MEM_OP_REG);
+
+	ret = altera_quadspi_write_erase_check(nor, ERASE_CHECK);
+	if (ret < 0) {
+		dev_err(nor->dev, "illegal erase\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int altera_quadspi_read(struct spi_nor *nor, loff_t from, size_t len,
+			       size_t *retlen, u_char *buf)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+
+	memcpy_fromio(buf, dev->data_base + from, len);
+	*retlen = len;
+
+	return 0;
+}
+
+static void altera_quadspi_write(struct spi_nor *nor, loff_t to, size_t len,
+				 size_t *retlen, const u_char *buf)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	int ret = 0;
+
+	memcpy_toio(dev->data_base + to, buf, len);
+	*retlen += len;
+
+	/*
+	 * check whether write triggered a illegal write interrupt
+	 */
+
+	ret = altera_quadspi_write_erase_check(nor, WRITE_CHECK);
+	if (ret < 0)
+		dev_err(nor->dev, "illegal write\n");
+
+
+}
+
+static int altera_quadspi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	struct mtd_info *mtd = &flash->mtd;
+	uint32_t offset = ofs;
+	u32 sector_start, sector_end;
+	u32 num_sectors;
+	u32 mem_op;
+	u32 sr_bp;
+	u32 sr_tb;
+
+	sector_start = offset;
+	sector_end = altera_quadspi_addr_to_sector(mtd, offset + len);
+	num_sectors = mtd->size;
+	do_div(num_sectors, mtd->erasesize);
+
+	dev_dbg(nor->dev, "%s: sector start is %u,sector end is %u\n",
+		__func__, sector_start, sector_end);
+
+	if (sector_start >= num_sectors / 2) {
+		sr_bp = fls(num_sectors - 1 - sector_start) + 1;
+		sr_tb = 0;
+	} else if ((sector_end < num_sectors / 2) && ~dev->is_epcs) {
+		sr_bp = fls(sector_end) + 1;
+		sr_tb = 1;
+	} else {
+		sr_bp = 16;
+		sr_tb = 0;
+	}
+
+	mem_op = (sr_tb << 12) | (sr_bp << 8);
+	mem_op &= QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
+	mem_op |= QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
+	writel(mem_op, dev->csr_base + QUADSPI_MEM_OP_REG);
+
+	return 0;
+}
+
+static int altera_quadspi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	u32 mem_op;
+
+	dev_dbg(nor->dev, "Unlock all protected area\n");
+	mem_op = 0;
+	mem_op &= QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
+	mem_op |= QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
+	writel(mem_op, dev->csr_base + QUADSPI_MEM_OP_REG);
+
+	return 0;
+}
+
+static void altera_quadspi_chip_select(struct altera_quadspi *dev, u32 bank)
+{
+	u32 val = 0;
+
+	switch (bank) {
+	case 0:
+		val = QUADSPI_CHIP_SELECT_0;
+		break;
+	case 1:
+		val = QUADSPI_CHIP_SELECT_1;
+		break;
+	case 2:
+		val = QUADSPI_CHIP_SELECT_2;
+		break;
+	default:
+		return;
+	}
+	writel(val, dev->csr_base + QUADSPI_CHIP_SELECT_REG);
+}
+
+
+static int altera_quadspi_probe_config_dt(struct platform_device *pdev,
+					  struct device_node *np,
+					  struct altera_quadspi_plat *pdata)
+{
+	struct device_node *pp = NULL;
+	struct resource *quadspi_res;
+	int i = 0;
+
+	pdata->is_epcs = of_property_read_bool(np, "is-epcs");
+
+	quadspi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "csr_base");
+	pdata->csr_base = devm_ioremap_resource(&pdev->dev, quadspi_res);
+	if (IS_ERR(pdata->csr_base)) {
+		dev_err(&pdev->dev, "%s: ERROR: failed to map csr base\n",
+			__func__);
+		return PTR_ERR(pdata->csr_base);
+	}
+
+	quadspi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "data_base");
+	pdata->data_base = devm_ioremap_resource(&pdev->dev, quadspi_res);
+	if (IS_ERR(pdata->data_base)) {
+		dev_err(&pdev->dev, "%s: ERROR: failed to map data base\n",
+			__func__);
+		return PTR_ERR(pdata->data_base);
+	}
+
+	/* Fill structs for each subnode (flash device) */
+	for_each_available_child_of_node(np, pp) {
+		/* Read bank id from DT */
+		pdata->np[i] = pp;
+		i++;
+	}
+	pdata->num_flashes = i;
+	return 0;
+}
+
+static const char *get_flash_name(struct spi_nor *nor)
+{
+	struct altera_quadspi_flash *flash = nor->priv;
+	struct altera_quadspi *dev = flash->priv;
+	int index;
+	int ret;
+	u8 id = 0;
+	u8 opcode_id;
+
+	opcode_id = dev->is_epcs ? EPCS_OPCODE_ID : EPCQ_OPCODE_ID;
+	ret = nor->read_reg(nor, SPINOR_OP_RDID, &id, 1);
+	if (ret)
+		return NULL;
+	for (index = 0; index < ARRAY_SIZE(flash_devices); index++) {
+		if (flash_devices[index].device_id == id &&
+		    flash_devices[index].opcode_id == opcode_id)
+			return flash_devices[index].name;
+	}
+
+	/* Memory chip is not listed and not supported */
+	return NULL;
+}
+
+static int altera_quadspi_setup_banks(struct platform_device *pdev,
+				   u32 bank, struct device_node *np)
+{
+	struct altera_quadspi *dev = platform_get_drvdata(pdev);
+	struct mtd_part_parser_data ppdata = {};
+	struct altera_quadspi_flash *flash;
+	struct spi_nor *nor;
+	int ret = 0;
+	char modalias[40];
+	const char *flash_name;
+
+	altera_quadspi_chip_select(dev, bank);
+
+	if (bank > dev->num_flashes - 1)
+		return -EINVAL;
+
+	flash = devm_kzalloc(&pdev->dev, sizeof(*flash), GFP_KERNEL);
+	if (!flash)
+		return -ENOMEM;
+
+	dev->flash[bank] = flash;
+	nor = &flash->nor;
+	nor->mtd = &flash->mtd;
+	nor->dev = &pdev->dev;
+	nor->priv = flash;
+	flash->mtd.priv = nor;
+	flash->priv = dev;
+
+	/* spi nor framework*/
+	nor->read_reg = altera_quadspi_read_reg;
+	nor->write_reg = altera_quadspi_write_reg;
+	nor->read = altera_quadspi_read;
+	nor->write = altera_quadspi_write;
+	nor->erase = altera_quadspi_erase;
+	nor->flash_lock = altera_quadspi_lock;
+	nor->flash_unlock = altera_quadspi_unlock;
+
+	if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
+		return -EINVAL;
+
+	flash_name = get_flash_name(nor);
+	if (flash_name == NULL)
+		return -EINVAL;
+
+	if (strcmp(flash_name, modalias) != 0) {
+		dev_err(nor->dev,
+			"flash name %s mismatch with device tree %s\n",
+			flash_name, modalias);
+		return -EINVAL;
+	}
+	ret = spi_nor_scan(nor, flash_name, SPI_NOR_QUAD);
+		if (ret)
+			return ret;
+
+	ppdata.of_node = np;
+
+	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata, NULL, 0);
+}
+
+static int altera_quadspi_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct altera_quadspi_plat *pdata = NULL;
+	struct altera_quadspi *dev;
+	int ret = 0;
+	int i;
+
+	if (!np) {
+		ret = -ENODEV;
+		dev_err(&pdev->dev, "no device found\n");
+		goto err;
+	}
+
+	pdata = devm_kzalloc(&pdev->dev,
+			     sizeof(struct altera_quadspi_plat),
+			     GFP_KERNEL);
+
+	if (!pdata) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = altera_quadspi_probe_config_dt(pdev, np, pdata);
+	if (ret) {
+		ret = -ENODEV;
+		dev_err(&pdev->dev, "probe fail\n");
+		goto err;
+	}
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	dev->is_epcs = pdata->is_epcs;
+	dev->csr_base = pdata->csr_base;
+	dev->data_base = pdata->data_base;
+
+	/* check number of flashes */
+	dev->num_flashes = pdata->num_flashes;
+	if (dev->num_flashes > MAX_NUM_FLASH_CHIP) {
+		dev_err(&pdev->dev, "exceeding max number of flashes\n");
+		dev->num_flashes = MAX_NUM_FLASH_CHIP;
+	}
+
+	/* check clock */
+	dev->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(dev->clk)) {
+		ret = PTR_ERR(dev->clk);
+		goto err;
+	}
+	ret = clk_prepare_enable(dev->clk);
+	if (ret)
+		goto err;
+
+	platform_set_drvdata(pdev, dev);
+
+	/* loop for each flash which is connected to quadspi */
+	for (i = 0; i < dev->num_flashes; i++) {
+		ret = altera_quadspi_setup_banks(pdev, i, pdata->np[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "bank setup failed\n");
+			goto err_bank_setup;
+		}
+	}
+
+	return 0;
+
+err_bank_setup:
+	clk_disable_unprepare(dev->clk);
+err:
+	return ret;
+}
+
+static int altera_quadspi_remove(struct platform_device *pdev)
+{
+	struct altera_quadspi *dev;
+	struct altera_quadspi_flash *flash;
+	int ret, i;
+
+	dev = platform_get_drvdata(pdev);
+
+	/* clean up for all nor flash */
+	for (i = 0; i < dev->num_flashes; i++) {
+		flash = dev->flash[i];
+		if (!flash)
+			continue;
+
+		/* clean up mtd stuff */
+		ret = mtd_device_unregister(&flash->mtd);
+		if (ret)
+			dev_err(&pdev->dev, "error removing mtd\n");
+	}
+
+	clk_disable_unprepare(dev->clk);
+
+	return 0;
+}
+
+static const struct of_device_id altera_quadspi_id_table[] = {
+	{ .compatible = "altr,quadspi-1.0" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, altera_quadspi_id_table);
+
+static struct platform_driver altera_quadspi_driver = {
+	.driver = {
+		.name = ALTERA_QUADSPI_RESOURCE_NAME,
+		.bus = &platform_bus_type,
+		.of_match_table = altera_quadspi_id_table,
+	},
+	.probe = altera_quadspi_probe,
+	.remove = altera_quadspi_remove,
+};
+module_platform_driver(altera_quadspi_driver);
+
+MODULE_AUTHOR("Viet Nga Dao <vndao@altera.com>");
+MODULE_DESCRIPTION("Altera QuadSPI Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 43bb552..ad0c274 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -683,6 +683,17 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+
+	/* Altera EPCQ/EPCS Flashes */
+	{ "epcq16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
+	{ "epcq32-nonjedec",  INFO(0, 0, 0x10000, 64,   0) },
+	{ "epcq64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
+	{ "epcq128-nonjedec", INFO(0, 0, 0x10000, 256,  0) },
+	{ "epcq256-nonjedec", INFO(0, 0, 0x10000, 512,  0) },
+	{ "epcq512-nonjedec", INFO(0, 0, 0x10000, 1024, 0) },
+	{ "epcs16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
+	{ "epcs64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
+	{ "epcs128-nonjedec", INFO(0, 0, 0x40000, 256,  0) },
 	{ },
 };
 
-- 
1.7.11.GIT


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
