From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v2 1/3] pinctrl: bcm2835: switch to GENERIC_PINCONF
Date: Sun,  4 Mar 2018 22:29:18 -0400
Message-ID: <1520216960-19880-2-git-send-email-matheus@castello.eng.br>
References: <431699005.307231.1520086916739@email.1und1.de>
 <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.wahren@i2se.com, linus.walleij@linaro.org
Cc: eric@anholt.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

To enable support for generic binding in the pinctrl-bcm2835 and use pinctrl
generic to parse properties the GENERIC_PINCONF have to be selected.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 drivers/pinctrl/bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index e8c4e4f..0f38d51 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -20,6 +20,7 @@ config PINCTRL_BCM2835
 	bool
 	select PINMUX
 	select PINCONF
+	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP

 config PINCTRL_IPROC_GPIO
--
2.7.4
