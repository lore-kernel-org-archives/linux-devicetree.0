From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 0/4] add dsa switch support for ar9331
Date: Mon, 14 Oct 2019 08:15:45 +0200
Message-ID: <20191014061549.3669-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Chris Snook <chris.snook@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <jhogan@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Vivien Didelot <vivien.didelot@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series provides dsa switch support for Atheros ar9331 WiSoC.
As side effect ag71xx needed to be ported to phylink to make the switch
driver (as well phylink based) work properly.

Oleksij Rempel (4):
  net: ag71xx: port to phylink
  dt-bindings: net: dsa: qca,ar9331 switch documentation
  MIPS: ath79: ar9331: add ar9331-switch node
  net: dsa: add support for Atheros AR9331 build-in switch

 .../devicetree/bindings/net/dsa/ar9331.txt    | 155 ++++
 arch/mips/boot/dts/qca/ar9331.dtsi            | 128 ++-
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |  13 +
 drivers/net/dsa/Kconfig                       |   2 +
 drivers/net/dsa/Makefile                      |   1 +
 drivers/net/dsa/qca/Kconfig                   |  11 +
 drivers/net/dsa/qca/Makefile                  |   2 +
 drivers/net/dsa/qca/ar9331.c                  | 822 ++++++++++++++++++
 drivers/net/ethernet/atheros/Kconfig          |   2 +-
 drivers/net/ethernet/atheros/ag71xx.c         | 144 +--
 include/net/dsa.h                             |   2 +
 net/dsa/Kconfig                               |   6 +
 net/dsa/Makefile                              |   1 +
 net/dsa/tag_ar9331.c                          |  97 +++
 14 files changed, 1324 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/ar9331.txt
 create mode 100644 drivers/net/dsa/qca/Kconfig
 create mode 100644 drivers/net/dsa/qca/Makefile
 create mode 100644 drivers/net/dsa/qca/ar9331.c
 create mode 100644 net/dsa/tag_ar9331.c

-- 
2.23.0
