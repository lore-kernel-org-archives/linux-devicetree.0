From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 05/14] MIPS: ingenic: Enable pinctrl for all ingenic SoCs
Date: Fri, 12 May 2017 18:52:58 +0200
Message-ID: <20170512165307.31369-5-paul@crapouillou.net>
References: <20170428200824.10906-2-paul@crapouillou.net>
 <20170512165307.31369-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170512165307.31369-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Maarten ter Huurne <maarten@treewalker.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

There is a pinctrl driver for each of the Ingenic SoCs supported by the
upstream Linux kernel. In order to switch away from the old GPIO
platform code, we now enable the pinctrl drivers by default for the
Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

 v2: No changes
 v3: No changes
 v4: No changes
 v5: No changes
 v6: No changes

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e0bb576410bb..771995b75e0d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -363,6 +363,7 @@ config MACH_INGENIC
 	select SYS_SUPPORTS_ZBOOT_UART16550
 	select DMA_NONCOHERENT
 	select IRQ_MIPS_CPU
+	select PINCTRL
 	select GPIOLIB
 	select COMMON_CLK
 	select GENERIC_IRQ_CHIP
-- 
2.11.0
