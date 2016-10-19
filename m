From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 7/9] ARM: meson: enable MESON_IRQ_GPIO in Kconfig for meson8
Date: Wed, 19 Oct 2016 17:21:18 +0200
Message-ID: <1476890480-8884-8-git-send-email-jbrunet@baylibre.com>
References: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Add select MESON_IRQ_GPIO in Kconfig for Amlogic's meson8 and meson8b SoC

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/mach-meson/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index b6e3acc63e14..63157295cd9d 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -21,11 +21,13 @@ config MACH_MESON8
 	bool "Amlogic Meson8 SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select MESON_IRQ_GPIO
 
 config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
 	select COMMON_CLK_MESON8B
+	select MESON_IRQ_GPIO
 
 endif
-- 
2.7.4
