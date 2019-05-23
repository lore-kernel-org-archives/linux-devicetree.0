From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 0/3] net: phy: add interface mode
 PHY_INTERFACE_MODE_USXGMII
Date: Thu, 23 May 2019 20:06:10 +0200
Message-ID: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add support for interface mode USXGMII.

On Freescale boards LS1043A and LS1046A a warning may pop up now
because mode xgmii should be changed to usxgmii (as the used
Aquantia PHY doesn't support XGMII).

Heiner Kallweit (3):
  net: phy: add interface mode PHY_INTERFACE_MODE_USXGMII
  dt-bindings: net: document new usxgmii phy mode
  net: phy: aquantia: add USXGMII support and warn if XGMII mode is set

 Documentation/devicetree/bindings/net/ethernet.txt | 1 +
 drivers/net/phy/aquantia_main.c                    | 8 ++++++++
 include/linux/phy.h                                | 3 +++
 3 files changed, 12 insertions(+)

-- 
2.21.0
