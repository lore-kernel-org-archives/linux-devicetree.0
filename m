From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/3] base: Export platform_msi_domain_{alloc,free}_irqs
Date: Tue, 26 Jan 2016 13:52:27 +0000
Message-ID: <1453816347-32720-4-git-send-email-marc.zyngier@arm.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453816347-32720-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The new function platform_msi_domain_{alloc,free}_irqs are meant to be
used in platform drivers, which can be built as modules. Therefore, it
makes sense to export them to be used from kernel modules.

Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/base/platform-msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 5df4575..82f4c89 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -246,6 +246,7 @@ out_free_data:
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(platform_msi_domain_alloc_irqs);
 
 /**
  * platform_msi_domain_free_irqs - Free MSI interrupts for @dev
@@ -268,3 +269,4 @@ void platform_msi_domain_free_irqs(struct device *dev)
 	msi_domain_free_irqs(dev->msi_domain, dev);
 	platform_msi_free_descs(dev);
 }
+EXPORT_SYMBOL_GPL(platform_msi_domain_free_irqs);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
