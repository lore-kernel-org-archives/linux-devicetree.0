From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH net-next v2 0/4] net: phy: Add AST2600 MDIO support
Date: Wed, 31 Jul 2019 15:09:55 +0930
Message-ID: <20190731053959.16293-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

v2 of the ASPEED MDIO series addresses comments from Rob on the devicetree
bindings and Andrew on the driver itself.

v1 of the series can be found here:

http://patchwork.ozlabs.org/cover/1138140/

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: net: Add aspeed,ast2600-mdio binding
  net: phy: Add mdio-aspeed
  net: ftgmac100: Add support for DT phy-handle property
  net: ftgmac100: Select ASPEED MDIO driver for the AST2600

 .../bindings/net/aspeed,ast2600-mdio.yaml     |  45 +++++
 drivers/net/ethernet/faraday/Kconfig          |   1 +
 drivers/net/ethernet/faraday/ftgmac100.c      |  37 ++++-
 drivers/net/phy/Kconfig                       |  13 ++
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-aspeed.c                 | 157 ++++++++++++++++++
 6 files changed, 250 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
 create mode 100644 drivers/net/phy/mdio-aspeed.c

-- 
2.20.1
