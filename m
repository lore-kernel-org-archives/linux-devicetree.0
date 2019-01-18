From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 4/4] memory: jz4780_nemc: Add support for the JZ4725B
Date: Fri, 18 Jan 2019 12:13:29 -0300
Message-ID: <20190118151329.8040-4-paul@crapouillou.net>
References: <20190118151329.8040-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118151329.8040-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add support for the JZ4725B SoC from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---

v2: No change

 drivers/memory/jz4780-nemc.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 66b8b43eaeff..90d6cbcccd0b 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -44,9 +44,14 @@
 #define NEMC_NFCSR_NFCEn(n)	BIT((((n) - 1) << 1) + 1)
 #define NEMC_NFCSR_TNFEn(n)	BIT(16 + (n) - 1)
 
+struct jz_soc_info {
+	u8 tas_tah_cycles_max;
+};
+
 struct jz4780_nemc {
 	spinlock_t lock;
 	struct device *dev;
+	const struct jz_soc_info *soc_info;
 	void __iomem *base;
 	struct clk *clk;
 	uint32_t clk_period;
@@ -202,7 +207,7 @@ static bool jz4780_nemc_configure_bank(struct jz4780_nemc *nemc,
 	if (of_property_read_u32(node, "ingenic,nemc-tAS", &val) == 0) {
 		smcr &= ~NEMC_SMCR_TAS_MASK;
 		cycles = jz4780_nemc_ns_to_cycles(nemc, val);
-		if (cycles > 15) {
+		if (cycles > nemc->soc_info->tas_tah_cycles_max) {
 			dev_err(nemc->dev, "tAS %u is too high (%u cycles)\n",
 				val, cycles);
 			return false;
@@ -214,7 +219,7 @@ static bool jz4780_nemc_configure_bank(struct jz4780_nemc *nemc,
 	if (of_property_read_u32(node, "ingenic,nemc-tAH", &val) == 0) {
 		smcr &= ~NEMC_SMCR_TAH_MASK;
 		cycles = jz4780_nemc_ns_to_cycles(nemc, val);
-		if (cycles > 15) {
+		if (cycles > nemc->soc_info->tas_tah_cycles_max) {
 			dev_err(nemc->dev, "tAH %u is too high (%u cycles)\n",
 				val, cycles);
 			return false;
@@ -278,6 +283,10 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	if (!nemc)
 		return -ENOMEM;
 
+	nemc->soc_info = device_get_match_data(dev);
+	if (!nemc->soc_info)
+		return -EINVAL;
+
 	spin_lock_init(&nemc->lock);
 	nemc->dev = dev;
 
@@ -370,8 +379,17 @@ static int jz4780_nemc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct jz_soc_info jz4725b_soc_info = {
+	.tas_tah_cycles_max = 7,
+};
+
+static const struct jz_soc_info jz4780_soc_info = {
+	.tas_tah_cycles_max = 15,
+};
+
 static const struct of_device_id jz4780_nemc_dt_match[] = {
-	{ .compatible = "ingenic,jz4780-nemc" },
+	{ .compatible = "ingenic,jz4725b-nemc", .data = &jz4725b_soc_info, },
+	{ .compatible = "ingenic,jz4780-nemc", .data = &jz4780_soc_info, },
 	{},
 };
 
-- 
2.11.0
