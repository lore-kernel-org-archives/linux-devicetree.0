From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 12/15] Rename ROCKCHIP_PCIE_RPIFR1_INTR_MASK and
 ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT
Date: Fri, 02 Sep 2016 10:55:35 -0500
Message-ID: <20160902155535.8650.68415.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160902154501.8650.99790.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160902154501.8650.99790.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

to match similar definitions.
---
 drivers/pci/host/pcie-rockchip.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 88c16da..2a41439 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -56,8 +56,8 @@
 #define  PCIE_CLIENT_LINK_STATUS_MASK		0x3
 #define PCIE_CLIENT_INT_MASK		(PCIE_CLIENT_BASE + 0x4c)
 #define PCIE_CLIENT_INT_STATUS		(PCIE_CLIENT_BASE + 0x50)
-#define  ROCKCHIP_PCIE_RPIFR1_INTR_MASK		GENMASK(8, 5)
-#define  ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT	5
+#define  PCIE_CLIENT_INTR_MASK			GENMASK(8, 5)
+#define  PCIE_CLIENT_INTR_SHIFT			5
 #define  PCIE_CLIENT_INT_LEGACY_DONE		BIT(15)
 #define  PCIE_CLIENT_INT_MSG			BIT(14)
 #define  PCIE_CLIENT_INT_HOT_RST		BIT(13)
@@ -679,8 +679,7 @@ static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	reg = rockchip_pcie_read(rockchip, PCIE_CLIENT_INT_STATUS);
-	reg = (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
-	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
+	reg = (reg & PCIE_CLIENT_INTR_MASK) >> PCIE_CLIENT_INTR_SHIFT;
 
 	while (reg) {
 		hwirq = ffs(reg) - 1;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
