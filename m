From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Enable more warnings
Date: Thu, 4 Mar 2010 11:12:18 +1100
Message-ID: <20100304001218.GC4488@yookeroo>
References: <20100303052630.GQ23435@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100303052630.GQ23435@yookeroo>
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

This patch turns on a bunch of extra gcc warnings, most of which are
probably a good idea.  Of the new warnings -Wnested-externs and
-Wstrict-prototypes need no code changes, we're already warning-clean.
The remaining one, -Wmissing-prototypes requires trivial changes in
some of the tests (making functions local).

This patch also rearranges the warnings flags into a separate make
variable for convenience, and turns on -Werror, to really encourage
people to keep the code warning-clean.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/Makefile
===================================================================
--- dtc.orig/Makefile	2010-03-04 11:09:54.527022044 +1100
+++ dtc/Makefile	2010-03-04 11:10:20.507033793 +1100
@@ -16,7 +16,9 @@ LOCAL_VERSION =
 CONFIG_LOCALVERSION =
 
 CPPFLAGS = -I libfdt
-CFLAGS = -Wall -g -Os -fPIC -Wpointer-arith -Wcast-qual
+WARNINGS = -Werror -Wall -Wextra -Wpointer-arith -Wcast-qual -Wnested-externs \
+	-Wstrict-prototypes -Wmissing-prototypes
+CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
 
 BISON = bison
 LEX = flex
Index: dtc/tests/extra-terminating-null.c
===================================================================
--- dtc.orig/tests/extra-terminating-null.c	2010-03-04 11:09:54.363021733 +1100
+++ dtc/tests/extra-terminating-null.c	2010-03-04 11:09:55.796048832 +1100
@@ -28,7 +28,7 @@
 #include "tests.h"
 #include "testdata.h"
 
-void check_extranull(void *fdt, const char *prop, const char *str, int numnulls)
+static void check_extranull(void *fdt, const char *prop, const char *str, int numnulls)
 {
 	int len = strlen(str);
 	char checkbuf[len+numnulls];
Index: dtc/tests/get_alias.c
===================================================================
--- dtc.orig/tests/get_alias.c	2010-03-04 11:09:54.335020966 +1100
+++ dtc/tests/get_alias.c	2010-03-04 11:09:55.796048832 +1100
@@ -29,7 +29,7 @@
 #include "tests.h"
 #include "testdata.h"
 
-void check_alias(void *fdt, const char *path, const char *alias)
+static void check_alias(void *fdt, const char *path, const char *alias)
 {
 	const char *aliaspath;
 
Index: dtc/tests/path_offset_aliases.c
===================================================================
--- dtc.orig/tests/path_offset_aliases.c	2010-03-04 11:09:54.379023209 +1100
+++ dtc/tests/path_offset_aliases.c	2010-03-04 11:09:55.796048832 +1100
@@ -29,7 +29,7 @@
 #include "tests.h"
 #include "testdata.h"
 
-void check_alias(void *fdt, const char *full_path, const char *alias_path)
+static void check_alias(void *fdt, const char *full_path, const char *alias_path)
 {
 	int offset, offset_a;
 
Index: dtc/tests/value-labels.c
===================================================================
--- dtc.orig/tests/value-labels.c	2010-03-04 11:09:54.355048932 +1100
+++ dtc/tests/value-labels.c	2010-03-04 11:09:55.796048832 +1100
@@ -59,8 +59,8 @@ struct val_label labels3[] = {
 	{ "end3", -1 },
 };
 
-void check_prop_labels(void *sohandle, void *fdt, const char *name,
-		       const struct val_label* labels, int n)
+static void check_prop_labels(void *sohandle, void *fdt, const char *name,
+			      const struct val_label* labels, int n)
 {
 	const struct fdt_property *prop;
 	const char *p;


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
