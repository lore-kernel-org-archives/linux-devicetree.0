From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] drivers: of: Fix of_pci.h header guard
Date: Tue,  7 Jun 2016 18:44:48 +0100
Message-ID: <cf20413cea1895fd005bf27460fe649000c09e02.1465321392.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The compilation of of_pci.c is governed by CONFIG_OF_PCI, but the
corresponding declarations in of_pci.h are inconsistently guarded by
CONFIG_OF, with the result that if CONFIG_PCI is disabled for an OF
platform, the dangling external declarations are still active and the
inline stub definitions not. So far this has managed to go unnoticed
since it happens that the only references to these functions are from
code which itself depends on CONFIG_PCI or CONFIG_OF_PCI.

Fix this with the appropriate config guard so that any new callers
outside PCI-specific code don't start unexpectedly breaking under
certain configs.

Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/of_pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 070f8835780b..4224e7bb7c16 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -8,7 +8,7 @@ struct pci_dev;
 struct of_phandle_args;
 struct device_node;
 
-#ifdef CONFIG_OF
+#ifdef CONFIG_OF_PCI
 int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq);
 struct device_node *of_pci_find_child_device(struct device_node *parent,
 					     unsigned int devfn);
-- 
2.8.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
