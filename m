From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 02/23] ARM: u300: enabled delaytimer on the U300
Date: Mon, 22 Apr 2013 11:51:33 +0200
Message-ID: <1366624293-6156-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

The U300 can support timer-based delays, so implement this.
Skips past jiffy calibration.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-u300/timer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-u300/timer.c b/arch/arm/mach-u300/timer.c
index d9e7320..c3d3802 100644
--- a/arch/arm/mach-u300/timer.c
+++ b/arch/arm/mach-u300/timer.c
@@ -18,6 +18,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/irq.h>
+#include <linux/delay.h>
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
@@ -345,6 +346,12 @@ static u32 notrace u300_read_sched_clock(void)
 	return readl(U300_TIMER_APP_VBASE + U300_TIMER_APP_GPT2CC);
 }
 
+static unsigned long u300_read_current_timer(void)
+{
+	return readl(U300_TIMER_APP_VBASE + U300_TIMER_APP_GPT2CC);
+}
+
+static struct delay_timer u300_delay_timer;
 
 /*
  * This sets up the system timers, clock source and clock event.
@@ -362,6 +369,10 @@ void __init u300_timer_init(void)
 
 	setup_sched_clock(u300_read_sched_clock, 32, rate);
 
+	u300_delay_timer.read_current_timer = &u300_read_current_timer;
+	u300_delay_timer.freq = rate;
+	register_current_timer_delay(&u300_delay_timer);
+
 	/*
 	 * Disable the "OS" and "DD" timers - these are designed for Symbian!
 	 * Example usage in cnh1601578 cpu subsystem pd_timer_app.c
-- 
1.7.11.3
