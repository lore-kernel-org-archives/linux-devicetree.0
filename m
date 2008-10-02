From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [1/5] dtc: Implement and use an xstrdup() function
Date: Fri, 3 Oct 2008 00:05:12 +1000
Message-ID: <20081002140512.GE11662@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081002140427.GD11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

Many places in dtc use strdup(), but none of them actually check the
return value to see if the implied allocation succeeded.  This is a
potential bug, which we fix in the patch below by replacing strdup()
with an xstrdup() which in analogy to xmalloc() will quit with a fatal
error if the allocation fails.

xstrdup() is defined in srcpos.c, because that's available to both dtc
itself and the conversion program which also uses it.  While we're at
it, we add standard double-include protection to srcpos.h which was
missing it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 convert-dtsv0-lexer.l |    2 +-
 dtc-lexer.l           |   15 +++++++--------
 dtc-parser.y          |    1 -
 dtc.c                 |    1 -
 dtc.h                 |    2 ++
 flattree.c            |    7 +++----
 fstree.c              |    4 ++--
 srcpos.c              |   13 +++++++++++--
 srcpos.h              |    6 ++++++
 treesource.c          |    1 -
 10 files changed, 32 insertions(+), 20 deletions(-)

Index: dtc/convert-dtsv0-lexer.l
===================================================================
--- dtc.orig/convert-dtsv0-lexer.l	2008-10-03 00:03:36.000000000 +1000
+++ dtc/convert-dtsv0-lexer.l	2008-10-03 00:03:38.000000000 +1000
@@ -185,7 +185,7 @@ const struct {
 
 <PROPNODENAME>{PROPNODECHAR}+ {
 			ECHO;
-			last_name = strdup(yytext);
+			last_name = xstrdup(yytext);
 			BEGIN(INITIAL);
 		}
 
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-10-03 00:03:36.000000000 +1000
+++ dtc/dtc-lexer.l	2008-10-03 00:03:38.000000000 +1000
@@ -35,7 +35,6 @@ LINECOMMENT	"//".*\n
 
 %{
 #include "dtc.h"
-#include "srcpos.h"
 #include "dtc-parser.tab.h"
 
 
@@ -105,7 +104,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Label: %s\n", yytext);
-			yylval.labelref = strdup(yytext);
+			yylval.labelref = xstrdup(yytext);
 			yylval.labelref[yyleng-1] = '\0';
 			return DT_LABEL;
 		}
@@ -128,7 +127,7 @@ static int pop_input_file(void);
 <INITIAL>[0-9a-fA-F]+	{
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
-			yylval.literal = strdup(yytext);
+			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LEGACYLITERAL;
 		}
@@ -136,7 +135,7 @@ static int pop_input_file(void);
 <V1>[0-9]+|0[xX][0-9a-fA-F]+      {
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
-			yylval.literal = strdup(yytext);
+			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LITERAL;
 		}
@@ -145,7 +144,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
-			yylval.labelref = strdup(yytext+1);
+			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
@@ -154,7 +153,7 @@ static int pop_input_file(void);
 			yylloc.first_line = yylineno;
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
-			yylval.labelref = strdup(yytext+2);
+			yylval.labelref = xstrdup(yytext+2);
 			return DT_REF;
 		}
 
@@ -162,7 +161,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
-			yylval.labelref = strdup(yytext+1);
+			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
@@ -186,7 +185,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("PropNodeName: %s\n", yytext);
-			yylval.propnodename = strdup(yytext);
+			yylval.propnodename = xstrdup(yytext);
 			BEGIN_DEFAULT();
 			return DT_PROPNODENAME;
 		}
Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2008-10-03 00:03:36.000000000 +1000
+++ dtc/dtc-parser.y	2008-10-03 00:03:38.000000000 +1000
@@ -24,7 +24,6 @@
 #include <stdio.h>
 
 #include "dtc.h"
-#include "srcpos.h"
 
 extern int yylex(void);
 
Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2008-10-03 00:03:36.000000000 +1000
+++ dtc/dtc.c	2008-10-03 00:03:38.000000000 +1000
@@ -19,7 +19,6 @@
  */
 
 #include "dtc.h"
-#include "srcpos.h"
 
 #include "version_gen.h"
 
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2008-10-03 00:03:36.000000000 +1000
+++ dtc/dtc.h	2008-10-03 00:03:38.000000000 +1000
@@ -34,6 +34,8 @@
 #include <libfdt_env.h>
 #include <fdt.h>
 
