From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 03/10] Fix indentation of srcpos_verror()
Date: Sat,  4 Jan 2014 00:24:36 +1100
Message-ID: <1388755483-27008-4-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Somehow this function ended up with a 7 space indent, instead of the usual
8 space (1 tab) indent.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 srcpos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 71a73b8..48059aa 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -293,13 +293,13 @@ srcpos_string(struct srcpos *pos)
 void
 srcpos_verror(struct srcpos *pos, const char *fmt, va_list va)
 {
-       const char *srcstr;
+	const char *srcstr;
 
-       srcstr = srcpos_string(pos);
+	srcstr = srcpos_string(pos);
 
-       fprintf(stderr, "Error: %s ", srcstr);
-       vfprintf(stderr, fmt, va);
-       fprintf(stderr, "\n");
+	fprintf(stderr, "Error: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
 }
 
 void
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
