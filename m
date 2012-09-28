From: Simon Glass <sjg@chromium.org>
Subject: [PATCH] arm: fdt: Relocate fdt along with other data
Date: Thu, 27 Sep 2012 18:41:55 -0700
Message-ID: <1348796515-29008-1-git-send-email-sjg@chromium.org>
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

Rather than leave the fdt down next to the code/data, we really should
relocate it along with everything else. For CONFIG_OF_EMBED this happens
automatically, but for CONFIG_OF_SEPARATE it does not.

Add code to copy the fdt and point to the new copy after relocation.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/lib/board.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/arch/arm/lib/board.c b/arch/arm/lib/board.c
index 109a1ac..6dca891 100644
--- a/arch/arm/lib/board.c
+++ b/arch/arm/lib/board.c
@@ -274,6 +274,8 @@ void board_init_f(ulong bootflag)
 #ifdef CONFIG_PRAM
 	ulong reg;
 #endif
+	void *new_fdt = NULL;
+	size_t fdt_size = 0;
 
 	bootstage_mark_name(BOOTSTAGE_ID_START_UBOOT_F, "board_init_f");
 
@@ -409,6 +411,22 @@ void board_init_f(ulong bootflag)
 	debug("Reserving %zu Bytes for Global Data at: %08lx\n",
 			sizeof (gd_t), addr_sp);
 
+#if defined(CONFIG_OF_SEPARATE) && defined(CONFIG_OF_CONTROL)
+	/*
+	 * If the device tree is sitting immediate above our image then we
+	 * must relocate it. If it is embedded in the data section, then it
+	 * will be relocated with other data.
+	 */
+	if (gd->fdt_blob) {
+		fdt_size = ALIGN(fdt_totalsize(gd->fdt_blob) + 0x1000, 32);
+
+		addr_sp -= fdt_size;
+		new_fdt = (void *)addr_sp;
+		debug("Reserving %zu Bytes for FDT at: %08lx\n",
+		      fdt_size, addr_sp);
+	}
+#endif
+
 	/* setup stackpointer for exeptions */
 	gd->irq_sp = addr_sp;
 #ifdef CONFIG_USE_IRQ
@@ -442,6 +460,10 @@ void board_init_f(ulong bootflag)
 	gd->start_addr_sp = addr_sp;
 	gd->reloc_off = addr - _TEXT_BASE;
 	debug("relocation Offset is: %08lx\n", gd->reloc_off);
+	if (new_fdt) {
+		memcpy(new_fdt, gd->fdt_blob, fdt_size);
+		gd->fdt_blob = new_fdt;
+	}
 	memcpy(id, (void *)gd, sizeof(gd_t));
 
 	relocate_code(addr_sp, id, addr);
-- 
1.7.7.3
