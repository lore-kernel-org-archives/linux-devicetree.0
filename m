From: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Subject: [PATCH v2 0/5] arm: sun9i: Support AXP808 PMIC and Sunchip CX-A99 board
Date: Thu,  9 Feb 2017 00:29:05 +0100 (CET)
Message-ID: <cover.1486592470.git.rask@formelder.dk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series add support for the Sunchip CX-A99 board, which is used in
a few media players, making it the third device with an Allwinner A80 SoC
to be supported. The board uses the X-Powers AXP808 PMIC which this patch
series also adds support for.

Patch 1 adds a documentation line which was forgotten when device tree
bindings for the axp20x family were updated for the AXP806 PMIC. A line
immediately below the missing line will be inserted by patch 2, so I'm
including patch 1 in this series to avoid conflicts between patches.

Patch 2 adds the AXP808 to the axp20x device tree bindings.

Patch 3 adds support for the AXP808 to the axp20x MFD driver.

Patch 4 adds support for the AXP808 to the axp20x regulator driver.

Patch 5 add the device tree for the Sunchip CX-A99 board. This patch is v6 of
the only remaining patch from v4 of the patch series posted back in August.
Support for the AXP808 has made major improvements possible, notably Wifi.

Before trying out this patch series, make sure your tree contains patch
"regulator: axp20x: AXP806: Fix dcdcb being set instead of dcdce" [1]
to avoid damage to the DRAM chips through over-voltage.

[1] https://patchwork.kernel.org/patch/9530319/

Rask Ingemann Lambertsen (5):
  dts: mfd: axp20x: Add AXP806 to list of current AXP20x family members
  dts: mfd: axp20x: Add binding for the AXP808
  mfd: axp20x: Add support for the AXP808 PMIC
  regulator: axp20x: Add support for the AXP808 PMIC
  ARM: dts: sun9i: Initial support for the Sunchip CX-A99 board

 Documentation/devicetree/bindings/mfd/axp20x.txt |   8 +-
 arch/arm/boot/dts/Makefile                       |   3 +-
 arch/arm/boot/dts/sun9i-a80-cx-a99.dts           | 409 +++++++++++++++++++++++
 drivers/mfd/axp20x-rsb.c                         |   1 +
 drivers/mfd/axp20x.c                             |  26 ++
 drivers/regulator/axp20x-regulator.c             |   7 +-
 include/linux/mfd/axp20x.h                       |   1 +
 7 files changed, 449 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun9i-a80-cx-a99.dts

-- 
2.10.2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
