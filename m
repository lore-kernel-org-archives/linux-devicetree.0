From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 06/14] fdt: Export fdtdec_lookup() and fix the name
Date: Thu, 25 Oct 2012 19:31:03 -0700
Message-ID: <1351218671-15228-7-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The name of this function is not consistent, so fix it, and export
the function for external use.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   13 +++++++++++++
 lib/fdtdec.c     |    2 +-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index e566e47..3f1840c 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -110,6 +110,19 @@ int fdtdec_next_alias(const void *blob, const char *name,
 		enum fdt_compat_id id, int *upto);
 
 /**
+ * Find the compatible ID for a given node.
+ *
+ * Generally each node has at least one compatible string attached to it.
+ * This function looks through our list of known compatible strings and
+ * returns the corresponding ID which matches the compatible string.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Node containing compatible string to find
+ * @return compatible ID, or COMPAT_UNKNOWN if we cannot find a match
+ */
+enum fdt_compat_id fdtdec_lookup(const void *blob, int node);
+
+/**
  * Look in the FDT for an alias with the given name and return its node.
  *
  * @param blob	FDT blob
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 16435b7..efe9afe 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -128,7 +128,7 @@ int fdtdec_get_is_enabled(const void *blob, int node)
 	return 1;
 }
 
-enum fdt_compat_id fd_dec_lookup(const void *blob, int node)
+enum fdt_compat_id fdtdec_lookup(const void *blob, int node)
 {
 	enum fdt_compat_id id;
 
-- 
1.7.7.3
