From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] mfd: 88pm800: Add 88pm860 device support
Date: Thu,  9 Jul 2015 17:17:05 +0530
Message-ID: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

88PM860 falls under 88pm800 family of devices, with some feature
additions, for example, support for dual phase on BUCK1.

This patch series, enabled chip ID support for 88pm860 in the driver
and adds,
  - Init time configuration support based on chip ID
  - DT property for 32KHz low jitter clock enable
  - DT property for dual phase enable

TODO:
 - Some of init time configurations are common to both 88pm800 and 88pm860
   devices, but since I can not validate it, decided to move it to
   88pm860 block only.
   But if someone is willing to help me in validation, we can move it to
   common code later. No issues there.
 - Sleep/low-power-mode related configuration is also part of init time,
   but since we are too far from sleep mode support and without testing
   I do not want add anything, decided to take it later when we actually
   start looking at sleep support.
 - Init time configuration also includes pinmux setting for the device.
   I am working on using pinctrl-single driver to have standard and generic
   interface, hopefully it will get handled through pinctrl subsystem.
   Link to RFC - https://patches.linaro.org/50604/

Vaibhav Hiremath (6):
  mfd: 88pm80x: Add 88pm860 chip type support
  mfd: 88pm800: Add init time initial configuration support
  mfd: devicetree: bindings: 88pm800: Add DT property for 32KHz output
    enable
  mfd: 88pm800: Enable 32KHZ XO low jitter clock out
  mfd: devicetree: bindings: 88pm800: Add DT property for dual phase
    enable
  mfd: 88pm800: Add support for configuration of dual phase on BUCK1

 Documentation/devicetree/bindings/mfd/88pm800.txt | 12 ++++
 drivers/mfd/88pm800.c                             | 88 +++++++++++++++++++++++
 drivers/mfd/88pm80x.c                             |  2 +
 include/linux/mfd/88pm80x.h                       | 18 +++++
 4 files changed, 120 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
