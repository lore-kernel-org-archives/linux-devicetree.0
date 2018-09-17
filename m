From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH v2 0/4] net: qcom/emac: add shared mdio bus support
Date: Mon, 17 Sep 2018 16:53:27 +0800
Message-ID: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: timur@kernel.org, andrew@lunn.ch
Cc: davem@davemloft.net, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>, yu.zheng@hxt-semitech.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The emac include MDIO controller, and the motherboard has more than one
PHY connected to an MDIO bus. So share the shared mii_bus for others MAC
device that not has MDIO bus connected. 

Tested: QDF2400 (ACPI), buildin/insmod/rmmod

V2:
 - Separate patch.
 - bindings: s/Since QDF2400 emac/Since emac/

Wang Dongsheng (4):
  net: qcom/emac: split phy_config to mdio bus create and get phy device
  dt-bindings: net: qcom: Add binding for shared mdio bus
  net: qcom/emac: add of shared mdio bus support
  net: qcom/emac: add acpi shared mdio bus support

 .../devicetree/bindings/net/qcom-emac.txt     |   4 +
 drivers/net/ethernet/qualcomm/emac/emac-phy.c | 207 ++++++++++++++----
 drivers/net/ethernet/qualcomm/emac/emac.c     |   8 +-
 3 files changed, 175 insertions(+), 44 deletions(-)

-- 
2.18.0
