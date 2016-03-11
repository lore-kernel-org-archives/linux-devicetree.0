From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 6/8] of.h: add for_each_compatible_node_from helper
Date: Fri, 11 Mar 2016 16:56:13 +0100
Message-ID: <1457711775-6326-7-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When working with independant trees, one need to find each
compatible node from something else than of_root.

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 include/linux/of.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 883df55..37da652 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -891,6 +891,9 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
+#define for_each_compatible_node_from(from, dn, type, compatible) \
+	for (dn = of_find_compatible_node(from, type, compatible); dn; \
+	     dn = of_find_compatible_node(dn, type, compatible))
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
