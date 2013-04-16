From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 15 Apr 2013 22:13:11 -0400
Message-ID: <1366078397-14889-5-git-send-email-vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366078397-14889-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is so all utilities can have this flag and not just dtc.

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 dtc.c  | 5 +----
 util.c | 7 +++++++
 util.h | 5 +++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/dtc.c b/dtc.c
index d40e220..e4e1b84 100644
--- a/dtc.c
+++ b/dtc.c
@@ -21,8 +21,6 @@
 #include "dtc.h"
 #include "srcpos.h"
 
-#include "version_gen.h"
-
 /*
  * Command line options
  */
@@ -158,8 +156,7 @@ int main(int argc, char *argv[])
 			srcfile_add_search_path(optarg);
 			break;
 		case 'v':
-			printf("Version: %s\n", DTC_VERSION);
-			exit(0);
+			util_version();
 		case 'H':
 			if (streq(optarg, "legacy"))
 				phandle_format = PHANDLE_LEGACY;
diff --git a/util.c b/util.c
index 0367df6..350cf8b 100644
--- a/util.c
+++ b/util.c
@@ -34,6 +34,7 @@
 
 #include "libfdt.h"
 #include "util.h"
+#include "version_gen.h"
 
 char *xstrdup(const char *s)
 {
@@ -385,3 +386,9 @@ void utilfdt_print_data(const char *data, int len)
 		printf("]");
 	}
 }
+
+void util_version(void)
+{
+	printf("Version: %s\n", DTC_VERSION);
+	exit(0);
+}
diff --git a/util.h b/util.h
index b9c6d7e..95ae531 100644
--- a/util.h
+++ b/util.h
@@ -179,4 +179,9 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size);
  */
 void utilfdt_print_data(const char *data, int len);
 
+/**
+ * Show source version and exit
+ */
+void util_version(void) __attribute__((noreturn));
+
 #endif /* _UTIL_H */
-- 
1.8.1.2