+#include "srcpos.h"
+
 #define DEFAULT_FDT_VERSION	17
 /*
  * Command line options
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2008-10-03 00:03:36.000000000 +1000
+++ dtc/flattree.c	2008-10-03 00:03:38.000000000 +1000
@@ -19,7 +19,6 @@
  */
 
 #include "dtc.h"
-#include "srcpos.h"
 
 #define FTF_FULLPATH	0x1
 #define FTF_VARALIGN	0x2
@@ -601,7 +600,7 @@ static char *flat_read_string(struct inb
 		len++;
 	} while ((*p++) != '\0');
 
-	str = strdup(inb->ptr);
+	str = xstrdup(inb->ptr);
 
 	inb->ptr += len;
 
@@ -643,7 +642,7 @@ static char *flat_read_stringtable(struc
 		p++;
 	}
 
-	return strdup(inb->base + offset);
+	return xstrdup(inb->base + offset);
 }
 
 static struct property *flat_read_property(struct inbuf *dtbuf,
@@ -710,7 +709,7 @@ static char *nodename_from_path(const ch
 	if (!streq(ppath, "/"))
 		plen++;
 
-	return strdup(cpath + plen);
+	return xstrdup(cpath + plen);
 }
 
 static struct node *unflatten_tree(struct inbuf *dtbuf,
Index: dtc/fstree.c
===================================================================
--- dtc.orig/fstree.c	2008-10-03 00:03:36.000000000 +1000
+++ dtc/fstree.c	2008-10-03 00:03:38.000000000 +1000
@@ -58,7 +58,7 @@ static struct node *read_fstree(const ch
 					"WARNING: Cannot open %s: %s\n",
 					tmpnam, strerror(errno));
 			} else {
-				prop = build_property(strdup(de->d_name),
+				prop = build_property(xstrdup(de->d_name),
 						      data_copy_file(pfile,
 								     st.st_size),
 						      NULL);
@@ -69,7 +69,7 @@ static struct node *read_fstree(const ch
 			struct node *newchild;
 
 			newchild = read_fstree(tmpnam);
-			newchild = name_node(newchild, strdup(de->d_name),
+			newchild = name_node(newchild, xstrdup(de->d_name),
 					     NULL);
 			add_child(tree, newchild);
 		}
Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-03 00:03:36.000000000 +1000
+++ dtc/srcpos.c	2008-10-03 00:03:38.000000000 +1000
@@ -20,6 +20,15 @@
 #include "dtc.h"
 #include "srcpos.h"
 
+char *xstrdup(const char *s)
+{
+	int len = strlen(s);
+	char *dup = xmalloc(len + 1);
+
+	memcpy(dup, s, len+1);
+	return dup;
+}
+
 /*
  * Like yylineno, this is the current open file pos.
  */
@@ -39,7 +48,7 @@ static int dtc_open_one(struct dtc_file 
 		strcat(fullname, "/");
 		strcat(fullname, fname);
 	} else {
-		fullname = strdup(fname);
+		fullname = xstrdup(fname);
 	}
 
 	file->file = fopen(fullname, "r");
@@ -85,7 +94,7 @@ struct dtc_file *dtc_open_file(const cha
 		if (!file->file)
 			goto fail;
 
-		file->name = strdup(fname);
+		file->name = xstrdup(fname);
 		return file;
 	}
 
Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2008-10-03 00:03:36.000000000 +1000
+++ dtc/srcpos.h	2008-10-03 00:03:38.000000000 +1000
@@ -1,3 +1,5 @@
+#ifndef _SRCPOS_H
+#define _SRCPOS_H
 /*
  * Copyright 2007 Jon Loeliger, Freescale Semiconductor, Inc.
  *
@@ -24,6 +26,8 @@
 
 #include <stdio.h>
 
+char *xstrdup(const char *s);
+
 struct dtc_file {
 	char *dir;
 	const char *name;
@@ -83,3 +87,5 @@ struct search_path {
 extern struct dtc_file *dtc_open_file(const char *fname,
                                       const struct search_path *search);
 extern void dtc_close_file(struct dtc_file *file);
+
+#endif /* _SRCPOS_H */
Index: dtc/treesource.c
===================================================================
--- dtc.orig/treesource.c	2008-10-03 00:03:36.000000000 +1000
+++ dtc/treesource.c	2008-10-03 00:03:38.000000000 +1000
@@ -19,7 +19,6 @@
  */
 
 #include "dtc.h"
-#include "srcpos.h"
 
 extern FILE *yyin;
 extern int yyparse(void);


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
