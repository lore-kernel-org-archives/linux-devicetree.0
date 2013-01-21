From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/8] Export fdt_stringlist_contains()
Date: Mon, 21 Jan 2013 12:59:18 -0800
Message-ID: <1358801962-21707-5-git-send-email-sjg@chromium.org>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This function is useful outside libfdt, so export it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 libfdt/fdt_ro.c |    5 ++---
 libfdt/libfdt.h |   14 ++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 42da2bd..50007f6 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -515,8 +515,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 	return offset; /* error from fdt_next_node() */
 }
 
-static int _fdt_stringlist_contains(const char *strlist, int listlen,
-				    const char *str)
+int fdt_stringlist_contains(const char *strlist, int listlen, const char *str)
 {
 	int len = strlen(str);
 	const char *p;
@@ -542,7 +541,7 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 	prop = fdt_getprop(fdt, nodeoffset, "compatible", &len);
 	if (!prop)
 		return len;
-	if (_fdt_stringlist_contains(prop, len, compatible))
+	if (fdt_stringlist_contains(prop, len, compatible))
 		return 0;
 	else
 		return 1;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 8e57a06..c0075e7 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -816,6 +816,20 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 				  const char *compatible);
 
+/**
+ * fdt_stringlist_contains - check a string list property for a string
+ * @strlist: Property containing a list of strings to check
+ * @listlen: Length of property
+ * @str: String to search for
+ *
+ * This is a utility function provided for convenience. The list contains
+ * one or more strings, each terminated by \0, as is found in a device tree
+ * "compatible" property.
+ *
+ * @return: 1 if the string is found in the list, 0 not found, or invalid list
+ */
+int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
+
 /**********************************************************************/
 /* Write-in-place functions                                           */
 /**********************************************************************/
-- 
1.7.7.3
