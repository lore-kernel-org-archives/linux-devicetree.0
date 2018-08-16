From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/7] pinctrl: ingenic: Drop dependency on MACH_INGENIC
Date: Thu, 16 Aug 2018 18:35:43 +0200
Message-ID: <20180816163544.9072-6-paul@crapouillou.net>
References: <20180816163544.9072-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816163544.9072-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Depending on MACH_INGENIC prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 20e368b8f54a..b52e16dd8a91 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -309,9 +309,9 @@ config PINCTRL_ZYNQ
 
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
-	default y
+	default MACH_INGENIC
 	depends on OF
-	depends on MACH_INGENIC || COMPILE_TEST
+	depends on MIPS || COMPILE_TEST
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-- 
2.11.0
