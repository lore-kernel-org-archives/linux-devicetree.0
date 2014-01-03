From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 05/10] Make srcpos_{v,}error() more widely useful
Date: Sat,  4 Jan 2014 00:24:38 +1100
Message-ID: <1388755483-27008-6-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow them to take a prefix argument giving the general type of error,
which will be useful in future.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y |  2 +-
 srcpos.c     | 12 ++++++------
 srcpos.h     | 10 ++++++----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 4864631..2bcef1b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -475,7 +475,7 @@ void print_error(char const *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	srcpos_verror(&yylloc, fmt, va);
+	srcpos_verror(&yylloc, "Error", fmt, va);
 	va_end(va);
 
 	treesource_error = true;
diff --git a/srcpos.c b/srcpos.c
index 6705fed..3999675 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -290,27 +290,27 @@ srcpos_string(struct srcpos *pos)
 	return pos_str;
 }
 
-void
-srcpos_verror(struct srcpos *pos, const char *fmt, va_list va)
+void srcpos_verror(struct srcpos *pos, const char *prefix,
+		   const char *fmt, va_list va)
 {
 	char *srcstr;
 
 	srcstr = srcpos_string(pos);
 
-	fprintf(stderr, "Error: %s ", srcstr);
+	fprintf(stderr, "%s: %s ", prefix, srcstr);
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 
 	free(srcstr);
 }
 
-void
-srcpos_error(struct srcpos *pos, const char *fmt, ...)
+void srcpos_error(struct srcpos *pos, const char *prefix,
+		  const char *fmt, ...)
 {
 	va_list va;
 
 	va_start(va, fmt);
-	srcpos_verror(pos, fmt, va);
+	srcpos_verror(pos, prefix, fmt, va);
 	va_end(va);
 }
 
diff --git a/srcpos.h b/srcpos.h
index 46ea08a..f81827b 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -107,10 +107,12 @@ extern struct srcpos *srcpos_copy(struct srcpos *pos);
 extern char *srcpos_string(struct srcpos *pos);
 extern void srcpos_dump(struct srcpos *pos);
 
-extern void srcpos_verror(struct srcpos *pos, const char *, va_list va)
-     __attribute__((format(printf, 2, 0)));
-extern void srcpos_error(struct srcpos *pos, const char *, ...)
-     __attribute__((format(printf, 2, 3)));
+extern void srcpos_verror(struct srcpos *pos, const char *prefix,
+			  const char *fmt, va_list va)
+	__attribute__((format(printf, 3, 0)));
+extern void srcpos_error(struct srcpos *pos, const char *prefix,
+			 const char *fmt, ...)
+	__attribute__((format(printf, 3, 4)));
 
 extern void srcpos_set_line(char *f, int l);
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
