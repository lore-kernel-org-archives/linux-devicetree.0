From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/2] regulator: add support for mxs regulator
Date: Sat, 27 Sep 2014 00:59:46 +0000
Message-ID: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, shawn.guo@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: festevam@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for Freescale i.MX23, i.xM28
on-chip regulators: vddd, vdda, vddio

This driver based on the Freescale high level [1] and low level 
driver [2], but contains the following changes:

* devicetree support
* fix for regulator modes
* drop support for overall_current and brown out
* replace udelay() with schedule()
* code cleanup

The code has been tested on a I2SE Duckbill.

[1] - http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/regulator/mxs-regulator.c?h=imx_2.6.35_maintain
[2] - http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/arch/arm/mach-mx28/power.c?h=imx_2.6.35_maintain

Stefan Wahren (2):
  DT: add binding for mxs regulator
  regulator: add mxs regulator driver

 .../bindings/regulator/mxs-regulator.txt           |   36 ++
 drivers/regulator/Kconfig                          |   11 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mxs-regulator.c                  |  395 ++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt
 create mode 100644 drivers/regulator/mxs-regulator.c

-- 
1.7.9.5
