From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 1/2] of: remove extraneous 'const' in typedef
Date: Thu, 11 May 2017 14:24:49 +0200
Message-ID: <20170511122458.3862716-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

One change that was meant to address a sparse warning turned out
to cause hundreds of new gcc-7 warnings:

include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]

After reverting the change, the gcc warnings are gone again, and I
can't reproduce the sparse warnings either.

Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 include/linux/of_irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index ec6b11deb773..1e0deb8e8494 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -8,7 +8,7 @@
 #include <linux/ioport.h>
 #include <linux/of.h>
 
-typedef int const (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
+typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 
 /*
  * Workarounds only applied to 32bit powermac machines
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
