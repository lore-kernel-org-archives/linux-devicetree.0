From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 0/2] NET: PHY: Add PHY LED control binding.
Date: Sun,  5 Jun 2016 23:45:48 +0200
Message-ID: <1465163150-21429-1-git-send-email-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: f.fainelli@gmail.com
Cc: alexander.stein@systec-electronic.com, netdev@vger.kernel.org, andrew@lunn.ch, john@phrozen.org, openwrt@kresin.me, hauke.mehrtens@intel.com, daniel.schwierzeck@gmail.com, eckert.florian@googlemail.com, devicetree@vger.kernel.org, thomas.langer@intel.com, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

This is now spitted out of the patch series that adds support the 
Ethernet PHY. The second patch depends on the Ethernet PHY code which I 
send before. How should this get merged, or should I split this in a 
different way?

Hauke Mehrtens (2):
  NET: PHY: Add PHY LED control binding.
  NET: PHY: Intel XWAY: add LED configuration support

 .../devicetree/bindings/phy/intel-xway.txt         |  77 +++++++++++
 Documentation/devicetree/bindings/phy/phy-leds.txt |  52 +++++++
 drivers/net/phy/intel-xway.c                       | 152 +++++++++++++++++++++
 include/dt-bindings/phy/phy-leds.h                 |  27 ++++
 4 files changed, 308 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/intel-xway.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-leds.txt
 create mode 100644 include/dt-bindings/phy/phy-leds.h

-- 
2.8.1
