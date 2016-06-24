From: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Implement the -a option to pad dtb aligned
Date: Fri, 24 Jun 2016 19:19:21 +0800
Message-ID: <1466767161-599-1-git-send-email-timwang@asrmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org, Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is one condition that need cat the dtb files
into one dtb.img which can support several boards
use same SoC platform.

And the original dtb file size is not aligned to any base.
This may cause "Synchronous Abort" when load from a unligned
address on some SoC machine, such as ARM.

So this patch implement the -a <aligned number> option to
pad zero at the end of dtb files and make the dtb size aligned
to <aligned number>.

Then, the aligned dtbs can cat together and load without "Synchronous
Abort".

Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
---
 dtc.c      |  9 ++++++++-
 dtc.h      |  1 +
 flattree.c | 10 ++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/dtc.c b/dtc.c
index 5fa23c4..1749d26 100644
--- a/dtc.c
+++ b/dtc.c
@@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int align_size;		/* Additional padding to blob accroding to the align size */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
@@ -53,7 +54,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -64,6 +65,7 @@ static struct option const usage_long_opts[] = {
 	{"reserve",           a_argument, NULL, 'R'},
 	{"space",             a_argument, NULL, 'S'},
 	{"pad",               a_argument, NULL, 'p'},
+	{"align",             a_argument, NULL, 'a'},
 	{"boot-cpu",          a_argument, NULL, 'b'},
 	{"force",            no_argument, NULL, 'f'},
 	{"include",           a_argument, NULL, 'i'},
@@ -91,6 +93,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tMake space for <number> reserve map entries (for dtb and asm output)",
 	"\n\tMake the blob at least <bytes> long (extra space)",
 	"\n\tAdd padding to the blob of <bytes> long (extra space)",
+	"\n\tMake the blob align to the <bytes> (extra space)",
 	"\n\tSet the physical boot cpu",
 	"\n\tTry to produce output even if the input tree has errors",
 	"\n\tAdd a path to search for include files",
@@ -169,6 +172,7 @@ int main(int argc, char *argv[])
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
+	align_size = 0;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -196,6 +200,9 @@ int main(int argc, char *argv[])
 		case 'p':
 			padsize = strtol(optarg, NULL, 0);
 			break;
+		case 'a':
+			align_size = strtol(optarg, NULL, 0);
+			break;
 		case 'f':
 			force = true;
 			break;
diff --git a/dtc.h b/dtc.h
index 56212c8..b406d21 100644
--- a/dtc.h
+++ b/dtc.h
@@ -53,6 +53,7 @@ extern int quiet;		/* Level of quietness */
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int align_size;		/* Additional padding to blob accroding to the align size */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 
 #define PHANDLE_LEGACY	0x1
diff --git a/flattree.c b/flattree.c
index ec14954..733e32e 100644
--- a/flattree.c
+++ b/flattree.c
@@ -413,6 +413,13 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 		fdt.totalsize = cpu_to_fdt32(tsize);
 	}
 
+	if (align_size > 0) {
+		int tsize = fdt32_to_cpu(fdt.totalsize);
+		padlen += (align_size - tsize % align_size);
+		tsize += padlen;
+		fdt.totalsize = cpu_to_fdt32(tsize);
+	}
+
 	/*
 	 * Assemble the blob: start with the header, add with alignment
 	 * the reserve buffer, add the reserve map terminating zeroes,
@@ -572,6 +579,9 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int version)
 	if (padsize > 0) {
 		fprintf(f, "\t.space\t%d, 0\n", padsize);
 	}
+	if (align_size > 0) {
+		fprintf(f, "\t.space\t%d, 0\n", align_size);
+	}
 	emit_label(f, symprefix, "blob_abs_end");
 
 	data_free(strbuf);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
