From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RFC 1/2] libfdt: Add node and property realloc functions.
Date: Wed, 10 Apr 2013 15:33:18 +0100
Message-ID: <1365604398-18064-1-git-send-email-srinivas.kandagatla@st.com>
References: <1365604278-17956-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365604278-17956-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

libfdt has code to add new property or node or extend a property to an
arbitary value, however it cannot be used because all the library
functions take preallocated fdt pointer limted to a size.

Adding realloc function into libfdt can help tools like fdtput to insert
nodes or properties or extend a property.

Without this patch if we try to add a new node/property to a dtb, the
libfdt errors with FDT_ERR_NOSPACE.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 libfdt/fdt_rw.c |   39 +++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h |    4 ++++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index fdba618..e7766d0 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -52,6 +52,7 @@
 
 #include <fdt.h>
 #include <libfdt.h>
+#include <stdlib.h>
 
 #include "libfdt_internal.h"
 
@@ -248,6 +249,13 @@ static int _fdt_add_property(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
+static int _fdt_realloc(void **fdt, int newsize)
+{
+	*fdt = realloc(*fdt, newsize);
+	fdt_set_totalsize(*fdt, newsize);
+	return 0;
+}
+
 int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 {
 	char *namep;
@@ -490,3 +498,34 @@ int fdt_pack(void *fdt)
 
 	return 0;
 }
+
+int fdt_realloc_node(void **fdt, const char *name)
+{
+	int delta = 0;
+	int newlen = strlen(name);
+	if (newlen)
+		delta = sizeof(struct fdt_node_header) +
+				FDT_TAGALIGN(newlen + 1) + FDT_TAGSIZE;
+	else
+		return 0;
+
+	return _fdt_realloc(fdt, fdt_totalsize(*fdt) + delta);
+}
+
+int fdt_realloc_property(void **fdt, int nodeoffset,
+		const char *name, int newlen)
+{
+	int delta = 0;
+	int oldlen;
+	if (!fdt_get_property(*fdt, nodeoffset, name, &oldlen))
+		/* strings + property header */
+		delta = sizeof(struct fdt_property) + strlen(name) + 1;
+
+	if (newlen > oldlen)
+		/* actual value in off_struct */
+		delta += FDT_TAGALIGN(newlen) - FDT_TAGALIGN(oldlen);
+	else
+		return 0;
+
+	return _fdt_realloc(fdt, fdt_totalsize(*fdt) + delta);
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 130789a..640c740 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1032,6 +1032,10 @@ int fdt_create_empty_tree(void *buf, int bufsize);
 int fdt_open_into(const void *fdt, void *buf, int bufsize);
 int fdt_pack(void *fdt);
 
+int fdt_realloc_property(void **fdt, int nodeoffset,
+				const char *name, int newlen);
+int fdt_realloc_node(void **fdt, const char *name);
+
 /**
  * fdt_add_mem_rsv - add one memory reserve map entry
  * @fdt: pointer to the device tree blob
-- 
1.7.6.5
