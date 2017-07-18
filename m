From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RFC PATCH v3 2/7] PCI: rockchip: introduce per-lanes PHYs support
Date: Tue, 18 Jul 2017 15:56:58 +0800
Message-ID: <1500364623-97041-3-git-send-email-shawn.lin@rock-chips.com>
References: <1500364623-97041-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500364623-97041-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We distinguish the legacy PHY with the newer per-lane
PHYs by adding legacy_phy flag. Note that the legacy phy
is still the first option to be searched in order not to
break the backward compatibility of DTB.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Tested-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v3:
- kill rockchip_pcie_manipulate_phys and related stuff
- use phys array
- improve the commit msg

Changes in v2: None

 drivers/pci/host/pcie-rockchip.c | 100 +++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 6632a51..4cc6aec 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -47,6 +47,7 @@
 #define HIWORD_UPDATE_BIT(val)		HIWORD_UPDATE(val, val)
 
 #define ENCODE_LANES(x)			((((x) >> 1) & 3) << 4)
+#define MAX_LANE_NUM			4
 
 #define PCIE_CLIENT_BASE		0x0
 #define PCIE_CLIENT_CONFIG		(PCIE_CLIENT_BASE + 0x00)
@@ -210,7 +211,8 @@
 struct rockchip_pcie {
 	void	__iomem *reg_base;		/* DT axi-base */
 	void	__iomem *apb_base;		/* DT apb-base */
-	struct	phy *phy;
+	bool    legacy_phy;
+	struct  phy *phys[MAX_LANE_NUM];
 	struct	reset_control *core_rst;
 	struct	reset_control *mgmt_rst;
 	struct	reset_control *mgmt_sticky_rst;
@@ -507,6 +509,46 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
 }
 
+static int rockchip_pcie_get_phys(struct rockchip_pcie *rockchip)
+{
+	struct device *dev = rockchip->dev;
+	struct phy *phy;
+	char *name;
+	u32 i;
+
+	rockchip->phys[0] = devm_phy_get(dev, "pcie-phy");
+	if (IS_ERR(rockchip->phys[0])) {
+		if (PTR_ERR(rockchip->phys[0]) == -EPROBE_DEFER)
+			return PTR_ERR(rockchip->phys[0]);
+		dev_dbg(dev, "missing legacy phy, and search for per-lane PHY\n");
+	} else {
+		rockchip->legacy_phy = true;
+		dev_warn(dev, "legacy phy model is deprecated!\n");
+		return 0;
+	}
+
+	for (i = 0; i < MAX_LANE_NUM; i++) {
+		name = kasprintf(GFP_KERNEL, "pcie-phy-%u", i);
+		if (!name)
+			return -ENOMEM;
+
+		phy = devm_of_phy_get(rockchip->dev,
+				      rockchip->dev->of_node, name);
+		kfree(name);
+
+		if (IS_ERR(phy)) {
+			if (PTR_ERR(phy) != -EPROBE_DEFER)
+				dev_err(dev, "missing phy for lane %d: %ld\n",
+					i, PTR_ERR(phy));
+			return PTR_ERR(phy);
+		}
+
+		rockchip->phys[i] = phy;
+	}
+
+	return 0;
+}
+
 /**
  * rockchip_pcie_init_port - Initialize hardware
  * @rockchip: PCIe port information
@@ -514,7 +556,7 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
-	int err;
+	int err, i;
 	u32 status;
 
 	gpiod_set_value(rockchip->ep_gpio, 0);
@@ -537,10 +579,12 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		return err;
 	}
 
-	err = phy_init(rockchip->phy);
-	if (err < 0) {
-		dev_err(dev, "fail to init phy, err %d\n", err);
-		return err;
+	for (i = 0; i < MAX_LANE_NUM; i++) {
+		err = phy_init(rockchip->phys[i]);
+		if (err) {
+			dev_err(dev, "init phy err %d\n", err);
+			return err;
+		}
 	}
 
 	err = reset_control_assert(rockchip->core_rst);
@@ -602,10 +646,12 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 			    PCIE_CLIENT_MODE_RC,
 			    PCIE_CLIENT_CONFIG);
 
-	err = phy_power_on(rockchip->phy);
-	if (err) {
-		dev_err(dev, "fail to power on phy, err %d\n", err);
-		return err;
+	for (i = 0; i < MAX_LANE_NUM; i++) {
+		err = phy_power_on(rockchip->phys[i]);
+		if (err) {
+			dev_err(dev, "power on phy err %d\n", err);
+			return err;
+		}
 	}
 
 	/*
@@ -853,20 +899,6 @@ static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int rockchip_pcie_get_phys(struct rockchip_pcie *rockchip)
-{
-	struct device *dev = rockchip->dev;
-
-	rockchip->phy = devm_phy_get(dev, "pcie-phy");
-	if (IS_ERR(rockchip->phy)) {
-		if (PTR_ERR(rockchip->phy) != -EPROBE_DEFER)
-			dev_err(dev, "missing phy\n");
-		return PTR_ERR(rockchip->phy);
-	}
-
-	return 0;
-}
-
 /**
  * rockchip_pcie_parse_dt - Parse Device Tree
  * @rockchip: PCIe port information
@@ -896,8 +928,9 @@ static int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	if (IS_ERR(rockchip->apb_base))
 		return PTR_ERR(rockchip->apb_base);
 
-	if (rockchip_pcie_get_phys(rockchip))
-		return PTR_ERR(rockchip->phy);
+	err = rockchip_pcie_get_phys(rockchip);
+	if (err)
+		return err;
 
 	rockchip->lanes = 1;
 	err = of_property_read_u32(node, "num-lanes", &rockchip->lanes);
@@ -1282,7 +1315,7 @@ static int rockchip_pcie_wait_l2(struct rockchip_pcie *rockchip)
 static int __maybe_unused rockchip_pcie_suspend_noirq(struct device *dev)
 {
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
-	int ret;
+	int ret, i;
 
 	/* disable core and cli int since we don't need to ack PME_ACK */
 	rockchip_pcie_write(rockchip, (PCIE_CLIENT_INT_CLI << 16) |
@@ -1295,8 +1328,10 @@ static int __maybe_unused rockchip_pcie_suspend_noirq(struct device *dev)
 		return ret;
 	}
 
-	phy_power_off(rockchip->phy);
-	phy_exit(rockchip->phy);
+	for (i = 0; i < MAX_LANE_NUM; i++) {
+		phy_power_off(rockchip->phys[i]);
+		phy_exit(rockchip->phys[i]);
+	}
 
 	clk_disable_unprepare(rockchip->clk_pcie_pm);
 	clk_disable_unprepare(rockchip->hclk_pcie);
@@ -1532,14 +1567,17 @@ static int rockchip_pcie_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
+	int i;
 
 	pci_stop_root_bus(rockchip->root_bus);
 	pci_remove_root_bus(rockchip->root_bus);
 	pci_unmap_iospace(rockchip->io);
 	irq_domain_remove(rockchip->irq_domain);
 
-	phy_power_off(rockchip->phy);
-	phy_exit(rockchip->phy);
+	for (i = 0; i < MAX_LANE_NUM; i++) {
+		phy_power_off(rockchip->phys[i]);
+		phy_exit(rockchip->phys[i]);
+	}
 
 	clk_disable_unprepare(rockchip->clk_pcie_pm);
 	clk_disable_unprepare(rockchip->hclk_pcie);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
