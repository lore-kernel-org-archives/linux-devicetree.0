From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Remove duplicate assignment
Date: Sun,  2 Mar 2014 21:45:57 +0100
Message-ID: <1393793157-29233-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 tests/testutils.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/testutils.c b/tests/testutils.c
index f185133..521f4f1 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -144,7 +144,6 @@ int nodename_eq(const char *s1, const char *s2)
 {
 	int len = strlen(s2);
 
-	len = strlen(s2);
 	if (strncmp(s1, s2, len) != 0)
 		return 0;
 	if (s1[len] == '\0')
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
