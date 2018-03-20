From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 0/2] GE Healthcare PPD firmware upgrade driver for ACHC
Date: Tue, 20 Mar 2018 18:21:59 +0100
Message-ID: <20180320172201.2065-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

Hi,

The PPD has a secondary processor from NXP, which can be programmed
from the main system. It is connected to the main processor by having
it's EzPort interface connected to the SPI bus.

This adds a generic driver to handle firmware flashing via NXP EzPort
and adds a custom compatible for the instance found in GE's device.
The reset gpio is only requested during flashing, since it is also
used for resetting other devices. A better solution for the shared
reset gpio is required at some point, but this does neither affect
the userspace interface, nor the DT interface and should not block
upstreaming this driver.

-- Sebastian

Sebastian Reichel (2):
  misc: ezport-firmware: new driver
  ARM: dts: imx53: PPD: Update ACHC programming interface

 Documentation/devicetree/bindings/misc/ge-achc.txt |  19 +-
 arch/arm/boot/dts/imx53-ppd.dts                    |   5 +-
 drivers/misc/Kconfig                               |   9 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ezport-firmware.c                     | 487 +++++++++++++++++++++
 5 files changed, 516 insertions(+), 5 deletions(-)
 create mode 100644 drivers/misc/ezport-firmware.c

-- 
2.16.2
