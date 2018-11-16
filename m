From: Biao Huang <biao.huang@mediatek.com>
Subject: [v3, PATCH 0/2] add Ethernet driver support for mt2712
Date: Fri, 16 Nov 2018 17:26:15 +0800
Message-ID: <1542360377-29047-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

modifications according to comments from Corentin and Andrew:
1. fix comment style
2. add COMPILE_TEST || ARCH_MEDIATEK in Kconfig file
3. replace pr_err with dev_err
4. add binding document for properties: tx-delay/rx-delay/fine-tune etc.
