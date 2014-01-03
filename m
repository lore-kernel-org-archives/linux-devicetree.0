From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 01/10] Remove unused srcpos_warn() function
Date: Sat,  4 Jan 2014 00:24:34 +1100
Message-ID: <1388755483-27008-2-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This function has no users, and we can replace it more generally later.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 srcpos.c | 17 -----------------
 srcpos.h |  2 --
 2 files changed, 19 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 294568b..06ef06d 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -312,23 +312,6 @@ srcpos_error(struct srcpos *pos, char const *fmt, ...)
 	va_end(va);
 }
 
-
-void
-srcpos_warn(struct srcpos *pos, char const *fmt, ...)
-{
-	const char *srcstr;
-	va_list va;
-	va_start(va, fmt);
-
-	srcstr = srcpos_string(pos);
-
-	fprintf(stderr, "Warning: %s ", srcstr);
-	vfprintf(stderr, fmt, va);
-	fprintf(stderr, "\n");
-
-	va_end(va);
-}
-
 void srcpos_set_line(char *f, int l)
 {
 	current_srcfile->name = f;
diff --git a/srcpos.h b/srcpos.h
index 57dfa0f..7f0eaea 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -111,8 +111,6 @@ extern void srcpos_verror(struct srcpos *pos, char const *, va_list va)
      __attribute__((format(printf, 2, 0)));
 extern void srcpos_error(struct srcpos *pos, char const *, ...)
      __attribute__((format(printf, 2, 3)));
-extern void srcpos_warn(struct srcpos *pos, char const *, ...)
-     __attribute__((format(printf, 2, 3)));
 
 extern void srcpos_set_line(char *f, int l);
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
