Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 28/28] PCI: tegra: Change link retry log level to debug
Date: Thu, 16 May 2019 11:23:07 +0530
Message-ID: <20190516055307.25737-29-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Driver checks for link up three times before giving up, each retry attempt
is printed as an error. Letting users know that PCIe link is down and in the
process of being brought up again is for debug, not an error condition.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V4: No change

V3: Changed dev_err to dev_dbg

V2: Updated commit log

 drivers/pci/controller/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 09b4d384ba38..e9420d87363e 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2372,7 +2372,7 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
 		} while (--timeout);
 
 		if (!timeout) {
-			dev_err(dev, "link %u down, retrying\n", port->index);
+			dev_dbg(dev, "link %u down, retrying\n", port->index);
 			goto retry;
 		}
 
-- 
2.17.1
