From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 17/22] ARM: shmobile: r8a7778: Stop passing mode pins state to clock driver
Date: Wed,  1 Jun 2016 21:21:15 +0200
Message-ID: <1464808880-343-18-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Now the R-Car M1A CPG clock driver obtains the state of the mode pins
from the R-Car RST driver, there's no longer a need to pass this state
explicitly. Hence we can just remove the .init_time() callback, the
generic ARM code will take care of calling of_clk_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 arch/arm/mach-shmobile/setup-r8a7778.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
index cf236db686a9dd47..7fa4a0b5f6549287 100644
--- a/arch/arm/mach-shmobile/setup-r8a7778.c
+++ b/arch/arm/mach-shmobile/setup-r8a7778.c
@@ -15,7 +15,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk/renesas.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 
@@ -23,19 +22,6 @@
 
 #include "common.h"
 
-#define MODEMR 0xffcc0020
-
-static void __init r8a7778_timer_init(void)
-{
-	u32 mode;
-	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-
-	BUG_ON(!modemr);
-	mode = ioread32(modemr);
-	iounmap(modemr);
-	r8a7778_clocks_init(mode);
-}
-
 #define INT2SMSKCR0	0x82288 /* 0xfe782288 */
 #define INT2SMSKCR1	0x8228c /* 0xfe78228c */
 
@@ -70,6 +56,5 @@ DT_MACHINE_START(R8A7778_DT, "Generic R8A7778 (Flattened Device Tree)")
 	.init_early	= shmobile_init_delay,
 	.init_irq	= r8a7778_init_irq_dt,
 	.init_late	= shmobile_init_late,
-	.init_time	= r8a7778_timer_init,
 	.dt_compat	= r8a7778_compat_dt,
 MACHINE_END
-- 
1.9.1
