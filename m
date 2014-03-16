From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv4 7/7] mfd: twl4030-madc: Move driver to drivers/iio/adc
Date: Sun, 16 Mar 2014 02:43:31 +0100
Message-ID: <1394934211-21605-8-git-send-email-sre@debian.org>
References: <1394934211-21605-1-git-send-email-sre@debian.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394934211-21605-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a driver for an A/D converter, which belongs into
drivers/iio/adc.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/iio/adc/Kconfig                 | 10 ++++++++++
 drivers/iio/adc/Makefile                |  1 +
 drivers/{mfd => iio/adc}/twl4030-madc.c |  0
 drivers/mfd/Kconfig                     | 10 ----------
 drivers/mfd/Makefile                    |  1 -
 5 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/{mfd => iio/adc}/twl4030-madc.c (100%)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 2209f28..427f75c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -183,6 +183,16 @@ config TI_AM335X_ADC
 	  Say yes here to build support for Texas Instruments ADC
 	  driver which is also a MFD client.
 
+config TWL4030_MADC
+	tristate "TWL4030 MADC (Monitoring A/D Converter)"
+	depends on TWL4030_CORE
+	help
+	This driver provides support for Triton TWL4030-MADC. The
+	driver supports both RT and SW conversion methods.
+
+	This driver can also be built as a module. If so, the module will be
+	called twl4030-madc.
+
 config TWL6030_GPADC
 	tristate "TWL6030 GPADC (General Purpose A/D Converter) Support"
 	depends on TWL4030_CORE
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index ba9a10a..9acf2df 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -20,5 +20,6 @@ obj-$(CONFIG_MCP3422) += mcp3422.o
 obj-$(CONFIG_NAU7802) += nau7802.o
 obj-$(CONFIG_TI_ADC081C) += ti-adc081c.o
 obj-$(CONFIG_TI_AM335X_ADC) += ti_am335x_adc.o
+obj-$(CONFIG_TWL4030_MADC) += twl4030-madc.o
 obj-$(CONFIG_TWL6030_GPADC) += twl6030-gpadc.o
 obj-$(CONFIG_VIPERBOARD_ADC) += viperboard_adc.o
diff --git a/drivers/mfd/twl4030-madc.c b/drivers/iio/adc/twl4030-madc.c
similarity index 100%
rename from drivers/mfd/twl4030-madc.c
rename to drivers/iio/adc/twl4030-madc.c
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 49bb445..23a8a51 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -935,16 +935,6 @@ config TWL4030_CORE
 	  high speed USB OTG transceiver, an audio codec (on most
 	  versions) and many other features.
 
-config TWL4030_MADC
-	tristate "TI TWL4030 MADC"
-	depends on TWL4030_CORE
-	help
-	This driver provides support for triton TWL4030-MADC. The
-	driver supports both RT and SW conversion methods.
-
-	This driver can be built as a module. If so it will be
-	named twl4030-madc
-
 config TWL4030_POWER
 	bool "TI TWL4030 power resources"
 	depends on TWL4030_CORE && ARM
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 5aea5ef..c8eb0bc 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -71,7 +71,6 @@ obj-$(CONFIG_MFD_TPS80031)	+= tps80031.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
-obj-$(CONFIG_TWL4030_MADC)      += twl4030-madc.o
 obj-$(CONFIG_TWL4030_POWER)    += twl4030-power.o
 obj-$(CONFIG_MFD_TWL4030_AUDIO)	+= twl4030-audio.o
 obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
-- 
1.9.0
