From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch v3 3/3] dt: OF_UNITTEST make dependency broken, fix unittest.c
 after move
Date: Thu, 12 Mar 2015 06:18:59 -0700
Message-ID: <55019243.8090902@gmail.com>
References: <5501918D.2020000@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5501918D.2020000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Fix an of_unittest.c include path to account for the move of
unittest.c into unittest-data/.

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

---
 drivers/of/unittest-data/unittest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/of/unittest-data/unittest.c
===================================================================
--- a/drivers/of/unittest-data/unittest.c
+++ b/drivers/of/unittest-data/unittest.c
@@ -23,7 +23,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 
-#include "of_private.h"
+#include "../of_private.h"
 
 static struct selftest_results {
 	int passed;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
