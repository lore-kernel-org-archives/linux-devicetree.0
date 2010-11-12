From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] dtc: Add command line option to force size alignment of blob.
Date: Fri, 12 Nov 2010 10:02:00 -0800
Message-ID: <1289584920-4703-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds a command line argument to allow the user to request
the that the blob be padded out to modulo <bytes> size.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 Documentation/manual.txt |    3 +++
 dtc.c                    |   10 ++++++++--
 flattree.c               |   20 +++++++++++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index f8a8a7b..c899396 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -117,6 +117,9 @@ Options:
 	Ensure the blob at least <bytes> long, adding additional
 	space if needed.
 
+    -a <bytes>
+        Ensure the blob is modulo <bytes> in length.
+ 
     -v
 	Print DTC version and exit.
 
diff --git a/dtc.c b/dtc.c
index 8b31d20..4e1abd4 100644
--- a/dtc.c
+++ b/dtc.c
@@ -77,6 +77,8 @@ static void  __attribute__ ((noreturn)) usage(void)
 	fprintf(stderr, "\t\tMake the blob at least <bytes> long (extra space)\n");
 	fprintf(stderr, "\t-p <bytes>\n");
 	fprintf(stderr, "\t\tAdd padding to the blob of <bytes> long (extra space)\n");
+	fprintf(stderr, "\t-a <bytes>\n");
+	fprintf(stderr, "\t\t Add padding make the blob modulo <bytes> in size\n");
 	fprintf(stderr, "\t-b <number>\n");
 	fprintf(stderr, "\t\tSet the physical boot cpu\n");
 	fprintf(stderr, "\t-f\n");
@@ -108,8 +110,9 @@ int main(int argc, char *argv[])
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
-
-	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:vH:")) != EOF) {
+	align_size = 0;
+	
+	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:a:fcqb:vH:")) != EOF) {
 		switch (opt) {
 		case 'I':
 			inform = optarg;
@@ -132,6 +135,9 @@ int main(int argc, char *argv[])
 		case 'p':
 			padsize = strtol(optarg, NULL, 0);
 			break;
+		case 'a':
+			alignsize = strtol(optarg, NULL, 0);
+			break;
 		case 'f':
 			force = 1;
 			break;
diff --git a/flattree.c b/flattree.c
index ead0332..e908609 100644
--- a/flattree.c
+++ b/flattree.c
@@ -373,7 +373,8 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	struct data strbuf     = empty_data;
 	struct fdt_header fdt;
 	int padlen = 0;
-
+	int align_len = 0;
+	
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
 			vi = &version_table[i];
@@ -411,6 +412,20 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	}
 
 	/*
+	 * If the user asked for alignment of the end of the blob,
+	 * adjust the totalsize. 
+	 */
+
+	if (align_size > 0)
+		align_len = align_size;
+
+	if (align_len > 0) {
+		int tsize = fdt32_to_cpu(fdt.totalsize);
+		tsize += alignlen;
+		fdt.totalsize = cpu_to_fdt32(tsize);
+	}
+
+	/*
 	 * Assemble the blob: start with the header, add with alignment
 	 * the reserve buffer, add the reserve map terminating zeroes,
 	 * the device tree itself, and finally the strings.
@@ -427,6 +442,9 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	 */
 	if (padlen > 0)
 		blob = data_append_zeroes(blob, padlen);
+	
+	if (align_len > 0)
+		blob = data_append_align(blob, align_len);
 
 	if (fwrite(blob.val, blob.len, 1, f) != 1) {
 		if (ferror(f))
-- 
1.7.2.3
