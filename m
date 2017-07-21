From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of: irq: fix of_irq_to_resource() error check
Date: Fri, 21 Jul 2017 20:30:39 +0300
Message-ID: <20170721173108.578363976@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of-irq-fix-of_irq_to_resource-error-check.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_irq_to_resource() has recently been fixed to return negative error #'s
along with 0, however of_irq_to_resource_table() still only regards 0 as
invalid IRQ -- fix it up.

Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against the 'dt/linus' branch of Rob Herring's 'linux.git' repo.

 drivers/of/irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/of/irq.c
===================================================================
--- linux.orig/drivers/of/irq.c
+++ linux/drivers/of/irq.c
@@ -476,7 +476,7 @@ int of_irq_to_resource_table(struct devi
 	int i;
 
 	for (i = 0; i < nr_irqs; i++, res++)
-		if (!of_irq_to_resource(dev, i, res))
+		if (of_irq_to_resource(dev, i, res) <= 0)
 			break;
 
 	return i;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
