From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Support additional regulators on BCM590xx
Date: Wed, 23 Apr 2014 19:21:29 -0400
Message-ID: <1398295293-11033-1-git-send-email-mporter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
	- Fix a several commit log typos and capitalization
	- Drop use of addmap[0|1] in favor of i2c_[pri|sec]
	- Replace regmap[0|1] with regmap_[pri|sec]

This series enables support for 7 additional regulators on the BCM59056
PMU. These regulators are accessed via a secondary I2C slave address.
The MFD driver exposes an additional regmap descriptor for the additional
address space and the regulator implements support for GPLDO1-6 and VBUS
regulators.

Matt Porter (4):
  mfd: bcm590xx: update binding with additional BCM59056 regulators
  mfd: bcm590xx: add support for secondary I2C slave address
  regulator: bcm590xx: add support for regulators on secondary I2C slave
  ARM: dts: bcm590xx: add support for GPLDO and VBUS regulators

 Documentation/devicetree/bindings/mfd/bcm590xx.txt |  4 +-
 arch/arm/boot/dts/bcm59056.dtsi                    | 21 +++++
 drivers/mfd/bcm590xx.c                             | 60 ++++++++++----
 drivers/regulator/bcm590xx-regulator.c             | 92 +++++++++++++++++++---
 include/linux/mfd/bcm590xx.h                       |  9 ++-
 5 files changed, 158 insertions(+), 28 deletions(-)

-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
