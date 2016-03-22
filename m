From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: [PATCH next 2/2] PCI: keystone: remove unnecessary goto statement
Date: Tue, 22 Mar 2016 15:52:58 -0400
Message-ID: <1458676378-24377-2-git-send-email-m-karicheri2@ti.com>
References: <1458676378-24377-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458676378-24377-1-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the misuse of goto statement in ks_pcie_get_irq_controller_info()
as simple return is more appropriate for this function. While at
it add an error log for absence of interrupt controller node.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-keystone.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-keystone.c b/drivers/pci/host/pci-keystone.c
index 299f2f0..3563b9c 100644
--- a/drivers/pci/host/pci-keystone.c
+++ b/drivers/pci/host/pci-keystone.c
@@ -181,11 +181,13 @@ static int ks_pcie_get_irq_controller_info(struct keystone_pcie *ks_pcie,
 	*np_temp = of_find_node_by_name(np_pcie, controller);
 	if (!(*np_temp)) {
 		dev_err(dev, "Node for %s is absent\n", controller);
-		goto out;
+		return ret;
 	}
 	temp = of_irq_count(*np_temp);
-	if (!temp)
-		goto out;
+	if (!temp) {
+		dev_err(dev, "No entries in %s\n", controller);
+		return ret;
+	}
 	if (temp > max_host_irqs)
 		dev_warn(dev, "Too many %s interrupts defined %u\n",
 			(legacy ? "legacy" : "MSI"), temp);
@@ -203,7 +205,6 @@ static int ks_pcie_get_irq_controller_info(struct keystone_pcie *ks_pcie,
 		*num_irqs = temp;
 		ret = 0;
 	}
-out:
 	return ret;
 }
 
@@ -231,6 +232,7 @@ static void ks_pcie_setup_interrupts(struct keystone_pcie *ks_pcie)
 	/* enable error interrupt */
 	if (ks_pcie->error_irq > 0)
 		ks_dw_pcie_enable_error_irq(ks_pcie->va_app_base);
+
 }
 
 /*
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
