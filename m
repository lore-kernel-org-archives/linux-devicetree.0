From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 02/10] Fix typo in type of srcpos_verror() et al.
Date: Sat,  4 Jan 2014 00:24:35 +1100
Message-ID: <1388755483-27008-3-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The srcpos_verror() and srcpos_error() functions declare the format
string as 'char const *' instead of 'const char *'.  Fix it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 srcpos.c | 4 ++--
 srcpos.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 06ef06d..71a73b8 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -291,7 +291,7 @@ srcpos_string(struct srcpos *pos)
 }
 
 void
-srcpos_verror(struct srcpos *pos, char const *fmt, va_list va)
+srcpos_verror(struct srcpos *pos, const char *fmt, va_list va)
 {
        const char *srcstr;
 
@@ -303,7 +303,7 @@ srcpos_verror(struct srcpos *pos, char const *fmt, va_list va)
 }
 
 void
-srcpos_error(struct srcpos *pos, char const *fmt, ...)
+srcpos_error(struct srcpos *pos, const char *fmt, ...)
 {
 	va_list va;
 
diff --git a/srcpos.h b/srcpos.h
index 7f0eaea..46ea08a 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -107,9 +107,9 @@ extern struct srcpos *srcpos_copy(struct srcpos *pos);
 extern char *srcpos_string(struct srcpos *pos);
 extern void srcpos_dump(struct srcpos *pos);
 
-extern void srcpos_verror(struct srcpos *pos, char const *, va_list va)
+extern void srcpos_verror(struct srcpos *pos, const char *, va_list va)
      __attribute__((format(printf, 2, 0)));
-extern void srcpos_error(struct srcpos *pos, char const *, ...)
+extern void srcpos_error(struct srcpos *pos, const char *, ...)
      __attribute__((format(printf, 2, 3)));
 
 extern void srcpos_set_line(char *f, int l);
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
