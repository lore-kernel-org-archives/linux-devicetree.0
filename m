From: Biao Huang <biao.huang@mediatek.com>
Subject: [v3, PATCH 0/2] add ethernet binding and modify ethernet driver for mt2712
Date: Wed, 19 Dec 2018 15:22:39 +0800
Message-ID: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

changes in v3:
resend this series base on the latest net-next tree.

changes in v2 as comments from Sean:
1. fix typo.
2. use capital letters for RMII/MII/RGMII in driver and bindings.

v1:
This new series is the result of discussion in:
http://lkml.org/lkml/2018/12/13/1007
http://lkml.org/lkml/2018/12/14/53

1. ethernet binding file move to this series.
2. remove fine tune property in device tree
3. remove fine tune flow in ethernet driver
4. set rgmii timing according to the value in device tree,
and don't care whether phy insert internal delay  or not.

Biao Huang (2):
  net-next: dt-binding: dwmac-mediatek: remove fine-tune property
  net-next: stmmac: dwmac-mediatek: remove fine-tune property

 .../devicetree/bindings/net/mediatek-dwmac.txt     |   31 +++------
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |   71 +++++++-------------
 2 files changed, 35 insertions(+), 67 deletions(-)

-- 
1.7.9.5
