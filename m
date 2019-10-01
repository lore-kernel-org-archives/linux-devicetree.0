From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/7] irqchip: Introduce Kconfig symbol to build irq-bcm283x.c
Date: Tue,  1 Oct 2019 15:48:36 -0700
Message-ID: <20191001224842.9382-2-f.fainelli@gmail.com>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001224842.9382-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Both irq-bcm2835.c and irq-bcm2836.c are currently used with
ARCH_BCM2835 but are soon going to be used with ARCH_BRCMSTB, introduce
a Kconfig symbol to make that those drivers selected/built by other
platforms.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/Kconfig  | 5 +++++
 drivers/irqchip/Makefile | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 80e10f4e213a..d1bb20d23d27 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -113,6 +113,11 @@ config I8259
 	bool
 	select IRQ_DOMAIN
 
+config BCM283X_IRQ
+	bool
+	select IRQ_DOMAIN
+	default ARCH_BCM2835
+
 config BCM6345_L1_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 8d0fcec6ab23..9cf14c7945f6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -5,8 +5,8 @@ obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
-obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
-obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
+obj-$(CONFIG_BCM283X_IRQ)		+= irq-bcm2835.o
+obj-$(CONFIG_BCM283X_IRQ)		+= irq-bcm2836.o
 obj-$(CONFIG_DAVINCI_AINTC)		+= irq-davinci-aintc.o
 obj-$(CONFIG_DAVINCI_CP_INTC)		+= irq-davinci-cp-intc.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
-- 
2.17.1
