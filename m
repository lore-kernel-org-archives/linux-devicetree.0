Return-Path: <SRS0=F++/=RK=outlook.com=ruizhao@kernel.org>
From: Rui Zhao <ruizhao@outlook.com>
Subject: [PATCH v2 1/2] EDAC: add EDAC driver for DMC520
Date: Thu, 7 Mar 2019 01:24:01 +0000
Message-ID: <BN7PR08MB5572D3A5217C4749AC4E7DC4AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "okaya@kernel.org" <okaya@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, Rui Zhao <ruizhao@microsoft.com>
List-ID: <devicetree@vger.kernel.org>

From: Rui Zhao <ruizhao@microsoft.com>

New driver supports error detection and correction on
the devices with ARM DMC-520 memory controller.

Signed-off-by: Rui Zhao <ruizhao@microsoft.com>
---
 MAINTAINERS                |   6 +
 drivers/edac/Kconfig       |   7 +
 drivers/edac/Makefile      |   1 +
 drivers/edac/dmc520_edac.c | 619 +++++++++++++++++++++++++++++++++++++++++=
++++
 4 files changed, 633 insertions(+)
 create mode 100644 drivers/edac/dmc520_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f64f8d..5e20149 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5432,6 +5432,12 @@ F:	Documentation/driver-api/edac.rst
 F:	drivers/edac/
 F:	include/linux/edac.h
=20
+EDAC-DMC520
+M:	Rui Zhao <ruizhao@microsoft.com>
+L:	linux-edac@vger.kernel.org
+S:	Supported
+F:	drivers/edac/dmc520_edac.c
+
 EDAC-E752X
 M:	Mark Gross <mark.gross@intel.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index e286b5b..5484fa6 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -475,4 +475,11 @@ config EDAC_QCOM
 	  For debugging issues having to do with stability and overall system
 	  health, you should probably say 'Y' here.
=20
+config EDAC_DMC520
+	tristate "ARM DMC-520 ECC"
+	depends on ARM64
+	help
+	  Support for error detection and correction on the
+	  SoCs with ARM DMC-520 DRAM controller.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 716096d..793d64f 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -78,3 +78,4 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+=3D synopsys_edac.o
 obj-$(CONFIG_EDAC_XGENE)		+=3D xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+=3D ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+=3D qcom_edac.o
