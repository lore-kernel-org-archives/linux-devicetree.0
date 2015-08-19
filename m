From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/address: Don't loop forever in of_find_matching_node_by_address().
Date: Wed, 19 Aug 2015 13:17:47 -0700
Message-ID: <1440015467-21364-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

If the internal call to of_address_to_resource() fails, we end up
looping forever in of_find_matching_node_by_address().  This can be
caused by a defective device tree, or calling with an incorrect
matches argument.

Fix by calling of_find_matching_node() unconditionally at the end of
the loop.

Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/address.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8bfda6a..384574c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -845,10 +845,10 @@ struct device_node *of_find_matching_node_by_address(struct device_node *from,
 	struct resource res;
 
 	while (dn) {
-		if (of_address_to_resource(dn, 0, &res))
-			continue;
-		if (res.start == base_address)
+		if (!of_address_to_resource(dn, 0, &res) &&
+		    res.start == base_address)
 			return dn;
+
 		dn = of_find_matching_node(dn, matches);
 	}
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
