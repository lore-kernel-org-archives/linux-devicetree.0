From: Biao Huang <biao.huang@mediatek.com>
Subject: [v4, PATCH 0/2] add Ethernet driver support for mt2712
Date: Tue, 20 Nov 2018 17:21:34 +0800
Message-ID: <1542705696-18507-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Changes in v4:
modifications according to comments from Rob and Sean:
1. call clk_bulk api to simplify clk settings.
2. add prefix for mediatek specified properties
3. evolution to a more general driver
