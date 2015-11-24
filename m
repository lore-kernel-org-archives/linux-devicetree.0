From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 0/6]  mfd: axp20x: Add support for RSB based AXP223
Date: Tue, 24 Nov 2015 11:48:30 +0800
Message-ID: <1448336916-31212-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v4 of the AXP223 PMIC series.

Changes since v3:

  - Removed settings for axp223 reg_rtc_ldo from board dts files that
    are already in axp22x.dtsi. The name is kept.

  - Dropped simplefb label and defconfig patches, as they are merged.

Changes since v2:

  - s/It's/Its/ for the commit messages of patches 5 and 7

  - Add Rob's Acked-by for patch 1

Changes since v1:

  - Dropped NMI interrupt controller dts patch (Merged)

  - Change MFD_AXP20X to represent the axp20x core, and drop MFD_AXP20X_CORE
  
  - Keep the axp20x core bits named axp20x.c

  - Add patch 7 to add AXP223 to sun8i-q8-common.dtsi

  - Add patch 8 & 9 to update defconfigs

  - Make axp20x drivers tristate and buildable as modules

  - Drop "_sunxi" substring from identifiers in axp20x-rsb driver


This series adds support for the Reduced Serial Bus based AXP223 PMIC.
The AXP223 is functionally identical to the AXP221, which we already
support. Only some default values for the regulators are different.
The defaults fit their recommended application, paired with different
SoCs.

Patch 1 adds AXP223 to the list of supported chips in the DT binding.

Patch 2 splits the axp20x mfd driver into 2 parts, a core library, and
an I2C driver.

Patch 3 adds an RSB based driver for the AXP223.

Patch 4 adds support for the AXP223 regulators

Patch 5 enables the AXP223 PMIC and its regulators for the Sinlinx
SinA33.

Patch 6 enables the AXP223 PMIC and its regulators for A23/A33 based
Q8 devices.


Regards
ChenYu


Chen-Yu Tsai (6):
  mfd: axp20x: Add AXP223 to list of supported PMICs in DT bindings
  mfd: axp20x: Split the driver into core and i2c bits
  mfd: axp20x: Add support for RSB based AXP223 PMIC
  regulator: axp20x: Support new AXP223 PMIC
  ARM: dts: sun8i: sinlinx-sina33: Add AXP223 PMIC device and regulator
    nodes
  ARM: dts: sun8i: q8-common: Add AXP223 PMIC device and regulator nodes

 Documentation/devicetree/bindings/mfd/axp20x.txt |   7 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts   |  79 +++++++++++++-
 arch/arm/boot/dts/sun8i-q8-common.dtsi           |  86 ++++++++++++++-
 drivers/mfd/Kconfig                              |  25 ++++-
 drivers/mfd/Makefile                             |   2 +
 drivers/mfd/axp20x-i2c.c                         | 127 +++++++++++++++++++++++
 drivers/mfd/axp20x-rsb.c                         |  93 +++++++++++++++++
 drivers/mfd/axp20x.c                             | 110 +++-----------------
 drivers/regulator/axp20x-regulator.c             |   3 +
 include/linux/mfd/axp20x.h                       |  34 +++++-
 10 files changed, 458 insertions(+), 108 deletions(-)
 create mode 100644 drivers/mfd/axp20x-i2c.c
 create mode 100644 drivers/mfd/axp20x-rsb.c

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
