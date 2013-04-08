From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 8/8] util: drop "long" from usage helpers
Date: Mon,  8 Apr 2013 03:06:52 -0400
Message-ID: <1365404812-15153-9-git-send-email-vapier@gentoo.org>
References: <1365404812-15153-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365404812-15153-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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

Now that all utils have converted to the new usage framework, we can
rename to just plain "usage()" and avoid naming conflicts.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 dtc.c     |  6 +++---
 fdtdump.c |  2 +-
 fdtget.c  |  6 +++---
 fdtput.c  |  8 ++++----
 util.c    |  6 +++---
 util.h    | 18 +++++++++---------
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/dtc.c b/dtc.c
index d0a1f2d..e3c9653 100644
--- a/dtc.c
+++ b/dtc.c
@@ -186,14 +186,14 @@ int main(int argc, char *argv[])
 			break;
 
 		case 'h':
-			long_usage(NULL);
+			usage(NULL);
 		default:
-			long_usage("unknown option");
+			usage("unknown option");
 		}
 	}
 
 	if (argc > (optind+1))
-		long_usage("missing files");
+		usage("missing files");
 	else if (argc < (optind+1))
 		arg = "-";
 	else
diff --git a/fdtdump.c b/fdtdump.c
index 7b967aa..2b8c194 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -149,7 +149,7 @@ int main(int argc, char *argv[])
 		}
 	}
 	if (optind != argc - 1)
-		long_usage("missing input filename");
+		usage("missing input filename");
 	file = argv[optind];
 
 	buf = utilfdt_read(file, &len);
diff --git a/fdtget.c b/fdtget.c
index c08efd4..65dd907 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -319,7 +319,7 @@ int main(int argc, char *argv[])
 		case 't':
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
-				long_usage("invalid type string");
+				usage("invalid type string");
 			break;
 
 		case 'p':
@@ -341,7 +341,7 @@ int main(int argc, char *argv[])
 	if (optind < argc)
 		filename = argv[optind++];
 	if (!filename)
-		long_usage("missing filename");
+		usage("missing filename");
 
 	argv += optind;
 	argc -= optind;
@@ -352,7 +352,7 @@ int main(int argc, char *argv[])
 
 	/* Check for node, property arguments */
 	if (args_per_step == 2 && (argc % 2))
-		long_usage("must have an even number of arguments");
+		usage("must have an even number of arguments");
 
 	if (do_fdtget(&disp, filename, argv, argc, args_per_step))
 		return 1;
diff --git a/fdtput.c b/fdtput.c
index 1be326a..bdf9d95 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -327,7 +327,7 @@ int main(int argc, char *argv[])
 		case 't':
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
-				long_usage("invalid type string");
+				usage("invalid type string");
 			break;
 
 		case 'v':
@@ -339,16 +339,16 @@ int main(int argc, char *argv[])
 	if (optind < argc)
 		filename = argv[optind++];
 	if (!filename)
-		long_usage("missing filename");
+		usage("missing filename");
 
 	argv += optind;
 	argc -= optind;
 
 	if (disp.oper == OPER_WRITE_PROP) {
 		if (argc < 1)
-			long_usage("missing node");
+			usage("missing node");
 		if (argc < 2)
-			long_usage("missing property");
+			usage("missing property");
 	}
 
 	if (do_fdtput(&disp, filename, argv, argc))
diff --git a/util.c b/util.c
index a1f4313..62d2167 100644
--- a/util.c
+++ b/util.c
@@ -382,9 +382,9 @@ void util_version(void)
 	exit(0);
 }
 
-void util_long_usage(const char *errmsg, const char *synopsis,
-		     const char *short_opts, struct option const long_opts[],
-		     const char * const opts_help[])
+void util_usage(const char *errmsg, const char *synopsis,
+		const char *short_opts, struct option const long_opts[],
+		const char * const opts_help[])
 {
 	FILE *fp = errmsg ? stderr : stdout;
 	const char a_arg[] = "<arg>";
diff --git a/util.h b/util.h
index 3d8c0a9..3f48664 100644
--- a/util.h
+++ b/util.h
@@ -178,7 +178,7 @@ void util_version(void) __attribute__((noreturn));
  * Show usage and exit
  *
  * This helps standardize the output of various utils.  You most likely want
- * to use the long_usage() helper below rather than call this.
+ * to use the usage() helper below rather than call this.
  *
  * @param errmsg	If non-NULL, an error message to display
  * @param synopsis	The initial example usage text (and possible examples)
@@ -186,9 +186,9 @@ void util_version(void) __attribute__((noreturn));
  * @param long_opts	The structure of long options
  * @param opts_help	An array of help strings (should align with long_opts)
  */
-void util_long_usage(const char *errmsg, const char *synopsis,
-		     const char *short_opts, struct option const long_opts[],
-		     const char * const opts_help[]) __attribute__((noreturn));
+void util_usage(const char *errmsg, const char *synopsis,
+		const char *short_opts, struct option const long_opts[],
+		const char * const opts_help[]) __attribute__((noreturn));
 
 /**
  * Show usage and exit
@@ -198,9 +198,9 @@ void util_long_usage(const char *errmsg, const char *synopsis,
  *
  * @param errmsg	If non-NULL, an error message to display
  */
-#define long_usage(errmsg) \
-	util_long_usage(errmsg, usage_synopsis, usage_short_opts, \
-			usage_long_opts, usage_opts_help)
+#define usage(errmsg) \
+	util_usage(errmsg, usage_synopsis, usage_short_opts, \
+		   usage_long_opts, usage_opts_help)
 
 /**
  * Call getopt_long() with standard options
@@ -230,8 +230,8 @@ void util_long_usage(const char *errmsg, const char *synopsis,
 
 /* Helper for getopt case statements */
 #define case_USAGE_COMMON_FLAGS \
-	case 'h': long_usage(NULL); \
+	case 'h': usage(NULL); \
 	case 'V': util_version(); \
-	case '?': long_usage("unknown option");
+	case '?': usage("unknown option");
 
 #endif /* _UTIL_H */
-- 
1.8.1.2
