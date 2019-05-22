From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/2] net: phy: add interface mode
 PHY_INTERFACE_MODE_USXGMII
Date: Wed, 22 May 2019 21:56:14 +0200
Message-ID: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add mode USXGMII and change places where so far (incorrectly) XGMII
was used instead.

Heiner Kallweit (2):
  net: phy: add interface mode PHY_INTERFACE_MODE_USXGMII
  net: phy: aquantia: add USXGMII support

 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 2 +-
 drivers/net/phy/aquantia_main.c                   | 6 +++++-
 include/linux/phy.h                               | 3 +++
 4 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.21.0
