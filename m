From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 03/12] ARM: davinci: enable the clocksource driver for DT mode
Date: Mon,  4 Feb 2019 18:17:48 +0100
Message-ID: <20190204171757.32073-4-brgl@bgdev.pl>
References: <20190204171757.32073-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Switch all davinci boards using device tree to using the new
clocksource driver: remove the previous OF_TIMER_DECLARE() from
mach-davinci and select davinci-timer to be built for
davinci_all_defconfig.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/Kconfig             |  1 +
 arch/arm/mach-davinci/time.c | 14 --------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 664e918e2624..8a09a0ab0ce2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -586,6 +586,7 @@ config ARCH_DAVINCI
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select COMMON_CLK
 	select CPU_ARM926T
+	select DAVINCI_TIMER
 	select GENERIC_ALLOCATOR
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-davinci/time.c b/arch/arm/mach-davinci/time.c
index 5a6de5368ab0..740410a3bb6a 100644
--- a/arch/arm/mach-davinci/time.c
+++ b/arch/arm/mach-davinci/time.c
@@ -398,17 +398,3 @@ void __init davinci_timer_init(struct clk *timer_clk)
 	for (i=0; i< ARRAY_SIZE(timers); i++)
 		timer32_config(&timers[i]);
 }
-
-static int __init of_davinci_timer_init(struct device_node *np)
-{
-	struct clk *clk;
-
-	clk = of_clk_get(np, 0);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	davinci_timer_init(clk);
-
-	return 0;
-}
-TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_init);
-- 
2.20.1
