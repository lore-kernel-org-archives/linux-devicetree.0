From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 07/12] ARM: davinci: move timer definitions to davinci.h
Date: Mon,  4 Feb 2019 18:17:52 +0100
Message-ID: <20190204171757.32073-8-brgl@bgdev.pl>
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

Boards from the dm* family rely on register offset definitions from
arch/arm/mach-davinci/include/mach/time.h. We'll be removing this file
soon, so move the required defines to davinci.h where the rest of such
constants live.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/davinci.h           | 3 +++
 arch/arm/mach-davinci/include/mach/time.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-davinci/davinci.h b/arch/arm/mach-davinci/davinci.h
index db4c95ef4d5c..dfd1b1ab7b59 100644
--- a/arch/arm/mach-davinci/davinci.h
+++ b/arch/arm/mach-davinci/davinci.h
@@ -60,6 +60,9 @@ void davinci_map_sysmod(void);
 #define DAVINCI_GPIO_BASE 0x01C67000
 int davinci_gpio_register(struct resource *res, int size, void *pdata);
 
+#define DAVINCI_TIMER0_BASE		(IO_PHYS + 0x21400)
+#define DAVINCI_WDOG_BASE		(IO_PHYS + 0x21C00)
+
 /* DM355 base addresses */
 #define DM355_ASYNC_EMIF_CONTROL_BASE	0x01e10000
 #define DM355_ASYNC_EMIF_DATA_CE0_BASE	0x02000000
diff --git a/arch/arm/mach-davinci/include/mach/time.h b/arch/arm/mach-davinci/include/mach/time.h
index 1c971d8d8ba8..ba913736990f 100644
--- a/arch/arm/mach-davinci/include/mach/time.h
+++ b/arch/arm/mach-davinci/include/mach/time.h
@@ -11,9 +11,7 @@
 #ifndef __ARCH_ARM_MACH_DAVINCI_TIME_H
 #define __ARCH_ARM_MACH_DAVINCI_TIME_H
 
-#define DAVINCI_TIMER0_BASE		(IO_PHYS + 0x21400)
 #define DAVINCI_TIMER1_BASE		(IO_PHYS + 0x21800)
-#define DAVINCI_WDOG_BASE		(IO_PHYS + 0x21C00)
 
 enum {
 	T0_BOT,
-- 
2.20.1
