Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 7/9] ata: ahci_tegra: disable DIPM
Date: Mon, 12 Mar 2018 17:10:36 +0530
Message-ID: <1520854838-21779-8-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

Tegra does not support DIPM and it should be disabled.

Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
---
v8:
* renamed tegra to Tegra in commit message
---
 drivers/ata/ahci_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 620cdd16ef2f..20c1fccbc669 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -444,7 +444,7 @@ static struct ata_port_operations ahci_tegra_port_ops = {
 };
 
 static const struct ata_port_info ahci_tegra_port_info = {
-	.flags		= AHCI_FLAG_COMMON,
+	.flags		= AHCI_FLAG_COMMON | ATA_FLAG_NO_DIPM,
 	.pio_mask	= ATA_PIO4,
 	.udma_mask	= ATA_UDMA6,
 	.port_ops	= &ahci_tegra_port_ops,
-- 
2.7.4
