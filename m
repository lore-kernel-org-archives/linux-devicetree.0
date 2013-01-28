From: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Move the fdt*_t type definitions to fdt.h
Date: Sun, 27 Jan 2013 21:44:37 -0500
Message-ID: <5105E615.30102@cideas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Arguably they belong there since they are fundamental to the fdt.
As a side effect, I had to flip the order of #includes of fdt.h and
libfdt_env.h in libfdt.h since libfdt_env.h needs the fdt*_t definitions.

Signed-off-by: Gerald Van Baren <gvb-LFPmMGy0VdYAvxtiuMwx3w@public.gmane.org>
---

I'm not sure I like this, but submit it for your consideration.  If, for
some reason, libfdt_env.h needed to (re)define something in fdt.h, it
would be unable to do so. :-/

 libfdt/fdt.h        |   14 ++++++++++++++
 libfdt/libfdt.h     |    2 +-
 libfdt/libfdt_env.h |   13 -------------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 45dd134..d7226f0 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -3,6 +3,20 @@

 #ifndef __ASSEMBLY__
+#include <stdint.h>
+
+#ifdef __CHECKER__
+#define __force __attribute__((force))
+#define __bitwise __attribute__((bitwise))
+#else
+#define __force
+#define __bitwise
+#endif
+
+typedef uint16_t __bitwise fdt16_t;
+typedef uint32_t __bitwise fdt32_t;
+typedef uint64_t __bitwise fdt64_t;
+
 struct fdt_header {
 	fdt32_t magic;			 /* magic word FDT_MAGIC */
 	fdt32_t totalsize;		 /* total size of DT block */
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c0075e7..0b699a8 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -51,8 +51,8 @@
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */

-#include <libfdt_env.h>
 #include <fdt.h>
+#include <libfdt_env.h>

 #define FDT_FIRST_SUPPORTED_VERSION	0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 956b4ae..b60e6a7 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -2,21 +2,8 @@
 #define _LIBFDT_ENV_H

 #include <stddef.h>
-#include <stdint.h>
 #include <string.h>

-#ifdef __CHECKER__
-#define __force __attribute__((force))
-#define __bitwise __attribute__((bitwise))
-#else
-#define __force
-#define __bitwise
-#endif
-
-typedef uint16_t __bitwise fdt16_t;
-typedef uint32_t __bitwise fdt32_t;
-typedef uint64_t __bitwise fdt64_t;
-
 #define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])
 #define CPU_TO_FDT16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
 #define CPU_TO_FDT32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x,
1) << 16) | \
-- 
1.7.9.5
