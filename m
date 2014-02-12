From: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] export of_irq_count
Date: Wed, 12 Feb 2014 11:34:03 -0600
Message-ID: <1392226444-30507-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Yves Vandervennet <rocket.yvanderv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

export of_irq_count so it can be used in drivers that are built
as modules.

Signed-off-by: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/irq.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9bcf2cf..5ed19f3 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -393,6 +393,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
