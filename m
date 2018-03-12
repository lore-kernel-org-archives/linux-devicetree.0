Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 9/9] ata: change Tegra124 to Tegra
Date: Mon, 12 Mar 2018 17:10:38 +0530
Message-ID: <1520854838-21779-10-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

ahci_tegra driver now supports Tegra124, Tegra132 and Tegra210,
so change Tegra124 to Tegra.

Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
---
 drivers/ata/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index a7120d621154..26b79991ba29 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -211,10 +211,10 @@ config AHCI_SUNXI
 	  If unsure, say N.
 
 config AHCI_TEGRA
-	tristate "NVIDIA Tegra124 AHCI SATA support"
+	tristate "NVIDIA Tegra AHCI SATA support"
 	depends on ARCH_TEGRA
 	help
-	  This option enables support for the NVIDIA Tegra124 SoC's
+	  This option enables support for the NVIDIA Tegra SoC's
 	  onboard AHCI SATA.
 
 	  If unsure, say N.
-- 
2.7.4
