Return-Path: <SRS0=zE5V=SZ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 01/28] soc/tegra: pmc: Export tegra_powergate_power_on()
Date: Tue, 23 Apr 2019 14:57:58 +0530
Message-ID: <20190423092825.759-2-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

tegra_powergate_sequence_power_up() powers up partition and also enables
clock & reset. However, if a controller like PCIe have multiple clocks
& resets and they need to be enabled in a sequence, driver must use
standalone function tegra_powergate_power_on() to power up partition.

Export tegra_powergate_power_on() to allow Tegra controller drivers to
unpower gate partition independent to clock & reset.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: No change

 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 0c5f79528e5f..cb3de81348bd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -701,6 +701,7 @@ int tegra_powergate_power_on(unsigned int id)
 
 	return tegra_powergate_set(pmc, id, true);
 }
+EXPORT_SYMBOL(tegra_powergate_power_on);
 
 /**
  * tegra_powergate_power_off() - power off partition
-- 
2.17.1
