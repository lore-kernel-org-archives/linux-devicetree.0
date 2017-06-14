From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Wed, 14 Jun 2017 17:53:49 +0300
Message-ID: <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497452030-15588-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dumping files with large properties results in output with
arbitrary long lines.

Original (manual line breaks inserted; it's a single long line):

/ {
    int = <0x00000001 0x00000024 0x00000004 0x00000000 \
0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
};

After prettification:

/ {
    int = <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0x000000ab>,
          <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x00000009>,
          <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x00000001>,
          <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x00000001>;
};

There are two new options (-w/--width) and (-S/--shift).

Width is the terminal width, shift is the amount of spaces each nest level
increases by.

Width by default is set to 80, and shift to 4.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 fdtdump.c | 103 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 5 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index fa3b561..82aec9a 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -22,6 +22,9 @@
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
 #define GET_CELL(p)	(p += 4, *((const fdt32_t *)(p-4)))
 
+static int width = 80;
+static int shift = 4;
+
 static const char *tagname(uint32_t tag)
 {
 	static const char * const names[] = {
@@ -42,6 +45,86 @@ static const char *tagname(uint32_t tag)
 #define dumpf(fmt, args...) \
 	do { if (debug) printf("// " fmt, ## args); } while (0)
 
+static void print_prop(int col, const char *data, int len)
+{
+	int i, j, qlen, span, fit;
+	const char *s;
+	char c, buf[C2STR_BUF_MAX];
+
+	/* no data, don't print */
+	if (len == 0)
+		return;
+
+	printf(" = ");
+	col += strlen(" = ");
+
+	if (util_is_printable_string(data, len)) {
+		s = data;
+		j = col;
+		do {
+			qlen = util_quoted_strlen(s);
+			if (s > data) {
+				printf(",");
+				j++;
+
+				if (j + qlen > width - 1) {
+					j = col;
+					printf("\n%*s", col, "");
+				} else {
+					printf(" ");
+					j++;
+				}
+			}
+
+			/* print quoted string */
+			putchar('\"');
+			while ((c = *s++) != '\0' && util_c2str(c, buf, sizeof(buf)))
+				printf("%s", buf);
+			putchar('\"');
+
+			j += qlen;
+		} while (s < data + len);
+
+	} else if ((len % 4) == 0) {
+		const fdt32_t *cell = (const fdt32_t *)data;
+
+		len /= 4;
+
+		/* how many words can we fit? */
+		fit = (width - 1 - col - 2) / 11;
+
+		do {
+			printf("<");
+			span = len > fit ? fit : len;
+			for (i = 0; i < span; i++)
+				printf("0x%08x%s", fdt32_to_cpu(cell[i]),
+						i < (span - 1) ? " " : "");
+			cell += span;
+			len -= span;
+			printf(">");
+			if (len > 0)
+				printf(",\n%*s", col, "");
+		} while (len > 0);
+	} else {
+		const unsigned char *p = (const unsigned char *)data;
+
+		/* how many bytes can we fit? */
+		fit = (width - 1 - col - 2) / 3;
+
+		do {
+			printf("[");
+			span = len > fit ? fit : len;
+			for (i = 0; i < span; i++)
+				printf("%02x%s", *p++,
+						i < span - 1 ? " " : "");
+			len -= span;
+			printf("]");
+			if (len > 0)
+				printf(",\n%*s", col, "");
+		} while (len > 0);
+	}
+}
+
 static void dump_blob(void *blob, bool debug)
 {
 	uintptr_t blob_off = (uintptr_t)blob;
@@ -57,12 +140,11 @@ static void dump_blob(void *blob, bool debug)
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
 	uint32_t tag;
 	const char *p, *s, *t;
-	int depth, sz, shift;
+	int depth, sz;
 	int i;
 	uint64_t addr, size;
 
 	depth = 0;
-	shift = 4;
 
 	printf("/dts-v1/;\n");
 	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
@@ -127,7 +209,8 @@ static void dump_blob(void *blob, bool debug)
 		}
 
 		if (tag != FDT_PROP) {
-			fprintf(stderr, "%*s ** Unknown tag 0x%08x\n", depth * shift, "", tag);
+			fprintf(stderr, "%*s ** Unknown tag 0x%08x\n",
+					depth * shift, "", tag);
 			break;
 		}
 		sz = fdt32_to_cpu(GET_CELL(p));
@@ -141,22 +224,26 @@ static void dump_blob(void *blob, bool debug)
 		dumpf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
 		dumpf("%04zx: value\n", (uintptr_t)t - blob_off);
 		printf("%*s%s", depth * shift, "", s);
-		utilfdt_print_data(t, sz);
+		print_prop(depth * shift + strlen(s), t, sz);
 		printf(";\n");
 	}
 }
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "dsw:S:" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
 	{"debug",            no_argument, NULL, 'd'},
 	{"scan",             no_argument, NULL, 's'},
+	{"width",	     required_argument, NULL, 'w' },
+	{"shift",	     required_argument, NULL, 'S' },
 	USAGE_COMMON_LONG_OPTS
 };
 static const char * const usage_opts_help[] = {
 	"Dump debug information while decoding the file",
 	"Scan for an embedded fdt in file",
+	"Width of output",
+	"Shift space amount when recursing",
 	USAGE_COMMON_OPTS_HELP
 };
 
@@ -198,6 +285,12 @@ int main(int argc, char *argv[])
 		case 's':
 			scan = true;
 			break;
+		case 'w':
+			width = atoi(optarg);
+			break;
+		case 'S':
+			shift = atoi(optarg);
+			break;
 		}
 	}
 	if (optind != argc - 1)
-- 
2.1.4
