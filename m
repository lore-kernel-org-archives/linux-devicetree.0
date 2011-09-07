From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/3] dtc: Support character literals in cell lists
Date: Wed,  7 Sep 2011 16:15:39 -0700
Message-ID: <1315437340-1661-3-git-send-email-robotboy@chromium.org>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315437340-1661-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

With this patch the following property assignment:

    property = <0x12345678 'a' '\r' 100>;

is equivalent to:

    property = <0x12345678 0x00000061 0x0000000D 0x00000064>

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 Documentation/dts-format.txt |    2 +-
 Documentation/manual.txt     |    7 ++++---
 dtc-lexer.l                  |   14 ++++++++++++++
 dtc-parser.y                 |    4 ++++
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index a655b87..eae8b76 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -33,7 +33,7 @@ Property values may be defined as an array of 32-bit integer cells, as
 NUL-terminated strings, as bytestrings or a combination of these.
 
 * Arrays of cells are represented by angle brackets surrounding a
-  space separated list of C-style integers
+  space separated list of C-style integers or character literals.
 
 	e.g. interrupts = <17 0xc>;
 
diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index f8a8a7b..940fd3d 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -213,10 +213,11 @@ For example:
 
 By default, all numeric values are hexadecimal.  Alternate bases
 may be specified using a prefix "d#" for decimal, "b#" for binary,
-and "o#" for octal.
+and "o#" for octal.  Character literals are supported using the C
+language character literal syntax of 'a'.
 
-Strings support common escape sequences from C: "\n", "\t", "\r",
-"\(octal value)", "\x(hex value)".
+Strings and character literals support common escape sequences from C:
+"\n", "\t", "\r", "\(octal value)", "\x(hex value)".
 
 
 4.3) Labels and References
diff --git a/dtc-lexer.l b/dtc-lexer.l
index e866ea5..d4f9eaa 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -29,6 +29,8 @@ PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
 PATHCHAR	({PROPNODECHAR}|[/])
 LABEL		[a-zA-Z_][a-zA-Z0-9_]*
 STRING		\"([^\\"]|\\.)*\"
+CHAR_LITERAL	'[^\\']'
+CHAR_ESCAPED	'\\([^']+|')'
 WS		[[:space:]]
 COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
 LINECOMMENT	"//".*\n
@@ -109,6 +111,18 @@ static int pop_input_file(void);
 			return DT_LITERAL;
 		}
 
+<V1>{CHAR_LITERAL}	{
+			yylval.byte = yytext[1];
+			DPRINT("Character literal: %s\n", yytext);
+			return DT_BYTE;
+		}
+
+<V1>{CHAR_ESCAPED}	{
+			yylval.byte = get_escape_char_exact(yytext+1, yyleng-2);
+			DPRINT("Character literal escaped: %s\n", yytext);
+			return DT_BYTE;
+		}
+
 <*>\&{LABEL}	{	/* label reference */
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
diff --git a/dtc-parser.y b/dtc-parser.y
index 5e84a67..b7d2ab4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -265,6 +265,10 @@ cellval:
 		{
 			$$ = eval_literal($1, 0, 32);
 		}
+	| DT_BYTE
+		{
+			$$ = $1;
+		}
 	;
 
 bytestring:
-- 
1.7.3.1
