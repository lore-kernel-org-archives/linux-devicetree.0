From: Yuiko Oshino <yuiko.oshino@microchip.com>
Subject: [PATCH v3 net-next 0/2] Add support for Microchip Technology KSZ9131 10/100/1000 Ethernet PHY
Date: Thu, 18 Oct 2018 15:06:00 -0400
Message-ID: <1539889562-21458-1-git-send-email-yuiko.oshino@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, m.felsch@pengutronix.de, Markus.Niebel@tqs.de, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org


This is the initial driver for Microchip KSZ9131 10/100/1000 Ethernet PHY

v3:
- KSZ9131 uses picosecond units for values of devicetree properties.
- rewrite micrel.c and micrel-ksz90x1.txt to use the picosecond values.
v2:
- Creating a series from two related patches.

Yuiko Oshino (2):
  net: phy: micrel: add Microchip KSZ9131 initial driver
  dt-bindings: net: add support for Microchip KSZ9131

 .../devicetree/bindings/net/micrel-ksz90x1.txt     |  28 ++++-
 drivers/net/phy/micrel.c                           | 130 ++++++++++++++++++++-
 include/linux/micrel_phy.h                         |   1 +
 3 files changed, 157 insertions(+), 2 deletions(-)

-- 
2.7.4
