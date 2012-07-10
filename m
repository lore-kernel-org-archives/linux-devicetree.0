From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/5] fdtput: Adjust report_error() to use name, namelen params
Date: Tue, 10 Jul 2012 05:56:47 -0700
Message-ID: <1341925008-10627-4-git-send-email-sjg@chromium.org>
References: <1341925008-10627-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341925008-10627-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As with many fdt functions, report_error() should permit a namelen to
be specified, thus obviating the need for nul termination in strings
passed to it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 fdtput.c |   25 ++++++++++++++++++-------
 1 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index fc6b85e..f217f1d 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -41,9 +41,20 @@ struct display_info {
 	int verbose;		/* verbose output */
 };
 
-static void report_error(const char *where, int err)
+
+/**
+ * Report an error with a particular node.
+ *
+ * @param name		Node name to report error on
+ * @param namelen	Length of node name, or -1 to use entire string
+ * @param err		Error number to report (-FDT_ERR_...)
+ */
+static void report_error(const char *name, int namelen, int err)
 {
-	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
+	if (namelen == -1)
+		namelen = strlen(name);
+	fprintf(stderr, "Error at '%1.*s': %s\n", namelen, name,
+		fdt_strerror(err));
 }
 
 /**
@@ -127,13 +138,13 @@ static int store_key_value(void *blob, const char *node_name,
 
 	node = fdt_path_offset(blob, node_name);
 	if (node < 0) {
-		report_error(node_name, node);
+		report_error(node_name, -1, node);
 		return -1;
 	}
 
 	err = fdt_setprop(blob, node, property, buf, len);
 	if (err) {
-		report_error(property, err);
+		report_error(property, -1, err);
 		return -1;
 	}
 	return 0;
@@ -157,7 +168,7 @@ static int create_node(void *blob, const char *node_name)
 
 	p = strrchr(node_name, '/');
 	if (!p) {
-		report_error(node_name, -FDT_ERR_BADPATH);
+		report_error(node_name, -1, -FDT_ERR_BADPATH);
 		return -1;
 	}
 	*p = '\0';
@@ -165,14 +176,14 @@ static int create_node(void *blob, const char *node_name)
 	if (p > node_name) {
 		node = fdt_path_offset(blob, node_name);
 		if (node < 0) {
-			report_error(node_name, node);
+			report_error(node_name, -1, node);
 			return -1;
 		}
 	}
 
 	node = fdt_add_subnode(blob, node, p + 1);
 	if (node < 0) {
-		report_error(p + 1, node);
+		report_error(p + 1, -1, node);
 		return -1;
 	}
 
-- 
1.7.7.3
