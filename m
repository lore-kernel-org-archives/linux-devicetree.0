From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [3/5] dtc: Cleanup yyerrorf() function
Date: Fri, 3 Oct 2008 00:06:52 +1000
Message-ID: <20081002140652.GG11662@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081002140556.GF11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, we put the source file name into the yylloc variable, but
never use the stored value.  Instead the yyerrorf() function directly
accesses srcpos_file to get the input file name.

That works in practice, but is likely not to always be correct if we
ever re-enable the glr-parser option.  Even now, its correctness
relies on the exact point in time bison executes the semantic rules
w.r.t. to the lexing rules, which is probably correct but not
obviously correct, which is far from ideal.

So, this patch replaces yyerrorf() with a srcpos_error() function
which pulls the filename information out of the yylloc variable, which
bison is explicitly supposed to get right for us.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 dtc-parser.y |   32 ++++++++++----------------------
 srcpos.c     |   13 +++++++++++++
 srcpos.h     |    6 ++----
 3 files changed, 25 insertions(+), 26 deletions(-)

Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2008-10-03 00:03:38.000000000 +1000
+++ dtc/dtc-parser.y	2008-10-03 00:03:57.000000000 +1000
@@ -30,6 +30,7 @@ extern int yylex(void);
 extern struct boot_info *the_boot_info;
 extern int treesource_error;
 
+static void yyerror(char const *s);
 static unsigned long long eval_literal(const char *s, int base, int bits);
 %}
 
@@ -206,10 +207,13 @@ propdata:
 			struct data d = empty_data;
 
 			if ($6 != 0)
-				if (fseek(file->file, $6, SEEK_SET) != 0)
-					yyerrorf("Couldn't seek to offset %llu in \"%s\": %s",
-						 (unsigned long long)$6,
-						 $4.val, strerror(errno));
+				if (fseek(file->file, $6, SEEK_SET) != 0) {
+					srcpos_error(&yylloc, "Couldn't seek to"
+						     " offset %llu in \"%s\": %s",
+						     (unsigned long long)$6,
+						     $4.val, strerror(errno));
+					treesource_error = 1;
+				}
 
 			d = data_copy_file(file->file, $8);
 
@@ -338,26 +342,10 @@ label:
 
 %%
 
-void yyerrorf(char const *s, ...)
+static void yyerror(char const *s)
 {
-	const char *fname = srcpos_file ? srcpos_file->name : "<no-file>";
-	va_list va;
-	va_start(va, s);
-
-	if (strcmp(fname, "-") == 0)
-		fname = "stdin";
-
-	fprintf(stderr, "%s:%d ", fname, yylloc.first_line);
-	vfprintf(stderr, s, va);
-	fprintf(stderr, "\n");
-
+	srcpos_error(&yylloc, "%s", s);
 	treesource_error = 1;
-	va_end(va);
-}
-
-void yyerror (char const *s)
-{
-	yyerrorf("%s", s);
 }
 
 static unsigned long long eval_literal(const char *s, int base, int bits)
Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-03 00:03:38.000000000 +1000
+++ dtc/srcpos.c	2008-10-03 00:03:57.000000000 +1000
@@ -29,6 +29,19 @@ char *xstrdup(const char *s)
 	return dup;
 }
 
+void srcpos_error(YYLTYPE *loc, char const *fmt, ...)
+{
+	va_list va;
+	va_start(va, fmt);
+
+	fprintf(stderr, "%s:%d ", loc->file->name, loc->first_line);
+
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+
+	va_end(va);
+}
+
 /*
  * Like yylineno, this is the current open file pos.
  */
Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2008-10-03 00:03:38.000000000 +1000
+++ dtc/srcpos.h	2008-10-03 00:03:57.000000000 +1000
@@ -72,10 +72,8 @@ typedef struct YYLTYPE {
 	}								\
     while (YYID (0))
 
-
-
-extern void yyerror(char const *);
-extern void yyerrorf(char const *, ...) __attribute__((format(printf, 1, 2)));
+void srcpos_error(YYLTYPE *loc, char const *fmt, ...)
+	__attribute__((format(printf, 2, 3)));
 
 extern struct dtc_file *srcpos_file;
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
