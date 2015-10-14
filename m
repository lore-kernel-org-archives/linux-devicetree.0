From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 5/7] ARM: mach-stm32: Select pinctrl
Date: Wed, 14 Oct 2015 22:07:25 +0200
Message-ID: <1444853247-31114-6-git-send-email-mcoquelin.stm32@gmail.com>
References: <1444853247-31114-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1444853247-31114-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afaerber@suse.de, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/Kconfig                          | 1 +
 drivers/pinctrl/stm32/pinctrl-stm32f429.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index bf94e54..8b1afd4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -985,6 +985,7 @@ config ARCH_STM32
 	select ARMV7M_SYSTICK
 	select CLKSRC_STM32
 	select RESET_CONTROLLER
+	select PINCTRL
 	help
 	  Support for STMicroelectronics STM32 processors.
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32f429.c b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
index 3535037..f34016b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32f429.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
@@ -1564,7 +1564,7 @@ static const struct stm32_desc_pin stm32f429_pins[] = {
 	),
 };
 
-struct stm32_pinctrl_match_data stm32f429_match_data = {
+static struct stm32_pinctrl_match_data stm32f429_match_data = {
 	.pins = stm32f429_pins,
 	.npins = ARRAY_SIZE(stm32f429_pins),
 };
-- 
1.9.1

