From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 19/22] ARM: shmobile: rcar-gen2: Stop passing mode pins state to clock driver
Date: Wed,  1 Jun 2016 21:21:17 +0200
Message-ID: <1464808880-343-20-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Now the R-Car Gen2 CPG clock driver obtains the state of the mode pins
from the R-Car RST driver, there's no longer a need to pass this state
explicitly. Hence we can just call of_clk_init() instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop "select MFD_SYSCON", as the clock driver no longer uses syscon,

v2:
  - Kill compiler warning if CONFIG_ARM_ARCH_TIMER is not enabled.
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 1c6fd11c2f824019..755ce7a940c11848 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk/renesas.h>
+#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/device.h>
 #include <linux/dma-contiguous.h>
@@ -51,8 +51,8 @@ u32 rcar_gen2_read_mode_pins(void)
 
 void __init rcar_gen2_timer_init(void)
 {
-	u32 mode = rcar_gen2_read_mode_pins();
 #ifdef CONFIG_ARM_ARCH_TIMER
+	u32 mode = rcar_gen2_read_mode_pins();
 	void __iomem *base;
 	int extal_mhz = 0;
 	u32 freq;
@@ -127,7 +127,7 @@ void __init rcar_gen2_timer_init(void)
 	iounmap(base);
 #endif /* CONFIG_ARM_ARCH_TIMER */
 
-	rcar_gen2_clocks_init(mode);
+	of_clk_init(NULL);
 	clocksource_probe();
 }
 
-- 
1.9.1
