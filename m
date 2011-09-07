From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Wed,  7 Sep 2011 16:15:40 -0700
Message-ID: <1315437340-1661-4-git-send-email-robotboy@chromium.org>
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

    property = ['a' 2b '\r'];

is equivalent to:

    property = [61 2b 0d];

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 Documentation/dts-format.txt |    5 +++--
 dtc-lexer.l                  |   14 ++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

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
index d4f9eaa..31cd18a 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -142,6 +142,20 @@ static int pop_input_file(void);
 			return DT_BYTE;
 		}
 
+<BYTESTRING>{CHAR_LITERAL} {
+			DPRINT("Character literal: %s\n", yytext);
+			yylval.byte = yytext[1];
+			DPRINT("Byte: %02x\n", (int)yylval.byte);
+			return DT_BYTE;
+		}
+
+<BYTESTRING>{CHAR_ESCAPED} {
+			DPRINT("Character escaped literal: %s\n", yytext);
+			yylval.byte = get_escape_char_exact(yytext+1, yyleng-2);
+			DPRINT("Byte: %02x\n", (int)yylval.byte);
+			return DT_BYTE;
+		}
+
 <BYTESTRING>"]"	{
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
-- 
1.7.3.1
