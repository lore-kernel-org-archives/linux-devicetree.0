From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 05/10] util: add common ARRAY_SIZE define
Date: Wed, 29 May 2013 12:51:33 +1000
Message-ID: <1369795898-7631-6-git-send-email-david@gibson.dropbear.id.au>
References: <1369795898-7631-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369795898-7631-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

I want to use this in more places, so put it in util.h rather than
copying & pasting it into another file.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 convert-dtsv0-lexer.l |    2 --
 dtc.h                 |    1 -
 util.h                |    2 ++
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
index 8902648..548e719 100644
--- a/convert-dtsv0-lexer.l
+++ b/convert-dtsv0-lexer.l
@@ -50,8 +50,6 @@ static int saw_hyphen; /* = 0 */
 static unsigned long long last_val;
 static char *last_name; /* = NULL */
 
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-
 const struct {
 	const char *pattern;
 	int obase, width;
diff --git a/dtc.h b/dtc.h
index 3e42a07..264a20c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -66,7 +66,6 @@ typedef uint32_t cell_t;
 #define strneq(a, b, n)	(strncmp((a), (b), (n)) == 0)
 
 #define ALIGN(x, a)	(((x) + (a) - 1) & ~((a) - 1))
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
 /* Data blobs */
 enum markertype {
diff --git a/util.h b/util.h
index 7b9a840..8f40b44 100644
--- a/util.h
+++ b/util.h
@@ -24,6 +24,8 @@
  *                                                                   USA
  */
 
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
 static inline void __attribute__((noreturn)) die(const char *str, ...)
 {
 	va_list ap;
-- 
1.7.10.4
