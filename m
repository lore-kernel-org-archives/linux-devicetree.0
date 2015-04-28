From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH v3 2/2] mtd: nand: driver for Conexant Digicolor NAND Flash Controller
Date: Tue, 28 Apr 2015 15:19:19 +0300
Message-ID: <ca5f3e97ba1844c19a03b2fe69ff34456c92d339.1430223559.git.baruch@tkos.co.il>
References: <2bba276e3a1808a9fc49d30cabe8d9de8bc60efd.1430223559.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2bba276e3a1808a9fc49d30cabe8d9de8bc60efd.1430223559.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds driver for the NAND flash controller on the CX92755 So=
C. This
SoC is one of the Conexant Digicolor series, and this driver should sup=
port
other SoCs in this series.

Only hardware syndrome ECC mode is currently supported.

This driver was tested on the Equinox CX92755 EVK, with the Samsung K9G=
AG08U0E
NAND chip (MLC, 8K pages, 436 bytes OOB). Test included attach of UBI v=
olume,
mount of UBIFS filesystem, and files read/write.

The driver was also tested by all MTD tests (except torturetest), and p=
assed
all of them. For oobtest the bitflip_limit parameter was set to 2.

Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
v3:
   Default to hw_syndrome ecc mode when the nand-ecc-mode property is m=
issing
   (Boris Brezillon).

v2:
   * Address review comments of Boris Brezillon:
     - Fix MODULE_DEVICE_TABLE name
     - Remove digicolor_nfc_wait_ready() specific ops
     - Extend the comment on CMD_NUMBER_BYTES definition
     - Split bch_configs[] initialization from struct definition
     - digicolor_nfc_cmd_write() returns error on timeout
     - Differentiate between ETIMEDOUT and EIO in digicolor_nfc_ecc_sta=
tus()
     - Bail out of digicolor_nfc_read_page_syndrome() on ECC status tim=
eout
     - Remove redundant digicolor_nfc_dev_ready() after NAND_CMD_RESET
     - Fallback to ecc_strength_ds/ecc_step_ds when there are no ECC
       configuration DT properties
     - Add a comment explaining buffer tail handling in digicolor_nfc_r=
w_buf()
     - Split per-NAND chip fields into a separate struct
     - Use nand_sdr_timings to calculate signal timing configuration
     - dev_ready() returns 1 only when the chip is actually ready

   * Other changes:
     - Use readl_poll_timeout() in digicolor_nfc_wait_ready() instead o=
f open
       coding the same functionality
     - Use memcpy() for buffer tail in digicolor_nfc_rw_buf()
     - Add ecc.write_oob that does the equivalent of ecc.read_oob; this=
 fixes
       mtd_oobtest
     - Update commit message to reflect mtd tests status
     - Allow up to 4 bitflips on average per 1K of blank page; fixes
       mtd_oobtest error
---
 drivers/mtd/nand/Kconfig          |   6 +
 drivers/mtd/nand/Makefile         |   1 +
 drivers/mtd/nand/digicolor_nand.c | 665 ++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 672 insertions(+)
 create mode 100644 drivers/mtd/nand/digicolor_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d8fa5a..a7a5039ce357 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -530,4 +530,10 @@ config MTD_NAND_HISI504
 	help
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
=20
+config MTD_NAND_DIGICOLOR
+	tristate "Support for NAND on Conexant Digicolor SoCs"
+	depends on ARCH_DIGICOLOR
+	help
+	  Enables support for NAND Flash chips on Conexant Digicolor SoCs.
+
 endif # MTD_NAND
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 582bbd05aff7..1ae4cf0eec08 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -52,5 +52,6 @@ obj-$(CONFIG_MTD_NAND_XWAY)		+=3D xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+=3D bcm47xxnflash/
 obj-$(CONFIG_MTD_NAND_SUNXI)		+=3D sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        +=3D hisi504_nand.o
