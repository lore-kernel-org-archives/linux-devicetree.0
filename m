Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 6/9] ata: ahci_tegra: disable devslp for Tegra124
Date: Mon, 12 Mar 2018 17:10:35 +0530
Message-ID: <1520854838-21779-7-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

Tegra124 does not support devslp and it should be disabled.

Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
---
v8:
* spelled out t124 as Tegra124
* changed u32 quirks to boolean supports_devslp
* moved the aux register comments above platform_get_resource()
---
 drivers/ata/ahci_tegra.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 547a6f93922c..620cdd16ef2f 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -166,12 +166,14 @@ struct tegra_ahci_ops {
 struct tegra_ahci_soc {
 	const char *const		*supply_names;
 	u32				num_supplies;
+	bool				supports_devslp;
 	const struct tegra_ahci_ops	*ops;
 };
 
 struct tegra_ahci_priv {
 	struct platform_device	   *pdev;
 	void __iomem		   *sata_regs;
+	void __iomem		   *sata_aux_regs;
 	struct reset_control	   *sata_rst;
 	struct reset_control	   *sata_oob_rst;
 	struct reset_control	   *sata_cold_rst;
@@ -181,6 +183,18 @@ struct tegra_ahci_priv {
 	const struct tegra_ahci_soc *soc;
 };
 
+static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
+{
+	struct tegra_ahci_priv *tegra = hpriv->plat_data;
+	u32 val;
+
+	if (tegra->sata_aux_regs && !tegra->soc->supports_devslp) {
+		val = readl(tegra->sata_aux_regs + SATA_AUX_MISC_CNTL_1_0);
+		val &= ~SATA_AUX_MISC_CNTL_1_0_SDS_SUPPORT;
+		writel(val, tegra->sata_aux_regs + SATA_AUX_MISC_CNTL_1_0);
+	}
+}
+
 static int tegra124_ahci_init(struct ahci_host_priv *hpriv)
 {
 	struct tegra_ahci_priv *tegra = hpriv->plat_data;
@@ -401,6 +415,7 @@ static int tegra_ahci_controller_init(struct ahci_host_priv *hpriv)
 	val &= ~SATA_CONFIGURATION_0_CLK_OVERRIDE;
 	writel(val, tegra->sata_regs + SATA_CONFIGURATION_0);
 
+	tegra_ahci_handle_quirks(hpriv);
 
 	/* Unmask SATA interrupts */
 
@@ -446,6 +461,7 @@ static const struct tegra_ahci_ops tegra124_ahci_ops = {
 static const struct tegra_ahci_soc tegra124_ahci_soc = {
 	.supply_names = tegra124_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra124_supply_names),
+	.supports_devslp = false,
 	.ops = &tegra124_ahci_ops,
 };
 
@@ -488,6 +504,16 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->sata_regs))
 		return PTR_ERR(tegra->sata_regs);
 
+	/*
+	 * AUX registers is optional.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	if (res) {
+		tegra->sata_aux_regs = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(tegra->sata_aux_regs))
+			return PTR_ERR(tegra->sata_aux_regs);
+	}
+
 	tegra->sata_rst = devm_reset_control_get(&pdev->dev, "sata");
 	if (IS_ERR(tegra->sata_rst)) {
 		dev_err(&pdev->dev, "Failed to get sata reset\n");
-- 
2.7.4
