From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 04/10] Fix memory leak in srcpos_verror()
Date: Sat,  4 Jan 2014 00:24:37 +1100
Message-ID: <1388755483-27008-5-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since dtc runs are short, we don't care that much about memory leaks.
Still, leaking the source position string every time we print an error
messages is pretty nasty.  Fix it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 srcpos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/srcpos.c b/srcpos.c
index 48059aa..6705fed 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -293,13 +293,15 @@ srcpos_string(struct srcpos *pos)
 void
 srcpos_verror(struct srcpos *pos, const char *fmt, va_list va)
 {
-	const char *srcstr;
+	char *srcstr;
 
 	srcstr = srcpos_string(pos);
 
 	fprintf(stderr, "Error: %s ", srcstr);
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
+
+	free(srcstr);
 }
 
 void
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