+obj-$(CONFIG_MTD_NAND_DIGICOLOR)	+=3D digicolor_nand.o
=20
 nand-objs :=3D nand_base.o nand_bbt.o nand_timings.o
diff --git a/drivers/mtd/nand/digicolor_nand.c b/drivers/mtd/nand/digic=
olor_nand.c
new file mode 100644
index 000000000000..630552cdb668
--- /dev/null
+++ b/drivers/mtd/nand/digicolor_nand.c
@@ -0,0 +1,665 @@
+/*
+ *  Driver for Conexant Digicolor NAND Flash Controller
+ *
+ * Author: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
+ *
+ * Copyright (C) 2014, 2015 Paradox Innovation Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_mtd.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#define DRIVER_NAME "digicolor_nand"
+
+#define NFC_CONTROL			0x180
+#define NFC_CONTROL_LOCAL_RESET		BIT(0)
+#define NFC_CONTROL_ENABLE		BIT(1)
+#define NFC_CONTROL_BCH_TCONFIG(n)	((n) << 13)
+#define NFC_CONTROL_BCH_KCONFIG		(77 << 16)
+#define NFC_CONTROL_BCH_DATA_FIELD_RANGE_1024	BIT(30)
+
+#define NFC_STATUS_1			0x18c
+#define NFC_STATUS_1_CORRECTABLE_ERRORS(reg)	(((reg) >> 16) & 0x7ff)
+#define NFC_STATUS_1_UNCORRECTED_ERROR	BIT(31)
+
+#define NFC_COMMAND			0x1a0
+#define NFC_COMMAND_CODE_OFF		28
+#define CMD_CHIP_ENABLE(n)		((~(1 << (n)) & 0xf) << 20)
+#define CMD_STOP_ON_COMPLETE		BIT(15)
+#define CMD_ECC_ENABLE			BIT(13)
+#define CMD_TOGGLE			BIT(13) /* WAIT READY command */
+#define CMD_ECC_STATUS			BIT(12)
+#define CMD_RB_DATA			BIT(12) /* WAIT READY command */
+#define CMD_NUMBER_BYTES(n)		((n) << 8) /* CLE/ALE commands */
+#define CMD_SKIP_LENGTH(n)		(((n) & 0xf) << 8) /* READ/WRITE */
+#define CMD_SKIP_OFFSET(n)		((n) << 16)
+#define CMD_RB_MASK(n)			((1 << (n)) & 0xf)
+#define CMD_IMMEDIATE_DATA		0xff /* bad block mark */
+
+#define CMD_CLE				(0 << NFC_COMMAND_CODE_OFF)
+#define CMD_ALE				(1 << NFC_COMMAND_CODE_OFF)
+#define CMD_PAGEREAD			(2 << NFC_COMMAND_CODE_OFF)
+#define CMD_PAGEWRITE			(3 << NFC_COMMAND_CODE_OFF)
+#define CMD_WAITREADY			(4 << NFC_COMMAND_CODE_OFF)
+#define CMD_WAIT			(5 << NFC_COMMAND_CODE_OFF)
+
+#define NFC_DATA			0x1c0
+#define ALE_DATA_OFF(n)			(((n)-1)*8)
+
+#define NFC_TIMING_CONFIG		0x1c4
+#define TIMING_ASSERT(clk)		((clk) & 0xff)
+#define TIMING_DEASSERT(clk)		(((clk) & 0xff) << 8)
+#define TIMING_SAMPLE(clk)		(((clk) & 0xf) << 24)
+
+#define NFC_INTFLAG_CLEAR		0x1c8
+#define NFC_INT_CMD_READY		BIT(8)
+#define NFC_INT_DATA_READ_READY		BIT(9)
+#define NFC_INT_DATA_WRITE_READY	BIT(10)
+#define NFC_INT_COMMAND_COMPLETE_READY	BIT(11)
+#define NFC_INT_ECC_STATUS_READY	BIT(12)
+#define RDY(op)				NFC_INT_##op##_READY
+
+#define INITIAL_TCCS	500 /* ns; from the ONFI spec version 4.0, =C2=A7=
4.17.1 */
+#define TIMEOUT_MS	100
+
+struct digicolor_nand {
+	struct mtd_info		mtd;
+	struct nand_chip	nand;
+
+	u32 cs;
+	int t_ccs;
+};
+
+struct digicolor_nfc {
+	void __iomem		*regs;
+	struct device		*dev;
+	unsigned long		clk_rate;
+
+	u32 ale_cmd;
+	u32 ale_data;
+	int ale_data_bytes;
+	int ready_wait;
+
+	/* Only one NAND chip supported for now */
+	struct digicolor_nand	dc_nand;
+};
+
+struct bch_configs_t {
+	int bits;	/* correctable error bits number (strength) per step */
+	int r_bytes;	/* extra bytes needed per step */
+};
+
+/*
+ * Table of BCH configuration options. The index of this table (0 - 5)=
 is set
+ * in the BchTconfig field of the NFC_CONTROL register.
+ */
+struct bch_configs_t bch_configs[] =3D {
+	{  6, 11 },
+	{  7, 13 },
+	{  8, 14 },
+	{ 24, 42 },
+	{ 28, 49 },
+	{ 30, 53 },
+};
+
+static int digicolor_nfc_buf_blank(const uint8_t *buf, int len)
+{
+	const uint32_t *p =3D (const uint32_t *)buf;
+	int bitflip_limit =3D (len/1024) * 4;
+	u32 res;
+	int i;
+	unsigned int bitflips =3D 0;
+
+	for (i =3D 0; i < (len >> 2); i++) {
+		res =3D p[i] ^ 0xffffffff;
+		if (res)
+			bitflips +=3D hweight32(res);
+	}
+
+	return bitflips <=3D bitflip_limit;
+}
+
+static int digicolor_nfc_wait_ready(struct digicolor_nfc *nfc, u32 mas=
k)
+{
+	u32 status;
+	int ret;
+
+	ret =3D readl_poll_timeout(nfc->regs + NFC_INTFLAG_CLEAR, status,
+				 status & mask, 0, TIMEOUT_MS*1000);
+	if (ret =3D=3D -ETIMEDOUT)
+		dev_err(nfc->dev, "register ready timeout (mask: %08x)\n",
+			mask);
+
+	return ret;
+}
+
+static int digicolor_nfc_cmd_write(struct digicolor_nfc *nfc, u32 data=
)
+{
+	if (digicolor_nfc_wait_ready(nfc, RDY(CMD)))
+		return -ETIMEDOUT;
+	writel_relaxed(data, nfc->regs + NFC_COMMAND);
+
+	return 0;
+}
+
+static int digicolor_nfc_ecc_status(struct digicolor_nfc *nfc)
+{
+	u32 status;
+
+	if (digicolor_nfc_wait_ready(nfc, RDY(ECC_STATUS)))
+		return -ETIMEDOUT;
+
+	status =3D readl_relaxed(nfc->regs + NFC_STATUS_1);
+	writel_relaxed(NFC_INT_ECC_STATUS_READY, nfc->regs + NFC_INTFLAG_CLEA=
R);
+
+	if (status & NFC_STATUS_1_UNCORRECTED_ERROR)
+		return -EIO;
+
+	return NFC_STATUS_1_CORRECTABLE_ERRORS(status);
+}
+
+static void digicolor_nfc_wait_ns(struct digicolor_nfc *nfc, int wait_=
ns)
+{
+	uint64_t tmp =3D ((uint64_t) nfc->clk_rate * wait_ns);
+	u8 clk;
+
+	do_div(tmp, NSEC_PER_SEC);
+	clk =3D tmp > 0xff ? 0xff : tmp;
+	digicolor_nfc_cmd_write(nfc, CMD_WAIT | clk);
+}
+
+static int digicolor_nfc_dev_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+	u32 readready, status;
+	u32 cs =3D nfc->dc_nand.cs;
+
+	if (nfc->ready_wait) {
+		status =3D readl_relaxed(nfc->regs + NFC_INTFLAG_CLEAR);
+		if (status & RDY(COMMAND_COMPLETE)) {
+			nfc->ready_wait =3D 0;
+			writel_relaxed(RDY(COMMAND_COMPLETE),
+				       nfc->regs + NFC_INTFLAG_CLEAR);
+			return 1;
+		}
+		return 0;
+	}
+
+	readready =3D CMD_WAITREADY | CMD_CHIP_ENABLE(cs) | CMD_RB_MASK(cs)
+		| CMD_TOGGLE | CMD_RB_DATA | CMD_STOP_ON_COMPLETE;
+	digicolor_nfc_cmd_write(nfc, readready);
+	nfc->ready_wait =3D 1;
+
+	return 0;
+}
+
+static void digicolor_nfc_cmd_ctrl(struct mtd_info *mtd, int cmd,
+				   unsigned int ctrl)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+	u32 cs =3D nfc->dc_nand.cs;
+
+	if (ctrl & NAND_CLE) {
+		digicolor_nfc_cmd_write(nfc,
+					CMD_CLE | CMD_CHIP_ENABLE(cs) | cmd);
+		if (cmd =3D=3D NAND_CMD_RNDOUTSTART || cmd =3D=3D NAND_CMD_RNDIN) {
+			digicolor_nfc_wait_ns(nfc, nfc->dc_nand.t_ccs);
+		} else if (cmd =3D=3D NAND_CMD_RESET) {
+			digicolor_nfc_wait_ns(nfc, 200);
+		}
+	} else if (ctrl & NAND_ALE) {
+		if (ctrl & NAND_CTRL_CHANGE) {
+			/* First ALE data byte */
+			nfc->ale_cmd =3D CMD_ALE | CMD_CHIP_ENABLE(cs)
+				| (cmd & 0xff);
+			nfc->ale_data_bytes++;
+			return;
+		}
+		/* More ALE data bytes. Assume no more than 5 address cycles */
+		nfc->ale_data |=3D cmd << ALE_DATA_OFF(nfc->ale_data_bytes++);
+		return;
+	} else if (nfc->ale_data_bytes > 0) {
+		/* Finish ALE */
+		nfc->ale_cmd |=3D CMD_NUMBER_BYTES(nfc->ale_data_bytes - 1);
+		digicolor_nfc_cmd_write(nfc, nfc->ale_cmd);
+		if (nfc->ale_data_bytes > 1)
+			digicolor_nfc_cmd_write(nfc, nfc->ale_data);
+		nfc->ale_data_bytes =3D nfc->ale_data =3D 0;
+	}
+}
+
+static uint8_t digicolor_nfc_rw_byte(struct digicolor_nfc *nfc, int by=
te)
+{
+	bool read =3D (byte =3D=3D -1);
+	u32 cs =3D nfc->dc_nand.cs;
+
+	digicolor_nfc_cmd_write(nfc, read ? CMD_PAGEREAD : CMD_PAGEWRITE
+				| CMD_CHIP_ENABLE(cs));
+	digicolor_nfc_cmd_write(nfc, 1);
+
+	if (digicolor_nfc_wait_ready(nfc, read ?
+				     RDY(DATA_READ) : RDY(DATA_WRITE)))
+		return 0;
+
+	if (read)
+		return readl_relaxed(nfc->regs + NFC_DATA);
+	else
+		writel_relaxed(byte & 0xff, nfc->regs + NFC_DATA);
+
+	return 0;
+}
+
+static uint8_t digicolor_nfc_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+
+	return digicolor_nfc_rw_byte(nfc, -1);
+}
+
+static void digicolor_nfc_write_byte(struct mtd_info *mtd, uint8_t byt=
e)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+
+	digicolor_nfc_rw_byte(nfc, byte);
+}
+
+static void digicolor_nfc_rw_buf(struct digicolor_nfc *nfc, uint8_t *r=
ead_buf,
+				 const uint8_t *write_buf, int len, bool ecc)
+{
+	struct mtd_info *mtd =3D &nfc->dc_nand.mtd;
+	uint32_t *pr =3D (uint32_t *)read_buf;
+	const uint32_t *pw =3D (const uint32_t *)write_buf;
+	u32 cs =3D nfc->dc_nand.cs;
+	bool read =3D (read_buf !=3D NULL);
+	u32 op =3D read ? RDY(DATA_READ) : RDY(DATA_WRITE);
+	int i;
+	u32 cmd, data;
+
+	cmd =3D read_buf ? CMD_PAGEREAD : CMD_PAGEWRITE;
+	cmd |=3D CMD_CHIP_ENABLE(cs);
+	data =3D len & 0xffff;
+	if (ecc) {
+		cmd |=3D CMD_ECC_ENABLE | CMD_SKIP_LENGTH(1);
+		if (read)
+			cmd |=3D CMD_ECC_STATUS;
+		else
+			cmd |=3D CMD_IMMEDIATE_DATA;
+		data |=3D CMD_SKIP_OFFSET(mtd->writesize);
+	}
+
+	if (digicolor_nfc_cmd_write(nfc, cmd))
+		return;
+	if (digicolor_nfc_cmd_write(nfc, data))
+		return;
+
+	while (len >=3D 4) {
+		if (digicolor_nfc_wait_ready(nfc, op))
+			return;
+		if (read)
+			*pr++ =3D readl_relaxed(nfc->regs + NFC_DATA);
+		else
+			writel_relaxed(*pw++, nfc->regs + NFC_DATA);
+		len -=3D 4;
+	}
+
+	/*
+	 * The NFC_DATA register is 32bit wide, so we must write 4 bytes at a
+	 * time. In case we have a tail of less than 4 bytes (this might
+	 * happen when reading/writing the OOB area) we stuff these bytes int=
o
+	 * the last register access.
+	 */
+	if (len > 0) {
+		u32 buf_tail =3D 0;
+
+		if (digicolor_nfc_wait_ready(nfc, op))
+			return;
+		if (read) {
+			buf_tail =3D readl_relaxed(nfc->regs + NFC_DATA);
+			memcpy(pr, &buf_tail, i);
+		} else {
+			memcpy(&buf_tail, pw, i);
+			writel_relaxed(buf_tail, nfc->regs + NFC_DATA);
+		}
+	}
+}
+
+static void digicolor_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf,=
 int len)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+
