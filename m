From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] mfd: max14577: Add max14577 MFD drivers
Date: Wed, 13 Nov 2013 08:40:53 +0100
Message-ID: <1384328457-5147-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds drivers for MAXIM 14577 chip. The chip contains Micro-USB
Interface Circuit and Li+ Battery Charger. It contains accessory and USB
charger detection logic. It supports USB 2.0 Hi-Speed, UART and stereo
audio signals over Micro-USB connector.

The battery charger is compliant with the USB Battery Charging Specification
Revision 1.1. It has also SFOUT LDO output for powering USB devices.

The patchset consists of following drivers:
1. MFD core driver.
2. Extcon driver for the MUIC (Micro USB Interface Controller).
3. Charger driver using power supply class.
4. Regulator driver for SFOUT and charger.

The patchset is rebased on latest Linus' tree (v3.12-4849-g10d0c97) however
testing was mostly done on 3.10. Except minor change in extcon_dev_register()
function the patchset cleanly applies to 3.10 and 3.12.


Best regards,
Krzysztof Kozlowski


Chanwoo Choi (2):
  mfd: max14577: Add max14577 MFD driver core
  extcon: max77693: Add extcon-max14577 driver to support MUIC device

Krzysztof Kozlowski (2):
  charger: max14577: Add charger support for Maxim 14577
  regulator: max14577: Add regulator driver for Maxim 14577

 drivers/extcon/Kconfig               |   10 +
 drivers/extcon/Makefile              |    1 +
 drivers/extcon/extcon-max14577.c     |  806 ++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig                  |   13 +
 drivers/mfd/Makefile                 |    1 +
 drivers/mfd/max14577-irq.c           |  283 ++++++++++++
 drivers/mfd/max14577.c               |  268 +++++++++++
 drivers/power/Kconfig                |    7 +
 drivers/power/Makefile               |    1 +
 drivers/power/max14577_charger.c     |  327 ++++++++++++++
 drivers/regulator/Kconfig            |    8 +
 drivers/regulator/Makefile           |    1 +
 drivers/regulator/max14577.c         |  365 +++++++++++++++
 include/linux/mfd/max14577-private.h |  291 ++++++++++++
 include/linux/mfd/max14577.h         |   76 ++++
 15 files changed, 2458 insertions(+)
 create mode 100644 drivers/extcon/extcon-max14577.c
 create mode 100644 drivers/mfd/max14577-irq.c
 create mode 100644 drivers/mfd/max14577.c
 create mode 100644 drivers/power/max14577_charger.c
 create mode 100644 drivers/regulator/max14577.c
 create mode 100644 include/linux/mfd/max14577-private.h
 create mode 100644 include/linux/mfd/max14577.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
