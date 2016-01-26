From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 2/3] of: MSI: Simplify irqdomain lookup
Date: Tue, 26 Jan 2016 13:52:26 +0000
Message-ID: <1453816347-32720-3-git-send-email-marc.zyngier@arm.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

So far, when trying to associate a device with its MSI domain,
we first lookup the domain using a MSI token, and if this
doesn't return anything useful, we pick up any domain matching
the same node.

This logic is broken for two reasons:
1) Only the generic MSI code (PCI or platform) sets this token
   to PCI/MSI or platform MSI. So we're guaranteed that if there
   is something to be found, we will find it with the first call.
2) If we have a convoluted situation where:
   - a single node implements both wired and MSI interrupts
   - MSI support for that HW hasn't been compiled in
   we'll end up using the wired domain for MSIs anyway, and things
   break badly.

So let's just remove __of_get_msi_domain, and replace it by a direct
call to irq_find_matching_host, because that's what we really want.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/of/irq.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 4fa916d..a9ea552 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -680,18 +680,6 @@ u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in)
 	return __of_msi_map_rid(dev, &msi_np, rid_in);
 }
 
-static struct irq_domain *__of_get_msi_domain(struct device_node *np,
-					      enum irq_domain_bus_token token)
-{
-	struct irq_domain *d;
-
-	d = irq_find_matching_host(np, token);
-	if (!d)
-		d = irq_find_host(np);
-
-	return d;
-}
-
 /**
  * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
  * @dev: device for which the mapping is to be done.
@@ -707,7 +695,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 rid)
 	struct device_node *np = NULL;
 
 	__of_msi_map_rid(dev, &np, rid);
-	return __of_get_msi_domain(np, DOMAIN_BUS_PCI_MSI);
+	return irq_find_matching_host(np, DOMAIN_BUS_PCI_MSI);
 }
 
 /**
@@ -731,7 +719,7 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 	/* Check for a single msi-parent property */
 	msi_np = of_parse_phandle(np, "msi-parent", 0);
 	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
-		d = __of_get_msi_domain(msi_np, token);
+		d = irq_find_matching_host(msi_np, token);
 		if (!d)
 			of_node_put(msi_np);
 		return d;
@@ -745,7 +733,7 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 		while (!of_parse_phandle_with_args(np, "msi-parent",
 						   "#msi-cells",
 						   index, &args)) {
-			d = __of_get_msi_domain(args.np, token);
+			d = irq_find_matching_host(args.np, token);
 			if (d)
 				return d;
 
-- 
2.1.4
