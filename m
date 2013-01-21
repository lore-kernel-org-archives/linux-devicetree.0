From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 7/8] Remove fdtdump and use fdtgrep instead
Date: Mon, 21 Jan 2013 12:59:21 -0800
Message-ID: <1358801962-21707-8-git-send-email-sjg@chromium.org>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since fdtgrep does everything that fdtdump does now, perhaps we should
replace it with a symlink.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 Makefile  |    5 +-
 fdtdump.c |  137 -------------------------------------------------------------
 fdtgrep.c |   40 ++++++++++++------
 3 files changed, 30 insertions(+), 152 deletions(-)
 delete mode 100644 fdtdump.c

diff --git a/Makefile b/Makefile
index 96e0488..339b83c 100644
--- a/Makefile
+++ b/Makefile
@@ -122,7 +122,6 @@ all: $(BIN) libfdt
 ifneq ($(DEPTARGETS),)
 -include $(DTC_OBJS:%.o=%.d)
 -include $(CONVERT_OBJS:%.o=%.d)
--include $(FDTDUMP_OBJS:%.o=%.d)
 -include $(FDTGET_OBJS:%.o=%.d)
 -include $(FDTPUT_OBJS:%.o=%.d)
 -include $(FDTGREP_OBJS:%.o=%.d)
@@ -184,7 +183,9 @@ convert-dtsv0: $(CONVERT_OBJS)
 	@$(VECHO) LD $@
 	$(LINK.c) -o $@ $^
 
-fdtdump:	$(FDTDUMP_OBJS)
+fdtdump:	fdtgrep
+	rm -f $@
+	ln -s $< $@
 
 fdtget:	$(FDTGET_OBJS) $(LIBFDT_archive)
 
