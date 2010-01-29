From: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Modification of lexer and parser, improving dtc portability.
Date: Fri, 29 Jan 2010 17:31:51 +0100
Message-ID: <1264782711-52086-1-git-send-email-zbr@semihalf.com>
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
To: Devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This mod allows successful build of dtc using both bison/flex and yacc/lex.

Signed-off-by: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
---
 dtc-lexer.l  |    1 +
 dtc-parser.y |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 9021231..3c3434c 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -38,6 +38,7 @@ LINECOMMENT	"//".*\n
 #include "srcpos.h"
 #include "dtc-parser.tab.h"
 
+YYLTYPE yylloc;
 
 /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
 #define	YY_USER_ACTION \
diff --git a/dtc-parser.y b/dtc-parser.y
index b7c7dbd..a2c0925 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -18,14 +18,14 @@
  *                                                                   USA
  */
 
-%locations
-
 %{
 #include <stdio.h>
 
 #include "dtc.h"
 #include "srcpos.h"
 
+YYLTYPE yylloc;
+
 extern int yylex(void);
 extern void yyerror(char const *s);
 
-- 
1.6.3.1
