From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 1/8] sandbox: fdt: Add support for
	CONFIG_OF_CONTROL
Date: Sun, 22 Jan 2012 22:48:46 -0800
Message-ID: <1327301333-30776-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

This adds support for a controlling fdt, mirroring the ARM implementation.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v3:
- Use #if defined()..#elif defined, instead of #ifdef..#elif defined

 arch/sandbox/include/asm/global_data.h |    1 +
 arch/sandbox/lib/board.c               |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/sandbox/include/asm/global_data.h b/arch/sandbox/include/asm/global_data.h
index 8d47191..01a7063 100644
--- a/arch/sandbox/include/asm/global_data.h
+++ b/arch/sandbox/include/asm/global_data.h
@@ -45,6 +45,7 @@ typedef	struct global_data {
 	unsigned long	fb_base;	/* base address of frame buffer */
 	u8		*ram_buf;	/* emulated RAM buffer */
 	phys_size_t	ram_size;	/* RAM size */
+	const void	*fdt_blob;	/* Our device tree, NULL if none */
 	void		**jt;		/* jump table */
 	char		env_buf[32];	/* buffer for getenv() before reloc. */
 } gd_t;
diff --git a/arch/sandbox/lib/board.c b/arch/sandbox/lib/board.c
index b7997e9..6d464d6 100644
--- a/arch/sandbox/lib/board.c
+++ b/arch/sandbox/lib/board.c
@@ -156,6 +156,14 @@ void board_init_f(ulong bootflag)
 
 	memset((void *)gd, 0, sizeof(gd_t));
 
+#if defined(CONFIG_OF_EMBED)
+	/* Get a pointer to the FDT */
+	gd->fdt_blob = _binary_dt_dtb_start;
+#elif defined(CONFIG_OF_SEPARATE)
+	/* FDT is at end of image */
+	gd->fdt_blob = (void *)(_end_ofs + _TEXT_BASE);
+#endif
+
 	for (init_fnc_ptr = init_sequence; *init_fnc_ptr; ++init_fnc_ptr) {
 		if ((*init_fnc_ptr)() != 0)
 			hang();
-- 
1.7.7.3
