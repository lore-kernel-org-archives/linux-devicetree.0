From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/6] Default to bootm_size() when CONFIG_SYS_BOOTMAPSZ is not
	defined
Date: Mon, 28 Mar 2011 13:58:43 -0600
Message-ID: <20110328195839.10235.92568.stgit@ponder>
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

This patch adds a function getenv_bootm_mapsize() for obtaining the
size of the early mapped region accessible by the kernel during early
boot.  It defaults to CONFIG_SYS_BOOTMAPSZ, or if not defined,
defaults to getenv_bootm_size(), which in turn defaults to the size of
RAM.

getenv_bootm_mapsize() can also be overridden with a "bootm_mapsize"
environmental variable.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 README                   |   16 ++++++++++++++--
 arch/powerpc/lib/bootm.c |    2 +-
 common/image.c           |   22 +++++++++++++++++++---
 include/image.h          |    1 +
 4 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/README b/README
index 21cd71b..b8c1833 100644
--- a/README
+++ b/README
@@ -2311,7 +2311,10 @@ Configuration Settings:
 		used) must be put below this limit, unless "bootm_low"
 		enviroment variable is defined and non-zero. In such case
 		all data for the Linux kernel must be between "bootm_low"
-		and "bootm_low" + CONFIG_SYS_BOOTMAPSZ.
+		and "bootm_low" + CONFIG_SYS_BOOTMAPSZ.  The environment
+		variable "bootm_mapsize" will override the value of
+		CONFIG_SYS_BOOTMAPSZ.  If CONFIG_SYS_BOOTMAPSZ is undefined,
+		then the value in "bootm_size" will be used instead.
 
 - CONFIG_SYS_BOOT_RAMDISK_HIGH:
 		Enable initrd_high functionality.  If defined then the
@@ -3147,7 +3150,16 @@ List of environment variables (most likely not complete):
 		  for use by the bootm command. See also "bootm_size"
 		  environment variable. Address defined by "bootm_low" is
 		  also the base of the initial memory mapping for the Linux
-		  kernel -- see the description of CONFIG_SYS_BOOTMAPSZ.
+		  kernel -- see the description of CONFIG_SYS_BOOTMAPSZ and
+		  bootm_mapsize.
+
+  bootm_mapsize	- Size of the initial memory mapping for the Linux kernel.
+		  This variable is given as a hexadecimal number and it
+		  defines the size of the memory region starting at base
+		  address bootm_low that is accessible by the Linux kernel
+		  during early boot.  If unset, CONFIG_SYS_BOOTMAPSZ is used
+		  as the default value if it is defined, and bootm_size is
+		  used otherwise.
 
   bootm_size	- Memory range available for image processing in the bootm
 		  command can be restricted. This variable is given as
diff --git a/arch/powerpc/lib/bootm.c b/arch/powerpc/lib/bootm.c
index 11a574a..1ee4f79 100644
--- a/arch/powerpc/lib/bootm.c
+++ b/arch/powerpc/lib/bootm.c
@@ -95,7 +95,7 @@ static void boot_jump_linux(bootm_headers_t *images)
 		debug ("   Booting using OF flat tree...\n");
 		WATCHDOG_RESET ();
 		(*kernel) ((bd_t *)of_flat_tree, 0, 0, EPAPR_MAGIC,
-			   CONFIG_SYS_BOOTMAPSZ, 0, 0);
+			   getenv_bootm_mapsize(), 0, 0);
 		/* does not return */
 	} else
 #endif
diff --git a/common/image.c b/common/image.c
index c86b86f..a6247d8 100644
--- a/common/image.c
+++ b/common/image.c
@@ -454,6 +454,22 @@ phys_size_t getenv_bootm_size(void)
 #endif
 }
 
+phys_size_t getenv_bootm_mapsize(void)
+{
+	phys_size_t tmp;
+	char *s = getenv ("bootm_mapsize");
+	if (s) {
+		tmp = (phys_size_t)simple_strtoull (s, NULL, 16);
+		return tmp;
+	}
+
+#if defined(CONFIG_SYS_BOOTMAPSZ)
+	return CONFIG_SYS_BOOTMAPSZ;
+#else
+	return getenv_bootm_size();
+#endif
+}
+
 void memmove_wd (void *to, void *from, size_t len, ulong chunksz)
 {
 	if (to == from)
@@ -1207,7 +1223,7 @@ int boot_relocate_fdt (struct lmb *lmb, char **of_flat_tree, ulong *of_size)
 	/* Pad the FDT by a specified amount */
 	of_len = *of_size + CONFIG_SYS_FDT_PAD;
 	of_start = (void *)(unsigned long)lmb_alloc_base(lmb, of_len, 0x1000,
-			CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
+			getenv_bootm_mapsize() + getenv_bootm_low());
 
 	if (of_start == 0) {
 		puts("device tree - allocation error\n");
@@ -1581,7 +1597,7 @@ int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end)
 	char *s;
 
 	cmdline = (char *)(ulong)lmb_alloc_base(lmb, CONFIG_SYS_BARGSIZE, 0xf,
-				     CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
+				getenv_bootm_mapsize() + getenv_bootm_base());
 
 	if (cmdline == NULL)
 		return -1;
@@ -1617,7 +1633,7 @@ int boot_get_cmdline (struct lmb *lmb, ulong *cmd_start, ulong *cmd_end)
 int boot_get_kbd (struct lmb *lmb, bd_t **kbd)
 {
 	*kbd = (bd_t *)(ulong)lmb_alloc_base(lmb, sizeof(bd_t), 0xf,
-				     CONFIG_SYS_BOOTMAPSZ + getenv_bootm_low());
+				getenv_bootm_mapsize() + getenv_bootm_low());
 	if (*kbd == NULL)
 		return -1;
 
diff --git a/include/image.h b/include/image.h
index aa1d7df..b77cb79 100644
--- a/include/image.h
+++ b/include/image.h
@@ -451,6 +451,7 @@ int image_check_dcrc (const image_header_t *hdr);
 int getenv_yesno (char *var);
 ulong getenv_bootm_low(void);
 phys_size_t getenv_bootm_size(void);
+phys_size_t getenv_bootm_mapsize(void);
 void memmove_wd (void *to, void *from, size_t len, ulong chunksz);
 #endif
