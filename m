From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Allow dtc to decompile device tre blobs in hexdump format
Date: Sun, 4 Apr 2010 00:22:32 -0400
Message-ID: <20100404042232.GN8865@yookeroo>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

When debugging handoffs between different boot stages which use
flattened device trees to communicate, it's often useful to dump the
device tree blob being passed and use dtc to decompile it to something
readable.  However, with some debugging tools it's possible to perform
a hex memory dump of the device tree, but it's awkward or impossible
to directly dump the memory as a binary blob.

Obviously, it's quite straightforward to write a script or program to
convert the hex dump back to binary, but I'm not aware of a standard
tool to do so.

This patch, therefore, adds a "hex" input format to dtc which allows
it to directly (or almost so) parse and decompile a device tree blob
supplied as a hex dump.  The input dtc expects in this mode must have
no addresses or other extraneous text which could contain valid hex
digits, however it will silently ignore any whitespace, punctuation,
or other non-hex-digit formatting in the dump.  The dump must also
either be either byte-by-byte, or display each hex number as
big-endian (so "od -t x1" will produce suitable output on any system,
but "od -t x2" will produce suitable output only when run on a
big-endian system).

Thus, if addresses and any header/footer are removed (usually easy to
do in an editor), dtc will accept quite a wide range of likely hex
dump formats.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2010-04-04 00:18:34.646981340 -0400
+++ dtc/dtc.c	2010-04-04 00:18:37.282980811 -0400
@@ -62,6 +62,7 @@ static void  __attribute__ ((noreturn)) 
 	fprintf(stderr, "\t\tInput formats are:\n");
 	fprintf(stderr, "\t\t\tdts - device tree source text\n");
 	fprintf(stderr, "\t\t\tdtb - device tree blob\n");
+	fprintf(stderr, "\t\t\thex - device tree blob hexdump\n");
 	fprintf(stderr, "\t\t\tfs - /proc/device-tree style directory\n");
 	fprintf(stderr, "\t-o <output file>\n");
 	fprintf(stderr, "\t-O <output format>\n");
@@ -186,8 +187,10 @@ int main(int argc, char *argv[])
 		bi = dt_from_source(arg);
 	else if (streq(inform, "fs"))
 		bi = dt_from_fs(arg);
-	else if(streq(inform, "dtb"))
+	else if (streq(inform, "dtb"))
 		bi = dt_from_blob(arg);
