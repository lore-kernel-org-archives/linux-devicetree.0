From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/2] dtc: Move some functions to util.[ch]
Date: Mon, 5 Jan 2009 12:50:23 +1100
Message-ID: <20090105015023.GF11210@yookeroo.seuss>
References: <20090105014436.GC11210@yookeroo.seuss>
	<20090105014745.GE11210@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090105014745.GE11210-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that we have a util.[ch] file shared between dtc and
convert-dtsv0, move some functions which are currently duplicated in
the two to util files.  Specifically we move the die(), xmalloc() and
xrealloc() functions.

While we're at it, add standard double-include protection to util.h

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/convert-dtsv0-lexer.l
===================================================================
--- dtc.orig/convert-dtsv0-lexer.l	2008-10-04 15:20:44.000000000 +1000
+++ dtc/convert-dtsv0-lexer.l	2008-10-04 22:22:23.000000000 +1000
@@ -52,26 +52,6 @@ static char *last_name; /* = NULL */
 
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
-static inline void __attribute__((noreturn)) die(char * str, ...)
-{
-	va_list ap;
-
-	va_start(ap, str);
-	fprintf(stderr, "FATAL ERROR: ");
-	vfprintf(stderr, str, ap);
-	exit(1);
-}
-
-static inline void *xmalloc(size_t len)
-{
-	void *new = malloc(len);
-
-	if (! new)
-		die("malloc() failed\n");
-
-	return new;
-}
-
 const struct {
 	const char *pattern;
 	int obase, width;
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2008-10-04 15:19:46.000000000 +1000
+++ dtc/dtc.h	2008-10-04 22:22:23.000000000 +1000
@@ -53,36 +53,6 @@ extern int reservenum;		/* Number of mem
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 
-static inline void __attribute__((noreturn)) die(char * str, ...)
-{
-	va_list ap;
-
-	va_start(ap, str);
-	fprintf(stderr, "FATAL ERROR: ");
-	vfprintf(stderr, str, ap);
-	exit(1);
-}
-
-static inline void *xmalloc(size_t len)
-{
-	void *new = malloc(len);
-
-	if (! new)
-		die("malloc() failed\n");
-
-	return new;
-}
-
-static inline void *xrealloc(void *p, size_t len)
-{
-	void *new = realloc(p, len);
-
-	if (! new)
-		die("realloc() failed (len=%d)\n", len);
-
-	return new;
-}
-
 typedef uint32_t cell_t;
 
 
Index: dtc/util.h
===================================================================
--- dtc.orig/util.h	2008-10-04 15:20:03.000000000 +1000
+++ dtc/util.h	2008-10-04 22:22:23.000000000 +1000
@@ -1,3 +1,6 @@
+#ifndef _UTIL_H
+#define _UTIL_H
+
 /*
  * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
  *
@@ -17,4 +20,36 @@
  *                                                                   USA
  */
 
+static inline void __attribute__((noreturn)) die(char * str, ...)
+{
+	va_list ap;
+
+	va_start(ap, str);
+	fprintf(stderr, "FATAL ERROR: ");
+	vfprintf(stderr, str, ap);
+	exit(1);
+}
+
+static inline void *xmalloc(size_t len)
+{
+	void *new = malloc(len);
+
+	if (!new)
+		die("malloc() failed\n");
+
+	return new;
+}
+
+static inline void *xrealloc(void *p, size_t len)
+{
+	void *new = realloc(p, len);
+
+	if (!new)
+		die("realloc() failed (len=%d)\n", len);
+
+	return new;
+}
+
 extern char *xstrdup(const char *s);
+
+#endif /* _UTIL_H */


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
