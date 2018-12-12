From: Biao Huang <biao.huang@mediatek.com>
Subject: [v6, PATCH 0/2] add Ethernet driver support for mt2712
Date: Wed, 12 Dec 2018 17:35:30 +0800
Message-ID: <1544607332-29921-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Changes in v6:
 modifications according to comments from Rob/Andrew/Sean:
 1. use delay_ps instead of delay stage.
 2. add comments in driver to avoid confusion.
 2. rewrite set_delay function.
 3. modify binding document for properties: tx-delay-ps/rx-delay-ps/pericfg etc.

Biao Huang (2):
  net:stmmac: dwmac-mediatek: add support for mt2712
  dt-binding: mediatek-dwmac: add binding document for MediaTek MT2712
    DWMAC

 .../devicetree/bindings/net/mediatek-dwmac.txt     |   87 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |    8 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |    1 +
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |  408 ++++++++++++++++++++ 
 4 files changed, 504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

--
1.7.9.5
