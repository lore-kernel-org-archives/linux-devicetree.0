From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 4/5] mtd: nand: add support for Micron on-die ECC
Date: Sat, 29 Apr 2017 11:06:45 +0200
Message-ID: <1493456806-18898-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493456806-18898-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the core NAND subsystem has support for on-die ECC, this commit
brings the necessary code to support on-die ECC on Micron NANDs.

In micron_nand_init(), we detect if the Micron NAND chip supports on-die
ECC mode, by checking a number of conditions:

 - It must be an ONFI NAND
 - It must be a SLC NAND

 - Enabling *and* disabling on-die ECC must work

 - The on-die ECC must be correcting 4 bits per 512 bytes of data. Some
   Micron NAND chips have an on-die ECC able to correct 8 bits per 512
   bytes of data, but they work slightly differently and therefore we
   don't support them in this patch.

Then, if the on-die ECC cannot be disabled (some Micron NAND have on-die
ECC forcefully enabled), we bail out, as we don't support such
NANDs. Indeed, the implementation of raw_read()/raw_write() make the
assumption that on-die ECC can be disabled. Support for Micron NANDs
with on-die ECC forcefully enabled can easily be added, but in the
absence of such HW for testing, we preferred to simply bail out.

If the on-die ECC is supported, and requested in the Device Tree, then
it is indeed enabled, by using custom implementations of the
->read_page(), ->read_page_raw(), ->write_page() and ->write_page_raw()
operation to properly handle the on-die ECC.

In the non-raw functions, we need to enable the internal ECC engine
before issuing the NAND_CMD_READ0 or NAND_CMD_SEQIN commands, which is
why we set the NAND_ECC_CUSTOM_PAGE_ACCESS option at initialization
time (it asks the NAND core to let the NAND driver issue those
commands).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/nand_micron.c | 215 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h       |   2 +
 2 files changed, 217 insertions(+)

diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
index 8770110..0987f32 100644
--- a/drivers/mtd/nand/nand_micron.c
+++ b/drivers/mtd/nand/nand_micron.c
@@ -17,6 +17,12 @@
 
 #include <linux/mtd/nand.h>
 
+/*
+ * Special Micron status bit that indicates when the block has been
+ * corrected by on-die ECC and should be rewritten
+ */
+#define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)
+
 struct nand_onfi_vendor_micron {
 	u8 two_plane_read;
 	u8 read_cache;
@@ -66,9 +72,191 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 	return 0;
 }
 
