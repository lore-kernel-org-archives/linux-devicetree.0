From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] ARM: gemini: select MIGHT_HAVE_PCI
Date: Sat, 11 Feb 2017 13:52:19 +0100
Message-ID: <20170211125220.10273-3-linus.walleij@linaro.org>
References: <20170211125220.10273-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170211125220.10273-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gavin Guo <gavinguo-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>, Macpaul Lin <macpaul-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Feng-Hsin Chiang <john453-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As we have a PCI driver for the Gemini, we should select
MIGHT_HAVE_PCI.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gavin Guo <gavinguo-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>
Cc: Macpaul Lin <macpaul-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>
Cc: Feng-Hsin Chiang <john453-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
PCI maintainers: this is FYI only, I will funnel this to the ARM
SoC tree once we are done with the PCI driver.
---
 arch/arm/mach-gemini/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
index 798abb16bb88..91ea52ccf13c 100644
--- a/arch/arm/mach-gemini/Kconfig
+++ b/arch/arm/mach-gemini/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_GEMINI
 	select GEMINI_TIMER
 	select GPIO_GEMINI
 	select GPIOLIB
+	select MIGHT_HAVE_PCI
 	select POWER_RESET
 	select POWER_RESET_SYSCON
 	select SERIAL_OF_PLATFORM
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
