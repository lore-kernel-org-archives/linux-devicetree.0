From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] ARM: shmobile: armadillo legacy: Migrate to generic l2c OF initialization
Date: Wed,  4 Feb 2015 15:15:13 +0100
Message-ID: <1423059315-28519-4-git-send-email-geert+renesas@glider.be>
References: <1423059315-28519-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1423059315-28519-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Migrate the generic r8a7740 platform from calling l2x0_of_init() to the
generic l2c OF initialization.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
  - Keep only {,~}L2C_AUX_CTRL_SHARED_OVERRIDE
---
 arch/arm/mach-shmobile/board-armadillo800eva.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-shmobile/board-armadillo800eva.c b/arch/arm/mach-shmobile/board-armadillo800eva.c
index 6d949f1c850bda8b..c3261dc2fc009db5 100644
--- a/arch/arm/mach-shmobile/board-armadillo800eva.c
+++ b/arch/arm/mach-shmobile/board-armadillo800eva.c
@@ -1309,12 +1309,6 @@ static void __init eva_init(void)
 		sdhi1 = &sdhi1_device;
 	}
 
-
-#ifdef CONFIG_CACHE_L2X0
-	/* Shared attribute override enable, 32K*8way */
-	l2x0_init(IOMEM(0xf0002000), 0x00400000, 0xc20f0fff);
-#endif
-
 	i2c_register_board_info(0, i2c0_devices, ARRAY_SIZE(i2c0_devices));
 	i2c_register_board_info(2, i2c2_devices, ARRAY_SIZE(i2c2_devices));
 
@@ -1355,6 +1349,8 @@ static const char *eva_boards_compat_dt[] __initdata = {
 };
 
 DT_MACHINE_START(ARMADILLO800EVA_DT, "armadillo800eva")
+	.l2c_aux_val	= L2C_AUX_CTRL_SHARED_OVERRIDE,
+	.l2c_aux_mask	= ~L2C_AUX_CTRL_SHARED_OVERRIDE,
 	.map_io		= r8a7740_map_io,
 	.init_early	= r8a7740_add_early_devices,
 	.init_irq	= r8a7740_init_irq_of,
-- 
1.9.1

