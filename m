From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Assorted cleanups and extensions for ftdump
Date: Tue, 17 Nov 2009 17:00:53 +1100
Message-ID: <20091117060053.GC2576@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch makes a number of minor changes to the ftdump debugging
tool.

 * There was an endian bug in one place, which this fixes.

 * We now use const qualifiers in a number of places where we can

 * ftdump can now be instructed to read from stdin by giving "-" as
   the filename.

 * The buffer into which the blob is read is increased from 16k to
   64k, and is now dynamically allocated.

 * ftdump now emits source in dts-v1 format

Since ftdump is little used these days, these fixes are arguably of
little use.  On the other hand, I already did the work of making the
changes some time back, so I guess we might as well fold these small
fixes and improvements in.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/ftdump.c
===================================================================
--- dtc.orig/ftdump.c	2009-11-17 16:54:53.882607285 +1100
+++ dtc/ftdump.c	2009-11-17 16:55:29.937594652 +1100
@@ -4,15 +4,18 @@
 
 #include <stdint.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
 
 #include <fdt.h>
 #include <libfdt_env.h>
 
+#define FTDUMP_BUF_SIZE	65536
+
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
-#define GET_CELL(p)	(p += 4, *((uint32_t *)(p-4)))
+#define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
 
 static int is_printable_string(const void *data, int len)
 {
@@ -38,10 +41,10 @@ static int is_printable_string(const voi
 	return 1;
 }
 
-static void print_data(const void *data, int len)
+static void print_data(const char *data, int len)
 {
 	int i;
-	const uint8_t *s;
+	const char *p = data;
 
 	/* no data, don't print */
 	if (len == 0)
@@ -52,13 +55,13 @@ static void print_data(const void *data,
 	} else if ((len % 4) == 0) {
 		printf(" = <");
 		for (i = 0; i < len; i += 4)
-			printf("%08x%s", *((const uint32_t *)data + i),
+			printf("0x%08x%s", fdt32_to_cpu(GET_CELL(p)),
 			       i < (len - 4) ? " " : "");
 		printf(">");
 	} else {
 		printf(" = [");
-		for (i = 0, s = data; i < len; i++)
-			printf("%02x%s", s[i], i < len - 1 ? " " : "");
+		for (i = 0; i < len; i++)
+			printf("%02x%s", *p++, i < len - 1 ? " " : "");
 		printf("]");
 	}
 }
@@ -71,13 +74,12 @@ static void dump_blob(void *blob)
 	uint32_t off_str = fdt32_to_cpu(bph->off_dt_strings);
 	struct fdt_reserve_entry *p_rsvmap =
 		(struct fdt_reserve_entry *)((char *)blob + off_mem_rsvmap);
-	char *p_struct = (char *)blob + off_dt;
-	char *p_strings = (char *)blob + off_str;
+	const char *p_struct = (const char *)blob + off_dt;
+	const char *p_strings = (const char *)blob + off_str;
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
 	uint32_t tag;
-	char *p;
-	char *s, *t;
+	const char *p, *s, *t;
 	int depth, sz, shift;
 	int i;
 	uint64_t addr, size;
@@ -85,6 +87,7 @@ static void dump_blob(void *blob)
 	depth = 0;
 	shift = 4;
 
+	printf("/dts-v1/;\n");
 	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
 	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
 	printf("// off_dt_struct:\t0x%x\n", off_dt);
@@ -167,7 +170,7 @@ static void dump_blob(void *blob)
 int main(int argc, char *argv[])
 {
 	FILE *fp;
-	char buf[16384];	/* 16k max */
+	char *buf;
 	int size;
 
 	if (argc < 2) {
@@ -175,15 +178,25 @@ int main(int argc, char *argv[])
 		return 5;
 	}
 
-	fp = fopen(argv[1], "rb");
-	if (fp == NULL) {
-		fprintf(stderr, "unable to open %s\n", argv[1]);
+	if (strcmp(argv[1], "-") == 0) {
+		fp = stdin;
+	} else {
+		fp = fopen(argv[1], "rb");
+		if (fp == NULL) {
+			fprintf(stderr, "unable to open %s\n", argv[1]);
+			return 10;
+		}
+	}
+
+	buf = malloc(FTDUMP_BUF_SIZE);
+	if (!buf) {
+		fprintf(stderr, "Couldn't allocate %d byte buffer\n", FTDUMP_BUF_SIZE);
 		return 10;
 	}
 
-	size = fread(buf, 1, sizeof(buf), fp);
-	if (size == sizeof(buf)) {	/* too large */
-		fprintf(stderr, "file too large\n");
+	size = fread(buf, 1, FTDUMP_BUF_SIZE, fp);
+	if (size == FTDUMP_BUF_SIZE) {
+		fprintf(stderr, "file too large (maximum is %d bytes)\n", FTDUMP_BUF_SIZE);
 		return 10;
 	}
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
