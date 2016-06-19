From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH v2 0/3] Add Broadcom iproc-static-adc controller driver
Date: Sun, 19 Jun 2016 15:36:27 +0530
Message-ID: <1466330790-2820-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Richardson <jonathar@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains initial driver for Broadcom's
iproc static adc controller. The patchset is based on v4.7-rc1
tag and its tested on Broadcom Cygnus SoC.

The patches can be fetched from iproc-adc-v2 branch of
https://github.com/Broadcom/arm64-linux.git

Changes since v1:
 - Modified Kconfig file to add more informative information
   in Broadcom Adc driver configuration menu.
 - Added Broadcom Adc driver menu config in the alphabetical
   order in Kconfig
 - Addressed various comments given by Peter Meerwald-Stadler
   on driver source code, Including issues related to linux
   coding style and race conditions.

Raveendra Padasalagi (3):
  Documentation: DT: Add iproc-static-adc binding
  iio: Add driver for Broadcom iproc-static-adc
  ARM:dts-Add dt node for Broadcom iproc-static-adc

 .../bindings/iio/adc/brcm,iproc-static-adc.txt     |  43 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  13 +
 drivers/iio/adc/Kconfig                            |  13 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/bcm_iproc_adc.c                    | 563 +++++++++++++++++++++
 5 files changed, 633 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
 create mode 100644 drivers/iio/adc/bcm_iproc_adc.c

-- 
1.9.1
