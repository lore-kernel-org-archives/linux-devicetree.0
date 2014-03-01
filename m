From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Remove dead code in util.c
Date: Sat,  1 Mar 2014 09:11:47 +0100
Message-ID: <1393661507-7197-1-git-send-email-xypron.glpk@gmx.de>
References: <CAL_JsqK9Wquv6kgefyPvy0JqXNO7Cx2+iN_ss=CtgXnKEjrF-Q@mail.gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK9Wquv6kgefyPvy0JqXNO7Cx2+iN_ss=CtgXnKEjrF-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

xrealloc never returns null

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 util.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/util.c b/util.c
index be67836..1ce8b97 100644
--- a/util.c
+++ b/util.c
@@ -219,10 +219,6 @@ int utilfdt_read_err_len(const char *filename, char **buffp, off_t *len)
 		if (offset == bufsize) {
 			bufsize *= 2;
 			buf = xrealloc(buf, bufsize);
-			if (!buf) {
-				ret = ENOMEM;
-				break;
-			}
 		}
 
 		ret = read(fd, &buf[offset], bufsize - offset);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
