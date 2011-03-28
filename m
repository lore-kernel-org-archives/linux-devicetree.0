From: Peter Tyser <ptyser-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] fdt_ro: Fix fdt_get_property_namelen() length bug
Date: Mon, 28 Mar 2011 17:19:35 -0500
Message-ID: <1301350775-27040-1-git-send-email-ptyser@xes-inc.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

fdt_get_property_namelen() should only compare 'namelen' characters when
matching a property name.  The previous code compared 'namelen'
characters correctly, but also required the property name length to
exactly match 'namelen'.

This length matching requirement would result in bugs such as
"ethernet0" not being found when using fdt_get_property_namelen() to
find properties starting with "ethernet".

Fix the bug by allowing the property name length to be greater than or
equal to 'namelen'.

Also, fix a typo in the fdt_get_property_namelen() description.

Signed-off-by: Peter Tyser <ptyser-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Reported-by: Chris Anacker <canacker-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
---
Let me know if this isn't the right mailing list for dtc/libfdt fixes.
This issue isn't in the Linux kernel since it differs from the dtc
tree, but is in other packages, eg U-Boot.  Please keep me on CC,
I'm not subscribed to this list.

 libfdt/fdt_ro.c |    2 +-
 libfdt/libfdt.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 02b6d68..8e03eb6 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -85,7 +85,7 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 {
 	const char *p = fdt_string(fdt, stroffset);
 
-	return (strlen(p) == len) && (memcmp(p, s, len) == 0);
+	return (strlen(p) >= len) && (memcmp(p, s, len) == 0);
 }
 
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 55f3eb3..1762c27 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -419,8 +419,8 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  * @namelen: number of characters of name to consider
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
- * Identical to fdt_get_property_namelen(), but only examine the first
- * namelen characters of name for matching the property name.
+ * Identical to fdt_get_property(), but only examine the first namelen
+ * characters of name for matching the property name.
  */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
-- 
1.7.0.4
