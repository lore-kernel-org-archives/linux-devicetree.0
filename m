From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/2] net: stmmac: dwmac-meson: 100M phy mode support for AXG SoC
Date: Thu, 26 Apr 2018 16:05:06 +0000
Message-ID: <20180426160508.29380-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Due to the dwmac glue layer register changed, we need to 
introduce a new compatible name for the Meson-AXG SoC
to support for the RMII 100M ethernet PHY.

Yixun Lan (2):
  dt-bindings: net: meson-dwmac: new compatible name for AXG SoC
  net: stmmac: dwmac-meson: extend phy mode setting

 .../devicetree/bindings/net/meson-dwmac.txt   |  1 +
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 96 ++++++++++++++++---
 2 files changed, 86 insertions(+), 11 deletions(-)

-- 
2.17.0
