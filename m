From: Ravi Shankar Jonnalagadda <venkata.ravi.jonnalagadda-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/5] PCI:xilinx-nwl: Enable Root DMA
Date: Fri, 8 Sep 2017 17:53:03 +0530
Message-ID: <1504873388-29195-2-git-send-email-vjonnal@xilinx.com>
References: <1504873388-29195-1-git-send-email-vjonnal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504873388-29195-1-git-send-email-vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enabling Root DMA interrupts

Adding Root DMA translations to bridge for Register Access

Signed-off-by: Ravi Shankar Jonnalagadda <vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: RaviKiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pcie-xilinx-nwl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/host/pcie-xilinx-nwl.c b/drivers/pci/host/pcie-xilinx-nwl.c
index eec641a..5766582 100644
--- a/drivers/pci/host/pcie-xilinx-nwl.c
+++ b/drivers/pci/host/pcie-xilinx-nwl.c
@@ -39,6 +39,11 @@
 #define E_ECAM_CONTROL			0x00000228
 #define E_ECAM_BASE_LO			0x00000230
 #define E_ECAM_BASE_HI			0x00000234
+#define E_DREG_CTRL			0x00000288
+#define E_DREG_BASE_LO			0x00000290
+
+#define DREG_DMA_EN			BIT(0)
+#define DREG_DMA_BASE_LO		0xFD0F0000
 
 /* Ingress - address translations */
 #define I_MSII_CAPABILITIES		0x00000300
@@ -57,6 +62,10 @@
 #define MSGF_MSI_STATUS_HI		0x00000444
 #define MSGF_MSI_MASK_LO		0x00000448
 #define MSGF_MSI_MASK_HI		0x0000044C
+/* Root DMA Interrupt register */
+#define MSGF_DMA_MASK			0x00000464
+
+#define MSGF_INTR_EN			BIT(0)
 
 /* Msg filter mask bits */
 #define CFG_ENABLE_PM_MSG_FWD		BIT(1)
@@ -766,6 +775,12 @@ static int nwl_pcie_bridge_init(struct nwl_pcie *pcie)
 	nwl_bridge_writel(pcie, nwl_bridge_readl(pcie, MSGF_LEG_STATUS) &
 			  MSGF_LEG_SR_MASKALL, MSGF_LEG_STATUS);
 
+	/* Enabling DREG translations */
+	nwl_bridge_writel(pcie, DREG_DMA_EN, E_DREG_CTRL);
+	nwl_bridge_writel(pcie, DREG_DMA_BASE_LO, E_DREG_BASE_LO);
+	/* Enabling Root DMA interrupts */
+	nwl_bridge_writel(pcie, MSGF_INTR_EN, MSGF_DMA_MASK);
+
 	/* Enable all legacy interrupts */
 	nwl_bridge_writel(pcie, MSGF_LEG_SR_MASKALL, MSGF_LEG_MASK);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