+static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
+					    struct mtd_oob_region *oobregion)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 8;
+	oobregion->length = 8;
+
+	return 0;
+}
+
+static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
+					     struct mtd_oob_region *oobregion)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 2;
+	oobregion->length = 6;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_nand_on_die_ooblayout_ops = {
+	.ecc = micron_nand_on_die_ooblayout_ecc,
+	.free = micron_nand_on_die_ooblayout_free,
+};
+
+static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+
+	if (enable)
+		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
+
+	return chip->onfi_set_features(nand_to_mtd(chip), chip,
+				       ONFI_FEATURE_ON_DIE_ECC, feature);
+}
+
+static int
+micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+				 uint8_t *buf, int oob_required,
+				 int page)
+{
+	int status;
+	int max_bitflips = 0;
+
+	micron_nand_on_die_ecc_setup(chip, true);
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+	if (status & NAND_STATUS_FAIL)
+		mtd->ecc_stats.failed++;
+	/*
+	 * The internal ECC doesn't tell us the number of bitflips
+	 * that have been corrected, but tells us if it recommends to
+	 * rewrite the block. If it's the case, then we pretend we had
+	 * a number of bitflips equal to the ECC strength, which will
+	 * hint the NAND core to rewrite the block.
+	 */
+	else if (status & NAND_STATUS_WRITE_RECOMMENDED)
+		max_bitflips = chip->ecc.strength;
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, -1, -1);
+
+	nand_read_page_raw(mtd, chip, buf, oob_required, page);
+
+	micron_nand_on_die_ecc_setup(chip, false);
+
+	return max_bitflips;
+}
+
+static int
+micron_nand_write_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+				  const uint8_t *buf, int oob_required,
+				  int page)
+{
+	micron_nand_on_die_ecc_setup(chip, true);
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+	nand_write_page_raw(mtd, chip, buf, oob_required, page);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	micron_nand_on_die_ecc_setup(chip, false);
+
+	return 0;
+}
+
+static int
+micron_nand_read_page_raw_on_die_ecc(struct mtd_info *mtd,
+				     struct nand_chip *chip,
+				     uint8_t *buf, int oob_required,
+				     int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	nand_read_page_raw(mtd, chip, buf, oob_required, page);
+
+	return 0;
+}
+
+static int
+micron_nand_write_page_raw_on_die_ecc(struct mtd_info *mtd,
+				      struct nand_chip *chip,
+				      const uint8_t *buf, int oob_required,
+				      int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+	nand_write_page_raw(mtd, chip, buf, oob_required, page);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	return 0;
+}
+
+enum {
+	/* The NAND flash doesn't support on-die ECC */
+	MICRON_ON_DIE_UNSUPPORTED,
+
+	/*
+	 * The NAND flash supports on-die ECC and it can be
+	 * enabled/disabled by a set features command.
+	 */
+	MICRON_ON_DIE_SUPPORTED,
+
+	/*
+	 * The NAND flash supports on-die ECC, and it cannot be
+	 * disabled.
+	 */
+	MICRON_ON_DIE_MANDATORY,
+};
+
+/*
+ * Try to detect if the NAND support on-die ECC. To do this, we enable
+ * the feature, and read back if it has been enabled as expected. We
+ * also check if it can be disabled, because some Micron NANDs do not
+ * allow disabling the on-die ECC and we don't support such NANDs for
+ * now.
+ *
+ * This function also has the side effect of disabling on-die ECC if
+ * it had been left enabled by the firmware/bootloader.
+ */
+static int micron_supports_on_die_ecc(struct nand_chip *chip)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+	int ret;
+
+	if (chip->onfi_version == 0)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	if (chip->bits_per_cell != 1)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	ret = micron_nand_on_die_ecc_setup(chip, true);
+	if (ret)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	chip->onfi_get_features(nand_to_mtd(chip), chip,
+				ONFI_FEATURE_ON_DIE_ECC, feature);
+	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) == 0)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	ret = micron_nand_on_die_ecc_setup(chip, false);
+	if (ret)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	chip->onfi_get_features(nand_to_mtd(chip), chip,
+				ONFI_FEATURE_ON_DIE_ECC, feature);
+	if (feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN)
+		return MICRON_ON_DIE_MANDATORY;
+
+	/*
+	 * Some Micron NANDs have an on-die ECC of 4/512, some other
+	 * 8/512. We only support the former.
+	 */
+	if (chip->onfi_params.ecc_bits != 4)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	return MICRON_ON_DIE_SUPPORTED;
+}
+
 static int micron_nand_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ondie;
 	int ret;
 
 	ret = micron_nand_onfi_init(chip);
@@ -78,6 +266,33 @@ static int micron_nand_init(struct nand_chip *chip)
 	if (mtd->writesize == 2048)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	ondie = micron_supports_on_die_ecc(chip);
+
+	if (ondie == MICRON_ON_DIE_MANDATORY) {
+		pr_err("On-die ECC forcefully enabled, not supported\n");
+		return -EINVAL;
+	}
+
+	if (chip->ecc.mode == NAND_ECC_ON_DIE) {
+		if (ondie == MICRON_ON_DIE_UNSUPPORTED) {
+			pr_err("On-die ECC selected but not supported\n");
+			return -EINVAL;
+		}
+
+		chip->ecc.options = NAND_ECC_CUSTOM_PAGE_ACCESS;
+		chip->ecc.bytes = 32;
+		chip->ecc.strength = 4;
+		chip->ecc.algo = NAND_ECC_BCH;
+		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
+		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
+		chip->ecc.read_page_raw =
+			micron_nand_read_page_raw_on_die_ecc;
+		chip->ecc.write_page_raw =
+			micron_nand_write_page_raw_on_die_ecc;
+
+		mtd_set_ooblayout(mtd, &micron_nand_on_die_ooblayout_ops);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7a01d2e..f019916 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -258,6 +258,8 @@ struct nand_chip;
 
 /* Vendor-specific feature address (Micron) */
 #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
+#define ONFI_FEATURE_ON_DIE_ECC		0x90
+#define   ONFI_FEATURE_ON_DIE_ECC_EN	BIT(3)
 
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
