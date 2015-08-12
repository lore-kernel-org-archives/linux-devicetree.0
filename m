From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH V4 0/3] mfd: arizona: Support Cirrus Logic CS47L24 and WM1831
Date: Wed, 12 Aug 2015 12:58:09 +0100
Message-ID: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: sameo@linux.intel.com, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This set of patches adds MFD support for the CS47L24 and WM1831 codecs.

Since there are a few features of the existing codecs that are not present
on the CS47L24/WM1831 the first two patches factor out some small parts of
the suspend/resume handling so that the CS47L24/WM1831 can be added in a
clean, readable way.

There are also some small changes due to the change of manufacturer, the
original Arizona codecs were produced by Wolfson Microelectronics but the
CS47L24 and WM1831 are Cirrus Logic parts.

Richard Fitzgerald (3):
  mfd: arizona: factor out DCVDD isolation control
  mfd: arizona: factor out checking of jack detection state
  mfd: arizona: Support Cirrus Logic CS47L24 and WM1831

 Documentation/devicetree/bindings/mfd/arizona.txt |    6 +-
 drivers/mfd/Kconfig                               |   19 +-
 drivers/mfd/Makefile                              |    3 +
 drivers/mfd/arizona-core.c                        |  220 ++-
 drivers/mfd/arizona-irq.c                         |   40 +-
 drivers/mfd/arizona-spi.c                         |    8 +
 drivers/mfd/arizona.h                             |    4 +
 drivers/mfd/cs47l24-tables.c                      | 1635 +++++++++++++++++++++
 include/linux/mfd/arizona/core.h                  |    3 +
 9 files changed, 1858 insertions(+), 80 deletions(-)
 create mode 100644 drivers/mfd/cs47l24-tables.c

-- 
1.9.1
