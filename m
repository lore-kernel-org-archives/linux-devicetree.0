From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH nand-next 2/2] mtd: rawnand: meson: support for older SoCs up to Meson8
Date: Fri,  1 Mar 2019 19:29:22 +0100
Message-ID: <20190301182922.8309-3-martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liang.yang@amlogic.com
Cc: linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds support for the following SoCs to the meson-nand driver:
- Meson8 (assuming Meson8m2 uses the same IP block revision)
- Meson8b
- GXBB

The clock setup is the only difference between GXL and the older SoCs.
Compared to GXL and AXG these older SoCs:
- have a dedicated NAND clock instead of one that's shared with
  sd_emmc_c
- use the same ECC capabilities as GXL (up to 60-bits ECC)

The "amlogic,mmc-syscon" property is not required on these older SoCs
because the NAND clock is not shared with the sd_emmc_c controller. The
syscon from that property is used to switch the clock output between the
NAND controller and the sd_emmc_c controller on the newer SoCs.

The "rx" and "tx" clocks also don't exist on the older SoCs which also
means that the phase cannot be controlled there. Obtain these clocks
using devm_clk_get_optional() which will return NULL if they were not
passed via device-tree. None of the "consumers" of the "rx" and "tx"
clocks (within the meson-nand driver) have to be adjusted because the
common clock framework is NULL-safe (meaning NULL-clocks can be passed,
clk_prepare_enable() and clk_disable_unprepare() are no-ops in that
case).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 46 ++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 38db4fd61459..2a5f9ce5db9b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -128,6 +128,7 @@ struct meson_nand_ecc {
 
 struct meson_nfc_data {
 	const struct nand_ecc_caps *ecc_caps;
+	bool has_mmc_syscon;
 };
 
 struct meson_nfc_param {
@@ -209,7 +210,7 @@ static int meson_nand_calc_ecc_bytes(int step_size, int strength)
 	return ecc_bytes;
 }
 
-NAND_ECC_CAPS_SINGLE(meson_gxl_ecc_caps,
+NAND_ECC_CAPS_SINGLE(meson8_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8, 24, 30, 40, 50, 60);
 NAND_ECC_CAPS_SINGLE(meson_axg_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8);
@@ -999,21 +1000,22 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		return PTR_ERR(nfc->device_clk);
 	}
 
-	nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
+	nfc->phase_tx = devm_clk_get_optional(nfc->dev, "tx");
 	if (IS_ERR(nfc->phase_tx)) {
 		dev_err(nfc->dev, "failed to get TX clk\n");
 		return PTR_ERR(nfc->phase_tx);
 	}
 
-	nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
+	nfc->phase_rx = devm_clk_get_optional(nfc->dev, "rx");
 	if (IS_ERR(nfc->phase_rx)) {
 		dev_err(nfc->dev, "failed to get RX clk\n");
 		return PTR_ERR(nfc->phase_rx);
 	}
 
-	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
-	regmap_update_bits(nfc->reg_clk,
-			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
+	if (nfc->data->has_mmc_syscon)
+		/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
+		regmap_update_bits(nfc->reg_clk,
+				   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
 
 	ret = clk_prepare_enable(nfc->core_clk);
 	if (ret) {
@@ -1345,16 +1347,32 @@ static irqreturn_t meson_nfc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
+static const struct meson_nfc_data meson8_data = {
+	.ecc_caps = &meson8_ecc_caps,
+	.has_mmc_syscon = false,
+};
+
 static const struct meson_nfc_data meson_gxl_data = {
-	.ecc_caps = &meson_gxl_ecc_caps,
+	.ecc_caps = &meson8_ecc_caps,
+	.has_mmc_syscon = true,
 };
 
 static const struct meson_nfc_data meson_axg_data = {
 	.ecc_caps = &meson_axg_ecc_caps,
+	.has_mmc_syscon = true,
 };
 
 static const struct of_device_id meson_nfc_id_table[] = {
 	{
+		.compatible = "amlogic,meson8-nfc",
+		.data = &meson8_data,
+	}, {
+		.compatible = "amlogic,meson8b-nfc",
+		.data = &meson8_data,
+	}, {
+		.compatible = "amlogic,meson-gxbb-nfc",
+		.data = &meson8_data,
+	}, {
 		.compatible = "amlogic,meson-gxl-nfc",
 		.data = &meson_gxl_data,
 	}, {
@@ -1390,12 +1408,14 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->reg_base))
 		return PTR_ERR(nfc->reg_base);
 
-	nfc->reg_clk =
-		syscon_regmap_lookup_by_phandle(dev->of_node,
-						"amlogic,mmc-syscon");
-	if (IS_ERR(nfc->reg_clk)) {
-		dev_err(dev, "Failed to lookup clock base\n");
-		return PTR_ERR(nfc->reg_clk);
+	if (nfc->data->has_mmc_syscon) {
+		nfc->reg_clk =
+			syscon_regmap_lookup_by_phandle(dev->of_node,
+							"amlogic,mmc-syscon");
+		if (IS_ERR(nfc->reg_clk)) {
+			dev_err(dev, "Failed to lookup clock base\n");
+			return PTR_ERR(nfc->reg_clk);
+		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.21.0
