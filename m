From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of: Don't try to search when phandle == 0
Date: Thu,  2 Oct 2014 13:12:10 +0100
Message-ID: <1412251931-6640-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A value of '0' isn't a valid phandle, so searching for a node with that
phandle is pointless. It will result in nothing but false positives.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 293ed4b687ba..2305dc0382bc 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1021,6 +1021,9 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 	struct device_node *np;
 	unsigned long flags;
 
+	if (!handle)
+		return NULL;
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	for (np = of_allnodes; np; np = np->allnext)
 		if (np->phandle == handle)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
