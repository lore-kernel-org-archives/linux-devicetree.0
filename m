Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 07/33] ARM: davinci: select SPARSE_IRQ
Date: Fri,  8 Feb 2019 18:31:28 +0100
Message-Id: <20190208173154.4665-8-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, David Lechner <david@lechnology.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Everything is in place now for SPARSE_IRQ. Select it and set
DAVINCI_INTC_START to NR_IRQS.

We now need to include mach/irqs.h in a couple places as it is no
longer indirectly included after selecting SPARSE_IRQ.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/Kconfig                            | 1 +
 arch/arm/mach-davinci/board-da830-evm.c     | 1 +
 arch/arm/mach-davinci/board-da850-evm.c     | 1 +
 arch/arm/mach-davinci/board-dm644x-evm.c    | 1 +
 arch/arm/mach-davinci/devices-da8xx.c       | 1 +
 arch/arm/mach-davinci/include/mach/common.h | 4 +++-
 arch/arm/mach-davinci/include/mach/irqs.h   | 1 -
 arch/arm/mach-davinci/irq.c                 | 1 +
 8 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f7770fdcad68..1037f49e050f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -595,6 +595,7 @@ config ARCH_DAVINCI
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
 	select RESET_CONTROLLER
+	select SPARSE_IRQ
 	select USE_OF
 	select ZONE_DMA
 	help
diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index c4da635ee4ce..41f5a51fee9a 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -36,6 +36,7 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
+#include <mach/irqs.h>
 #include "cp_intc.h"
 #include <mach/mux.h>
 #include <mach/da8xx.h>
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 44bca048dfd0..317f48560534 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -46,6 +46,7 @@
 #include "cp_intc.h"
 #include <mach/da8xx.h>
 #include <mach/mux.h>
+#include <mach/irqs.h>
 #include "sram.h"
 
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index b80c4ee76217..16ffed2525e6 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -36,6 +36,7 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
+#include <mach/irqs.h>
 #include <linux/platform_data/i2c-davinci.h>
 #include <mach/serial.h>
 #include <mach/mux.h>
diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
index 298165095d31..3104a3eb2ddf 100644
--- a/arch/arm/mach-davinci/devices-da8xx.c
+++ b/arch/arm/mach-davinci/devices-da8xx.c
@@ -25,6 +25,7 @@
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
 #include <mach/time.h>
+#include <mach/irqs.h>
 
 #include "asp.h"
 #include "cpuidle.h"
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index d840023eaaac..1ceed0345988 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -17,7 +17,9 @@
 #include <linux/types.h>
 #include <linux/reboot.h>
 
-#define DAVINCI_INTC_START		0
+#include <asm/irq.h>
+
+#define DAVINCI_INTC_START		NR_IRQS
 #define DAVINCI_INTC_IRQ(_irqnum)	(DAVINCI_INTC_START + (_irqnum))
 
 void davinci_timer_init(struct clk *clk);
diff --git a/arch/arm/mach-davinci/include/mach/irqs.h b/arch/arm/mach-davinci/include/mach/irqs.h
index 03c446635301..8f9fc7a56ce8 100644
--- a/arch/arm/mach-davinci/include/mach/irqs.h
+++ b/arch/arm/mach-davinci/include/mach/irqs.h
@@ -401,6 +401,5 @@
 /* da850 currently has the most gpio pins (144) */
 #define DAVINCI_N_GPIO			144
 /* da850 currently has the most irqs so use DA850_N_CP_INTC_IRQ */
-#define NR_IRQS				(DA850_N_CP_INTC_IRQ + DAVINCI_N_GPIO)
 
 #endif /* __ASM_ARCH_IRQS_H */
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index de31be42a394..16ac28833eb4 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -28,6 +28,7 @@
 #include <mach/hardware.h>
 #include <mach/cputype.h>
 #include <mach/common.h>
+#include <mach/irqs.h>
 #include <asm/mach/irq.h>
 #include <asm/exception.h>
 
-- 
2.20.1
