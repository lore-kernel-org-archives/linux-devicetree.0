From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 1/7] MIPS: lantiq: dma: add dev pointer
Date: Sat, 1 Sep 2018 16:57:00 +0200
Message-ID: <20180901145700.GB6305@lunn.ch>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901114535.9070-2-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180901114535.9070-2-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 01, 2018 at 01:45:29PM +0200, Hauke Mehrtens wrote:
> dma_zalloc_coherent() now crashes if no dev pointer is given.
> Add a dev pointer to the ltq_dma_channel structure and fill it in the
> driver using it.
> 
> This fixes a bug introduced in kernel 4.19.

Hi Hauke

Should this be added to stable so that it appears in 4.19-rcX?  If so,
please send it to net, not net-next.

       Andrew
