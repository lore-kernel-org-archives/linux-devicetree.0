From: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Subject: [PATCH net-next] net: phy: Add LED mode driver for Microsemi PHYs
Date: Tue, 31 Jan 2017 11:16:00 +0530
Message-ID: <1485841561-32056-1-git-send-email-Raju.Lakkaraju@microsemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: f.fainelli@gmail.com, Allan.Nielsen@microsemi.com, andrew@lunn.ch, Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
List-Id: devicetree@vger.kernel.org

From: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>

LED Mode:
Microsemi PHY support 2 LEDs (LED[0] and LED[1]) to display different
status information that can be selected by setting LED mode.

LED Mode parameter (vddmac, led-0-mode) and (vddmac, led-1-mode) get
from Device Tree.

Tested on Beaglebone Black with VSC 8531 PHY.

Signed-off-by: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>

Raju Lakkaraju (1):
  net: phy: Add LED mode driver for Microsemi PHYs.

 .../devicetree/bindings/net/mscc-phy-vsc8531.txt   | 39 ++++++++++++
 drivers/net/phy/mscc.c                             | 72 ++++++++++++++++++++++
 2 files changed, 111 insertions(+)

-- 
2.7.4
