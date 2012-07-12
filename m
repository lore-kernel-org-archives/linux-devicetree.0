From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/5] fdtput: Prepare to support multiple operations
Date: Thu, 12 Jul 2012 08:52:48 -0700
Message-ID: <1342108371-15616-2-git-send-email-sjg@chromium.org>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We want to add new options to this tool. In preparation for this, add
the concept of a current operation.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Change enum operation_t to oper_type

 fdtput.c |   37 ++++++++++++++++++++++++++-----------
 1 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index 244d1f1..da63539 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -28,7 +28,13 @@
 
 #include "util.h"
 
+/* These are the operations we support */
+enum oper_type {
+	OPER_WRITE_PROP,		/* Write a property in a node */
+};
+
 struct display_info {
+	enum oper_type oper;	/* operation to perform */
 	int type;		/* data type (s/i/u/x or 0 for default) */
 	int size;		/* data size (1/2/4) */
 	int verbose;		/* verbose output */
@@ -143,13 +149,19 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 	if (!blob)
 		return -1;
 
-	/* convert the arguments into a single binary value, then store */
-	assert(arg_count >= 2);
-	if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
-		store_key_value(blob, *arg, arg[1], value, len))
-		ret = -1;
-
-	if (!ret)
+	switch (disp->oper) {
+	case OPER_WRITE_PROP:
+		/*
+		 * Convert the arguments into a single binary value, then
+		 * store them into the property.
+		 */
+		assert(arg_count >= 2);
+		if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
+			store_key_value(blob, *arg, arg[1], value, len))
+			ret = -1;
+		break;
+	}
+	if (ret >= 0)
 		ret = utilfdt_write(filename, blob);
 
 	free(blob);
@@ -185,6 +197,7 @@ int main(int argc, char *argv[])
 
 	memset(&disp, '\0', sizeof(disp));
 	disp.size = -1;
+	disp.oper = OPER_WRITE_PROP;
 	for (;;) {
 		int c = getopt(argc, argv, "ht:v");
 		if (c == -1)
@@ -224,10 +237,12 @@ int main(int argc, char *argv[])
 	argv += optind;
 	argc -= optind;
 
-	if (argc < 1)
-		usage("Missing node");
-	if (argc < 2)
-		usage("Missing property");
+	if (disp.oper == OPER_WRITE_PROP) {
+		if (argc < 1)
+			usage("Missing node");
+		if (argc < 2)
+			usage("Missing property");
+	}
 
 	if (do_fdtput(&disp, filename, argv, argc))
 		return 1;
-- 
1.7.7.3
