Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 8/9] ata: ahci_tegra: Add AHCI support for Tegra210
Date: Mon, 12 Mar 2018 17:10:37 +0530
Message-ID: <1520854838-21779-9-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

Add support for the AHCI-compliant Serial ATA host controller on the
Tegra210 system-on-chip.

Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
---
v8:
* renamed the structure tegra210_ahci_soc_data to tegra210_ahci_soc
v7:
* Added commit message
---
 drivers/ata/ahci_tegra.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 20c1fccbc669..64d848409fe2 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -465,11 +465,19 @@ static const struct tegra_ahci_soc tegra124_ahci_soc = {
 	.ops = &tegra124_ahci_ops,
 };
 
+static const struct tegra_ahci_soc tegra210_ahci_soc = {
+	.supports_devslp = false,
+};
+
 static const struct of_device_id tegra_ahci_of_match[] = {
 	{
 		.compatible = "nvidia,tegra124-ahci",
 		.data = &tegra124_ahci_soc
 	},
+	{
+		.compatible = "nvidia,tegra210-ahci",
+		.data = &tegra210_ahci_soc
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, tegra_ahci_of_match);
@@ -584,5 +592,5 @@ static struct platform_driver tegra_ahci_driver = {
 module_platform_driver(tegra_ahci_driver);
 
 MODULE_AUTHOR("Mikko Perttunen <mperttunen@nvidia.com>");
-MODULE_DESCRIPTION("Tegra124 AHCI SATA driver");
+MODULE_DESCRIPTION("Tegra AHCI SATA driver");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4
