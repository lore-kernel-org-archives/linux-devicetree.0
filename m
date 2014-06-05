From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 5/7] ARM: shmobile: r8a7791 dtsi: Add SYS-DMAC0 and SYS-DMAC1 nodes
Date: Thu, 05 Jun 2014 14:37:24 +0200
Message-ID: <3309154.oqbpVVpMgz@avalon>
References: <1401716531-29794-1-git-send-email-geert+renesas@glider.be> <2440127.sDc7m91LPu@avalon> <871tv4jjkh.wl%kuninori.morimoto.gx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <871tv4jjkh.wl%kuninori.morimoto.gx@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Morimoto-san,

On Wednesday 04 June 2014 17:17:53 Kuninori Morimoto wrote:
> Hi Laurent
> 
> > > Add nodes for the SYS-DMA controllers, SYS-DMAC0 and SYS-DMAC1. These
> > > both share the same device sources, so are wrapped in the shdma-mux
> > > node to allow both to be used.
> > > 
> > > Cfr. the r8a7790 version by Ben Dooks.
> > > 
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> 
> (snip)
> 
> > > +		sysdma0: dma-controller@e6700020 {
> > > +			compatible = "renesas,shdma-r8a7791";
> > > +			reg = <0 0xe6700020 0 0xffc0>;
> > 
> > Even though the registered defined in the datasheet start at 0xe6700020,
> > the documentation clearly states that "The base address of registers for
> > the lower-numbered channels  (0 to 14) is H'E670 0000". I'm also
> > wondering where the size comes from, if you want to span the 0xe6700000
> > to 0xe670ffff range, the size should be 0xffe0, not 0xffc0.
> 
> Unfortunately, this mapping (form 0x20) is required from driver
> for historical reasons.
> So, driver setting needs to care about it.
> Please check DMA_CHANNEL macro for each setup-xxx.c

Right, but that doesn't mean we shouldn't fix that while we still can :-) For 
the r8a73a4 we're probably stuck (I won't reiterate here my view of 
considering DT bindings as stable when it's clear they haven't gone through 
proper review), but before we add support for new SoCs I'd like to see to 
problems being fixed.

> # but, it works without care about it (?)
> # becase there are mirror register there (?), I'm not sure detail

-- 
Regards,

Laurent Pinchart

