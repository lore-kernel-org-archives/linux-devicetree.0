From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] Add character literal parsing in bytestrings
Date: Thu, 23 Jun 2011 16:20:38 -0700
Message-ID: <1308871239-32683-2-git-send-email-robotboy@chromium.org>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308871239-32683-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This adds support for parsing simple (non-escaped) 'x' character
literal syntax in bytestrings.  For example:

    property = ['a' 2b 'c'];

is equivalent to:

    property = [61 2b 62];

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
---
 Documentation/dts-format.txt |    5 +++--
 Documentation/manual.txt     |    3 ++-
 dtc-lexer.l                  |    8 ++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index a655b87..d191eeb 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -48,11 +48,12 @@ NUL-terminated strings, as bytestrings or a combination of these.
 	e.g. compatible = "simple-bus";
 
 * A bytestring is enclosed in square brackets [] with each byte
-  represented by two hexadecimal digits.  Spaces between each byte are
-  optional.
+  represented by two hexadecimal digits or a character literal.
+  Spaces between each byte or character literal are optional.
 
 	e.g. local-mac-address = [00 00 12 34 56 78]; or equivalently
 	     local-mac-address = [000012345678];
+	e.g. keymap = ['a' 'b' 'c' 'd'];
 
 * Values may have several comma-separated components, which are
   concatenated together.
diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index f8a8a7b..f38a995 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -213,7 +213,8 @@ For example:
 
 By default, all numeric values are hexadecimal.  Alternate bases
 may be specified using a prefix "d#" for decimal, "b#" for binary,
-and "o#" for octal.
+and "o#" for octal.  Character literals are supported in
+byte sequences using the C language character literal syntax of 'a'.
 
 Strings support common escape sequences from C: "\n", "\t", "\r",
 "\(octal value)", "\x(hex value)".
diff --git a/dtc-lexer.l b/dtc-lexer.l
index e866ea5..1276c6f 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -29,6 +29,7 @@ PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
 PATHCHAR	({PROPNODECHAR}|[/])
 LABEL		[a-zA-Z_][a-zA-Z0-9_]*
 STRING		\"([^\\"]|\\.)*\"
+CHAR_LITERAL	'[^\\']'
 WS		[[:space:]]
 COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
 LINECOMMENT	"//".*\n
@@ -128,6 +129,13 @@ static int pop_input_file(void);
 			return DT_BYTE;
 		}
 
+<BYTESTRING>{CHAR_LITERAL} {
+			DPRINT("Character literal: %s\n", yytext);
+			yylval.byte = yytext[1];
+			DPRINT("Byte: %02x\n", (int)yylval.byte);
+			return DT_BYTE;
+		}
+
 <BYTESTRING>"]"	{
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
-- 
1.7.3.1
