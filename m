From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Add -Wredundant-decls
Date: Thu, 11 Mar 2010 11:23:41 +1100
Message-ID: <20100311002341.GC11655@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

We are almost clean already with the -Wredundant-decls warning.  The
only exception is a declaration for isatty() inside the flex-generated
code.  This can be removed by using flex's "never-interactive" option,
which we probably should be using anyway, since we never parse
interactively in the sense that this option implies.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/Makefile
===================================================================
--- dtc.orig/Makefile	2010-03-11 11:12:43.704724530 +1100
+++ dtc/Makefile	2010-03-11 11:12:45.920725101 +1100
@@ -17,7 +17,7 @@ CONFIG_LOCALVERSION =
 
 CPPFLAGS = -I libfdt
 WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
-	-Wstrict-prototypes -Wmissing-prototypes
+	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
 CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
 
 BISON = bison
Index: dtc/convert-dtsv0-lexer.l
===================================================================
--- dtc.orig/convert-dtsv0-lexer.l	2010-03-11 11:12:43.600746855 +1100
+++ dtc/convert-dtsv0-lexer.l	2010-03-11 11:12:45.920725101 +1100
@@ -17,7 +17,7 @@
  *                                                                   USA
  */
 
-%option noyywrap nounput noinput
+%option noyywrap nounput noinput never-interactive
 
 %x INCLUDE
 %x BYTESTRING
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2010-03-11 11:12:43.612724636 +1100
+++ dtc/dtc-lexer.l	2010-03-11 11:12:45.920725101 +1100
@@ -18,7 +18,7 @@
  *                                                                   USA
  */
 
-%option noyywrap nounput noinput
+%option noyywrap nounput noinput never-interactive
 
 %x INCLUDE
 %x BYTESTRING

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
