From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V3 0/4]  pv88080: PV88080 driver submission
Date: Fri, 18 Nov 2016 09:35:47 +0900
Message-ID: <cover.1479429347.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

From: Eric Jeong <eric.jeong.opensource@diasemi.com>

This patch set adds support for the PV88080 PMIC.
And, this patch is done as part of the existing PV88080 Regulator
driver by expanding the driver for GPIO function support.

In this patch set the following is provided:

[PATCH V3 1/4] Move binding document
[PATCH V3 2/4] MFD core support
[PATCH V3 3/4] Update regulator driver for MFD support
[PATCH V3 4/4] Add GPIO function support

This patch applies against linux-next and next-20161117

Thank you,
Eric Jeong, Dialog Semiconductor Ltd.

Eric Jeong (4):
  Documentation: pv88080: Move binding document
  mfd: pv88080: MFD core support
  regulator: pv88080: Update Regulator driver for MFD support
  gpio: pv88080: Add GPIO function support

 .../bindings/{regulator => mfd}/pv88080.txt        |   16 +-
 drivers/gpio/Kconfig                               |   11 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-pv88080.c                        |  213 +++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/pv88080.c                              |  331 ++++++++++++++++++++
 drivers/regulator/Kconfig                          |    9 +-
 drivers/regulator/pv88080-regulator.c              |  185 ++++-------
 drivers/regulator/pv88080-regulator.h              |  118 -------
 include/linux/mfd/pv88080.h                        |  222 +++++++++++++
 11 files changed, 872 insertions(+), 247 deletions(-)
 rename Documentation/devicetree/bindings/{regulator => mfd}/pv88080.txt (79%)
 create mode 100644 drivers/gpio/gpio-pv88080.c
 create mode 100644 drivers/mfd/pv88080.c
 delete mode 100644 drivers/regulator/pv88080-regulator.h
 create mode 100644 include/linux/mfd/pv88080.h

-- 
end-of-patch for PATCH V3

