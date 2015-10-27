From: Saurabh Sengar <saurabh.truth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drivers: of: removing assignment of 0 to static variable
Date: Tue, 27 Oct 2015 09:12:01 +0530
Message-ID: <1445917321-5225-1-git-send-email-saurabh.truth@gmail.com>
References: <saurabh.truth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <saurabh.truth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Saurabh Sengar <saurabh.truth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

no need to initialise static variable with 0, hence correcting it.

Signed-off-by: Saurabh Sengar <saurabh.truth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 6e82bc42..63699dd 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -184,7 +184,7 @@ static void * unflatten_dt_node(const void *blob,
 	struct property *pp, **prev_pp = NULL;
 	const char *pathp;
 	unsigned int l, allocl;
-	static int depth = 0;
+	static int depth;
 	int old_depth;
 	int offset;
 	int has_name = 0;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
