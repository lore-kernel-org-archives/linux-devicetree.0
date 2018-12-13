From: David Miller <davem@davemloft.net>
Subject: Re: [v7, PATCH 0/2] add Ethernet driver support for mt2712
Date: Wed, 12 Dec 2018 21:40:54 -0800 (PST)
Message-ID: <20181212.214054.1923431319770488052.davem@davemloft.net>
References: <1544666173-5121-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544666173-5121-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Thu, 13 Dec 2018 09:56:11 +0800

> Changes in v7:
> Add MODULE_LICENSE info in driver.

Biao, I said I need a "fixup" patch, not the whole series again.

I've already applied your patches, and you need to send me a small
fix on top.

This shows that you are not generating your patches against my
net-next tree properly.  If you were, you would see that I applied
your changes already.
