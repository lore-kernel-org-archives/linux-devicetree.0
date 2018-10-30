From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net:stmmac: dwmac-mediatek: add support for mt2712
Date: Tue, 30 Oct 2018 12:56:38 +0100
Message-ID: <20181030115638.GB27873@lunn.ch>
References: <1540782294-27721-1-git-send-email-biao.huang@mediatek.com>
 <1540782294-27721-2-git-send-email-biao.huang@mediatek.com>
 <20181029100828.GA19103@Red>
 <1540883812.26982.15.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540883812.26982.15.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, liguo.zhang@mediatek.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, joabreu@synopsys.com, linux-mediatek@lists.infradead.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > > +	plat_dat->interface = priv_plat->phy_mode;
> > > +	/* clk_csr_i = 250-300MHz & MDC = clk_csr_i/124 */
> > > +	plat_dat->clk_csr = 5;
> > > +	plat_dat->has_gmac4 = 1;
> > > +	plat_dat->has_gmac = 0;
> > > +	plat_dat->pmt = 0;
> > > +	plat_dat->maxmtu = 1500;
> > 
> > ETH_DATA_LEN ?
> how about getting maxmtu from device tree rather than assignment here?

Does it vary between devices? I expect it is a constant, determined by
the DMA hardware design. So no need to make it configurabale.

    Andrew
