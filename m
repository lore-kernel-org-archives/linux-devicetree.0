From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Thu, 11 Nov 2010 16:03:49 -0800
Message-ID: <a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch forces the size of the DTB to be modulo 32 bytes. This is
needed to support linking multiple DTB's into a single section in the
image. GCC wants structures to be 32 byte aligned without this change
DTB's after the first in the section may not be properly aligned so
the flat tree parsing code will fall over.

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 scripts/dtc/flattree.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
index 76acd28..ccca797 100644
--- a/scripts/dtc/flattree.c
+++ b/scripts/dtc/flattree.c
@@ -358,6 +358,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	struct data strbuf     = empty_data;
 	struct fdt_header fdt;
 	int padlen = 0;
+	int align_size;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -395,6 +396,9 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 		fdt.totalsize = cpu_to_fdt32(tsize);
 	}
 
+	align_size = ALIGN(fdt32_to_cpu(fdt.totalsize), 32);
+	fdt.totalsize = cpu_to_fdt32(align_size);
+
 	/*
 	 * Assemble the blob: start with the header, add with alignment
 	 * the reserve buffer, add the reserve map terminating zeroes,
@@ -412,7 +416,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	 */
 	if (padlen > 0)
 		blob = data_append_zeroes(blob, padlen);
-
+	blob = data_append_align(blob, 32);
 	fwrite(blob.val, blob.len, 1, f);
 
 	if (ferror(f))
-- 
1.7.2.3
