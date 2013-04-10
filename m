From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 10/10] fdtdump: add a debug mode
Date: Wed, 10 Apr 2013 14:29:15 -0400
Message-ID: <1365618555-5893-11-git-send-email-vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365618555-5893-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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

When hacking raw fdt files, it's useful to know the actual offsets into
the file each node appears.  Add a --debug mode that includes this.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 fdtdump.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 2b8c194..2c8bff6 100644
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
+	return "???";
+}
+
+#define dprintf(fmt, args...) \
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
+		dprintf("%04zx: tag: 0x%08x (%s)\n",
+		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
 
 		if (tag == FDT_BEGIN_NODE) {
 			s = p;
@@ -113,6 +135,8 @@ static void dump_blob(void *blob)
 
 		p = PALIGN(p + sz, 4);
 
+		dprintf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
+		dprintf("%04zx: value\n", (uintptr_t)t - blob_off);
 		printf("%*s%s", depth * shift, "", s);
 		utilfdt_print_data(t, sz);
 		printf(";\n");
@@ -121,8 +145,9 @@ static void dump_blob(void *blob)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = "s" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
+	{"debug",            no_argument, NULL, 'd'},
 	{"scan",             no_argument, NULL, 's'},
 	USAGE_COMMON_LONG_OPTS
 };
@@ -136,6 +161,7 @@ int main(int argc, char *argv[])
 	int opt;
 	const char *file;
 	char *buf;
+	bool debug = false;
 	bool scan = false;
 	off_t len;
 
@@ -143,6 +169,9 @@ int main(int argc, char *argv[])
 		switch (opt) {
 		case_USAGE_COMMON_FLAGS
 
+		case 'd':
+			debug = true;
+			break;
 		case 's':
 			scan = true;
 			break;
@@ -179,6 +208,9 @@ int main(int argc, char *argv[])
 				    fdt_off_dt_struct(p) < this_len &&
 					fdt_off_dt_strings(p) < this_len)
 					break;
+				if (debug)
+					printf("%s: skipping fdt magic at offset %#zx\n",
+						file, p - buf);
 			}
 			++p;
 		}
@@ -188,7 +220,7 @@ int main(int argc, char *argv[])
 		buf = p;
 	}
 
-	dump_blob(buf);
+	dump_blob(buf, debug);
 
 	return 0;
 }
-- 
1.8.1.2
