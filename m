From: Yi Zhang <yizhang@marvell.com>
Subject: [PATCH V2 0/2] add basic support to Marvell 88pm880/88pm886 PMIC chip
Date: Fri, 12 Jun 2015 16:43:19 +0800
Message-ID: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, pebolle@tiscali.nl
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yizhang@marvell.com, zhouqiao@marvell.com, zhenzh@marvell.com
List-Id: devicetree@vger.kernel.org

  - 88pm880 and 88pm886 are PMIC chips which integrates regulator,
    gpadc, charger, fuelgauge, etc;
	they share most of the functions and register mapping
  - this version removes the redundant EXPORT_SYMBOL_GPL, compared with the
    first version


Yi Zhang (2):
  mfd: add Marvell 88pm88x description
  mfd: 88pm88x: initialize 88pm886/88pm880 base support

 Documentation/devicetree/bindings/mfd/88pm88x.txt |  33 ++
 drivers/mfd/88pm880-table.c                       | 173 +++++++
 drivers/mfd/88pm886-table.c                       | 173 +++++++
 drivers/mfd/88pm88x-core.c                        | 584 ++++++++++++++++++++++
 drivers/mfd/88pm88x-i2c.c                         | 167 +++++++
 drivers/mfd/88pm88x-irq.c                         | 171 +++++++
 drivers/mfd/88pm88x.h                             |  51 ++
 drivers/mfd/Kconfig                               |  12 +
 drivers/mfd/Makefile                              |   3 +
 include/linux/mfd/88pm880-reg.h                   |  98 ++++
 include/linux/mfd/88pm880.h                       |  59 +++
 include/linux/mfd/88pm886-reg.h                   |  59 +++
 include/linux/mfd/88pm886.h                       |  55 ++
 include/linux/mfd/88pm88x-reg.h                   | 118 +++++
 include/linux/mfd/88pm88x.h                       | 202 ++++++++
 15 files changed, 1958 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/88pm88x.txt
 create mode 100644 drivers/mfd/88pm880-table.c
 create mode 100644 drivers/mfd/88pm886-table.c
 create mode 100644 drivers/mfd/88pm88x-core.c
 create mode 100644 drivers/mfd/88pm88x-i2c.c
 create mode 100644 drivers/mfd/88pm88x-irq.c
 create mode 100644 drivers/mfd/88pm88x.h
 create mode 100644 include/linux/mfd/88pm880-reg.h
 create mode 100644 include/linux/mfd/88pm880.h
 create mode 100644 include/linux/mfd/88pm886-reg.h
 create mode 100644 include/linux/mfd/88pm886.h
 create mode 100644 include/linux/mfd/88pm88x-reg.h
 create mode 100644 include/linux/mfd/88pm88x.h

-- 
1.9.1
