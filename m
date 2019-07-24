From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next 0/3] net: ethernet: mediatek: convert to phylink.
Date: Wed, 24 Jul 2019 21:17:23 +0200
Message-ID: <20190724191725.3903-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Russell King <linux@armlinux.org.uk>, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

These patches converts mediatek driver to phylink api.
SGMII support is only tested with fixed speed of 2.5Gbit on a Bananapi R64.
Frank tested these patches on this Bananapi R64 (mt7622) and
Bananapi R2 (mt7623).
Tested on hardware: mt7621, mt7622 and mt7623.

René van Dorst (3):
  net: ethernet: mediatek: Add basic PHYLINK support
  net: ethernet: mediatek: Re-add support SGMII
  dt-bindings: net: ethernet: Update mt7622 docs and dts to reflect the
    new phylink API

 .../arm/mediatek/mediatek,sgmiisys.txt        |   2 -
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  28 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   1 -
 drivers/net/ethernet/mediatek/Kconfig         |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  |  72 +--
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 486 ++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  67 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c     |  65 ++-
 8 files changed, 436 insertions(+), 287 deletions(-)

To: <netdev@vger.kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: David S. Miller <davem@davemloft.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
-- 
2.20.1
