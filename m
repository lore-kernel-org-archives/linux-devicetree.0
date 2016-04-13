From: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH 3/6] genirq/msi: Export msi_get_domain_info
Date: Wed, 13 Apr 2016 12:30:53 +0200
Message-ID: <1460543456-11345-4-git-send-email-mbrugger@suse.com>
References: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460543456-11345-1-git-send-email-mbrugger-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, jroedel-l3A5Bk7waGM@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mbrugger-IBi9RG/b67k@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Allow modules to call msi_get_domain_info.

Signed-off-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
---
 kernel/irq/msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 38e89ce..9b0ba4a 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -400,5 +400,6 @@ struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain)
 {
 	return (struct msi_domain_info *)domain->host_data;
 }
+EXPORT_SYMBOL_GPL(msi_get_domain_info);
 
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
