From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 5/6] Respect memreserve regions specified in the device tree
Date: Mon, 28 Mar 2011 13:59:01 -0600
Message-ID: <20110328195900.10235.6524.stgit@ponder>
References: <20110328195231.10235.36716.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110328195231.10235.36716.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

If a regions is reserved in the fdt, then it should not be used.  Add
the memreserve regions to the lmb so that u-boot doesn't use them to
store the initrd.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/lib/bootm.c     |    2 ++
 arch/powerpc/lib/bootm.c |    4 ++++
 common/cmd_bootm.c       |    2 ++
 common/image.c           |   29 ++++++++++++++++++++++++++++-
 include/image.h          |    1 +
 5 files changed, 37 insertions(+), 1 deletions(-)

diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
index aba13f4..802e833 100644
--- a/arch/arm/lib/bootm.c
+++ b/arch/arm/lib/bootm.c
@@ -187,6 +187,8 @@ static int bootm_linux_fdt(int machid, bootm_headers_t *images)
 
 	kernel_entry = (void (*)(int, int, void *))images->ep;
 
+	boot_fdt_add_mem_rsv_regions(lmb, *of_flat_tree);
+
 	rd_len = images->rd_end - images->rd_start;
 	ret = boot_ramdisk_high(lmb, images->rd_start, rd_len,
 				initrd_start, initrd_end);
diff --git a/arch/powerpc/lib/bootm.c b/arch/powerpc/lib/bootm.c
index 180ee30..4744313 100644
--- a/arch/powerpc/lib/bootm.c
+++ b/arch/powerpc/lib/bootm.c
@@ -234,6 +234,10 @@ static int boot_body_linux(bootm_headers_t *images)
 
 	int ret;
 
+#if defined(CONFIG_OF_LIBFDT)
+	boot_fdt_add_mem_rsv_regions(lmb, *of_flat_tree);
+#endif
+
 	/* allocate space and init command line */
 	ret = boot_cmdline_linux(images);
 	if (ret)
diff --git a/common/cmd_bootm.c b/common/cmd_bootm.c
index 8a0a99e..8729852 100644
--- a/common/cmd_bootm.c
+++ b/common/cmd_bootm.c
@@ -547,6 +547,8 @@ int do_bootm_subcommand (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
 #if defined(CONFIG_OF_LIBFDT)
 		case BOOTM_STATE_FDT:
 		{
+			boot_fdt_add_mem_rsv_regions(&images.lmb,
+						     images.ft_addr);
 			ret = boot_relocate_fdt(&images.lmb,
 				&images.ft_addr, &images.ft_len);
 			break;
diff --git a/common/image.c b/common/image.c
index 127eda2..d783808 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1185,6 +1185,34 @@ static int fit_check_fdt (const void *fit, int fdt_noffset, int verify)
 #define CONFIG_SYS_FDT_PAD 0x3000
 #endif
 
+#if defined(CONFIG_OF_LIBFDT)
+/**
+ * boot_fdt_add_mem_rsv_regions - Mark the memreserve sections as unusable
+ * @lmb: pointer to lmb handle, will be used for memory mgmt
+ * @fdt_blob: pointer to fdt blob base address
+ *
+ * Adds the memreserve regions in the dtb to the lmb block.  Adding the
+ * memreserve regions prevents u-boot from using them to store the initrd
+ * or the fdt blob.
+ */
+void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
+{
+	uint64_t addr, size;
+	int i, total;
+
+	if (fdt_check_header (fdt_blob) != 0)
+		return;
+
+	total = fdt_num_mem_rsv(fdt_blob);
+	for (i = 0; i < total; i++) {
+		if (fdt_get_mem_rsv(fdt_blob, i, &addr, &size) != 0)
+			continue;
+		printf("   reserving fdt memory region: addr=%llx size=%llx\n",
+			(unsigned long long)addr, (unsigned long long)size);
+		lmb_reserve(lmb, addr, size);
+	}
+}
+
 /**
  * boot_relocate_fdt - relocate flat device tree
  * @lmb: pointer to lmb handle, will be used for memory mgmt
@@ -1202,7 +1230,6 @@ static int fit_check_fdt (const void *fit, int fdt_noffset, int verify)
  *      0 - success
  *      1 - failure
  */
-#if defined(CONFIG_OF_LIBFDT)
 int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size)
 {
 	void	*fdt_blob = *of_flat_tree;
diff --git a/include/image.h b/include/image.h
index b77cb79..43e6ab6 100644
--- a/include/image.h
+++ b/include/image.h
@@ -336,6 +336,7 @@ int boot_get_ramdisk (int argc, char * const argv[], bootm_headers_t *images,
 #ifdef CONFIG_OF_LIBFDT
 int boot_get_fdt (int flag, int argc, char * const argv[], bootm_headers_t *images,
 		char **of_flat_tree, ulong *of_size);
+void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob);
 int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size);
 #endif
