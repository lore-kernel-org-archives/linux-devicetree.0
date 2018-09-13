From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH 0/2] net: qcom/emac: add shared mdio bus support
Date: Thu, 13 Sep 2018 17:04:51 +0800
Message-ID: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: timur@kernel.org
Cc: davem@davemloft.net, yu.zheng@hxt-semitech.com, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Share the mii_bus for others MAC device because QDF2400 emac
include MDIO, and the motherboard has more than one PHY connected
to an MDIO bus.

Tested: QDF2400 (ACPI), buildin/insmod/rmmod

Wang Dongsheng (2):
  dt-bindings: net: qcom: Add binding for shared mdio bus
  net: qcom/emac: add shared mdio bus support

 .../devicetree/bindings/net/qcom-emac.txt     |   4 +
 drivers/net/ethernet/qualcomm/emac/emac-phy.c | 211 ++++++++++++++----
 drivers/net/ethernet/qualcomm/emac/emac.c     |   7 +-
 3 files changed, 178 insertions(+), 44 deletions(-)

-- 
2.18.0
