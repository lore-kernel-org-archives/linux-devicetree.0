From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 2/9] mfd: bd71837: build BD71837 PMIC MFD driver
Date: Thu, 24 May 2018 08:56:35 +0300
Message-ID: <20180524055635.GC4249@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Configuration options and Makefile for BD71837 PMIC MFD driver

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/Kconfig  | 13 +++++++++++++
 drivers/mfd/Makefile |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b860eb5aa194..7aa05fc9ed8e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1787,6 +1787,19 @@ config MFD_STW481X
 	  in various ST Microelectronics and ST-Ericsson embedded
 	  Nomadik series.
 
+config MFD_BD71837
+	bool "BD71837 Power Management chip"
+	depends on I2C=y
+	depends on OF
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	select MFD_CORE
+	help
+	  Select this option to get support for the ROHM BD71837
+	  Power Management chips. BD71837 is designed to power processors like
+	  NXP i.MX8. It contains 8 BUCK outputs and 7 LDOs, voltage monitoring
+	  and emergency shut down as well as 32,768KHz clock output.
+
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e9fd20dba18d..09dc9eb3782c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -227,4 +227,5 @@ obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
 obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
 obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
+obj-$(CONFIG_MFD_BD71837)	+= bd71837.o
 
-- 
2.14.3
