From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add MFD/Regulator support for ATC260x PMICs
Date: Mon, 17 Jun 2019 21:20:07 +0530
Message-ID: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org
Cc: afaerber@suse.de, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds MFD core and Regulator support for Actions Semi ATC260x
PMICs. ATC260x series PMICs integrates Audio Codec, Power management,
Clock generation, and GPIO controller blocks. There are 3 variants of this
PMIC series exist today:

ATC2603A
ATC2603C
ATC2609A

This patchset adds only ATC2609A PMIC support with regulator functionality.
Regulator driver supports 4 DC-DC converters and 10 LDO regulators.

This series has been tested on 96Boards Bubblegum96 board integrating
ATC2609A. Since the board support depends on the SIRQ driver (being reviewed),
I haven't added any dts changes for now!

Thanks,
Mani

Manivannan Sadhasivam (4):
  dt-bindings: mfd: Add Actions Semi ATC260x PMIC binding
  mfd: Add initial MFD driver for ATC260x PMICs
  regulator: Add regulator driver for ATC260x PMICs
  MAINTAINERS: Add entry for ATC260x PMIC

 .../devicetree/bindings/mfd/atc260x.txt       | 162 ++++++++
 MAINTAINERS                                   |   9 +
 drivers/mfd/Kconfig                           |  22 +
 drivers/mfd/Makefile                          |   7 +
 drivers/mfd/atc2609a-helpers.c                |  91 ++++
 drivers/mfd/atc260x-core.c                    |  85 ++++
 drivers/mfd/atc260x-i2c.c                     |  98 +++++
 drivers/mfd/atc260x.h                         |  22 +
 drivers/regulator/Kconfig                     |   8 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/atc260x-regulator.c         | 389 ++++++++++++++++++
 include/linux/mfd/atc260x/atc2609a_regs.h     | 228 ++++++++++
 include/linux/mfd/atc260x/core.h              |  64 +++
 13 files changed, 1186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atc260x.txt
 create mode 100644 drivers/mfd/atc2609a-helpers.c
 create mode 100644 drivers/mfd/atc260x-core.c
 create mode 100644 drivers/mfd/atc260x-i2c.c
 create mode 100644 drivers/mfd/atc260x.h
 create mode 100644 drivers/regulator/atc260x-regulator.c
 create mode 100644 include/linux/mfd/atc260x/atc2609a_regs.h
 create mode 100644 include/linux/mfd/atc260x/core.h

-- 
2.17.1
