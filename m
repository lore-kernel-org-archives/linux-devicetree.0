From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 3/3] tps65912: Cleanup TPS65912 subdevice configuration dependencies
Date: Tue, 15 Sep 2015 12:57:41 -0500
Message-ID: <1442339861-30300-4-git-send-email-afd@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442339861-30300-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65912 subdevices depend on the mfd core and not any particular
interface. The core is only enabled by enabling an interface so this
is safe.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/regulator/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b4fc9e4..82218fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -840,7 +840,7 @@ config GPIO_TPS65910
 
 config GPIO_TPS65912
 	tristate "TI TPS65912 GPIO"
-	depends on (MFD_TPS65912_I2C || MFD_TPS65912_SPI)
+	depends on MFD_TPS65912
 	help
 	  This driver supports TPS65912 gpio chip
 
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 64bccff..1dec96a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -729,7 +729,7 @@ config REGULATOR_TPS65910
 
 config REGULATOR_TPS65912
 	tristate "TI TPS65912 Power regulator"
-	depends on (MFD_TPS65912_I2C || MFD_TPS65912_SPI)
+	depends on MFD_TPS65912
 	help
 	    This driver supports TPS65912 voltage regulator chip.
 
-- 
1.9.1

