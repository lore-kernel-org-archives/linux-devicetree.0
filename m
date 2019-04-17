From: David Bauer <mail@david-bauer.net>
Subject: [PATCH v3 0/3] net: add reset-controller driven PHY reset
Date: Wed, 17 Apr 2019 23:59:19 +0200
Message-ID: <20190417215922.30472-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for a PHY reset driven by a reset-controller.
Currently, only GPIO driven resets are supported by the PHY subsystem.
It also renames the reset-gpio from 'reset' to 'reset_gpio' to
better differentiate between resets wired to a GPIO and resets wired to
a reset-controller driven pin.

Some systems have the PHY reset-line wired to a pin controlled by a
reset-controller (eg. some Atheros AR9132 based boards). In case the
bootloader asserts reset before loading the kernel, we currently do not
have a clean way of deasserting reset to probe the PHY.

v3:
 - add missing newline in mdio_bus.c

v2:
 - fixed missed rename of "reset" in at803x.c
 - move initial reset to mdio_device_reset


David Bauer (3):
  dt-bindings: net: add PHY reset controller binding
  net: phy: add support for reset-controller
  net: mdio: rename mdio_device reset to reset_gpio

 Documentation/devicetree/bindings/net/phy.txt |  6 ++++
 drivers/net/phy/at803x.c                      |  2 +-
 drivers/net/phy/mdio_bus.c                    | 33 ++++++++++++++++---
 drivers/net/phy/mdio_device.c                 | 13 ++++++--
 include/linux/mdio.h                          |  3 +-
 5 files changed, 48 insertions(+), 9 deletions(-)

-- 
2.21.0
