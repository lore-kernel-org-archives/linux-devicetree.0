From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/9] Rename pcie_read() and pcie_write() to
 rockchip_pcie_read() and
Date: Thu, 01 Sep 2016 11:44:08 -0500
Message-ID: <20160901164408.14195.30921.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160901163758.14195.15725.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160901163758.14195.15725.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

rockchip_pcie_write().
---
 drivers/pci/host/pcie-rockchip.c |   66 +++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index a7006be..c9d0799 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -200,12 +200,12 @@ struct rockchip_pcie_port {
 	struct	irq_domain *irq_domain;
 };
 
-static inline u32 pcie_read(struct rockchip_pcie_port *port, u32 reg)
+static u32 rockchip_pcie_read(struct rockchip_pcie_port *port, u32 reg)
 {
 	return readl(port->apb_base + reg);
 }
 
-static inline void pcie_write(struct rockchip_pcie_port *port, u32 val, u32 reg)
+static void rockchip_pcie_write(struct rockchip_pcie_port *port, u32 val, u32 reg)
 {
 	writel(val, port->apb_base + reg);
 }
@@ -214,18 +214,18 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie_port *port)
 {
 	u32 status;
 
-	status = pcie_read(port, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
+	status = rockchip_pcie_read(port, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
 	status |= (PCIE_RC_CONFIG_LCSR_LBMIE | PCIE_RC_CONFIG_LCSR_LABIE);
-	pcie_write(port, status, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
+	rockchip_pcie_write(port, status, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
 }
 
 static void rockchip_pcie_clr_bw_int(struct rockchip_pcie_port *port)
 {
 	u32 status;
 
-	status = pcie_read(port, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
+	status = rockchip_pcie_read(port, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
 	status |= (PCIE_RC_CONFIG_LCSR_LBMS | PCIE_RC_CONFIG_LCSR_LAMS);
-	pcie_write(port, status, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
+	rockchip_pcie_write(port, status, PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_LCSR);
 }
 
 static int rockchip_pcie_valid_device(struct rockchip_pcie_port *pp,
@@ -417,7 +417,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 		return err;
 	}
 
-	pcie_write(port,
+	rockchip_pcie_write(port,
 		   HIWORD_UPDATE(PCIE_CLIENT_CONF_ENABLE,
 				 PCIE_CLIENT_CONF_ENABLE_MASK,
 				 PCIE_CLIENT_CONF_ENABLE_SHIFT) |
@@ -471,13 +471,13 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 	 * reliable and enabling ASPM doesn't work.  This is a controller
 	 * bug we need to work around.
 	 */
-	status = pcie_read(port, PCIE_RC_CONFIG_BASE +
+	status = rockchip_pcie_read(port, PCIE_RC_CONFIG_BASE +
 				 PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2);
-	pcie_write(port, status, PCIE_RC_CONFIG_BASE +
+	rockchip_pcie_write(port, status, PCIE_RC_CONFIG_BASE +
 				 PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2);
 
 	/* Enable Gen1 training */
-	pcie_write(port,
+	rockchip_pcie_write(port,
 		   HIWORD_UPDATE(PCIE_CLIENT_LINK_TRAIN_ENABLE,
 				 PCIE_CLIENT_LINK_TRAIN_MASK,
 				 PCIE_CLIENT_LINK_TRAIN_SHIFT),
@@ -489,7 +489,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 	timeout = jiffies + msecs_to_jiffies(500);
 
 	for (;;) {
-		status = pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
+		status = rockchip_pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
 		if (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
 		      PCIE_CLIENT_LINK_STATUS_MASK) ==
 		      PCIE_CLIENT_LINK_STATUS_UP) {
@@ -507,7 +507,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 
 	/* Double check gen1 training */
 	if (err) {
-		status = pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
+		status = rockchip_pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
 		err = (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
 			PCIE_CLIENT_LINK_STATUS_MASK) ==
 			PCIE_CLIENT_LINK_STATUS_UP) ? 0 : -ETIMEDOUT;
@@ -521,15 +521,15 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 	 * Enable retrain for gen2. This should be configured only after
 	 * gen1 finished.
 	 */
-	status = pcie_read(port,
+	status = rockchip_pcie_read(port,
 			   PCIE_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
 	status |= PCIE_CORE_LCSR_RETRAIN_LINK;
-	pcie_write(port, status,
+	rockchip_pcie_write(port, status,
 		   PCIE_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
 
 	timeout = jiffies + msecs_to_jiffies(500);
 	for (;;) {
-		status = pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
+		status = rockchip_pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
 		if (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
 		     PCIE_CORE_PL_CONF_SPEED_MASK) ==
 		     PCIE_CORE_PL_CONF_SPEED_5G) {
@@ -547,7 +547,7 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 
 	/* Double check gen2 training */
 	if (err) {
-		status = pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
+		status = rockchip_pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
 		err = (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
 			PCIE_CORE_PL_CONF_SPEED_MASK) ==
 			PCIE_CORE_PL_CONF_SPEED_5G) ? 0 : -ETIMEDOUT;
@@ -556,23 +556,23 @@ static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
 	}
 
 	/* Check the final link width from negotiated lane counter from MGMT */
-	status = pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
+	status = rockchip_pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
 	status =  0x1 << ((status >> PCIE_CORE_PL_CONF_LANE_SHIFT) &
 			   PCIE_CORE_PL_CONF_LANE_MASK);
 	dev_dbg(port->dev, "current link width is x%d\n", status);
 
-	pcie_write(port, ROCKCHIP_VENDOR_ID, PCIE_RC_CONFIG_BASE);
-	pcie_write(port, PCI_CLASS_BRIDGE_PCI << PCIE_CORE_RC_CONF_SCC_SHIFT,
+	rockchip_pcie_write(port, ROCKCHIP_VENDOR_ID, PCIE_RC_CONFIG_BASE);
+	rockchip_pcie_write(port, PCI_CLASS_BRIDGE_PCI << PCIE_CORE_RC_CONF_SCC_SHIFT,
 		   PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_RID_CCR);
-	pcie_write(port, 0x0, PCIE_CORE_CTRL_MGMT_BASE + PCIE_RC_BAR_CONF);
+	rockchip_pcie_write(port, 0x0, PCIE_CORE_CTRL_MGMT_BASE + PCIE_RC_BAR_CONF);
 
-	pcie_write(port, (RC_REGION_0_ADDR_TRANS_L + RC_REGION_0_PASS_BITS),
+	rockchip_pcie_write(port, (RC_REGION_0_ADDR_TRANS_L + RC_REGION_0_PASS_BITS),
 		   PCIE_CORE_AXI_CONF_BASE);
-	pcie_write(port, RC_REGION_0_ADDR_TRANS_H,
+	rockchip_pcie_write(port, RC_REGION_0_ADDR_TRANS_H,
 		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_ADDR1);
-	pcie_write(port, 0x0080000a,
+	rockchip_pcie_write(port, 0x0080000a,
 		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_DESC0);
-	pcie_write(port, 0x0,
+	rockchip_pcie_write(port, 0x0,
 		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_DESC1);
 
 	return 0;
@@ -584,10 +584,10 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
 	u32 reg;
 	u32 sub_reg;
 
-	reg = pcie_read(pp, PCIE_CLIENT_INT_STATUS);
+	reg = rockchip_pcie_read(pp, PCIE_CLIENT_INT_STATUS);
 	if (reg & PCIE_CLIENT_INT_LOCAL) {
 		dev_dbg(pp->dev, "local interrupt received\n");
-		sub_reg = pcie_read(pp, PCIE_CORE_INT_STATUS);
+		sub_reg = rockchip_pcie_read(pp, PCIE_CORE_INT_STATUS);
 		if (sub_reg & PCIE_CORE_INT_PRFPE)
 			dev_dbg(pp->dev, "parity error detected while reading from the PNP receive FIFO RAM\n");
 
@@ -630,13 +630,13 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
 		if (sub_reg & PCIE_CORE_INT_MMVC)
 			dev_dbg(pp->dev, "MSI mask register changes\n");
 
-		pcie_write(pp, sub_reg, PCIE_CORE_INT_STATUS);
+		rockchip_pcie_write(pp, sub_reg, PCIE_CORE_INT_STATUS);
 	} else if (reg & PCIE_CLIENT_INT_PHY) {
 		dev_dbg(pp->dev, "phy link changes\n");
 		rockchip_pcie_clr_bw_int(pp);
 	}
 
-	pcie_write(pp, reg & PCIE_CLIENT_INT_LOCAL, PCIE_CLIENT_INT_STATUS);
+	rockchip_pcie_write(pp, reg & PCIE_CLIENT_INT_LOCAL, PCIE_CLIENT_INT_STATUS);
 
 	return IRQ_HANDLED;
 }
@@ -646,7 +646,7 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
 	struct rockchip_pcie_port *pp = arg;
 	u32 reg;
 
-	reg = pcie_read(pp, PCIE_CLIENT_INT_STATUS);
+	reg = rockchip_pcie_read(pp, PCIE_CLIENT_INT_STATUS);
 	if (reg & PCIE_CLIENT_INT_LEGACY_DONE)
 		dev_dbg(pp->dev, "legacy done interrupt received\n");
 
@@ -671,7 +671,7 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
 	if (reg & PCIE_CLIENT_INT_PHY)
 		dev_dbg(pp->dev, "phy interrupt received\n");
 
-	pcie_write(pp, reg & (PCIE_CLIENT_INT_LEGACY_DONE |
+	rockchip_pcie_write(pp, reg & (PCIE_CLIENT_INT_LEGACY_DONE |
 			      PCIE_CLIENT_INT_MSG | PCIE_CLIENT_INT_HOT_RST |
 			      PCIE_CLIENT_INT_DPA | PCIE_CLIENT_INT_FATAL_ERR |
 			      PCIE_CLIENT_INT_NFATAL_ERR |
@@ -693,7 +693,7 @@ static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 	port = irq_desc_get_handler_data(desc);
 
-	reg = pcie_read(port, PCIE_CLIENT_INT_STATUS);
+	reg = rockchip_pcie_read(port, PCIE_CLIENT_INT_STATUS);
 	reg = (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
 	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
 
@@ -917,9 +917,9 @@ err_out:
 
 static void rockchip_pcie_enable_interrupts(struct rockchip_pcie_port *port)
 {
-	pcie_write(port, (PCIE_CLIENT_INT_CLI << 16) &
+	rockchip_pcie_write(port, (PCIE_CLIENT_INT_CLI << 16) &
 		   (~PCIE_CLIENT_INT_CLI), PCIE_CLIENT_INT_MASK);
-	pcie_write(port, (u32)(~PCIE_CORE_INT), PCIE_CORE_INT_MASK);
+	rockchip_pcie_write(port, (u32)(~PCIE_CORE_INT), PCIE_CORE_INT_MASK);
 
 	rockchip_pcie_enable_bw_int(port);
 }

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
