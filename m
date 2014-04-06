From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: introduce of_property_read_s32
Date: Sun,  6 Apr 2014 12:52:11 +0200
Message-ID: <1396781531-3397-1-git-send-email-sre@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce signed 32bit integer of_property_read method.

Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Hi,

This is a dependency for the DT binding additions in lis302dl, which can be
found at [0]. Since I never got any reply from the DT maintainers I will try to
send this patch separate, so that the it hopefully catches their eyes :)

[0] http://www.spinics.net/lists/devicetree/msg15747.html

-- Sebastian
---
 include/linux/of.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 919bf21..70530d1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -691,6 +691,13 @@ static inline int of_property_read_u32(const struct device_node *np,
 	return of_property_read_u32_array(np, propname, out_value, 1);
 }
 
+static inline int of_property_read_s32(const struct device_node *np,
+				       const char *propname,
+				       s32 *out_value)
+{
+	return of_property_read_u32(np, propname, (u32*) out_value);
+}
+
 #define of_property_for_each_u32(np, propname, prop, p, u)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		p = of_prop_next_u32(prop, NULL, &u);		\
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
