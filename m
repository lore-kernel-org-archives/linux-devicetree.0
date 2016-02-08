From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 0/2] pinctrl: stm32; Fix build issue in -next and make compile-testing possible
Date: Mon,  8 Feb 2016 18:57:37 +0100
Message-ID: <1454954259-4923-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: patrice.chotard@st.com, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afaerber@suse.de, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com
List-Id: devicetree@vger.kernel.org

This two-patches series fixes two problems on stm32 pinctrl driver:
	1 - As reported by Arnd, there is a missing dependency with DT Bindings
headers on Linus' pinctrl/devel branch. This dependency is in fact not needed,
so the first patch removes it.
	2 - The driver could be selected for compile testing via menuconfig, but
the Makefile only selected stm32 driver directory if ARCH_STM32 was selected.
The second patch selects the stm32 driver if PINCTRL_STM32 is selected.

Regards,
Maxime

Maxime Coquelin (2):
  pinctrl: stm32: Remove dependency with DT bindings header files
  pinctrl: stm32: Fix compile testing selection

 drivers/pinctrl/Makefile              | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 --
 drivers/pinctrl/stm32/pinctrl-stm32.h | 8 ++++++++
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
1.9.1

