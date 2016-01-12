From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v2 0/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
Date: Tue, 12 Jan 2016 16:05:13 +0800
Message-ID: <1452585915-551-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

This patch set adds support for the Active-semi ACT8945A PMIC
MFD driver. It is a Multi Function Device with the following
subdevices:
 - Regulator
 - Charger

It is interfaced to the host controller using I2C interface,
ACT8945A is a child device of the I2C.

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
