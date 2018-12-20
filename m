From: David Miller <davem@davemloft.net>
Subject: Re: [v3, PATCH 0/2] add ethernet binding and modify ethernet
 driver for mt2712
Date: Wed, 19 Dec 2018 16:25:12 -0800 (PST)
Message-ID: <20181219.162512.2128297455575722871.davem@davemloft.net>
References: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545204161-15742-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Wed, 19 Dec 2018 15:22:39 +0800

> changes in v3:
> resend this series base on the latest net-next tree.
> 
> changes in v2 as comments from Sean:
> 1. fix typo.
> 2. use capital letters for RMII/MII/RGMII in driver and bindings.
> 
> v1:
> This new series is the result of discussion in:
> http://lkml.org/lkml/2018/12/13/1007
> http://lkml.org/lkml/2018/12/14/53
> 
> 1. ethernet binding file move to this series.
> 2. remove fine tune property in device tree
> 3. remove fine tune flow in ethernet driver
> 4. set rgmii timing according to the value in device tree,
> and don't care whether phy insert internal delay  or not.

Series applied.
