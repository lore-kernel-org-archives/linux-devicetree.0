From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 32/33] irqchip: davinci-cp-intc: move the driver to drivers/irqchip
Date: Fri,  8 Feb 2019 18:34:57 +0100
Message-ID: <20190208173458.4801-33-brgl@bgdev.pl>
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

The cp-intc driver has now been cleaned up. Move it to drivers/irqchip
where it belongs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/mach-davinci/Kconfig                             | 8 ++------
 arch/arm/mach-davinci/Makefile                            | 2 --
 drivers/irqchip/Kconfig                                   | 5 +++++
 drivers/irqchip/Makefile                                  | 1 +
 .../cp_intc.c => drivers/irqchip/irq-davinci-cp-intc.c    | 0
 5 files changed, 8 insertions(+), 8 deletions(-)
 rename arch/arm/mach-davinci/cp_intc.c => drivers/irqchip/irq-davinci-cp-intc.c (100%)

diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index 71a4d875dd39..5a59cebc7d0a 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -1,10 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 if ARCH_DAVINCI
 
-config CP_INTC
-	bool
-	select IRQ_DOMAIN
-
 config ARCH_DAVINCI_DMx
 	bool
 
@@ -33,13 +29,13 @@ config ARCH_DAVINCI_DA830
 	select ARCH_DAVINCI_DA8XX
 	# needed on silicon revs 1.0, 1.1:
 	select CPU_DCACHE_WRITETHROUGH if !CPU_DCACHE_DISABLE
-	select CP_INTC
+	select DAVINCI_CP_INTC
 
 config ARCH_DAVINCI_DA850
 	bool "DA850/OMAP-L138/AM18x based system"
 	depends on !ARCH_DAVINCI_DMx || (AUTO_ZRELADDR && ARM_PATCH_PHYS_VIRT)
 	select ARCH_DAVINCI_DA8XX
-	select CP_INTC
+	select DAVINCI_CP_INTC
 
 config ARCH_DAVINCI_DA8XX
 	bool
diff --git a/arch/arm/mach-davinci/Makefile b/arch/arm/mach-davinci/Makefile
index 983865a99616..f76a8482784f 100644
--- a/arch/arm/mach-davinci/Makefile
+++ b/arch/arm/mach-davinci/Makefile
@@ -18,8 +18,6 @@ obj-$(CONFIG_ARCH_DAVINCI_DM365)	+= dm365.o devices.o
 obj-$(CONFIG_ARCH_DAVINCI_DA830)	+= da830.o devices-da8xx.o usb-da8xx.o
 obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= da850.o devices-da8xx.o usb-da8xx.o
 
-obj-$(CONFIG_CP_INTC)			+= cp_intc.o
-
 # Board specific
 obj-$(CONFIG_MACH_DA8XX_DT)		+= da8xx-dt.o pdata-quirks.o
 obj-$(CONFIG_MACH_DAVINCI_EVM)  	+= board-dm644x-evm.o
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ea0eb82bf1d2..48fc5024c073 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -134,6 +134,11 @@ config DAVINCI_AINTC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
+config DAVINCI_CP_INTC
+	bool
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
+
 config DW_APB_ICTL
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 623e0ec5f9d0..e6cd0c98eff2 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
 obj-$(CONFIG_DAVINCI_AINTC)		+= irq-davinci-aintc.o
+obj-$(CONFIG_DAVINCI_CP_INTC)		+= irq-davinci-cp-intc.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
 obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
 obj-$(CONFIG_ARCH_HIP04)		+= irq-hip04.o
diff --git a/arch/arm/mach-davinci/cp_intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
similarity index 100%
rename from arch/arm/mach-davinci/cp_intc.c
rename to drivers/irqchip/irq-davinci-cp-intc.c
-- 
2.20.1
