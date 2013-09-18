From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/2] powerpc: remove big endianness assumption in of_find_next_cache_node
Date: Wed, 18 Sep 2013 11:53:04 +0100
Message-ID: <1379501585-12532-2-git-send-email-Sudeep.KarkadaNagesha@arm.com>
References: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>

Currently big endianness of the device tree data is assumed in
of_find_next_cache_node for 'handle' when calling of_find_node_by_phandle.

In preparation to move this function to common code, this patch fixes
the endianness using 'be32_to_cpup'

Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
---
 arch/powerpc/kernel/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index b7634ce..09be275 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -778,7 +778,7 @@ struct device_node *of_find_next_cache_node(struct device_node *np)
 		handle = of_get_property(np, "next-level-cache", NULL);
 
 	if (handle)
-		return of_find_node_by_phandle(*handle);
+		return of_find_node_by_phandle(be32_to_cpup(handle));
 
 	/* OF on pmac has nodes instead of properties named "l2-cache"
 	 * beneath CPU nodes.
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
