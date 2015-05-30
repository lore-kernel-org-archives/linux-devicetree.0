From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 1/4] ARM: stm32: Enable clock source
Date: Sat, 30 May 2015 08:54:05 +0100
Message-ID: <1432972448-10332-2-git-send-email-daniel.thompson@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
 <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Currently STM32F4 systems do not complete the boot process. This is
trivially fixed by enabling a suitable clock source when ARCH_STM32 is
set.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e717642..462c1ee 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -978,6 +978,7 @@ config ARCH_STM32
 	depends on ARM_SINGLE_ARMV7M
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARMV7M_SYSTICK
+	select CLKSRC_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STMicroelectronics STM32 processors.
-- 
2.1.0
