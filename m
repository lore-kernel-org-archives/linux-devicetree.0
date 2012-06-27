From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/5] fec driver updates
Date: Wed, 27 Jun 2012 21:45:19 +0800
Message-ID: <1340804724-29410-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Florian Fainelli <florian@openwrt.org>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
* Add one patch to use devm_gpio_request_one
* Have a separate patch to fix phy-reset-gpios property in binding
  document
* Change phy-reset-interval to phy-reset-duration
* Add a sanity check on phy-reset-duration value

Shawn Guo (5):
  net: fec: reset phy after pinctrl setup
  net: fec: enable regulator for fec phy
  net: fec: use managed function devm_gpio_request_one
  net: fec: phy-reset-gpios is optional
  net: fec: add phy-reset-duration for device tree probe

 Documentation/devicetree/bindings/net/fsl-fec.txt |    6 +++-
 drivers/net/ethernet/freescale/fec.c              |   28 ++++++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

-- 
1.7.5.4
