From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RFC PATCH v3 1/7] PCI: rockchip: split out rockchip_pcie_get_phys
Date: Tue, 18 Jul 2017 15:56:57 +0800
Message-ID: <1500364623-97041-2-git-send-email-shawn.lin@rock-chips.com>
References: <1500364623-97041-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500364623-97041-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We plan to introduce per-lanes PHY, so split out new
function to make it easy in the future. No functional
change intended.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Tested-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v3: None
Changes in v2: None

 drivers/pci/host/pcie-rockchip.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 5acf869..6632a51 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -853,6 +853,19 @@ static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int rockchip_pcie_get_phys(struct rockchip_pcie *rockchip)
+{
+	struct device *dev = rockchip->dev;
+
+	rockchip->phy = devm_phy_get(dev, "pcie-phy");
+	if (IS_ERR(rockchip->phy)) {
+		if (PTR_ERR(rockchip->phy) != -EPROBE_DEFER)
+			dev_err(dev, "missing phy\n");
+		return PTR_ERR(rockchip->phy);
+	}
+
+	return 0;
+}
 
 /**
  * rockchip_pcie_parse_dt - Parse Device Tree
@@ -883,12 +896,8 @@ static int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	if (IS_ERR(rockchip->apb_base))
 		return PTR_ERR(rockchip->apb_base);
 
-	rockchip->phy = devm_phy_get(dev, "pcie-phy");
-	if (IS_ERR(rockchip->phy)) {
-		if (PTR_ERR(rockchip->phy) != -EPROBE_DEFER)
-			dev_err(dev, "missing phy\n");
+	if (rockchip_pcie_get_phys(rockchip))
 		return PTR_ERR(rockchip->phy);
-	}
 
 	rockchip->lanes = 1;
 	err = of_property_read_u32(node, "num-lanes", &rockchip->lanes);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
