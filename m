From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 06/10] fdtdump: add a debug mode
Date: Wed, 29 May 2013 12:51:34 +1000
Message-ID: <1369795898-7631-7-git-send-email-david@gibson.dropbear.id.au>
References: <1369795898-7631-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369795898-7631-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

When hacking raw fdt files, it's useful to know the actual offsets into
the file each node appears.  Add a --debug mode that includes this.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 fdtdump.c |   41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index c2f16ea..723770d 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -19,8 +19,29 @@
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
 #define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
 
-static void dump_blob(void *blob)
+static const char *tagname(uint32_t tag)
 {
+	static const char * const names[] = {
+#define TN(t) [t] #t
+		TN(FDT_BEGIN_NODE),
+		TN(FDT_END_NODE),
+		TN(FDT_PROP),
+		TN(FDT_NOP),
+		TN(FDT_END),
+#undef TN
+	};
+	if (tag < ARRAY_SIZE(names))
+		if (names[tag])
+			return names[tag];
+	return "FDT_???";
+}
+
+#define dumpf(fmt, args...) \
+	do { if (debug) printf("// " fmt, ## args); } while (0)
+
+static void dump_blob(void *blob, bool debug)
+{
+	uintptr_t blob_off = (uintptr_t)blob;
 	struct fdt_header *bph = blob;
 	uint32_t off_mem_rsvmap = fdt32_to_cpu(bph->off_mem_rsvmap);
 	uint32_t off_dt = fdt32_to_cpu(bph->off_dt_struct);
@@ -74,7 +95,8 @@ static void dump_blob(void *blob)
 	p = p_struct;
 	while ((tag = fdt32_to_cpu(GET_CELL(p))) != FDT_END) {
 
-		/* printf("tag: 0x%08x (%d)\n", tag, p - p_struct); */
+		dumpf("%04zx: tag: 0x%08x (%s)\n",
+		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
 
 		if (tag == FDT_BEGIN_NODE) {
 			s = p;
@@ -113,6 +135,8 @@ static void dump_blob(void *blob)
 
 		p = PALIGN(p + sz, 4);
 
+		dumpf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
+		dumpf("%04zx: value\n", (uintptr_t)t - blob_off);
 		printf("%*s%s", depth * shift, "", s);
 		utilfdt_print_data(t, sz);
 		printf(";\n");
@@ -121,12 +145,14 @@ static void dump_blob(void *blob)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = "s" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
+	{"debug",            no_argument, NULL, 'd'},
 	{"scan",             no_argument, NULL, 's'},
 	USAGE_COMMON_LONG_OPTS
 };
 static const char * const usage_opts_help[] = {
+	"Dump debug information while decoding the file",
 	"Scan for an embedded fdt in file",
 	USAGE_COMMON_OPTS_HELP
 };
@@ -136,6 +162,7 @@ int main(int argc, char *argv[])
 	int opt;
 	const char *file;
 	char *buf;
+	bool debug = false;
 	bool scan = false;
 	off_t len;
 
@@ -143,6 +170,9 @@ int main(int argc, char *argv[])
 		switch (opt) {
 		case_USAGE_COMMON_FLAGS
 
+		case 'd':
+			debug = true;
+			break;
 		case 's':
 			scan = true;
 			break;
@@ -179,6 +209,9 @@ int main(int argc, char *argv[])
 				    fdt_off_dt_struct(p) < this_len &&
 					fdt_off_dt_strings(p) < this_len)
 					break;
+				if (debug)
+					printf("%s: skipping fdt magic at offset %#zx\n",
+						file, p - buf);
 			}
 			++p;
 		}
@@ -188,7 +221,7 @@ int main(int argc, char *argv[])
 		buf = p;
 	}
 
-	dump_blob(buf);
+	dump_blob(buf, debug);
 
 	return 0;
 }
-- 
1.7.10.4
