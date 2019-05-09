From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
Date: Thu,  9 May 2019 13:59:54 -0700
Message-ID: <20190509205955.27842-3-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Doug Berger <opendmb@gmail.com>

ARCH_BRCMSTB needs to use the BCM2835 pin controller for chips
like BCM7211 which adopted that pin controller for GPIO. This
commit makes the option menu configurable with default enabled
for ARCH_BRCMSTB and ARCH_BCM2835.

Signed-off-by: Doug Berger <opendmb@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index c8575399d6f7..c57f1d9259d8 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -17,11 +17,15 @@ config PINCTRL_BCM281XX
 	  framework.  GPIO is provided by a separate GPIO driver.
 
 config PINCTRL_BCM2835
-	bool
+	bool "Broadcom BCM2835 GPIO (with PINCONF) driver"
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
+	default ARCH_BCM2835 || ARCH_BRCMSTB
+	help
+	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
-- 
2.17.1
