From: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Use the libfdt.h include as the interface definition
Date: Sun, 27 Jan 2013 21:35:22 -0500
Message-ID: <5105E3EA.2070306@cideas.com>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

libfdt.h is the libfdt interface definition.  It includes fdt.h and
libfdt_env.h, so there is no reason to include those in the general code.

Signed-off-by: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
---

No code changes, just cleaning up the #include situation WRT libfdt.h,
fdt.h, and libfdt_env.h (the later two being redundant).

I looked at moving the fdt64_t, fdt32_t, fdt16_t definitions from
libfdt_env.h to fdt.h.  I'm not sure this is a Good Thing[tm], but will
send a separate patch for consideration and discussion.

 dtc.h                    |    3 +--
 fdtdump.c                |    3 +--
 libfdt/fdt.c             |    3 ---
 libfdt/fdt_empty_tree.c  |    3 ---
 libfdt/fdt_ro.c          |    3 ---
 libfdt/fdt_rw.c          |    3 ---
 libfdt/fdt_strerror.c    |    3 ---
 libfdt/fdt_sw.c          |    3 ---
 libfdt/fdt_wip.c         |    3 ---
 libfdt/libfdt_internal.h |    1 -
 10 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/dtc.h b/dtc.h
index 3e42a07..a032645 100644
--- a/dtc.h
+++ b/dtc.h
@@ -32,8 +32,7 @@
 #include <errno.h>
 #include <unistd.h>

-#include <libfdt_env.h>
-#include <fdt.h>
+#include <libfdt.h>

 #include "util.h"

diff --git a/fdtdump.c b/fdtdump.c
index b2c5b37..3919490 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -8,8 +8,7 @@
 #include <string.h>
 #include <ctype.h>

-#include <libfdt_env.h>
-#include <fdt.h>
+#include <libfdt.h>

 #include "util.h"

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 57faba3..19b9043 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 int fdt_check_header(const void *fdt)
diff --git a/libfdt/fdt_empty_tree.c b/libfdt/fdt_empty_tree.c
index f72d13b..30c5525 100644
--- a/libfdt/fdt_empty_tree.c
+++ b/libfdt/fdt_empty_tree.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 int fdt_create_empty_tree(void *buf, int bufsize)
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 42da2bd..53c61ed 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 static int _fdt_nodename_eq(const void *fdt, int offset,
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index fdba618..b6a8815 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 static int _fdt_blocks_misordered(const void *fdt,
diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 struct fdt_errtabent {
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index f422754..85aaedf 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 static int _fdt_sw_check_header(void *fdt)
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c5bbb68..67fa7ca 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -48,11 +48,8 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include "libfdt_env.h"

-#include <fdt.h>
 #include <libfdt.h>
-
 #include "libfdt_internal.h"

 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 381133b..a8b36f4 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -50,7 +50,6 @@
  *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#include <fdt.h>

 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
-- 
1.7.9.5
