From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [RFC v3 0/3] NET: PHY: Intel XWAY driver
Date: Sat,  4 Jun 2016 13:45:25 +0200
Message-ID: <1465040728-4904-1-git-send-email-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: f.fainelli@gmail.com
Cc: alexander.stein@systec-electronic.com, netdev@vger.kernel.org, andrew@lunn.ch, john@phrozen.org, openwrt@kresin.me, hauke.mehrtens@intel.com, daniel.schwierzeck@gmail.com, eckert.florian@googlemail.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

This adds the Intel XWAY driver and also adds a device tree binding for 
Ethernet PHY LEDs.

changes since
RFC v2:
 * add Documentation/devicetree/bindings/phy/intel-xway.txt
 * fixed some typos
 * renamed from lantiq.c to intel-xway.c
 * split the generic PHY binding information out

Hauke Mehrtens (3):
  NET: PHY: adds driver for Intel XWAY PHY
  NET: PHY: Add PHY LED control binding.
  NET: PHY: Intel XWAY: add LED configuration support

 .../devicetree/bindings/phy/intel-xway.txt         |  77 +++
 Documentation/devicetree/bindings/phy/phy-leds.txt |  52 ++
 drivers/net/phy/Kconfig                            |   6 +
 drivers/net/phy/Makefile                           |   1 +
 drivers/net/phy/intel-xway.c                       | 541 +++++++++++++++++++++
 include/dt-bindings/phy/phy-leds.h                 |  27 +
 6 files changed, 704 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/intel-xway.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-leds.txt
 create mode 100644 drivers/net/phy/intel-xway.c
 create mode 100644 include/dt-bindings/phy/phy-leds.h

-- 
2.8.1