diff --git a/fdtdump.c b/fdtdump.c
deleted file mode 100644
index 03ea429..0000000
--- a/fdtdump.c
+++ /dev/null
@@ -1,137 +0,0 @@
-/*
- * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
- */
-
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <ctype.h>
-
-#include <libfdt_env.h>
-#include <fdt.h>
-
-#include "util.h"
-
-#define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
-#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
-#define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
-
-static void dump_blob(void *blob)
-{
-	struct fdt_header *bph = blob;
-	uint32_t off_mem_rsvmap = fdt32_to_cpu(bph->off_mem_rsvmap);
-	uint32_t off_dt = fdt32_to_cpu(bph->off_dt_struct);
-	uint32_t off_str = fdt32_to_cpu(bph->off_dt_strings);
-	struct fdt_reserve_entry *p_rsvmap =
-		(struct fdt_reserve_entry *)((char *)blob + off_mem_rsvmap);
-	const char *p_struct = (const char *)blob + off_dt;
-	const char *p_strings = (const char *)blob + off_str;
-	uint32_t version = fdt32_to_cpu(bph->version);
-	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag;
-	const char *p, *s, *t;
-	int depth, sz, shift;
-	int i;
-	uint64_t addr, size;
-
-	depth = 0;
-	shift = 4;
-
-	printf("/dts-v1/;\n");
-	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
-	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
-	printf("// off_dt_struct:\t0x%x\n", off_dt);
-	printf("// off_dt_strings:\t0x%x\n", off_str);
-	printf("// off_mem_rsvmap:\t0x%x\n", off_mem_rsvmap);
-	printf("// version:\t\t%d\n", version);
-	printf("// last_comp_version:\t%d\n",
-	       fdt32_to_cpu(bph->last_comp_version));
-	if (version >= 2)
-		printf("// boot_cpuid_phys:\t0x%x\n",
-		       fdt32_to_cpu(bph->boot_cpuid_phys));
-
-	if (version >= 3)
-		printf("// size_dt_strings:\t0x%x\n",
-		       fdt32_to_cpu(bph->size_dt_strings));
-	if (version >= 17)
-		printf("// size_dt_struct:\t0x%x\n",
-		       fdt32_to_cpu(bph->size_dt_struct));
-	printf("\n");
-
-	for (i = 0; ; i++) {
-		addr = fdt64_to_cpu(p_rsvmap[i].address);
-		size = fdt64_to_cpu(p_rsvmap[i].size);
-		if (addr == 0 && size == 0)
-			break;
-
-		printf("/memreserve/ %llx %llx;\n",
-		       (unsigned long long)addr, (unsigned long long)size);
-	}
-
-	p = p_struct;
-	while ((tag = fdt32_to_cpu(GET_CELL(p))) != FDT_END) {
-
-		/* printf("tag: 0x%08x (%d)\n", tag, p - p_struct); */
-
-		if (tag == FDT_BEGIN_NODE) {
-			s = p;
-			p = PALIGN(p + strlen(s) + 1, 4);
-
-			if (*s == '\0')
-				s = "/";
-
-			printf("%*s%s {\n", depth * shift, "", s);
-
-			depth++;
-			continue;
-		}
-
-		if (tag == FDT_END_NODE) {
-			depth--;
-
-			printf("%*s};\n", depth * shift, "");
-			continue;
-		}
-
-		if (tag == FDT_NOP) {
-			printf("%*s// [NOP]\n", depth * shift, "");
-			continue;
-		}
-
-		if (tag != FDT_PROP) {
-			fprintf(stderr, "%*s ** Unknown tag 0x%08x\n", depth * shift, "", tag);
-			break;
-		}
-		sz = fdt32_to_cpu(GET_CELL(p));
-		s = p_strings + fdt32_to_cpu(GET_CELL(p));
-		if (version < 16 && sz >= 8)
-			p = PALIGN(p, 8);
-		t = p;
-
-		p = PALIGN(p + sz, 4);
-
-		printf("%*s%s", depth * shift, "", s);
-		utilfdt_print_data(t, sz);
-		printf(";\n");
-	}
-}
-
-
-int main(int argc, char *argv[])
-{
-	char *buf;
-
-	if (argc < 2) {
-		fprintf(stderr, "supply input filename\n");
-		return 5;
-	}
-
-	buf = utilfdt_read(argv[1]);
-	if (buf)
-		dump_blob(buf);
-	else
-		return 10;
-
-	return 0;
-}
diff --git a/fdtgrep.c b/fdtgrep.c
index bb08f12..3169e29 100644
--- a/fdtgrep.c
+++ b/fdtgrep.c
@@ -726,28 +726,42 @@ int main(int argc, char *argv[])
 {
 	char *filename = NULL;
 	struct display_info disp;
+	const char *name;
 	int ret;
 
 	/* set defaults */
 	memset(&disp, '\0', sizeof(disp));
 	disp.flags = FDT_REG_SUPERNODES;	/* Default flags */
 
-	scan_args(&disp, argc, argv);
+	/* For fdtdump, use default args */
+	name = strrchr(argv[0], '/');
+	if (!strcmp(name ? name + 1 : argv[0], "fdtdump")) {
+		disp.show_dts_version = 1;
+		disp.header = 1;
+		disp.flags |= FDT_REG_ADD_MEM_RSVMAP;
+		if (argc < 2) {
+			fprintf(stderr, "supply input filename\n");
+			return 5;
+		}
+		filename = argv[1];
+	} else {
+		scan_args(&disp, argc, argv);
 
-	/* Show matched lines in colour if we can */
-	disp.colour = disp.all && isatty(0);
+		/* Show matched lines in colour if we can */
+		disp.colour = disp.all && isatty(0);
 
-	/* Any additional arguments can match anything, just like -g */
-	while (optind < argc - 1) {
-		if (value_add(&disp, &disp.value_head, FDT_IS_ANY, 1,
-				argv[optind++]))
-			usage("Cannot add value");
-	}
+		/* Any additional arguments can match anything, just like -g */
+		while (optind < argc - 1) {
+			if (value_add(&disp, &disp.value_head, FDT_IS_ANY, 1,
+					argv[optind++]))
+				usage("Cannot add value");
+		}
 
-	if (optind < argc)
-		filename = argv[optind++];
-	if (!filename)
-		usage("Missing filename");
+		if (optind < argc)
+			filename = argv[optind++];
+		if (!filename)
+			usage("Missing filename");
+	}
 
 	/* If a valid .dtb is required, set flags to ensure we get one */
 	if (disp.output == OUT_DTB) {
-- 
1.7.7.3
