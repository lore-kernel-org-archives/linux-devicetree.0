From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH v2 5/6] ARM: brcmstb: Select ARCH_WANT_OPTIONAL_GPIOLIB
Date: Thu, 28 May 2015 19:14:09 -0700
Message-ID: <1432865650-4062-6-git-send-email-gregory.0xf0@gmail.com>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Select ARCH_WANT_OPTIONAL_GPIOLIB from BRCMSTB to allow GPIOLIB and
GPIO_BRCMSTB to be enabled.

Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
---
v2: this was split out so that it can go through the ARM SoC tree.

 arch/arm/mach-bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 8b11f44..0ac9e4b3 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -144,6 +144,7 @@ config ARCH_BRCMSTB
 	select BRCMSTB_GISB_ARB
 	select BRCMSTB_L2_IRQ
 	select BCM7120_L2_IRQ
+	select ARCH_WANT_OPTIONAL_GPIOLIB
 	help
 	  Say Y if you intend to run the kernel on a Broadcom ARM-based STB
 	  chipset.
-- 
1.9.1

