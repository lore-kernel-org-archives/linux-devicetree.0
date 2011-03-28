From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/6] Remove device tree booting dependency on
	CONFIG_SYS_BOOTMAPSZ
Date: Mon, 28 Mar 2011 13:58:49 -0600
Message-ID: <20110328195848.10235.55053.stgit@ponder>
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

The previous patch makes u-boot use the full accessible size of ram as
the default boot mapped size if CONFIG_SYS_BOOTMAPSZ is not defined,
which means boot_relocate_fdt() can be changed to depend solely on
CONFIG_OF_LIBFDT.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/powerpc/lib/bootm.c       |    4 ++--
 common/cmd_bootm.c             |    2 +-
 common/image.c                 |    4 ++--
 include/configs/omap3_beagle.h |    7 -------
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/lib/bootm.c b/arch/powerpc/lib/bootm.c
index 1ee4f79..180ee30 100644
--- a/arch/powerpc/lib/bootm.c
+++ b/arch/powerpc/lib/bootm.c
@@ -249,7 +249,7 @@ static int boot_body_linux(bootm_headers_t *images)
 	if (ret)
 		return ret;
 
-#if defined(CONFIG_OF_LIBFDT) && defined(CONFIG_SYS_BOOTMAPSZ)
+#if defined(CONFIG_OF_LIBFDT)
 	ret = boot_relocate_fdt(lmb, of_flat_tree, &of_size);
 	if (ret)
 		return ret;
@@ -288,7 +288,7 @@ static int boot_body_linux(bootm_headers_t *images)
 		if (*initrd_start && *initrd_end)
 			fdt_initrd(*of_flat_tree, *initrd_start, *initrd_end, 1);
 	}
-#endif	/* CONFIG_OF_LIBFDT && CONFIG_SYS_BOOTMAPSZ */
+#endif	/* CONFIG_OF_LIBFDT */
 	return 0;
 }
 
diff --git a/common/cmd_bootm.c b/common/cmd_bootm.c
index a5c275f..8a0a99e 100644
--- a/common/cmd_bootm.c
+++ b/common/cmd_bootm.c
@@ -544,7 +544,7 @@ int do_bootm_subcommand (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
 		}
 			break;
 #endif
-#if defined(CONFIG_OF_LIBFDT) && defined(CONFIG_SYS_BOOTMAPSZ)
+#if defined(CONFIG_OF_LIBFDT)
 		case BOOTM_STATE_FDT:
 		{
 			ret = boot_relocate_fdt(&images.lmb,
diff --git a/common/image.c b/common/image.c
index a6247d8..127eda2 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1202,7 +1202,7 @@ static int fit_check_fdt (const void *fit, int fdt_noffset, int verify)
  *      0 - success
  *      1 - failure
  */
-#if defined(CONFIG_SYS_BOOTMAPSZ)
+#if defined(CONFIG_OF_LIBFDT)
 int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size)
 {
 	void	*fdt_blob = *of_flat_tree;
@@ -1252,7 +1252,7 @@ int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size)
 error:
 	return 1;
 }
-#endif /* CONFIG_SYS_BOOTMAPSZ */
+#endif /* CONFIG_OF_LIBFDT */
 
 /**
  * boot_get_fdt - main fdt handling routine
diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
index 5cfa4cb..a0f6829 100644
--- a/include/configs/omap3_beagle.h
+++ b/include/configs/omap3_beagle.h
@@ -56,13 +56,6 @@
 #define CONFIG_MISC_INIT_R
 
 #define CONFIG_OF_LIBFDT		1
-/*
- * The early kernel mapping on ARM currently only maps from the base of DRAM
- * to the end of the kernel image.  The kernel is loaded at DRAM base + 0x8000.
- * The early kernel pagetable uses DRAM base + 0x4000 to DRAM base + 0x8000,
- * so that leaves DRAM base to DRAM base + 0x4000 available.
- */
-#define CONFIG_SYS_BOOTMAPSZ	        0x4000
 
 #define CONFIG_CMDLINE_TAG		1	/* enable passing of ATAGs */
 #define CONFIG_SETUP_MEMORY_TAGS	1