+	digicolor_nfc_rw_buf(nfc, buf, NULL, len, false);
+}
+
+static void digicolor_nfc_write_buf(struct mtd_info *mtd, const uint8_=
t *buf,
+				    int len)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	struct digicolor_nfc *nfc =3D chip->priv;
+
+	digicolor_nfc_rw_buf(nfc, NULL, buf, len, false);
+}
+
+static int digicolor_nfc_read_page_syndrome(struct mtd_info *mtd,
+					    struct nand_chip *chip,
+					    uint8_t *buf, int oob_required,
+					    int page)
+{
+	struct digicolor_nfc *nfc =3D chip->priv;
+	int step, ecc_stat;
+	struct nand_oobfree *oobfree =3D &chip->ecc.layout->oobfree[0];
+	u8 *oob =3D chip->oob_poi + oobfree->offset;
+	unsigned int max_bitflips =3D 0;
+
+	for (step =3D 0; step < chip->ecc.steps; step++) {
+		digicolor_nfc_rw_buf(nfc, buf, NULL, chip->ecc.size, true);
+
+		ecc_stat =3D digicolor_nfc_ecc_status(nfc);
+		if (ecc_stat =3D=3D -EIO) {
+			if (!digicolor_nfc_buf_blank(buf, chip->ecc.size)) {
+				mtd->ecc_stats.failed++;
+				printk("%s: page: %d oob: %d\n", __func__,
+				       page, oob_required);
+			}
+		} else if (ecc_stat < 0) {
+			return ecc_stat;
+		} else /* ecc_stat >=3D 0 */ {
+			mtd->ecc_stats.corrected +=3D ecc_stat;
+			max_bitflips =3D max_t(unsigned int, max_bitflips,
+					     ecc_stat);
+		}
+
+		buf +=3D chip->ecc.size;
+	}
+
+	if (oob_required)
+		digicolor_nfc_rw_buf(nfc, oob, NULL, oobfree->length, false);
+
+	return max_bitflips;
+}
+
+static int digicolor_nfc_write_page_syndrome(struct mtd_info *mtd,
+					     struct nand_chip *chip,
+					     const uint8_t *buf,
+					     int oob_required)
+{
+	struct digicolor_nfc *nfc =3D chip->priv;
+	struct nand_oobfree *oobfree =3D &chip->ecc.layout->oobfree[0];
+	u8 *oob =3D chip->oob_poi + oobfree->offset;
+
+	digicolor_nfc_rw_buf(nfc, NULL, buf, mtd->writesize, true);
+
+	if (oob_required)
+		digicolor_nfc_rw_buf(nfc, NULL, oob, oobfree->length, false);
+
+	return 0;
+}
+
+static int digicolor_nfc_read_oob_syndrome(struct mtd_info *mtd,
+					   struct nand_chip *chip, int page)
+{
+	struct digicolor_nfc *nfc =3D chip->priv;
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, mtd->writesize, page);
+	digicolor_nfc_rw_buf(nfc, chip->oob_poi, NULL, mtd->oobsize, false);
+
+	return 0;
+}
+
+static int digicolor_nfc_write_oob_syndrome(struct mtd_info *mtd,
+					    struct nand_chip *chip, int page)
+{
+	struct digicolor_nfc *nfc =3D chip->priv;
+	int status;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
+	digicolor_nfc_rw_buf(nfc, NULL, chip->oob_poi, mtd->oobsize, false);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status =3D chip->waitfunc(mtd, chip);
+
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
+}
+
+static void digicolor_nfc_hw_init(struct digicolor_nfc *nfc)
+{
+	struct nand_chip *nand =3D &nfc->dc_nand.nand;
+	unsigned int ns_per_clk =3D NSEC_PER_SEC / nfc->clk_rate;
+	unsigned int ps_per_clk =3D ns_per_clk * 1000;
+	const struct nand_sdr_timings *timings;
+	u32 timing =3D 0;
+	u32 assert_t, deassert_t;
+	int sample_t;
+
+	writel_relaxed(NFC_CONTROL_LOCAL_RESET, nfc->regs + NFC_CONTROL);
+	udelay(10);
+	writel_relaxed(0, nfc->regs + NFC_CONTROL);
+	udelay(5);
+
+	timings =3D onfi_async_timing_mode_to_sdr_timings(
+		nand->onfi_timing_mode_default);
+
+	deassert_t =3D max(timings->tWH_min, timings->tREH_min);
+	timing |=3D TIMING_DEASSERT(DIV_ROUND_UP(deassert_t, ps_per_clk));
+
+	assert_t =3D max(max(timings->tRC_min, timings->tRP_min),
+		       max(timings->tWC_min, timings->tWP_min));
+	timing |=3D TIMING_ASSERT(DIV_ROUND_UP(assert_t, ps_per_clk));
+
+	sample_t =3D max_t(int, 0,
+			 timings->tREA_max + timings->tRHOH_min - assert_t);
+	timing |=3D TIMING_SAMPLE(DIV_ROUND_UP(sample_t, ps_per_clk));
+
+	writel_relaxed(timing, nfc->regs + NFC_TIMING_CONFIG);
+	writel_relaxed(NFC_CONTROL_ENABLE, nfc->regs + NFC_CONTROL);
+}
+
+static int digicolor_nfc_ecc_init(struct digicolor_nfc *nfc,
+				  struct device_node *np)
+{
+	struct mtd_info *mtd =3D &nfc->dc_nand.mtd;
+	struct nand_chip *chip =3D &nfc->dc_nand.nand;
+	int bch_data_range, bch_t, steps, mode, i;
+	u32 ctrl =3D NFC_CONTROL_ENABLE | NFC_CONTROL_BCH_KCONFIG;
+	struct nand_ecclayout *layout;
+
+	mode =3D of_get_nand_ecc_mode(np);
+	if (mode =3D=3D -EINVAL)
+		mode =3D NAND_ECC_HW_SYNDROME;
+	if (mode < 0)
+		return mode;
+	if (mode !=3D NAND_ECC_HW_SYNDROME) {
+		dev_err(nfc->dev, "unsupported ECC mode\n");
+		return -EINVAL;
+	}
+
+	bch_data_range =3D of_get_nand_ecc_step_size(np);
+	if (bch_data_range < 0)
+		bch_data_range =3D chip->ecc_step_ds;
+	if (bch_data_range !=3D 512 && bch_data_range !=3D 1024) {
+		dev_err(nfc->dev, "unsupported ECC step value (%d)\n",
+			bch_data_range);
+		return -EINVAL;
+	}
+	if (bch_data_range =3D=3D 1024)
+		ctrl |=3D NFC_CONTROL_BCH_DATA_FIELD_RANGE_1024;
+	steps =3D mtd->writesize / bch_data_range;
+
+	bch_t =3D of_get_nand_ecc_strength(np);
+	if (bch_t < 0)
+		bch_t =3D chip->ecc_strength_ds;
+	for (i =3D 0; i < ARRAY_SIZE(bch_configs); i++)
+		if (bch_configs[i].bits >=3D bch_t)
+			break;
+	if (i >=3D ARRAY_SIZE(bch_configs)) {
+		dev_err(nfc->dev, "unsupported ECC strength value (%d)\n",
+			bch_t);
+		return -EINVAL;
+	}
+	if (bch_configs[i].r_bytes * steps > (mtd->oobsize-1)) {
+		dev_err(nfc->dev, "OOB too small for selected ECC strength\n");
+		return -EINVAL;
+	}
+	ctrl |=3D NFC_CONTROL_BCH_TCONFIG(i);
+
+	writel_relaxed(ctrl, nfc->regs + NFC_CONTROL);
+
+	chip->ecc.size =3D bch_data_range;
+	chip->ecc.strength =3D bch_t;
+	chip->ecc.bytes =3D bch_configs[i].r_bytes;
+	chip->ecc.steps =3D steps;
+	chip->ecc.mode =3D mode;
+	chip->ecc.read_page =3D digicolor_nfc_read_page_syndrome;
+	chip->ecc.write_page =3D digicolor_nfc_write_page_syndrome;
+	chip->ecc.read_oob =3D digicolor_nfc_read_oob_syndrome;
+	chip->ecc.write_oob =3D digicolor_nfc_write_oob_syndrome;
+
+	layout =3D devm_kzalloc(nfc->dev, sizeof(*layout), GFP_KERNEL);
+	if (layout =3D=3D NULL)
+		return -ENOMEM;
+	layout->eccbytes =3D chip->ecc.bytes * steps;
+	/* leave 1 byte for bad block mark at the beginning of oob */
+	for (i =3D 0; i < layout->eccbytes; i++)
+		layout->eccpos[i] =3D i + 1;
+	layout->oobfree[0].length =3D mtd->oobsize - layout->eccbytes - 1;
+	layout->oobfree[0].offset =3D layout->eccbytes + 1;
+
+	chip->ecc.layout =3D layout;
+
+	return 0;
+}
+
+static int digicolor_nfc_probe(struct platform_device *pdev)
+{
+	struct mtd_info *mtd;
+	struct nand_chip *chip;
+	struct digicolor_nfc *nfc;
+	struct resource *r;
+	struct clk *clk;
+	struct device_node *nand_np;
+	struct mtd_part_parser_data ppdata;
+	int irq, ret;
+	u32 cs;
+
+	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	nfc->dev =3D &pdev->dev;
+	chip =3D &nfc->dc_nand.nand;
+	mtd =3D &nfc->dc_nand.mtd;
+	mtd->priv =3D chip;
+	mtd->dev.parent =3D &pdev->dev;
+	mtd->owner =3D THIS_MODULE;
+	mtd->name =3D DRIVER_NAME;
+
+	chip->priv =3D nfc;
+	chip->cmd_ctrl =3D digicolor_nfc_cmd_ctrl;
+	chip->read_byte =3D digicolor_nfc_read_byte;
+	chip->read_buf =3D digicolor_nfc_read_buf;
+	chip->write_byte =3D digicolor_nfc_write_byte;
+	chip->write_buf =3D digicolor_nfc_write_buf;
+	chip->dev_ready =3D digicolor_nfc_dev_ready;
+
+	clk =3D devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	nfc->clk_rate =3D clk_get_rate(clk);
+
+	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nfc->regs =3D devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(nfc->regs))
+		return PTR_ERR(nfc->regs);
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (IS_ERR_VALUE(irq))
+		return irq;
+
+	if (of_get_child_count(pdev->dev.of_node) > 1)
+		dev_warn(&pdev->dev,
+			 "only one NAND chip is currently supported\n");
+	nand_np =3D of_get_next_available_child(pdev->dev.of_node, NULL);
+	if (!nand_np) {
+		dev_err(&pdev->dev, "missing NAND chip node\n");
+		return -ENXIO;
+	}
+	ret =3D of_property_read_u32(nand_np, "reg", &cs);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: no valid reg property\n",
+			nand_np->full_name);
+		return ret;
+	}
+	nfc->dc_nand.cs =3D cs;
+
+	nfc->dc_nand.t_ccs =3D INITIAL_TCCS;
+
+	digicolor_nfc_hw_init(nfc);
+
+	ret =3D nand_scan_ident(mtd, 1, NULL);
+	if (ret)
+		return ret;
+	ret =3D digicolor_nfc_ecc_init(nfc, nand_np);
+	if (ret)
+		return ret;
+	ret =3D nand_scan_tail(mtd);
+	if (ret)
+		return ret;
+
+	ppdata.of_node =3D nand_np;
+	ret =3D mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
+	if (ret) {
+		nand_release(mtd);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, nfc);
+
+	return 0;
+}
+
+static int digicolor_nfc_remove(struct platform_device *pdev)
+{
+	struct digicolor_nfc *nfc =3D platform_get_drvdata(pdev);
+
+	nand_release(&nfc->dc_nand.mtd);
+
+	return 0;
+}
+
+static const struct of_device_id digicolor_nfc_ids[] =3D {
+	{ .compatible =3D "cnxt,cx92755-nfc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, digicolor_nfc_ids);
+
+static struct platform_driver digicolor_nfc_driver =3D {
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.of_match_table =3D digicolor_nfc_ids,
+	},
+	.probe =3D digicolor_nfc_probe,
+	.remove =3D digicolor_nfc_remove,
+};
+module_platform_driver(digicolor_nfc_driver);
+
+MODULE_AUTHOR("Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>");
+MODULE_DESCRIPTION("Conexant Digicolor NAND Flash Controller");
+MODULE_LICENSE("GPL");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