+	else if (streq(inform, "hex"))
+		bi = dt_from_hex(arg);
 	else
 		die("Unknown input format \"%s\"\n", inform);
 
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-04-04 00:18:34.678980307 -0400
+++ dtc/dtc.h	2010-04-04 00:18:37.282980811 -0400
@@ -231,6 +231,7 @@ void dt_to_blob(FILE *f, struct boot_inf
 void dt_to_asm(FILE *f, struct boot_info *bi, int version);
 
 struct boot_info *dt_from_blob(const char *fname);
+struct boot_info *dt_from_hex(const char *fname);
 
 /* Tree source */
 
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2010-04-04 00:18:34.763002999 -0400
+++ dtc/flattree.c	2010-04-04 00:18:37.287004228 -0400
@@ -799,23 +799,91 @@ static struct node *unflatten_tree(struc
 	return node;
 }
 
+static struct boot_info *__dt_from_blob(void *blob)
+{
+	struct fdt_header *fdt = blob;
+	uint32_t totalsize, version, size_dt, boot_cpuid_phys;
+	uint32_t off_dt, off_str, off_mem_rsvmap;
+	struct inbuf dtbuf, strbuf;
+	struct inbuf memresvbuf;
+	int flags = 0;
+	struct reserve_info *reservelist;
+	struct node *tree;
+	uint32_t val;
+
+	totalsize = fdt32_to_cpu(fdt->totalsize);
+
+	if (totalsize < FDT_V1_SIZE)
+		die("DT blob size (%d) is too small\n", totalsize);
+
+	off_dt = fdt32_to_cpu(fdt->off_dt_struct);
+	off_str = fdt32_to_cpu(fdt->off_dt_strings);
+	off_mem_rsvmap = fdt32_to_cpu(fdt->off_mem_rsvmap);
+	version = fdt32_to_cpu(fdt->version);
+	boot_cpuid_phys = fdt32_to_cpu(fdt->boot_cpuid_phys);
+
+	if (off_mem_rsvmap >= totalsize)
+		die("Mem Reserve structure offset exceeds total size\n");
+
+	if (off_dt >= totalsize)
+		die("DT structure offset exceeds total size\n");
+
+	if (off_str > totalsize)
+		die("String table offset exceeds total size\n");
+
+	if (version >= 3) {
+		uint32_t size_str = fdt32_to_cpu(fdt->size_dt_strings);
+		if (off_str+size_str > totalsize)
+			die("String table extends past total size\n");
+		inbuf_init(&strbuf, (char *)blob + off_str,
+			   (char *)blob + off_str + size_str);
+	} else {
+		inbuf_init(&strbuf, (char *)blob + off_str,
+			   (char *)blob + totalsize);
+	}
+
+	if (version >= 17) {
+		size_dt = fdt32_to_cpu(fdt->size_dt_struct);
+		if (off_dt+size_dt > totalsize)
+			die("Structure block extends past total size\n");
+	}
+
+	if (version < 16) {
+		flags |= FTF_FULLPATH | FTF_NAMEPROPS | FTF_VARALIGN;
+	} else {
+		flags |= FTF_NOPS;
+	}
+
+	inbuf_init(&memresvbuf, (char *)blob + off_mem_rsvmap,
+		   (char *)blob + totalsize);
+	inbuf_init(&dtbuf, (char *)blob + off_dt, (char *)blob + totalsize);
+
+	reservelist = flat_read_mem_reserve(&memresvbuf);
+
+	val = flat_read_word(&dtbuf);
+
+	if (val != FDT_BEGIN_NODE)
+		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
+
+	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
+
+	val = flat_read_word(&dtbuf);
+	if (val != FDT_END)
+		die("Device tree blob doesn't end with FDT_END\n");
+
+	return build_boot_info(reservelist, tree, boot_cpuid_phys);
+}
 
 struct boot_info *dt_from_blob(const char *fname)
 {
 	FILE *f;
-	uint32_t magic, totalsize, version, size_dt, boot_cpuid_phys;
-	uint32_t off_dt, off_str, off_mem_rsvmap;
+	uint32_t magic, totalsize;
 	int rc;
 	char *blob;
 	struct fdt_header *fdt;
 	char *p;
-	struct inbuf dtbuf, strbuf;
-	struct inbuf memresvbuf;
 	int sizeleft;
-	struct reserve_info *reservelist;
-	struct node *tree;
-	uint32_t val;
-	int flags = 0;
+	struct boot_info *bi;
 
 	f = srcfile_relative_open(fname, NULL);
 
@@ -845,9 +913,6 @@ struct boot_info *dt_from_blob(const cha
 	}
 
 	totalsize = fdt32_to_cpu(totalsize);
-	if (totalsize < FDT_V1_SIZE)
-		die("DT blob size (%d) is too small\n", totalsize);
-
 	blob = xmalloc(totalsize);
 
 	fdt = (struct fdt_header *)blob;
@@ -871,62 +936,66 @@ struct boot_info *dt_from_blob(const cha
 		p += rc;
 	}
 
-	off_dt = fdt32_to_cpu(fdt->off_dt_struct);
-	off_str = fdt32_to_cpu(fdt->off_dt_strings);
-	off_mem_rsvmap = fdt32_to_cpu(fdt->off_mem_rsvmap);
-	version = fdt32_to_cpu(fdt->version);
-	boot_cpuid_phys = fdt32_to_cpu(fdt->boot_cpuid_phys);
-
-	if (off_mem_rsvmap >= totalsize)
-		die("Mem Reserve structure offset exceeds total size\n");
-
-	if (off_dt >= totalsize)
-		die("DT structure offset exceeds total size\n");
-
-	if (off_str > totalsize)
-		die("String table offset exceeds total size\n");
-
-	if (version >= 3) {
-		uint32_t size_str = fdt32_to_cpu(fdt->size_dt_strings);
-		if (off_str+size_str > totalsize)
-			die("String table extends past total size\n");
-		inbuf_init(&strbuf, blob + off_str, blob + off_str + size_str);
-	} else {
-		inbuf_init(&strbuf, blob + off_str, blob + totalsize);
-	}
+	fclose(f);
 
-	if (version >= 17) {
-		size_dt = fdt32_to_cpu(fdt->size_dt_struct);
-		if (off_dt+size_dt > totalsize)
-			die("Structure block extends past total size\n");
-	}
+	bi = __dt_from_blob(fdt);
 
-	if (version < 16) {
-		flags |= FTF_FULLPATH | FTF_NAMEPROPS | FTF_VARALIGN;
-	} else {
-		flags |= FTF_NOPS;
-	}
+	free(blob);
 
-	inbuf_init(&memresvbuf,
-		   blob + off_mem_rsvmap, blob + totalsize);
-	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
+	return bi;
+}
 
-	reservelist = flat_read_mem_reserve(&memresvbuf);
+#define BYTE_BUF_SIZE	256
+#define HEX_BUF_SIZE	(2*BYTE_BUF_SIZE)
 
-	val = flat_read_word(&dtbuf);
+struct boot_info *dt_from_hex(const char *fname)
+{
+	FILE *f;
+	char hexbuf[HEX_BUF_SIZE];
+	uint8_t bytebuf[BYTE_BUF_SIZE];
+	char *p;
+	int rc, j = 0;
+	struct data blob = empty_data;
+	struct boot_info *bi;
 
-	if (val != FDT_BEGIN_NODE)
-		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
+	f = srcfile_relative_open(fname, NULL);
 
-	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
+	while (!feof(f)) {
+		rc = fread(hexbuf, 1, HEX_BUF_SIZE, f);
+		if (ferror(f))
+			die("Error reading hexdump file: %s\n", strerror(errno));
 
-	val = flat_read_word(&dtbuf);
-	if (val != FDT_END)
-		die("Device tree blob doesn't end with FDT_END\n");
+		for (p = hexbuf; p < (hexbuf + rc); p++) {
+			uint8_t val;
 
-	free(blob);
+			if ((*p >= '0') && (*p <= '9'))
+				val = *p - '0';
+			else if ((*p >= 'a') && (*p <= 'f'))
+				val = *p - 'a' + 10;
+			else if ((*p >= 'A') && (*p <= 'F'))
+				val = *p - 'A' + 10;
+			else
+				continue; /* Ignore non hex digits */
+
+			if ((j & 1) == 0)
+				bytebuf[j / 2] = val << 4;
+			else
+				bytebuf[j / 2] |= val;
+
+			j++;
+		}
+
+		blob = data_append_data(blob, bytebuf, j / 2);
+
+		if (j & 1)
+			bytebuf[0] = bytebuf[j / 2];
+		j &= 1;
+	}
 
 	fclose(f);
 
-	return build_boot_info(reservelist, tree, boot_cpuid_phys);
+	bi = __dt_from_blob(blob.val);
+	data_free(blob);
+
+	return bi;
 }
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2010-04-04 00:18:35.327003322 -0400
+++ dtc/tests/Makefile.tests	2010-04-04 00:18:37.287004228 -0400
@@ -33,7 +33,7 @@ TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
 TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d trees.d dumptrees.d)
 
