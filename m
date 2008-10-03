From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Implement and use an xstrdup() function
Date: Fri,  3 Oct 2008 12:15:08 -0500
Message-ID: <1223054108-22342-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Many places in dtc use strdup(), but none of them actually check the
return value to see if the implied allocation succeeded.  This is a
potential bug, which we fix in the patch below by replacing strdup()
with an xstrdup() which in analogy to xmalloc() will quit with a fatal
error if the allocation fails.

I felt the introduciton of util.[ch] was a better choice
for utility oriented code than directly using srcpos.c
for the new string function.

This patch is a re-factoring of Dave Gibson's similar patch.

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Makefile.convert-dtsv0 |    3 ++-
 Makefile.dtc           |   13 +++++++++++--
 convert-dtsv0-lexer.l  |    3 ++-
 dtc-lexer.l            |   14 +++++++-------
 dtc.h                  |    3 +++
 flattree.c             |    6 +++---
 fstree.c               |    4 ++--
 srcpos.c               |    4 ++--
 util.c                 |   30 ++++++++++++++++++++++++++++++
 util.h                 |   20 ++++++++++++++++++++
 10 files changed, 82 insertions(+), 18 deletions(-)
 create mode 100644 util.c
 create mode 100644 util.h

diff --git a/Makefile.convert-dtsv0 b/Makefile.convert-dtsv0
index a3f74c9..08ea40a 100644
--- a/Makefile.convert-dtsv0
+++ b/Makefile.convert-dtsv0
@@ -5,7 +5,8 @@
 #
 
 CONVERT_SRCS = \
-	srcpos.c
+	srcpos.c \
+	util.c
 
 CONVERT_GEN_SRCS = convert-dtsv0-lexer.lex.c
 
diff --git a/Makefile.dtc b/Makefile.dtc
index 6ddf9ec..bece49b 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -3,7 +3,16 @@
 # This is not a complete Makefile of itself.  Instead, it is designed to
 # be easily embeddable into other systems of Makefiles.
 #
-DTC_SRCS = dtc.c flattree.c fstree.c data.c livetree.c treesource.c srcpos.c \
-	checks.c
+DTC_SRCS = \
+	checks.c \
+	data.c \
+	dtc.c \
+	flattree.c \
+	fstree.c \
+	livetree.c \
+	srcpos.c \
+	treesource.c \
+	util.c
+
 DTC_GEN_SRCS = dtc-lexer.lex.c dtc-parser.tab.c
 DTC_OBJS = $(DTC_SRCS:%.c=%.o) $(DTC_GEN_SRCS:%.c=%.o)
diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
index 12b45ea..194f635 100644
--- a/convert-dtsv0-lexer.l
+++ b/convert-dtsv0-lexer.l
@@ -42,6 +42,7 @@ GAP		({WS}|{COMMENT}|{LINECOMMENT})*
 #include <fnmatch.h>
 
 #include "srcpos.h"
+#include "util.h"
 
 static int v1_tagged; /* = 0 */
 static int cbase = 16;
@@ -185,7 +186,7 @@ const struct {
 
 <PROPNODENAME>{PROPNODECHAR}+ {
 			ECHO;
-			last_name = strdup(yytext);
+			last_name = xstrdup(yytext);
 			BEGIN(INITIAL);
 		}
 
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 6f8b7dd..35b39ca 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -105,7 +105,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Label: %s\n", yytext);
-			yylval.labelref = strdup(yytext);
+			yylval.labelref = xstrdup(yytext);
 			yylval.labelref[yyleng-1] = '\0';
 			return DT_LABEL;
 		}
@@ -128,7 +128,7 @@ static int pop_input_file(void);
 <INITIAL>[0-9a-fA-F]+	{
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
-			yylval.literal = strdup(yytext);
+			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LEGACYLITERAL;
 		}
@@ -136,7 +136,7 @@ static int pop_input_file(void);
 <V1>[0-9]+|0[xX][0-9a-fA-F]+      {
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
-			yylval.literal = strdup(yytext);
+			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LITERAL;
 		}