+obj-$(CONFIG_EDAC_DMC520)		+=3D dmc520_edac.o
diff --git a/drivers/edac/dmc520_edac.c b/drivers/edac/dmc520_edac.c
new file mode 100644
index 0000000..c70ce4e
--- /dev/null
+++ b/drivers/edac/dmc520_edac.c
@@ -0,0 +1,619 @@
+// SPDX-License-Identifier: GPL-2.0+
+// EDAC driver for DMC-520
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/edac.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/interrupt.h>
+#include <linux/bitfield.h>
+#include <edac_mc.h>
+
+// DMC-520 registers
+#define REG_OFFSET_FEATURE_CONFIG		0x130
+#define REG_OFFSET_ECC_ERRC_COUNT_31_00		0x158
+#define REG_OFFSET_ECC_ERRC_COUNT_63_32		0x15C
+#define REG_OFFSET_ECC_ERRD_COUNT_31_00		0x160
+#define REG_OFFSET_ECC_ERRD_COUNT_63_32		0x164
+#define REG_OFFSET_FEATURE_CONTROL_NEXT		0x1F0
+#define REG_OFFSET_INTERRUPT_CONTROL		0x500
+#define REG_OFFSET_INTERRUPT_CLR		0x508
+#define REG_OFFSET_INTERRUPT_STATUS		0x510
+#define REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_31_00	0x528
+#define REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_63_32	0x52C
+#define REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_31_00	0x530
+#define REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_63_32	0x534
+#define REG_OFFSET_ADDRESS_CONTROL_NOW		0x1010
+#define REG_OFFSET_DECODE_CONTROL_NOW		0x1014
+#define REG_OFFSET_MEMORY_TYPE_NOW		0x1128
+#define REG_OFFSET_SCRUB_CONTROL0_NOW		0x1170
+#define REG_OFFSET_SCRUB_CONTROL1_NOW		0x1180
+#define REG_OFFSET_SCRUB_CONTROL2_NOW		0x1190
+#define REG_OFFSET_SCRUB_CONTROL3_NOW		0x11A0
+#define REG_OFFSET_SCRUB_CONTROL4_NOW		0x11B0
+#define REG_OFFSET_SCRUB_CONTROL5_NOW		0x11C0
+#define REG_OFFSET_SCRUB_CONTROL6_NOW		0x11D0
+#define REG_OFFSET_SCRUB_CONTROL7_NOW		0x11E0
+
+// DMC-520 types, masks and bitfields
+#define MEMORY_TYPE_LPDDR3			0
+#define MEMORY_TYPE_DDR3			1
+#define MEMORY_TYPE_DDR4			2
+#define MEMORY_TYPE_LPDDR4			3
+
+#define MEMORY_DEV_WIDTH_X4			0
+#define MEMORY_DEV_WIDTH_X8			1
+#define MEMORY_DEV_WIDTH_X16			2
+#define MEMORY_DEV_WIDTH_X32			3
+
+#define DRAM_ECC_INT_CE_MASK			BIT(2)
+#define DRAM_ECC_INT_UE_MASK			BIT(3)
+#define DRAM_ECC_INT_CE_OVERFLOW_MASK		BIT(18)
+#define DRAM_ECC_INT_UE_OVERFLOW_MASK		BIT(19)
+#define ALL_INT_MASK				GENMASK(9, 0)
+#define SCRUB_CONTROL_MASK			GENMASK(12, 0)
+
+#define REG_FIELD_DRAM_ECC_ENABLED		GENMASK(1, 0)
+#define REG_FIELD_MEMORY_TYPE			GENMASK(2, 0)
+#define REG_FIELD_DEVICE_WIDTH			GENMASK(9, 8)
+#define REG_FIELD_ADDRESS_CONTROL_COL		GENMASK(2, 0)
+#define REG_FIELD_ADDRESS_CONTROL_ROW		GENMASK(10, 8)
+#define REG_FIELD_ADDRESS_CONTROL_BANK		GENMASK(18, 16)
+#define REG_FIELD_ADDRESS_CONTROL_RANK		GENMASK(25, 24)
+#define REG_FIELD_ERR_INFO_LOW_VALID		BIT(0)
+#define REG_FIELD_ERR_INFO_LOW_COL		GENMASK(10, 1)
+#define REG_FIELD_ERR_INFO_LOW_ROW		GENMASK(28, 11)
+#define REG_FIELD_ERR_INFO_LOW_RANK		GENMASK(31, 29)
+#define REG_FIELD_ERR_INFO_HIGH_BANK		GENMASK(3, 0)
+#define REG_FIELD_ERR_INFO_HIGH_VALID		BIT(31)
+
+#define DRAM_ECC_MIN_INT_OVERFLOW_ERROR_COUNT	256
+#define DRAM_ADDRESS_CONTROL_MIN_COL_BITS	8
+#define DRAM_ADDRESS_CONTROL_MIN_ROW_BITS	11
+#define DMC520_EDAC_ERR_GRAIN			1
+#define DMC520_BUS_WIDTH			8
+
+// Driver settings
+#define EDAC_MSG_BUF_SIZE			128
+#define EDAC_MOD_NAME				"dmc520-edac"
+#define EDAC_CTL_NAME				"dmc520"
+
+struct ecc_error_info {
+	u32 col;
+	u32 row;
+	u32 bank;
+	u32 rank;
+};
+
+struct dmc520_edac {
+	void __iomem *reg_base;
+	char message[EDAC_MSG_BUF_SIZE];
+};
+
+static int dmc520_mc_idx;
+
+static u32 dmc520_read_reg(struct dmc520_edac *edac, u32 offset)
+{
+	return readl(edac->reg_base + offset);
+}
+
+static void dmc520_write_reg(struct dmc520_edac *edac, u32 val, u32 offset=
)
+{
+	writel(val, edac->reg_base + offset);
+}
+
+static u32 dmc520_calc_dram_ecc_error(u32 value)
+{
+	u32 total =3D 0;
+
+	// Each rank's error counter takes one byte
+	while (value > 0) {
+		total +=3D (value & 0xFF);
+		value >>=3D 8;
+	}
+	return total;
+}
+
+static u32 dmc520_get_dram_ecc_error_count(struct dmc520_edac *edac,
+					   bool is_ce)
+{
+	u32 reg_offset_low, reg_offset_high;
+	u32 err_low, err_high;
+	u32 ce_count;
+
+	reg_offset_low =3D is_ce ? REG_OFFSET_ECC_ERRC_COUNT_31_00 :
+				 REG_OFFSET_ECC_ERRD_COUNT_31_00;
+	reg_offset_high =3D is_ce ? REG_OFFSET_ECC_ERRC_COUNT_63_32 :
+				  REG_OFFSET_ECC_ERRD_COUNT_63_32;
+
+	err_low =3D dmc520_read_reg(edac, reg_offset_low);
+	err_high =3D dmc520_read_reg(edac, reg_offset_high);
+
+	ce_count =3D dmc520_calc_dram_ecc_error(err_low) +
+		   dmc520_calc_dram_ecc_error(err_high);
+
+	// Reset error counters
+	dmc520_write_reg(edac, 0, reg_offset_low);
+	dmc520_write_reg(edac, 0, reg_offset_high);
+
+	return ce_count;
+}
+
+static bool dmc520_get_dram_ecc_error_info(struct dmc520_edac *edac,
+					   bool is_ce,
+					   struct ecc_error_info *info)
+{
+	u32 reg_offset_low, reg_offset_high;
+	u32 reg_val_low, reg_val_high;
+	bool valid;
+
+	reg_offset_low =3D is_ce ? REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_31_00 :
+				 REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_31_00;
+	reg_offset_high =3D is_ce ? REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_63_32 :
+				  REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_63_32;
+
+	reg_val_low =3D dmc520_read_reg(edac, reg_offset_low);
+	reg_val_high =3D dmc520_read_reg(edac, reg_offset_high);
+
+	valid =3D (FIELD_GET(REG_FIELD_ERR_INFO_LOW_VALID, reg_val_low) !=3D 0) &=
&
+		(FIELD_GET(REG_FIELD_ERR_INFO_HIGH_VALID, reg_val_high) !=3D 0);
+
+	if (info) {
+		if (valid) {
+			info->col =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_COL,
+					      reg_val_low);
+			info->row =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_ROW,
+					      reg_val_low);
+			info->rank =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_RANK,
+					       reg_val_low);
+			info->bank =3D FIELD_GET(REG_FIELD_ERR_INFO_HIGH_BANK,
+					       reg_val_high);
+		} else {
+			memset(info, 0, sizeof(struct ecc_error_info));
+		}
+	}
+
+	return valid;
+}
+
+static bool dmc520_is_ecc_enabled(struct dmc520_edac *edac)
+{
+	u32 reg_val =3D dmc520_read_reg(edac, REG_OFFSET_FEATURE_CONFIG);
+
+	return (FIELD_GET(REG_FIELD_DRAM_ECC_ENABLED, reg_val) !=3D 0);
+}
+
+static bool dmc520_is_scrub_configured(struct dmc520_edac *edac)
+{
+	int chan;
+	u32 scrub_control_offsets[] =3D {
+		REG_OFFSET_SCRUB_CONTROL0_NOW,
+		REG_OFFSET_SCRUB_CONTROL1_NOW,
+		REG_OFFSET_SCRUB_CONTROL2_NOW,
+		REG_OFFSET_SCRUB_CONTROL3_NOW,
+		REG_OFFSET_SCRUB_CONTROL4_NOW,
+		REG_OFFSET_SCRUB_CONTROL5_NOW,
+		REG_OFFSET_SCRUB_CONTROL6_NOW,
+		REG_OFFSET_SCRUB_CONTROL7_NOW
+	};
+
+	for (chan =3D 0; chan < ARRAY_SIZE(scrub_control_offsets); chan++) {
+		u32 val =3D dmc520_read_reg(edac, scrub_control_offsets[chan]);
+
+		if ((val & SCRUB_CONTROL_MASK) !=3D 0)
+			return true;
+	}
+
+	return false;
+}
+
+static enum mem_type dmc520_get_mtype(struct dmc520_edac *edac)
+{
+	enum mem_type mt;
+	u32 reg_val, type;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_MEMORY_TYPE_NOW);
+	type =3D FIELD_GET(REG_FIELD_MEMORY_TYPE, reg_val);
+
+	switch (type) {
+	case MEMORY_TYPE_LPDDR3:
+	case MEMORY_TYPE_DDR3:
+		mt =3D MEM_DDR3;
+		break;
+
+	case MEMORY_TYPE_DDR4:
+	case MEMORY_TYPE_LPDDR4:
+	default:
+		mt =3D MEM_DDR4;
+		break;
+	}
+	return mt;
+}
+
+static enum dev_type dmc520_get_dtype(struct dmc520_edac *edac)
+{
+	enum dev_type dt;
+	u32 reg_val, device_width;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_MEMORY_TYPE_NOW);
+	device_width =3D FIELD_GET(REG_FIELD_DEVICE_WIDTH, reg_val);
+
+	switch (device_width) {
+	case MEMORY_DEV_WIDTH_X4:
+		dt =3D DEV_X4;
+		break;
+
+	case MEMORY_DEV_WIDTH_X8:
+		dt =3D DEV_X8;
+		break;
+
+	case MEMORY_DEV_WIDTH_X16:
+		dt =3D DEV_X16;
+		break;
+
+	case MEMORY_DEV_WIDTH_X32:
+		dt =3D DEV_X32;
+		break;
+	}
+	return dt;
+}
+
+static u32 dmc520_get_rank_count(void __iomem *reg_base)
+{
+	u32 reg_val, rank_bits;
+
+	reg_val =3D readl(reg_base + REG_OFFSET_ADDRESS_CONTROL_NOW);
+	rank_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_RANK, reg_val);
+
+	return (1 << rank_bits);
+}
+
+static u64 dmc520_get_rank_size(struct dmc520_edac *edac)
+{
+	u32 reg_val, col_bits, row_bits, bank_bits;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_ADDRESS_CONTROL_NOW);
+
+	col_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_COL, reg_val) +
+		   DRAM_ADDRESS_CONTROL_MIN_COL_BITS;
+	row_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_ROW, reg_val) +
+		   DRAM_ADDRESS_CONTROL_MIN_ROW_BITS;
+	bank_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_BANK, reg_val);
+
+	return (u64)DMC520_BUS_WIDTH << (col_bits + row_bits + bank_bits);
+}
+
+static void dmc520_handle_dram_ecc_errors(struct mem_ctl_info *mci,
+					  bool is_ce,
+					  bool overflow)
+{
+	struct ecc_error_info info;
+	struct dmc520_edac *edac;
+	u32 cnt;
+
+	edac =3D mci->pvt_info;
+	dmc520_get_dram_ecc_error_info(edac, is_ce, &info);
+
+	cnt =3D dmc520_get_dram_ecc_error_count(edac, is_ce);
+
+	if (overflow)
+		cnt +=3D DRAM_ECC_MIN_INT_OVERFLOW_ERROR_COUNT;
+
+	if (cnt > 0) {
+		snprintf(edac->message, ARRAY_SIZE(edac->message),
+			 "rank:%d bank:%d row:%d col:%d",
+			 info.rank, info.bank,
+			 info.row, info.col);
+
+		edac_mc_handle_error((is_ce ? HW_EVENT_ERR_CORRECTED :
+				     HW_EVENT_ERR_UNCORRECTED),
+				     mci, cnt, 0, 0, 0, info.rank, -1, -1,
+				     edac->message, "");
+	}
+}
+
+static irqreturn_t dmc520_edac_dram_ecc_isr(int irq, void *data, bool is_c=
e)
+{
+	u32 i_mask, o_mask, status;
+	bool overflow;
+	struct mem_ctl_info *mci;
+	struct dmc520_edac *edac;
+
+	mci =3D data;
+	edac =3D mci->pvt_info;
+
+	i_mask =3D is_ce ? DRAM_ECC_INT_CE_MASK : DRAM_ECC_INT_UE_MASK;
+	o_mask =3D is_ce ? DRAM_ECC_INT_CE_OVERFLOW_MASK :
+			 DRAM_ECC_INT_UE_OVERFLOW_MASK;
+
+	status =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_STATUS);
+	overflow =3D ((status & o_mask) !=3D 0);
+
+	dmc520_handle_dram_ecc_errors(mci, is_ce, overflow);
+
+	dmc520_write_reg(edac, i_mask, REG_OFFSET_INTERRUPT_CLR);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t dmc520_edac_dram_ce_isr(int irq, void *data)
+{
+	return dmc520_edac_dram_ecc_isr(irq, data, true);
+}
+
+static irqreturn_t dmc520_edac_dram_ue_isr(int irq, void *data)
+{
+	return dmc520_edac_dram_ecc_isr(irq, data, false);
+}
+
+static irqreturn_t dmc520_edac_all_isr(int irq, void *data)
+{
+	struct mem_ctl_info *mci;
+	struct dmc520_edac *edac;
+	u32 status;
+
+	mci =3D data;
+	edac =3D mci->pvt_info;
+
+	status =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_STATUS);
+
+	if (status & DRAM_ECC_INT_CE_MASK)
+		dmc520_edac_dram_ce_isr(irq, data);
+
+	if (status & DRAM_ECC_INT_UE_MASK)
+		dmc520_edac_dram_ue_isr(irq, data);
+
+	// Other interrupt handlers can be added
+
+	return IRQ_HANDLED;
+}
+
+static void dmc520_init_csrow(struct mem_ctl_info *mci)
+{
+	struct csrow_info *csi;
+	struct dimm_info *dimm;
+	int row, ch;
+	enum dev_type dt;
+	enum mem_type mt;
+	u64 rs;
+	u32 pages_per_rank;
+	struct dmc520_edac *edac =3D mci->pvt_info;
+
+	dt =3D dmc520_get_dtype(edac);
+	mt =3D dmc520_get_mtype(edac);
+	rs =3D dmc520_get_rank_size(edac);
+	pages_per_rank =3D rs >> PAGE_SHIFT;
+
+	for (row =3D 0; row < mci->nr_csrows; row++) {
+		csi =3D mci->csrows[row];
+
+		for (ch =3D 0; ch < csi->nr_channels; ch++) {
+			dimm		=3D csi->channels[ch]->dimm;
+			dimm->grain	=3D DMC520_EDAC_ERR_GRAIN;
+			dimm->dtype	=3D dt;
+			dimm->mtype	=3D mt;
+			dimm->edac_mode	=3D EDAC_FLAG_SECDED;
+			dimm->nr_pages	=3D pages_per_rank / csi->nr_channels;
+		}
+	}
+}
+
+static int count_set_bits(u32 n)
+{
+	int count;
+
+	for (count =3D 0; n !=3D 0; n &=3D (n - 1))
+		count++;
+
+	return count;
+}
+
+static int dmc520_edac_probe(struct platform_device *pdev)
+{
+	struct device *dev;
+	struct dmc520_edac *edac;
+	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[1];
+	int ret, irq, nintr;
+	struct resource *res;
+	void __iomem *reg_base;
+	u32 status, current_bit, interrupt_mask;
+	bool interrupt_shared;
+
+	dev =3D &pdev->dev;
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg_base =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
+
+	layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size =3D dmc520_get_rank_count(reg_base);
+	layers[0].is_virt_csrow =3D true;
+
+	mci =3D edac_mc_alloc(dmc520_mc_idx++, ARRAY_SIZE(layers), layers,
+			    sizeof(struct dmc520_edac));
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			    "Failed to allocate memory for mc instance\n");
+		return -ENOMEM;
+	}
+
+	edac =3D mci->pvt_info;
+	edac->reg_base =3D reg_base;
+
+	if (!dmc520_is_ecc_enabled(edac)) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME, "ECC not enabled\n");
+		ret =3D -ENXIO;
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, mci);
+
+	mci->pdev =3D dev;
+	mci->mtype_cap =3D MEM_FLAG_DDR3 | MEM_FLAG_DDR4;
+	mci->edac_ctl_cap =3D EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
+	mci->edac_cap =3D EDAC_FLAG_SECDED;
+	mci->scrub_cap =3D SCRUB_FLAG_HW_SRC;
+	mci->scrub_mode =3D dmc520_is_scrub_configured(edac) ?
+			  SCRUB_HW_SRC : SCRUB_NONE;
+	mci->ctl_name =3D EDAC_CTL_NAME;
+	mci->dev_name =3D dev_name(mci->pdev);
+	mci->mod_name =3D EDAC_MOD_NAME;
+	mci->ctl_page_to_phys =3D NULL;
+
+	edac_op_state =3D EDAC_OPSTATE_INT;
+
+	dmc520_init_csrow(mci);
+
+	ret =3D edac_mc_add_mc(mci);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			    "Failed to register with EDAC core\n");
+		goto err;
+	}
+
+	interrupt_shared =3D false;
+	interrupt_mask =3D DRAM_ECC_INT_CE_MASK | DRAM_ECC_INT_UE_MASK;
+
+	if (dev->of_node) {
+		if (of_find_property(dev->of_node, "interrupt-shared", NULL))
+			interrupt_shared =3D true;
+
+		if (of_property_read_u32(dev->of_node,
+					 "interrupt-mask",
+					 &interrupt_mask)) {
+			edac_printk(KERN_INFO, EDAC_MOD_NAME,
+				    "Use default interrupt mask 0x%X\n",
+				    interrupt_mask);
+		}
+
+		interrupt_mask &=3D ALL_INT_MASK;
+	}
+
+	// Clear interrupts
+	status =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_STATUS);
+	dmc520_write_reg(edac, 0, REG_OFFSET_INTERRUPT_CONTROL);
+	dmc520_write_reg(edac, ALL_INT_MASK, REG_OFFSET_INTERRUPT_CLR);
+
+	// Reset DRAM CE/UE counters
+	if (interrupt_mask & DRAM_ECC_INT_CE_MASK)
+		dmc520_get_dram_ecc_error_count(edac, true);
+
+	if (interrupt_mask & DRAM_ECC_INT_UE_MASK)
+		dmc520_get_dram_ecc_error_count(edac, false);
+
+	nintr =3D count_set_bits(interrupt_mask);
+	if (nintr =3D=3D 0) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Invalid interrupt mask 0x%X\n",
+			    interrupt_mask);
+		ret =3D -EINVAL;
+		goto err;
+	}
+
+	current_bit =3D BIT(0);
+	for (irq =3D 0; irq < nintr; ++irq) {
+		irq_handler_t edac_isr;
+		int irq_id =3D platform_get_irq(pdev, irq);
+
+		if (irq_id < 0) {
+			edac_printk(KERN_ERR, EDAC_MC,
+				    "Failed to get %s irq\n",
+				    irq =3D=3D 0 ? "CE" : "UE");
+			ret =3D -ENODEV;
+			goto err;
+		}
+
+		if (interrupt_shared) {
+			edac_isr =3D dmc520_edac_all_isr;
+		} else {
+			while (current_bit & ALL_INT_MASK) {
+				if (current_bit & interrupt_mask)
+					break;
+
+				current_bit <<=3D 1;
+			}
+
+			if (current_bit & DRAM_ECC_INT_CE_MASK) {
+				edac_isr =3D dmc520_edac_dram_ce_isr;
+			} else if (current_bit & DRAM_ECC_INT_UE_MASK) {
+				edac_isr =3D dmc520_edac_dram_ue_isr;
+			} else {
+				edac_printk(KERN_ERR, EDAC_MC,
+					    "Invalid interrupt bit 0x%X\n",
+					    current_bit);
+				ret =3D -EINVAL;
+				goto err;
+			}
+
+			current_bit <<=3D 1;
+		}
+
+		ret =3D devm_request_irq(&pdev->dev,
+				       irq_id,
+				       edac_isr,
+				       0,
+				       dev_name(&pdev->dev),
+				       mci);
+		if (ret < 0) {
+			edac_printk(KERN_ERR, EDAC_MC,
+				    "Failed to request irq %d\n", irq_id);
+			goto err;
+		}
+
+		// Only one irq for all interrupts
+		if (interrupt_shared)
+			break;
+	}
+
+	// Enable interrupts
+	dmc520_write_reg(edac, interrupt_mask, REG_OFFSET_INTERRUPT_CONTROL);
+
+	return 0;
+
+err:
+	edac_mc_free(mci);
+
+	return ret;
+}
+
+static int dmc520_edac_remove(struct platform_device *pdev)
+{
+	struct dmc520_edac *edac;
+	struct mem_ctl_info *mci;
+
+	mci =3D platform_get_drvdata(pdev);
+	edac =3D mci->pvt_info;
+
+	// Disable interrupts
+	dmc520_write_reg(edac, 0, REG_OFFSET_INTERRUPT_CONTROL);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+
+	return 0;
+}
+
+static const struct of_device_id dmc520_edac_driver_id[] =3D {
+	{ .compatible =3D "arm,dmc-520", },
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, dmc520_edac_driver_id);
+
+static struct platform_driver dmc520_edac_driver =3D {
+	.driver =3D {
+		.name =3D "dmc520",
+		.of_match_table =3D dmc520_edac_driver_id,
+	},
+
+	.probe =3D dmc520_edac_probe,
+	.remove =3D dmc520_edac_remove
+};
+
+module_platform_driver(dmc520_edac_driver);
+
+MODULE_AUTHOR("Rui Zhao <ruizhao@microsoft.com>");
+MODULE_DESCRIPTION("DMC-520 ECC driver");
+MODULE_LICENSE("GPL v2");
--=20
2.7.4
