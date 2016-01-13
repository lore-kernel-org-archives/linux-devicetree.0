From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
Date: Wed, 13 Jan 2016 11:55:21 +0800
Message-ID: <1452657323-30053-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds support for the Active-semi ACT8945A PMIC
MFD driver. It is a Multi Function Device with the following
subdevices:
 - Regulator
 - Charger

It is interfaced to the host controller using I2C interface,
ACT8945A is a child device of the I2C.

Changes in v4:
 - add a space before .compatible.
 - collect Reviewed-by from Krzysztof Kozlowski.

Changes in v3:
 - fix the tabbing errors in Example.
 - use "pmic@5b" label, not "act8945a@5b" in Example.
 - collect Acked-by from Rob.

Changes in v2:
 - add more help information in Kconfig.
 - update the file header with short version license and author line.
 - remove unused structure members (dev, i2c_client) of stuct act8945a_dev.
 - use define "PLATFORM_DEVID_NONE" for mfd_add_devices(), instead of '-1'.
 - use more explicit info to indicate the failure to add sub devices.
 - remove the unnecessary print out.
 - substitute MODULE_LICENSE("GPL") for MODULE_LICENSE("GPL v2").
 - use more specific label in Example.
 - add pmic and charger nodes in Example.

Wenyou Yang (2):
  mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
  mfd: add documentation for ACT8945A DT bindings

 Documentation/devicetree/bindings/mfd/act8945a.txt |   82 +++++++++++++++
 drivers/mfd/Kconfig                                |   11 ++
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/act8945a.c                             |  109 ++++++++++++++++++++
 include/linux/mfd/act8945a.h                       |   21 ++++
 5 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.txt
 create mode 100644 drivers/mfd/act8945a.c
 create mode 100644 include/linux/mfd/act8945a.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
