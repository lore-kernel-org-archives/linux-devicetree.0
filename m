From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] of: introduce of_property_read_s32
Date: Fri, 13 Dec 2013 21:54:51 +0100
Message-ID: <1386968094-24554-2-git-send-email-sre@debian.org>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386968094-24554-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce signed 32bit integer of_property_read method.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 include/linux/of.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 276c546..24cac04 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -601,6 +601,13 @@ static inline int of_property_read_u32(const struct device_node *np,
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
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