-TESTS_CLEANFILES_L =  *.output vglog.* vgcore.* *.dtb *.test.dts *.dtsv1 tmp.*
+TESTS_CLEANFILES_L =  *.output vglog.* vgcore.* *.dtb *.test.dts *.dtsv1 tmp.* *.hex
 TESTS_CLEANFILES_L += dumptrees
 TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-04-04 00:18:35.286995652 -0400
+++ dtc/tests/run_tests.sh	2010-04-04 00:18:37.287004228 -0400
@@ -6,6 +6,16 @@ if [ -z "$CC" ]; then
     CC=gcc
 fi
 
+hexdump_canon() {
+    hexdump -C $1 | cut -c9-61
+}
+
+hexdump_canon_caps() {
+    hexdump_canon $1 | tr 'a-z' 'A-Z'
+}
+
+hexdumpers="hexdump_canon hexdump_canon_caps"
+
 export QUIET_TEST=1
 
 export VALGRIND=
@@ -282,6 +292,14 @@ dtc_tests () {
 	run_dtc_test -I dtb -O dts -o odts_$tree.test.dts $tree
 	run_dtc_test -I dts -O dtb -o odts_$tree.test.dtb odts_$tree.test.dts
 	run_test dtbs_equal_ordered $tree odts_$tree.test.dtb
+
+	for h in $hexdumpers; do
+	    hextree=$tree.$h.test.hex
+	    $h $tree > $hextree
+	    run_dtc_test -I hex -O dts -o odts_$hextree.test.dts $hextree
+	    run_dtc_test -I dts -O dtb -o odts_$hextree.test.dtb odts_$hextree.test.dts
+	    run_test dtbs_equal_ordered $tree odts_$hextree.test.dtb
+    	done
     done
 
     # Check version conversions


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
