From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: irq: Export of_irq_count()
Date: Mon,  3 Apr 2017 17:55:47 +0200
Message-ID: <20170403155547.19917-1-thierry.reding@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

of_irq_count() is handy for obtaining the number of interrupts assigned
to a device tree node. It is reasonable to want to access this function
from loadable modules, so export the symbol to allow that.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi Rob, Frank,

This patch is required for the new Tegra186 GPIO driver I'm trying to
get merged for v4.12. It'd be great if I could get an Acked-by from you
so that the patch can be merged through the GPIO tree along with a few
other prerequisites for the new driver.

Potential for conflicts is rather minimal given the line count.

Thanks,
Thierry

 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7c56b72d1dc6..3deaada2ff29 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -458,6 +458,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
