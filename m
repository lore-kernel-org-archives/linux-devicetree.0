From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 2/5] drivers/of: add EXPORT_SYMBOL to of_irq_count
Date: Sun, 7 Feb 2016 19:00:41 -0500
Message-ID: <1454889644-27830-3-git-send-email-paul.gortmaker@windriver.com>
References: <1454889644-27830-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454889644-27830-1-git-send-email-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We would like to modularize some of the PCI platform specific
support code to keep multi platform bzImage sizes in check.

However, in a couple of the files we see this:

$ git grep -l of_irq_count drivers/pci
drivers/pci/host/pci-keystone.c
drivers/pci/host/pcie-iproc-msi.c

So, we export of_irq_count so we can make headway with the
modularization goal.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7ee21ae305ae..0d714748a571 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -449,6 +449,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
