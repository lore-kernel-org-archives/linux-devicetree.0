From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] Fix an overflow case in fdt_offset_ptr() detected by GCC 4.3.
Date: Thu, 25 Sep 2008 11:02:17 -0500
Message-ID: <1222358537.25112.7.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Stephen Papacharalambous <SteveP-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Using Gcc 4.3 detected this problem:

    ../dtc/libfdt/fdt.c: In function 'fdt_next_tag':
    ../dtc/libfdt/fdt.c:82: error: assuming signed overflow does not
    occur when assuming that (X + c) < X is always false

To fix the problem, treat the offset as an unsigned int.

The problem report and proposed fix were provided
by Steve Papacharalambous <stevep-KZfg59tc24xl57MIdRCFDg@public.gmane.org>.

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 libfdt/fdt.c    |    2 +-
 libfdt/libfdt.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 2acaec5..37085c1 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -74,7 +74,7 @@ int fdt_check_header(const void *fdt)
 	return 0;
 }
 
-const void *fdt_offset_ptr(const void *fdt, int offset, int len)
+const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
 	const char *p;
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 9e4f990..60dd4a1 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -122,7 +122,7 @@
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
 
-const void *fdt_offset_ptr(const void *fdt, int offset, int checklen);
+const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int checklen);
 static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 {
 	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
-- 
1.6.0.2.g2ebc0
