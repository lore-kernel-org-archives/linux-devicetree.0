From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] net: phy: Add AST2600 MDIO support
Date: Mon, 29 Jul 2019 14:09:22 +0930
Message-ID: <20190729043926.32679-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds support for the MDIO controllers found in the AST2600. In the
AST2500 and earlier the MDIO controller was embedded in the MAC; this has now
been separated out and the register interface rearranged (again).

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: net: Add aspeed,ast2600-mdio binding
  net: phy: Add mdio-aspeed
  net: ftgmac100: Add support for DT phy-handle property
  net: ftgmac100: Select ASPEED MDIO driver for the AST2600

 .../bindings/net/aspeed,ast2600-mdio.yaml     |  61 +++++++
 drivers/net/ethernet/faraday/Kconfig          |   1 +
 drivers/net/ethernet/faraday/ftgmac100.c      |  37 +++-
 drivers/net/phy/Kconfig                       |  13 ++
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-aspeed.c                 | 159 ++++++++++++++++++
 6 files changed, 268 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
 create mode 100644 drivers/net/phy/mdio-aspeed.c

-- 
2.20.1
