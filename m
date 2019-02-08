From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 23/33] ARM: davinci: cp-intc: add the new config structures for da8xx SoCs
Date: Fri,  8 Feb 2019 18:34:48 +0100
Message-ID: <20190208173458.4801-24-brgl@bgdev.pl>
References: <20190208173458.4801-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208173458.4801-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add the new-style config structures for da8xx SoCs. They will be used
once we make the cp-intc driver stop using davinci_soc_info.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/da830.c | 10 ++++++++++
 arch/arm/mach-davinci/da850.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 5cfd30c57429..38af72be1a85 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -12,6 +12,7 @@
 #include <linux/clk/davinci.h>
 #include <linux/gpio.h>
 #include <linux/init.h>
+#include <linux/irqchip/irq-davinci-cp-intc.h>
 #include <linux/platform_data/gpio-davinci.h>
 
 #include <asm/mach/map.h>
@@ -821,6 +822,15 @@ void __init da830_init(void)
 	WARN(!da8xx_syscfg0_base, "Unable to map syscfg0 module");
 }
 
+static const struct davinci_cp_intc_config da830_cp_intc_config = {
+	.reg = {
+		.start		= DA8XX_CP_INTC_BASE,
+		.end		= DA8XX_CP_INTC_BASE + SZ_8K - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	.num_irqs		= DA830_N_CP_INTC_IRQ,
+};
+
 void __init da830_init_irq(void)
 {
 	cp_intc_init();
diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index 6df6994c0f26..9a3ce68c0de4 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -18,6 +18,7 @@
 #include <linux/cpufreq.h>
 #include <linux/gpio.h>
 #include <linux/init.h>
+#include <linux/irqchip/irq-davinci-cp-intc.h>
 #include <linux/mfd/da8xx-cfgchip.h>
 #include <linux/platform_data/clk-da8xx-cfgchip.h>
 #include <linux/platform_data/clk-davinci-pll.h>
@@ -759,6 +760,15 @@ void __init da850_init(void)
 	WARN(!da8xx_syscfg1_base, "Unable to map syscfg1 module");
 }
 
+static const struct davinci_cp_intc_config da850_cp_intc_config = {
+	.reg = {
+		.start		= DA8XX_CP_INTC_BASE,
+		.end		= DA8XX_CP_INTC_BASE + SZ_8K - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	.num_irqs		= DA850_N_CP_INTC_IRQ,
+};
+
 void __init da850_init_irq(void)
 {
 	cp_intc_init();
-- 
2.20.1
