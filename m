From: David Bauer <mail@david-bauer.net>
Subject: [PATCH v2 0/3] net: add reset-controller driven PHY reset
Date: Wed, 17 Apr 2019 13:00:29 +0200
Message-ID: <20190417110032.17727-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for a PHY reset driven by a reset-controller.
Currently, only GPIO driven resets are supported by the PHY subsystem.

v2:
 - fixed missed rename of "reset" in at803x.c
 - move initial reset to mdio_device_reset


David Bauer (3):
  dt-bindings: net: add PHY reset controller binding
  net: phy: add support for reset-controller
  net: mdio: rename mdio_device reset to reset_gpio

 Documentation/devicetree/bindings/net/phy.txt |  6 ++++
 drivers/net/phy/at803x.c                      |  2 +-
 drivers/net/phy/mdio_bus.c                    | 32 ++++++++++++++++---
 drivers/net/phy/mdio_device.c                 | 13 ++++++--
 include/linux/mdio.h                          |  3 +-
 5 files changed, 47 insertions(+), 9 deletions(-)

-- 
2.21.0
