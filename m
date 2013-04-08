From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/8] fdtdump: add a --scan option
Date: Mon,  8 Apr 2013 03:06:50 -0400
Message-ID: <1365404812-15153-7-git-send-email-vapier@gentoo.org>
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

Often times, fdts get embedded in other larger files.  Rather than force
people to `dd` the blob out themselves, make the fdtdump file smarter.

It can now scan the blob looking for the fdt magic.  Once locate, it does
a little validation on the main struct to make sure we didn't hit random
binary data.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 fdtdump.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index b685ed1..7b967aa 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -2,12 +2,14 @@
  * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
  */
 
+#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
 
+#include <libfdt.h>
 #include <libfdt_env.h>
 #include <fdt.h>
 
@@ -119,11 +121,13 @@ static void dump_blob(void *blob)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "s" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
+	{"scan",             no_argument, NULL, 's'},
 	USAGE_COMMON_LONG_OPTS
 };
 static const char * const usage_opts_help[] = {
+	"Scan for an embedded fdt in file",
 	USAGE_COMMON_OPTS_HELP
 };
 
@@ -132,20 +136,58 @@ int main(int argc, char *argv[])
 	int opt;
 	const char *file;
 	char *buf;
+	bool scan = false;
+	off_t len;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
 		case_USAGE_COMMON_FLAGS
+
+		case 's':
+			scan = true;
+			break;
 		}
 	}
 	if (optind != argc - 1)
 		long_usage("missing input filename");
 	file = argv[optind];
 
-	buf = utilfdt_read(file, NULL);
+	buf = utilfdt_read(file, &len);
 	if (!buf)
 		die("could not read: %s\n", file);
 
+	/* try and locate an embedded fdt in a bigger blob */
+	if (scan) {
+		unsigned char smagic[4];
+		char *p = buf;
+		char *endp = buf + len;
+
+		fdt_set_magic(smagic, FDT_MAGIC);
+
+		/* poor man's memmem */
+		while (true) {
+			p = memchr(p, smagic[0], endp - p - 4);
+			if (!p)
+				break;
+			if (fdt_magic(p) == FDT_MAGIC) {
+				/* try and validate the main struct */
+				off_t this_len = endp - p;
+				fdt32_t max_version = 17;
+				if (fdt_version(p) <= max_version &&
+				    fdt_last_comp_version(p) < max_version &&
+				    fdt_totalsize(p) < this_len &&
+				    fdt_off_dt_struct(p) < this_len &&
+					fdt_off_dt_strings(p) < this_len)
+					break;
+			}
+			++p;
+		}
+		if (!p)
+			die("%s: could not locate fdt magic\n", file);
+		printf("%s: found fdt at offset %#zx\n", file, p - buf);
+		buf = p;
+	}
+
 	dump_blob(buf);
 
 	return 0;
-- 
1.8.1.2
