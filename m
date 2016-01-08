From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 0/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
Date: Fri, 8 Jan 2016 10:05:26 +0800
Message-ID: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org


This patch set adds support for the Active-semi ACT8945A PMIC.
It is a Multi Function Device with the following subdevices:
 - Regulator
 - Charger

It is interfaced to the host controller using I2C interface,
ACT8945A is a child device of the I2C.


Wenyou Yang (2):
  mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
  mfd: add documentation for ACT8945A DT bindings

 Documentation/devicetree/bindings/mfd/act8945a.txt |   16 +++
 drivers/mfd/Kconfig                                |    8 ++
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/act8945a.c                             |  122 ++++++++++++++++++++
 include/linux/mfd/act8945a.h                       |   25 ++++
 5 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.txt
 create mode 100644 drivers/mfd/act8945a.c
 create mode 100644 include/linux/mfd/act8945a.h

-- 
1.7.9.5
