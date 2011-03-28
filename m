From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 1/6] Stop passing around bootmem_base value.
Date: Mon, 28 Mar 2011 13:58:34 -0600
Message-ID: <20110328195830.10235.46889.stgit@ponder>
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

For the calls to boot_relocate_fdt(), boot_get_cmdline(), and
boot_get_kbd(), the value of bootmem_base is always obtained by
calling getenv_bootm_low().  Since the value always comes from the
same source, the calling signature for those functions can be
simplified by making them call getenv_bootm_low() directly.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/lib/bootm.c     |    3 +--
 arch/m68k/lib/bootm.c    |    7 ++-----
 arch/powerpc/lib/bootm.c |    9 +++------
 common/cmd_bootm.c       |    3 +--
 common/image.c           |   25 +++++++++----------------
 include/image.h          |    8 +++-----
 6 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
index 7734953..aba13f4 100644
--- a/arch/arm/lib/bootm.c
+++ b/arch/arm/lib/bootm.c
@@ -178,7 +178,6 @@ static int bootm_linux_fdt(int machid, bootm_headers_t *images)
 {
 	ulong rd_len;
 	void (*kernel_entry)(int zero, int dt_machid, void *dtblob);
-	ulong bootmap_base = getenv_bootm_low();
 	ulong of_size = images->ft_len;
 	char **of_flat_tree = &images->ft_addr;
 	ulong *initrd_start = &images->initrd_start;
@@ -194,7 +193,7 @@ static int bootm_linux_fdt(int machid, bootm_headers_t *images)
 	if (ret)
 		return ret;
 
-	ret = boot_relocate_fdt(lmb, bootmap_base, of_flat_tree, &of_size);
+	ret = boot_relocate_fdt(lmb, of_flat_tree, &of_size);
 	if (ret)
 		return ret;
 
diff --git a/arch/m68k/lib/bootm.c b/arch/m68k/lib/bootm.c
index 76a2fb2..1229ac7 100644
--- a/arch/m68k/lib/bootm.c
+++ b/arch/m68k/lib/bootm.c
@@ -71,7 +71,6 @@ int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *ima
 	int ret;
 
 	ulong cmd_start, cmd_end;
-	ulong bootmap_base;
 	bd_t  *kbd;
 	void  (*kernel) (bd_t *, ulong, ulong, ulong, ulong);
 	struct lmb *lmb = &images->lmb;
@@ -79,17 +78,15 @@ int do_bootm_linux(int flag, int argc, char * const argv[], bootm_headers_t *ima
 	if ((flag != 0) && (flag != BOOTM_STATE_OS_GO))
 		return 1;
 
-	bootmap_base = getenv_bootm_low();
-
 	/* allocate space and init command line */
-	ret = boot_get_cmdline (lmb, &cmd_start, &cmd_end, bootmap_base);
+	ret = boot_get_cmdline (lmb, &cmd_start, &cmd_end);
 	if (ret) {
 		puts("ERROR with allocation of cmdline\n");
 		goto error;
 	}
 
 	/* allocate space for kernel copy of board info */
-	ret = boot_get_kbd (lmb, &kbd, bootmap_base);
+	ret = boot_get_kbd (lmb, &kbd);
 	if (ret) {
 		puts("ERROR with allocation of kernel bd\n");
 		goto error;
diff --git a/arch/powerpc/lib/bootm.c b/arch/powerpc/lib/bootm.c
index 116d81b..11a574a 100644
--- a/arch/powerpc/lib/bootm.c
+++ b/arch/powerpc/lib/bootm.c
@@ -181,7 +181,6 @@ static void boot_prep_linux(void)
 
 static int boot_cmdline_linux(bootm_headers_t *images)
 {
-	ulong bootmap_base = getenv_bootm_low();
 	ulong of_size = images->ft_len;
 	struct lmb *lmb = &images->lmb;
 	ulong *cmd_start = &images->cmdline_start;
@@ -191,7 +190,7 @@ static int boot_cmdline_linux(bootm_headers_t *images)
 
 	if (!of_size) {
 		/* allocate space and init command line */
-		ret = boot_get_cmdline (lmb, cmd_start, cmd_end, bootmap_base);
+		ret = boot_get_cmdline (lmb, cmd_start, cmd_end);
 		if (ret) {
 			puts("ERROR with allocation of cmdline\n");
 			return ret;
@@ -203,7 +202,6 @@ static int boot_cmdline_linux(bootm_headers_t *images)
 
 static int boot_bd_t_linux(bootm_headers_t *images)
 {
-	ulong bootmap_base = getenv_bootm_low();
 	ulong of_size = images->ft_len;
 	struct lmb *lmb = &images->lmb;
 	bd_t **kbd = &images->kbd;
@@ -212,7 +210,7 @@ static int boot_bd_t_linux(bootm_headers_t *images)
 
 	if (!of_size) {
 		/* allocate space for kernel copy of board info */
-		ret = boot_get_kbd (lmb, kbd, bootmap_base);
+		ret = boot_get_kbd (lmb, kbd);
 		if (ret) {
 			puts("ERROR with allocation of kernel bd\n");
 			return ret;
@@ -230,7 +228,6 @@ static int boot_body_linux(bootm_headers_t *images)
 	ulong *initrd_start = &images->initrd_start;
 	ulong *initrd_end = &images->initrd_end;
 #if defined(CONFIG_OF_LIBFDT)
-	ulong bootmap_base = getenv_bootm_low();
 	ulong of_size = images->ft_len;
 	char **of_flat_tree = &images->ft_addr;
 #endif
@@ -253,7 +250,7 @@ static int boot_body_linux(bootm_headers_t *images)
 		return ret;
 
 #if defined(CONFIG_OF_LIBFDT) && defined(CONFIG_SYS_BOOTMAPSZ)
-	ret = boot_relocate_fdt(lmb, bootmap_base, of_flat_tree, &of_size);
+	ret = boot_relocate_fdt(lmb, of_flat_tree, &of_size);
 	if (ret)
 		return ret;
 
diff --git a/common/cmd_bootm.c b/common/cmd_bootm.c
index 18019d6..a5c275f 100644
--- a/common/cmd_bootm.c
+++ b/common/cmd_bootm.c
@@ -547,8 +547,7 @@ int do_bootm_subcommand (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
 #if defined(CONFIG_OF_LIBFDT) && defined(CONFIG_SYS_BOOTMAPSZ)
 		case BOOTM_STATE_FDT:
 		{
-			ulong bootmap_base = getenv_bootm_low();
-			ret = boot_relocate_fdt(&images.lmb, bootmap_base,
+			ret = boot_relocate_fdt(&images.lmb,
 				&images.ft_addr, &images.ft_len);
 			break;
 		}
diff --git a/common/image.c b/common/image.c
index f63a2ff..c86b86f 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1172,7 +1172,6 @@ static int fit_check_fdt (const void *fit, int fdt_noffset, int verify)
 /**
  * boot_relocate_fdt - relocate flat device tree
  * @lmb: pointer to lmb handle, will be used for memory mgmt
- * @bootmap_base: base address of the bootmap region
  * @of_flat_tree: pointer to a char* variable, will hold fdt start address
  * @of_size: pointer to a ulong variable, will hold fdt length
  *
@@ -1188,8 +1187,7 @@ static int fit_check_fdt (const void *fit, int fdt_noffset, int verify)
  *      1 - failure
  */
 #if defined(CONFIG_SYS_BOOTMAPSZ)
-int boot_relocate_fdt (struct lmb *lmb, ulong bootmap_base,
-		char **of_flat_tree, ulong *of_size)
+int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size)
 {
 	void	*fdt_blob = *of_flat_tree;
 	void	*of_start = 0;
@@ -1209,7 +1207,7 @@ int boot_relocate_fdt (struct lmb *lmb, ulong bootmap_base,
 	/* Pad the FDT by a specified amount */
 	of_len = *of_size + CONFIG_SYS_FDT_PAD;
 	of_start = (void *)(unsigned long)lmb_alloc_base(lmb, of_len, 0x1000,
-			(CONFIG_SYS_BOOTMAPSZ + bootmap_base));
+			CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
 
 	if (of_start == 0) {
 		puts("device tree - allocation error\n");
@@ -1567,11 +1565,9 @@ error:
  * @lmb: pointer to lmb handle, will be used for memory mgmt
  * @cmd_start: pointer to a ulong variable, will hold cmdline start
  * @cmd_end: pointer to a ulong variable, will hold cmdline end
- * @bootmap_base: ulong variable, holds offset in physical memory to
- * base of bootmap
  *
  * boot_get_cmdline() allocates space for kernel command line below
- * BOOTMAPSZ + bootmap_base address. If "bootargs" U-boot environemnt
+ * BOOTMAPSZ + getenv_bootm_low() address. If "bootargs" U-boot environemnt
  * variable is present its contents is copied to allocated kernel
  * command line.
  *
@@ -1579,14 +1575,13 @@ error:
  *      0 - success
  *     -1 - failure
  */
-int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end,
-			ulong bootmap_base)
+int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end)
 {
 	char *cmdline;
 	char *s;
 
 	cmdline = (char *)(ulong)lmb_alloc_base(lmb, CONFIG_SYS_BARGSIZE, 0xf,
-					 CONFIG_SYS_BOOTMAPSZ + bootmap_base);
+				     CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
 
 	if (cmdline == NULL)
 		return -1;
@@ -1610,21 +1605,19 @@ int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end,
  * boot_get_kbd - allocate and initialize kernel copy of board info
  * @lmb: pointer to lmb handle, will be used for memory mgmt
  * @kbd: double pointer to board info data
- * @bootmap_base: ulong variable, holds offset in physical memory to
- * base of bootmap
  *
  * boot_get_kbd() allocates space for kernel copy of board info data below
- * BOOTMAPSZ + bootmap_base address and kernel board info is initialized with
- * the current u-boot board info data.
+ * BOOTMAPSZ + getenv_bootm_low() address and kernel board info is initialized
+ * with the current u-boot board info data.
  *
  * returns:
  *      0 - success
  *     -1 - failure
  */
-int boot_get_kbd (struct lmb *lmb, bd_t **kbd, ulong bootmap_base)
+int boot_get_kbd (struct lmb *lmb, bd_t **kbd)
 {
 	*kbd = (bd_t *)(ulong)lmb_alloc_base(lmb, sizeof(bd_t), 0xf,
-				      CONFIG_SYS_BOOTMAPSZ + bootmap_base);
+				     CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
 	if (*kbd == NULL)
 		return -1;
 
diff --git a/include/image.h b/include/image.h
index 005e0d2..aa1d7df 100644
--- a/include/image.h
+++ b/include/image.h
@@ -336,8 +336,7 @@ int boot_get_ramdisk (int argc, char * const argv[], bootm_headers_t *images,
 #ifdef CONFIG_OF_LIBFDT
 int boot_get_fdt (int flag, int argc, char * const argv[], bootm_headers_t *images,
 		char **of_flat_tree, ulong *of_size);
-int boot_relocate_fdt (struct lmb *lmb, ulong bootmap_base,
-		char **of_flat_tree, ulong *of_size);
+int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size);
 #endif
 
 #ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
@@ -345,11 +344,10 @@ int boot_ramdisk_high (struct lmb *lmb, ulong rd_data, ulong rd_len,
 		  ulong *initrd_start, ulong *initrd_end);
 #endif /* CONFIG_SYS_BOOT_RAMDISK_HIGH */
 #ifdef CONFIG_SYS_BOOT_GET_CMDLINE
-int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end,
-			ulong bootmap_base);
+int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end)
 #endif /* CONFIG_SYS_BOOT_GET_CMDLINE */
 #ifdef CONFIG_SYS_BOOT_GET_KBD
-int boot_get_kbd (struct lmb *lmb, bd_t **kbd, ulong bootmap_base);
+int boot_get_kbd (struct lmb *lmb, bd_t **kbd);
 #endif /* CONFIG_SYS_BOOT_GET_KBD */
 #endif /* !USE_HOSTCC */
