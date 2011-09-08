From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 3/3] dtc: Support character literals in bytestrings
Date: Thu,  8 Sep 2011 14:39:17 -0700
Message-ID: <1315517957-3546-4-git-send-email-robotboy@chromium.org>
References: <1315517957-3546-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315517957-3546-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

    property = ['a' 2b '\r'];

is equivalent to:

    property = [61 2b 0d];

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 Documentation/dts-format.txt |    5 +++--
 dtc-lexer.l                  |    7 +++++++
 dtc-parser.y                 |    4 ++++
 tests/char_literal.c         |    8 ++++++++
 tests/char_literal.dts       |    1 +
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index eae8b76..555bd89 100644
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
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 94151da..11082c2 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -136,6 +136,13 @@ static int pop_input_file(void);
 			return DT_BYTE;
 		}
 
+<BYTESTRING>{CHAR_LITERAL} {
+			yytext[yyleng-1] = '\0';
+			yylval.literal = xstrdup(yytext+1);
+			DPRINT("Character literal: %s\n", yylval.literal);
+			return DT_CHAR_LITERAL;
+		}
+
 <BYTESTRING>"]"	{
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
diff --git a/dtc-parser.y b/dtc-parser.y
index 49bf208..020222f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -286,6 +286,10 @@ bytestring:
 		{
 			$$ = data_add_marker($1, LABEL, $2);
 		}
+	| bytestring DT_CHAR_LITERAL
+		{
+			$$ = data_append_byte($1, eval_char_literal($2));
+		}
 	;
 
 subnodes:
diff --git a/tests/char_literal.c b/tests/char_literal.c
index 150f2a0..c6e2405 100644
--- a/tests/char_literal.c
+++ b/tests/char_literal.c
@@ -33,6 +33,11 @@ int main(int argc, char *argv[])
 {
 	void *fdt;
 	uint32_t expected_cells[5];
+	uint8_t expected_bytes[5] = {TEST_CHAR1,
+				     TEST_CHAR2,
+				     TEST_CHAR3,
+				     TEST_CHAR4,
+				     TEST_CHAR5};
 
 	expected_cells[0] = cpu_to_fdt32((unsigned char)TEST_CHAR1);
 	expected_cells[1] = cpu_to_fdt32((unsigned char)TEST_CHAR2);
@@ -46,5 +51,8 @@ int main(int argc, char *argv[])
 	check_getprop(fdt, 0, "char-literal-cells",
 		      sizeof(expected_cells), expected_cells);
 
+	check_getprop(fdt, 0, "char-literal-bytes",
+		      sizeof(expected_bytes), expected_bytes);
+
 	PASS();
 }
diff --git a/tests/char_literal.dts b/tests/char_literal.dts
index 22e17ed..9baba5c 100644
--- a/tests/char_literal.dts
+++ b/tests/char_literal.dts
@@ -2,4 +2,5 @@
 
 / {
 	char-literal-cells = <'\r' 'b' '\0' '\'' '\xff'>;
+	char-literal-bytes = ['\r' 'b' '\0' '\'' '\xff'];
 };
-- 
1.7.3.1