@@ -145,7 +145,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
-			yylval.labelref = strdup(yytext+1);
+			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
@@ -154,7 +154,7 @@ static int pop_input_file(void);
 			yylloc.first_line = yylineno;
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
-			yylval.labelref = strdup(yytext+2);
+			yylval.labelref = xstrdup(yytext+2);
 			return DT_REF;
 		}
 
@@ -162,7 +162,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
-			yylval.labelref = strdup(yytext+1);
+			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
@@ -186,7 +186,7 @@ static int pop_input_file(void);
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;
 			DPRINT("PropNodeName: %s\n", yytext);
-			yylval.propnodename = strdup(yytext);
+			yylval.propnodename = xstrdup(yytext);
 			BEGIN_DEFAULT();
 			return DT_PROPNODENAME;
 		}
diff --git a/dtc.h b/dtc.h
index 08d54c8..5ead895 100644
--- a/dtc.h
+++ b/dtc.h
@@ -34,7 +34,10 @@
 #include <libfdt_env.h>
 #include <fdt.h>
 
+#include "util.h"
+
 #define DEFAULT_FDT_VERSION	17
+
 /*
  * Command line options
  */
diff --git a/flattree.c b/flattree.c
index 76acd28..50190b8 100644
--- a/flattree.c
+++ b/flattree.c
@@ -601,7 +601,7 @@ static char *flat_read_string(struct inbuf *inb)
 		len++;
 	} while ((*p++) != '\0');
 
-	str = strdup(inb->ptr);
+	str = xstrdup(inb->ptr);
 
 	inb->ptr += len;
 
@@ -643,7 +643,7 @@ static char *flat_read_stringtable(struct inbuf *inb, int offset)
 		p++;
 	}
 
-	return strdup(inb->base + offset);
+	return xstrdup(inb->base + offset);
 }
 
 static struct property *flat_read_property(struct inbuf *dtbuf,
@@ -710,7 +710,7 @@ static char *nodename_from_path(const char *ppath, const char *cpath)
 	if (!streq(ppath, "/"))
 		plen++;
 
-	return strdup(cpath + plen);
+	return xstrdup(cpath + plen);
 }
 
 static struct node *unflatten_tree(struct inbuf *dtbuf,
diff --git a/fstree.c b/fstree.c
index 766b269..7aee982 100644
--- a/fstree.c
+++ b/fstree.c
@@ -58,7 +58,7 @@ static struct node *read_fstree(const char *dirname)
 					"WARNING: Cannot open %s: %s\n",
 					tmpnam, strerror(errno));
 			} else {
-				prop = build_property(strdup(de->d_name),
+				prop = build_property(xstrdup(de->d_name),
 						      data_copy_file(pfile,
 								     st.st_size),
 						      NULL);
@@ -69,7 +69,7 @@ static struct node *read_fstree(const char *dirname)
 			struct node *newchild;
 
 			newchild = read_fstree(tmpnam);
-			newchild = name_node(newchild, strdup(de->d_name),
+			newchild = name_node(newchild, xstrdup(de->d_name),
 					     NULL);
 			add_child(tree, newchild);
 		}
diff --git a/srcpos.c b/srcpos.c
index 9641b76..d5a4b2a 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -39,7 +39,7 @@ static int dtc_open_one(struct dtc_file *file,
 		strcat(fullname, "/");
 		strcat(fullname, fname);
 	} else {
-		fullname = strdup(fname);
+		fullname = xstrdup(fname);
 	}
 
 	file->file = fopen(fullname, "r");
@@ -85,7 +85,7 @@ struct dtc_file *dtc_open_file(const char *fname,
 		if (!file->file)
 			goto fail;
 
-		file->name = strdup(fname);
+		file->name = xstrdup(fname);
 		return file;
 	}
 
diff --git a/util.c b/util.c
new file mode 100644
index 0000000..33631ce
--- /dev/null
+++ b/util.c
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include "dtc.h"
+
+char *xstrdup(const char *s)
+{
+	int len = strlen(s) + 1;
+	char *dup = xmalloc(len);
+
+	memcpy(dup, s, len);
+
+	return dup;
+}
diff --git a/util.h b/util.h
new file mode 100644
index 0000000..1fa78eb
--- /dev/null
+++ b/util.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+extern char *xstrdup(const char *s);
-- 
1.6.0.90.g436ed
