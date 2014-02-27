From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Memory leak in scripts/dtc/util.c
Date: Thu, 27 Feb 2014 19:24:33 +0100
Message-ID: <1393525473-12238-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

buf was leaked if out of memory

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 scripts/dtc/util.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/dtc/util.c b/scripts/dtc/util.c
index 2422c34..a1e2e59 100644
--- a/scripts/dtc/util.c
+++ b/scripts/dtc/util.c
@@ -210,9 +210,11 @@ int utilfdt_read_err(const char *filename, char **buffp)
 	do {
 		/* Expand the buffer to hold the next chunk */
 		if (offset == bufsize) {
+			char *buf_old = buf;
 			bufsize *= 2;
 			buf = realloc(buf, bufsize);
 			if (!buf) {
+				buf = buf_old;
 				ret = ENOMEM;
 				break;
 			}
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
