From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 04/12] ARM: davinci: WARN_ON() if clk_get() fails
Date: Mon,  4 Feb 2019 18:17:49 +0100
Message-ID: <20190204171757.32073-5-brgl@bgdev.pl>
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

Currently the timer code checks if the clock pointer passed to it is
good (!IS_ERR(clk)). The new clocksource driver expects the clock to
be functional and doesn't perform any checks so emit a warning if
clk_get() fails. Apply this to all davinci platforms.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/da830.c  | 4 ++++
 arch/arm/mach-davinci/da850.c  | 4 ++++
 arch/arm/mach-davinci/dm355.c  | 4 ++++
 arch/arm/mach-davinci/dm365.c  | 4 ++++
 arch/arm/mach-davinci/dm644x.c | 4 ++++
 arch/arm/mach-davinci/dm646x.c | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 2cc9fe4c3a91..9a4b749cbb6b 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -834,6 +834,10 @@ void __init da830_init_time(void)
 	da830_pll_init(NULL, pll, NULL);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index e7b78df2bfef..beb34ee42e3a 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -774,6 +774,10 @@ void __init da850_init_time(void)
 	da850_pll0_init(NULL, pll0, cfgchip);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index 4c6e0bef4509..2a523fa7c716 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -745,6 +745,10 @@ void __init dm355_init_time(void)
 	dm355_psc_init(NULL, psc);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index 01fb2b0c82de..68bd78dac293 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -786,6 +786,10 @@ void __init dm365_init_time(void)
 	dm365_psc_init(NULL, psc);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index 38f92b7d413e..070660cfd93a 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -681,6 +681,10 @@ void __init dm644x_init_time(void)
 	dm644x_psc_init(NULL, psc);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index 7dc54b2a610f..73a0f0226017 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -665,6 +665,10 @@ void __init dm646x_init_time(unsigned long ref_clk_rate,
 	dm646x_psc_init(NULL, psc);
 
 	clk = clk_get(NULL, "timer0");
+	if (WARN_ON(IS_ERR(clk))) {
+		pr_err("Unable to get the timer clock\n");
+		return;
+	}
 
 	davinci_timer_init(clk);
 }
-- 
2.20.1
