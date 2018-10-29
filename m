From: biao huang <biao.huang@mediatek.com>
Subject: Re: [v2, PATCH 0/2] add Ethernet driver support for mt2712
Date: Mon, 29 Oct 2018 11:32:25 +0800
Message-ID: <1540783945.26982.6.camel@mhfsdcap03>
References: <1540782294-27721-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540782294-27721-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net
Cc: robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Mon, 2018-10-29 at 11:04 +0800, Biao Huang wrote:
> The mt2712 Ethernet IP is from Synopsys, so extend stmmac to support mt2712.
> 
sorry, I forgot to add detail descriptions for these patches.

changes in v2:
--since STMMAC driver applied to most Synopsys ip Ethernet, I add
dwmac-mediatek.c to support MediaTek mt2712 in v2.
--abandon Ethernet drivers proposed in v1.
--rewrite dt-binding document for v2 driver.

Best Regards!
