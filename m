From: Harini Katakam <harini.katakam@xilinx.com>
Subject: [RFC PATCH 0/2] Macb SGMII status poll thread
Date: Wed, 31 Jul 2019 15:10:31 +0530
Message-ID: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, davem@davemloft.net, claudiu.beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, harinikatakamlinux@gmail.com, harini.katakam@xilinx.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When PS GEM is used with SGMII mode without an external PHY
on board, add a link status reporting mechanism.

Harini Katakam (2):
  dt-bindings: net: macb: Add new property for PS SGMII only
  net: macb: Add SGMII poll thread

 Documentation/devicetree/bindings/net/macb.txt |  4 ++
 drivers/net/ethernet/cadence/macb.h            |  8 ++++
 drivers/net/ethernet/cadence/macb_main.c       | 65 ++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.7.4
