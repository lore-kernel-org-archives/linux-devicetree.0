From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 04/19] PCI: keystone: Do not initiate link training multiple times
Date: Mon, 15 Oct 2018 18:37:06 +0530
Message-ID: <20181015130721.5535-5-kishon@ti.com>
References: <20181015130721.5535-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015130721.5535-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

commit 886bc5ceb5cc3ad4b219502d72 ("PCI: designware: Add generic
dw_pcie_wait_for_link()") while adding a generic dw_pcie_wait_for_link()
performed a special handling (initiate link training multiple times) for
keystone which is not required. This also resulted in unncessarily waiting
for more time to establish the link even when no PCI device is connected.

Remove it and make it look similar to other dwc based PCIe drivers.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index afb948372077..aa7e706fc37d 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -87,19 +87,17 @@ static int ks_pcie_establish_link(struct keystone_pcie *ks_pcie)
 {
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct device *dev = pci->dev;
-	unsigned int retries;
 
 	if (dw_pcie_link_up(pci)) {
 		dev_info(dev, "Link already up\n");
 		return 0;
 	}
 
+	ks_dw_pcie_initiate_link_train(ks_pcie);
+
 	/* check if the link is up or not */
-	for (retries = 0; retries < 5; retries++) {
-		ks_dw_pcie_initiate_link_train(ks_pcie);
-		if (!dw_pcie_wait_for_link(pci))
-			return 0;
-	}
+	if (!dw_pcie_wait_for_link(pci))
+		return 0;
 
 	dev_err(dev, "phy link never came up\n");
 	return -ETIMEDOUT;
-- 
2.17.1
