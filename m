From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH 1/2] PCI: rockchip: cleanup bit definition for PCIE_RC_CONFIG_LCS
Date: Mon, 14 Nov 2016 12:11:05 +0800
Message-ID: <1479096666-112668-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PCIE_RC_CONFIG_LCS contains control and status bits specific
to the PCIe link. The layout for this register looks the same
as the existed PCI_EXP_LNKCTL and PCI_EXP_LNKSTA. So let's
reuse them.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 drivers/pci/host/pcie-rockchip.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 7f238af..1dba698 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -141,12 +141,6 @@
 #define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
 #define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
 #define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
-#define   PCIE_RC_CONFIG_LCS_RETRAIN_LINK	BIT(5)
-#define   PCIE_RC_CONFIG_LCS_CCC		BIT(6)
-#define   PCIE_RC_CONFIG_LCS_LBMIE		BIT(10)
-#define   PCIE_RC_CONFIG_LCS_LABIE		BIT(11)
-#define   PCIE_RC_CONFIG_LCS_LBMS		BIT(30)
-#define   PCIE_RC_CONFIG_LCS_LAMS		BIT(31)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
@@ -229,7 +223,7 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 	u32 status;
 
 	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
-	status |= (PCIE_RC_CONFIG_LCS_LBMIE | PCIE_RC_CONFIG_LCS_LABIE);
+	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
 }
 
@@ -238,7 +232,7 @@ static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
 	u32 status;
 
 	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
-	status |= (PCIE_RC_CONFIG_LCS_LBMS | PCIE_RC_CONFIG_LCS_LAMS);
+	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
 }
 
@@ -540,7 +534,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 
 	/* Set RC's clock architecture as common clock */
 	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
-	status |= PCIE_RC_CONFIG_LCS_CCC;
+	status |= PCI_EXP_LNKCTL_CCC;
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
 
 	/* Enable Gen1 training */
@@ -575,7 +569,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		 * gen1 finished.
 		 */
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
-		status |= PCIE_RC_CONFIG_LCS_RETRAIN_LINK;
+		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
 
 		timeout = jiffies + msecs_to_jiffies(500);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
