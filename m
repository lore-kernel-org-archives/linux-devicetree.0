From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/10] util: add common ARRAY_SIZE define
Date: Wed, 10 Apr 2013 14:29:14 -0400
Message-ID: <1365618555-5893-10-git-send-email-vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365618555-5893-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I want to use this in more places, so put it in util.h rather than
copying & pasting it into another file.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 convert-dtsv0-lexer.l | 2 --
 dtc.h                 | 1 -
 util.h                | 2 ++
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
index 3f48664..958825d 100644
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
1.8.1.2
