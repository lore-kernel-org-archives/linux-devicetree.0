From: John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 2/3] ARM: WIP: add flat device tree support
Date: Wed, 28 Jul 2010 15:59:54 -0600
Message-ID: <1280354395-9128-3-git-send-email-john.rigby@linaro.org>
References: <1280354395-9128-1-git-send-email-john.rigby@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1280354395-9128-1-git-send-email-john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/include/asm/config.h |    1 +
 arch/arm/lib/bootm.c          |  128 ++++++++++++++++++++++++++++++++++++++++-
 common/cmd_bootm.c            |    5 +-
 common/image.c                |    7 ++-
 include/image.h               |    2 +-
 5 files changed, 138 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/config.h b/arch/arm/include/asm/config.h
index b76fd8e..9bca5bc 100644
--- a/arch/arm/include/asm/config.h
+++ b/arch/arm/include/asm/config.h
@@ -23,5 +23,6 @@
 
 /* Relocation to SDRAM works on all ARM boards */
 #define CONFIG_RELOC_FIXUP_WORKS
+#define CONFIG_LMB
 
 #endif
diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
index 3101321..e45d974 100644
--- a/arch/arm/lib/bootm.c
+++ b/arch/arm/lib/bootm.c
@@ -27,6 +27,12 @@
 #include <u-boot/zlib.h>
 #include <asm/byteorder.h>
 
+#if defined(CONFIG_OF_LIBFDT)
+#include <fdt.h>
+#include <libfdt.h>
+#include <fdt_support.h>
+#endif
+
 DECLARE_GLOBAL_DATA_PTR;
 
 #if defined (CONFIG_SETUP_MEMORY_TAGS) || \
@@ -50,7 +56,34 @@ static void setup_end_tag (bd_t *bd);
 static struct tag *params;
 #endif /* CONFIG_SETUP_MEMORY_TAGS || CONFIG_CMDLINE_TAG || CONFIG_INITRD_TAG */
 
-int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *images)
+static ulong get_sp(void);
+#if defined(CONFIG_OF_LIBFDT)
+static int bootm_linux_fdt(bootm_headers_t *images);
+#endif
+
+void arch_lmb_reserve(struct lmb *lmb)
+{
+	ulong sp;
+
+	/*
+	 * Booting a (Linux) kernel image
+	 *
+	 * Allocate space for command line and board info - the
+	 * address should be as high as possible within the reach of
+	 * the kernel (see CONFIG_SYS_BOOTMAPSZ settings), but in unused
+	 * memory, which means far enough below the current stack
+	 * pointer.
+	 */
+	sp = get_sp();
+	debug("## Current stack ends at 0x%08lx ", sp);
+
+	/* adjust sp by 1K to be safe */
+	sp -= 1024;
+	lmb_reserve(lmb, sp,
+		    gd->bd->bi_dram[0].start + gd->bd->bi_dram[0].size - sp);
+}
+
+int do_bootm_linux(int flag, int argc, char *argv[], bootm_headers_t *images)
 {
 	bd_t	*bd = gd->bd;
 	char	*s;
@@ -64,6 +97,11 @@ int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *ima
 	if ((flag != 0) && (flag != BOOTM_STATE_OS_GO))
 		return 1;
 
+#ifdef CONFIG_OF_LIBFDT
+	if (images->ft_len)
+		return bootm_linux_fdt(images);
+#endif
+
 	theKernel = (void (*)(int, int, uint))images->ep;
 
 	s = getenv ("machid");
@@ -99,7 +137,7 @@ int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *ima
 	if (images->rd_start && images->rd_end)
 		setup_initrd_tag (bd, images->rd_start, images->rd_end);
 #endif
-	setup_end_tag (bd);
+	setup_end_tag(bd);
 #endif
 
 	/* we assume that the kernel is in place */
@@ -120,6 +158,84 @@ int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *ima
 	return 1;
 }
 
