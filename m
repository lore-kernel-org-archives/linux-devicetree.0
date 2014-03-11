From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/5] BCM59056 PMU regulator support
Date: Tue, 11 Mar 2014 19:33:52 -0400
Message-ID: <1394580837-8331-1-git-send-email-mporter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BCM59056 is a multi-function power management unit used with the
BCM281xx family of SoCs. This series adds an MFD and voltage regulator
driver to support the BCM59056. The bcm28155-ap DT support is updated
to enable use of regulators on the otg and sdhci peripherals.

Changes since v3:
	- remove needless init of local ret variable in mfd driver probe

Changes since v2:
	- Move to mfd_add_devices() approach, eliminating representation
	  of the regulator block as a hardware subdevice. Regulators are
	  listed in the PMU binding and referenced via the parent device
	  of_node by the regulator driver.
	- Allow mfd driver to build as module
	- Remove regulator constraints from the .dtsi include only the
	  board-specific constraints in the board .dts.

Changes since v1:
        - renamed to bcm590xx to accomodate future family parts
        - remove use of subsys_initcall
        - fix BCM590XX_MAX_REGISTER value
        - remove unused chip id in mfd of/i2c matching
        - switch to of_platform_populate() in mfd
        - update binding to single document with regulators as optional
          properties in the regulator subdevice IP description
        - remove unused regulator get/set mode ops
        - remove unneeded regulator NULL constraint check
        - regulators property is optional, allow the driver to probe
          when it is missing
        - move of_node presence check into bcm590xx_parse_dt_reg_data()

Matt Porter (5):
  mfd: add bcm590xx pmu DT binding
  mfd: add bcm590xx pmu driver
  regulator: add bcm590xx regulator driver
  ARM: configs: bcm_defconfig: enable bcm590xx regulator support
  ARM: dts: add bcm590xx pmu support and enable for bcm28155-ap

 Documentation/devicetree/bindings/mfd/bcm590xx.txt |  41 ++
 arch/arm/boot/dts/bcm28155-ap.dts                  |  47 ++-
 arch/arm/boot/dts/bcm59056.dtsi                    |  77 ++++
 arch/arm/configs/bcm_defconfig                     |   7 +
 drivers/mfd/Kconfig                                |   8 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/bcm590xx.c                             |  93 +++++
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/bcm590xx-regulator.c             | 413 +++++++++++++++++++++
 include/linux/mfd/bcm590xx.h                       |  31 ++
 11 files changed, 726 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/bcm590xx.txt
 create mode 100644 arch/arm/boot/dts/bcm59056.dtsi
 create mode 100644 drivers/mfd/bcm590xx.c
 create mode 100644 drivers/regulator/bcm590xx-regulator.c
 create mode 100644 include/linux/mfd/bcm590xx.h

-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
