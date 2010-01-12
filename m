From: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Modification of lexer and parser, improving dtc portability.
Date: Tue, 12 Jan 2010 14:57:33 +0100
Message-ID: <1263304653-71750-1-git-send-email-zbr@semihalf.com>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This mod allows successful build of dtc using both bison/flex and yacc/lex.
---
 dtc-lexer.l  |    2 ++
 dtc-parser.y |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index d142de5..96c2fce 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -38,6 +38,8 @@ LINECOMMENT	"//".*\n
 #include "srcpos.h"
 #include "dtc-parser.tab.h"
 
+YYLTYPE yylloc;
+
 #define	YY_USER_ACTION \
 	{ \
 		yylloc.file = srcpos_file; \
diff --git a/dtc-parser.y b/dtc-parser.y
index 31c14d7..4411aed 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -18,7 +18,6 @@
  *                                                                   USA
  */
 
-%locations
 
 %{
 #include <stdio.h>
@@ -26,6 +25,8 @@
 #include "dtc.h"
 #include "srcpos.h"
 
+YYLTYPE yylloc;
+
 extern int yylex(void);
 extern void yyerror(char const *s);
 
-- 
1.6.3.1