+#if defined(CONFIG_OF_LIBFDT)
+static int fixup_memory_node(void *blob)
+{
+	bd_t	*bd = gd->bd;
+	int bank;
+	u64 start[CONFIG_NR_DRAM_BANKS];
+	u64 size[CONFIG_NR_DRAM_BANKS];
+
+	for (bank = 0; bank < CONFIG_NR_DRAM_BANKS; bank++) {
+		start[bank] = bd->bi_dram[bank].start;
+		size[bank] = bd->bi_dram[bank].size;
+	}
+
+	return fdt_fixup_memory_banks(blob, start, size, CONFIG_NR_DRAM_BANKS);
+}
+
+static int bootm_linux_fdt(bootm_headers_t *images)
+{
+	ulong rd_len;
+	bd_t *bd = gd->bd;
+	char *s;
+	int machid = bd->bi_arch_number;
+	void (*theKernel)(int zero, int dt_machid, void *dtblob);
+	ulong bootmap_base = getenv_bootm_low();
+	ulong of_size = images->ft_len;
+	char **of_flat_tree = &images->ft_addr;
+	ulong *initrd_start = &images->initrd_start;
+	ulong *initrd_end = &images->initrd_end;
+	struct lmb *lmb = &images->lmb;
+	int ret;
+
+	theKernel = (void (*)(int, int, void *))images->ep;
+
+	s = getenv("machid");
+	if (s) {
+		machid = simple_strtoul(s, NULL, 16);
+		printf("Using machid 0x%x from environment\n", machid);
+	}
+
+	show_boot_progress(15);
+
+	rd_len = images->rd_end - images->rd_start;
+	ret = boot_ramdisk_high(lmb, images->rd_start, rd_len,
+				initrd_start, initrd_end);
+	if (ret)
+		return ret;
+
+	ret = boot_relocate_fdt(lmb, bootmap_base, of_flat_tree, &of_size);
+	if (ret)
+		return ret;
+
+	debug("## Transferring control to Linux (at address %08lx) ...\n",
+	       (ulong) theKernel);
+
+	fdt_chosen(*of_flat_tree, 1);
+
+	fixup_memory_node(*of_flat_tree);
+
+	fdt_initrd(*of_flat_tree, *initrd_start, *initrd_end, 1);
+
+	/* we assume that the kernel is in place */
+	printf("\nStarting kernel ...\n\n");
+
+#ifdef CONFIG_USB_DEVICE
+	{
+		extern void udc_disconnect(void);
+		udc_disconnect();
+	}
+#endif
+
+	cleanup_before_linux();
+
+	theKernel(0, machid, *of_flat_tree);
+	/* does not return */
+
+	return 1;
+}
+#endif
 
 #if defined (CONFIG_SETUP_MEMORY_TAGS) || \
     defined (CONFIG_CMDLINE_TAG) || \
@@ -239,4 +355,12 @@ static void setup_end_tag (bd_t *bd)
 	params->hdr.size = 0;
 }
 
+static ulong get_sp(void)
+{
+	ulong ret;
+
+	asm("mov %0, sp" : "=r"(ret) : );
+	return ret;
+}
+
 #endif /* CONFIG_SETUP_MEMORY_TAGS || CONFIG_CMDLINE_TAG || CONFIG_INITRD_TAG */
diff --git a/common/cmd_bootm.c b/common/cmd_bootm.c
index adfa6cd..6519321 100644
--- a/common/cmd_bootm.c
+++ b/common/cmd_bootm.c
@@ -301,7 +301,10 @@ static int bootm_start(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
 		}
 
 #if defined(CONFIG_OF_LIBFDT)
-#if defined(CONFIG_PPC) || defined(CONFIG_M68K) || defined(CONFIG_SPARC)
+#if defined(CONFIG_PPC) || \
+    defined(CONFIG_M68K) || \
+    defined(CONFIG_SPARC) || \
+    defined(CONFIG_ARM)
 		/* find flattened device tree */
 		ret = boot_get_fdt (flag, argc, argv, &images,
 				    &images.ft_addr, &images.ft_len);
diff --git a/common/image.c b/common/image.c
index 6d8833e..6da38aa 100644
--- a/common/image.c
+++ b/common/image.c
@@ -985,7 +985,10 @@ int boot_get_ramdisk (int argc, char * const argv[], bootm_headers_t *images,
 	return 0;
 }
 
-#if defined(CONFIG_PPC) || defined(CONFIG_M68K) || defined(CONFIG_SPARC)
+#if defined(CONFIG_PPC) || \
+    defined(CONFIG_M68K) || \
+    defined(CONFIG_SPARC) || \
+    defined(CONFIG_ARM)
 /**
  * boot_ramdisk_high - relocate init ramdisk
  * @lmb: pointer to lmb handle, will be used for memory mgmt
@@ -1206,9 +1209,11 @@ int boot_relocate_fdt (struct lmb *lmb, ulong bootmap_base,
 	if (fdt_blob < (char *)bootmap_base)
 		relocate = 1;
 
+#ifdef CONFIG_SYS_BOOTMAPSZ
 	if ((fdt_blob + *of_size + CONFIG_SYS_FDT_PAD) >=
 			((char *)CONFIG_SYS_BOOTMAPSZ + bootmap_base))
 		relocate = 1;
+#endif
 
 	/* move flattend device tree if needed */
 	if (relocate) {
diff --git a/include/image.h b/include/image.h
index bcc08d1..8f06cdc 100644
--- a/include/image.h
+++ b/include/image.h
@@ -339,7 +339,7 @@ int boot_relocate_fdt (struct lmb *lmb, ulong bootmap_base,
 		char **of_flat_tree, ulong *of_size);
 #endif
 
-#if defined(CONFIG_PPC) || defined(CONFIG_M68K)
+#if defined(CONFIG_PPC) || defined(CONFIG_M68K) || defined(CONFIG_ARM)
 int boot_ramdisk_high (struct lmb *lmb, ulong rd_data, ulong rd_len,
 		  ulong *initrd_start, ulong *initrd_end);
 
-- 
1.7.0.4
