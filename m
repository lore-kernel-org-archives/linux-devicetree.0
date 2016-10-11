From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 3/3] PCI: rockchip: Specify the link capability
Date: Tue, 11 Oct 2016 12:26:27 +0800
Message-ID: <1476159987-31372-3-git-send-email-shawn.lin@rock-chips.com>
References: <1476159987-31372-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1476159987-31372-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

rk3399 supports PCIe 2.x link speeds marginally at best, and on some
boards, the link won't train at 5 GT/s at all. Rather than sacrifice
500ms waiting for training that will never happen, let's use the helper
function, of_get_pci_max_link_speed, to get the max link speed from DT
and specify link capability.

Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v6:
- user helper function of_get_pci_max_link_speed and use gen2 by default
  if finding any errors from of_get_pci_max_link_speed. It could be
  backward compatibe to the old dtb. (Suggested by Rob)

Changes in v5:
- rebase the code since it isn't cleanly applied after Bjorn's cleanup

Changes in v4:
- define link_gen as u32
- elaborate more for rockchip,max-link-speed on doc

Changes in v3:
- Cast a warning for invalid max link speed and use gen1 for it.
  That looks better than v2. (Suggested by Brian)

Changes in v2:
- rename the property to rockchip,max-link-speed according to
  Bjorn's recommendation and take some bits from imx6q-pcie to
  make this requirement more consisent.

 drivers/pci/host/pcie-rockchip.c | 58 +++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index b3548d0..7125e35 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -53,6 +53,7 @@
 #define   PCIE_CLIENT_ARI_ENABLE	  HIWORD_UPDATE_BIT(0x0008)
 #define   PCIE_CLIENT_CONF_LANE_NUM(x)	  HIWORD_UPDATE(0x0030, ENCODE_LANES(x))
 #define   PCIE_CLIENT_MODE_RC		  HIWORD_UPDATE_BIT(0x0040)
+#define   PCIE_CLIENT_GEN_SEL_1		  HIWORD_UPDATE(0x0080, 0)
 #define   PCIE_CLIENT_GEN_SEL_2		  HIWORD_UPDATE_BIT(0x0080)
 #define PCIE_CLIENT_BASIC_STATUS1	(PCIE_CLIENT_BASE + 0x48)
 #define   PCIE_CLIENT_LINK_STATUS_UP		0x00300000
@@ -200,6 +201,7 @@ struct rockchip_pcie {
 	struct	gpio_desc *ep_gpio;
 	u32	lanes;
 	u8	root_bus_nr;
+	int	link_gen;
 	struct	device *dev;
 	struct	irq_domain *irq_domain;
 };
@@ -437,13 +439,19 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		return err;
 	}
 
+	if (rockchip->link_gen == 2)
+		rockchip_writel(rockchip, PCIE_CLIENT_CONFIG,
+				PCIE_CLIENT_GEN_SEL_2);
+	else
+		rockchip_writel(rockchip, PCIE_CLIENT_CONFIG,
+				PCIE_CLIENT_GEN_SEL_1);
+
 	rockchip_writel(rockchip, PCIE_CLIENT_CONFIG,
 			    PCIE_CLIENT_CONF_ENABLE |
 			    PCIE_CLIENT_LINK_TRAIN_ENABLE |
 			    PCIE_CLIENT_ARI_ENABLE |
 			    PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes) |
-			    PCIE_CLIENT_MODE_RC |
-			    PCIE_CLIENT_GEN_SEL_2);
+			    PCIE_CLIENT_MODE_RC);
 
 	err = phy_power_on(rockchip->phy);
 	if (err) {
@@ -519,29 +527,31 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		msleep(20);
 	}
 
-	/*
-	 * Enable retrain for gen2. This should be configured only after
-	 * gen1 finished.
-	 */
-	status = rockchip_readl(rockchip, PCIE_RC_CONFIG_LCS);
-	status |= PCIE_RC_CONFIG_LCS_RETRAIN_LINK;
-	rockchip_writel(rockchip, PCIE_RC_CONFIG_LCS, status);
+	if (rockchip->link_gen == 2) {
+		/*
+		 * Enable retrain for gen2. This should be configured
+		 * only after gen1 finished.
+		 */
+		status = rockchip_readl(rockchip, PCIE_RC_CONFIG_LCS);
+		status |= PCIE_RC_CONFIG_LCS_RETRAIN_LINK;
+		rockchip_writel(rockchip, PCIE_RC_CONFIG_LCS, status);
+
+		timeout = jiffies + msecs_to_jiffies(500);
+		for (;;) {
+			status = rockchip_readl(rockchip, PCIE_CORE_CTRL);
+			if ((status & PCIE_CORE_PL_CONF_SPEED_MASK) ==
+			    PCIE_CORE_PL_CONF_SPEED_5G) {
+				dev_dbg(dev, "PCIe link training gen2 pass!\n");
+				break;
+			}
 
-	timeout = jiffies + msecs_to_jiffies(500);
-	for (;;) {
-		status = rockchip_readl(rockchip, PCIE_CORE_CTRL);
-		if ((status & PCIE_CORE_PL_CONF_SPEED_MASK) ==
-		    PCIE_CORE_PL_CONF_SPEED_5G) {
-			dev_dbg(dev, "PCIe link training gen2 pass!\n");
-			break;
-		}
+			if (time_after(jiffies, timeout)) {
+				dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
+				break;
+			}
 
-		if (time_after(jiffies, timeout)) {
-			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
-			break;
+			msleep(20);
 		}
-
-		msleep(20);
 	}
 
 	/* Check the final link width from negotiated lane counter from MGMT */
@@ -747,6 +757,10 @@ static int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 		rockchip->lanes = 1;
 	}
 
+	rockchip->link_gen = of_get_pci_max_link_speed(node);
+	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
+		rockchip->link_gen = 2;
+
 	rockchip->core_rst = devm_reset_control_get(dev, "core");
 	if (IS_ERR(rockchip->core_rst)) {
 		if (PTR_ERR(rockchip->core_rst) != -EPROBE_DEFER)
-- 
2.3.7
