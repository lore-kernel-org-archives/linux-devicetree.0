From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 06/17] ARM: davinci: dm355: WARN() if clk_get() fails
Date: Fri, 11 Jan 2019 18:21:23 +0100
Message-ID: <20190111172134.30147-7-brgl@bgdev.pl>
References: <20190111172134.30147-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111172134.30147-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently the timer code checks if the clock pointer passed to it is
good (!IS_ERR(clk)). The new clocksource driver expects the clock to
be functional and doesn't perform any checks so emit a warning if
clk_get() fails.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/dm355.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index 4c6e0bef4509..07ad9d6c9cae 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -745,6 +745,7 @@ void __init dm355_init_time(void)
 	dm355_psc_init(NULL, psc);
 
 	clk = clk_get(NULL, "timer0");
+	WARN(IS_ERR(clk), "Unable to get the timer clock\n");
 
 	davinci_timer_init(clk);
 }
-- 
2.19.1
