From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/overlay: Directly include idr.h
Date: Tue, 17 Feb 2015 11:36:58 +0900
Message-ID: <1424140618-22987-1-git-send-email-broonie@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The overlay code uses IDRs but does not explicitly include the header
providing the interface, instead relying on an implicit inclusion. Make
the dependency implict to avoid potential future build issues if the
implicit inclusion goes away.

Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/overlay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 352b4f28f82c..406664801cb5 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -19,6 +19,7 @@
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/idr.h>
 
 #include "of_private.h"
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
