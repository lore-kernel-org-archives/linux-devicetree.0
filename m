From: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Fri, 18 Jan 2013 06:59:46 -0500
Message-ID: <50F93932.60700@cideas.com>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
 <1358382963.18317.17@snotra>
 <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
 <50F843CD.1030309@cideas.com> <20130117235048.GF26321@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130117235048.GF26321-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/17/2013 06:50 PM, David Gibson wrote:
> On Thu, Jan 17, 2013 at 01:32:45PM -0500, Jerry Van Baren wrote:
>> Hi Scott, Kim, David,

[snip]

>> libfdt_env.h is where Kim typedef'ed fdt16_t, fdt32_t, fdt64_t
>> 
>> I suspect the original intent was to have <libfdt.h> be the file 
>> that people #included.  For whatever reason, most includes are 
>> (picking on fdt_ro.c arbitrarily): 51 #include "libfdt_env.h" 53
>> #include <fdt.h> 54 #include <libfdt.h> Since libfdt.h #includes
>> fdt.h and libfdt_env.h, lines 51 and 53 (above) are redundant.
>> It sorts out OK in dtc because libfdt_env.h includes stdint.h and
>> defines fdt*_t, but it messes me up in u-boot where (currently)
>> libfdt_env.h does *not* include stdint.h...
> 
> Ok, so, the uboot libfdt_env.h should be fixed to define uintXX_t
> and fdtXX_t (either by including stdint or my other means).  The
> purpose of libfdt_env.h is to define the things that libfdt
> requires, and those types are (now) such a requirement.

I like the move, but have not done it (yet).  I made a trial patch
(see below) that uses libfdt.h as the interface and cleans out the
(now redundant) other *fdt*.h includes.  If this is in the right
direction, I'll move the fdtXX_t typedefs and formally submit it.

The test suite has one failure, but it fails with or without my changes.

$ make check | grep FAIL
fdtget-runtest.sh 77 121 66 111 97 114 100 78 97 109 101 0 77 121 66
111 97 114 100 70 97 109 105 108 121 78 97 109 101 0
label01.dts.fdtget.test.dtb / compatible:	FAIL Results differ from
expected
*                FAIL:	1

********** TEST SUMMARY
*     Total testcases:	1443
*                PASS:	1442
*                FAIL:	1
*   Bad configuration:	0
* Strange test result:	0
**********

gvb

>From 1fb0193670e012072d4a9e5ac480e3201aaf30fd Mon Sep 17 00:00:00 2001
From: Gerald Van Baren <gvb-LFPmMGy0VdYAvxtiuMwx3w@public.gmane.org>
Date: Thu, 17 Jan 2013 21:14:01 -0500
Subject: [PATCH] Use the libfdt.h include as the interface definition

libfdt.h is the libfdt interface definition.  It includes fdt.h and
libfdt_env.h, so there is no reason to include those in the general code.

Signed-off-by: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
---
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
index e6c3cee..c55793c 100644
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
