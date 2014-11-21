From: Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH 1/1] of: base, fix of_property_read_string_helper kernel-doc
Date: Fri, 21 Nov 2014 13:23:09 +0100
Message-ID: <1416572589-4953-1-git-send-email-jslaby@suse.cz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Hart <darren.hart-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It referenced of_property_read_string_util whereas the function name
is of_property_read_string_helper.

Introduced in a87fa1d81a9fb5e9adca9820e16008c40ad09f33 (of: Fix
overflow bug in string property parsing functions). Found out when
reviewing the stable 3.12 queue.

Signed-off-by: Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Darren Hart <darren.hart-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 37de43ef22fc..76d8307a1cd5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1359,7 +1359,7 @@ int of_property_match_string(struct device_node *np, const char *propname,
 EXPORT_SYMBOL_GPL(of_property_match_string);
 
 /**
- * of_property_read_string_util() - Utility helper for parsing string properties
+ * of_property_read_string_helper() - Utility helper for parsing string properties
  * @np:		device node from which the property value is to be read.
  * @propname:	name of the property to be searched.
  * @out_strs:	output array of string pointers.
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
