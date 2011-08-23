From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH] dtc: Add support for named constants
Date: Tue, 23 Aug 2011 16:43:20 -0600
Message-ID: <1314139400-31984-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

You may define constants as follows:

/define/ $TWO 2;
/define/ $FOUR 4;
/define/ $OTHER $FOUR;

And properties may use these values as follows:

foo = <1 $TWO 3 $FOUR 5>;

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note 1: This is against dtc in the Linux kernel. Should this patch be
against upstream dtc, then back-ported to the kernel?

Note 2: I'd prefer the syntax of /define/ to be:

/define/ TWO 2;

but I assume that'd cause the lexing for DT_DEFINEREF to conflict with
that for DT_LABEL?

Note 3: The define syntax only handles integers. Should it be string-
based instead?

Note 4: I'm not sure what to do about re-generating the lex/yacc results;
my local tools aren't the versions used previously, and so introduce some
changes not related to mine.

 scripts/dtc/dtc-lexer.l  |   12 ++++++
 scripts/dtc/dtc-parser.y |   98 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 109 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
index e866ea5..ff31bbf 100644
--- a/scripts/dtc/dtc-lexer.l
+++ b/scripts/dtc/dtc-lexer.l
@@ -96,6 +96,12 @@ static int pop_input_file(void);
 			return DT_MEMRESERVE;
 		}
 
+<*>"/define/"	{
+			DPRINT("Keyword: /define/\n");
+			BEGIN_DEFAULT();
+			return DT_DEFINE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
@@ -109,6 +115,12 @@ static int pop_input_file(void);
 			return DT_LITERAL;
 		}
 
+<V1>\${LABEL}	{
+			yylval.defineref = xstrdup(yytext + 1);
+			DPRINT("Define: '%s'\n", yylval.defineref);
+			return DT_DEFINEREF;
+		}
+
 <*>\&{LABEL}	{	/* label reference */
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
index 5e84a67..50bc10b 100644
--- a/scripts/dtc/dtc-parser.y
+++ b/scripts/dtc/dtc-parser.y
@@ -33,12 +33,18 @@ extern void yyerror(char const *s);
 extern struct boot_info *the_boot_info;
 extern int treesource_error;
 
+static struct define *get_define(const char *s);
+static void set_define(const char *name, unsigned long long value);
+static void set_define_defineref(const char *name, const char *ref);
+static void set_define_literal(const char *name, const char *value);
+static unsigned long long eval_defineref(const char *s, int bits);
 static unsigned long long eval_literal(const char *s, int base, int bits);
 %}
 
 %union {
 	char *propnodename;
 	char *literal;
+	char *defineref;
 	char *labelref;
 	unsigned int cbase;
 	uint8_t byte;
@@ -55,8 +61,10 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_DEFINE
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
+%token <defineref> DT_DEFINEREF
 %token <cbase> DT_BASE
 %token <byte> DT_BYTE
 %token <data> DT_STRING
@@ -118,13 +126,31 @@ addr:
 		{
 			$$ = eval_literal($1, 0, 64);
 		}
-	  ;
+	| DT_DEFINEREF
+		{
+			$$ = eval_defineref($1, 64);
+		}
+	;
+
+define:
+	  DT_DEFINE DT_DEFINEREF DT_LITERAL ';'
+		{
+			set_define_literal($2, $3);
+		}
+	| DT_DEFINE DT_DEFINEREF DT_DEFINEREF ';'
+		{
+			set_define_defineref($2, $3);
+		}
+	;
 
 devicetree:
 	  '/' nodedef
 		{
 			$$ = name_node($2, "");
 		}
+	| define
+		{
+		}
 	| devicetree '/' nodedef
 		{
 			$$ = merge_nodes($1, $3);
@@ -139,6 +165,9 @@ devicetree:
 				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
+	| devicetree define
+		{
+		}
 	;
 
 nodedef:
@@ -265,6 +294,10 @@ cellval:
 		{
 			$$ = eval_literal($1, 0, 32);
 		}
+	| DT_DEFINEREF
+		{
+			$$ = eval_defineref($1, 32);
+		}
 	;
 
 bytestring:
@@ -327,6 +360,69 @@ void yyerror(char const *s) {
 	print_error("%s", s);
 }
 
+struct define {
+	const char *name;
+	unsigned long long value;
+	struct define *next;
+};
+static struct define *defines;
+
+static struct define *get_define(const char *s)
+{
+	struct define *define = defines;
+
+	while (define != NULL) {
+		if (streq(s, define->name))
+			return define;
+		define = define->next;
+	}
+
+	return NULL;
+}
+
+static void set_define(const char *name, unsigned long long value)
+{
+	struct define *define;
+
+	if (get_define(name)) {
+		print_error("redefining %s", name);
+		return;
+	}
+
+	define = xmalloc(sizeof(*define));
+	define->name = name;
+	define->value = value;
+	define->next = defines;
+	defines = define;
+}
+
+static void set_define_defineref(const char *name, const char *ref)
+{
+	unsigned long long v = eval_defineref(ref, 64);
+	set_define(name, v);
+}
+
+static void set_define_literal(const char *name, const char *value)
+{
+	unsigned long long v = eval_literal(value, 0, 64);
+	set_define(name, v);
+}
+
+unsigned long long eval_defineref(const char *s, int bits)
+{
+	struct define *define = get_define(s);
+
+	if (define == NULL) {
+		print_error("referenced define %s does not exist", s);
+		return 0;
+	}
+
+	if ((bits < 64) && (define->value >= (1ULL << bits)))
+		print_error("referenced define out of range");
+
+	return define->value;
+}
+
 static unsigned long long eval_literal(const char *s, int base, int bits)
 {
 	unsigned long long val;
-- 
1.7.0.4
