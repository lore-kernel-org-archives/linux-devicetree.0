From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 1/5] util: Add xasprintf portable asprintf variant
Date: Tue, 24 May 2016 20:50:35 +0300
Message-ID: <1464112239-29856-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464112239-29856-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Include a portable asprintf variant that works on any C99
conforming platform.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 util.c | 30 ++++++++++++++++++++++++++++++
 util.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/util.c b/util.c
index fb124ee..3550f86 100644
--- a/util.c
+++ b/util.c
@@ -46,6 +46,36 @@ char *xstrdup(const char *s)
 	return d;
 }
 
+/* based in part from (3) vsnprintf */
+int xasprintf(char **strp, const char *fmt, ...)
+{
+	int n, size = 128;	/* start with 128 bytes */
+	char *p;
+	va_list ap;
+
+	/* initial pointer is NULL making the fist realloc to be malloc */
+	p = NULL;
+	while (1) {
+		p = xrealloc(p, size);
+
+		/* Try to print in the allocated space. */
+		va_start(ap, fmt);
+		n = vsnprintf(p, size, fmt, ap);
+		va_end(ap);
+
+		/* If that worked, return the string. */
+		if (n > -1 && n < size)
+			break;
+		/* Else try again with more space. */
+		if (n > -1)	/* glibc 2.1 */
+			size = n + 1; /* precisely what is needed */
+		else		/* glibc 2.0 */
+			size *= 2; /* twice the old size */
+	}
+	*strp = p;
+	return strlen(p);
+}
+
 char *join_path(const char *path, const char *name)
 {
 	int lenp = strlen(path);
diff --git a/util.h b/util.h
index f800b60..f5c4f1b 100644
--- a/util.h
+++ b/util.h
@@ -59,6 +59,7 @@ static inline void *xrealloc(void *p, size_t len)
 }
 
 extern char *xstrdup(const char *s);
+extern int xasprintf(char **strp, const char *fmt, ...);
 extern char *join_path(const char *path, const char *name);
 
 /**
-- 
1.7.12
