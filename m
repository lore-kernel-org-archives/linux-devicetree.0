From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] of: of_reserved_mem: Provide return values
Date: Sat, 27 Sep 2014 11:02:21 -0300
Message-ID: <1411826541-5408-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Commit 1a29544cc8c9 ("drivers: of: add return value to 
of_reserved_mem_device_init") missed to update the return values in the error
cases, causing the following build warnings:

drivers/of/of_reserved_mem.c: In function 'of_reserved_mem_device_init':
drivers/of/of_reserved_mem.c:253:3: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
drivers/of/of_reserved_mem.c:259:3: warning: 'return' with no value, in function returning non-void [-Wreturn-type]

Provide proper return values. 

Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes since v1:
- Fix typo in the Reported-by tag

 drivers/of/of_reserved_mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7e7de03..01ef0a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -250,13 +250,13 @@ int of_reserved_mem_device_init(struct device *dev)
 
 	np = of_parse_phandle(dev->of_node, "memory-region", 0);
 	if (!np)
-		return;
+		return -ENODEV;
 
 	rmem = __find_rmem(np);
 	of_node_put(np);
 
 	if (!rmem || !rmem->ops || !rmem->ops->device_init)
-		return;
+		return -ENOMEM;
 
 	rmem->ops->device_init(rmem, dev);
 	dev_info(dev, "assigned reserved memory node %s\n", rmem->name);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
