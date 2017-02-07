From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Date: Mon, 6 Feb 2017 17:03:08 -0800
Message-ID: <20170207010308.GN25384@codeaurora.org>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <20170203034012.29399-5-chris.packham@alliedtelesis.co.nz>
 <20170206231400.GM25384@codeaurora.org>
 <9974653ab84040c3b12fad075790c123@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9974653ab84040c3b12fad075790c123-5g7mGxlPNYb6GjIOKuZY+ItlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/06, Chris Packham wrote:
> On 07/02/17 12:14, Stephen Boyd wrote:
> > On 02/03, Chris Packham wrote:
> >> The initial implementation in commit e120c17a70e5 ("clk: mvebu: support
> >> for 98DX3236 SoC") hardcoded a fixed value for the main PLL frequency.
> >> Port code from the Marvell supplied Linux kernel to support different
> >> PLL frequencies and provide clock gating support.
> >>
> >> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/clock/mvebu-core-clock.txt |   7 +
> >>  .../bindings/clock/mvebu-gated-clock.txt           |  11 ++
> >>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  14 +-
> >>  drivers/clk/mvebu/Makefile                         |   2 +-
> >>  drivers/clk/mvebu/armada-xp.c                      |  13 --
> >>  drivers/clk/mvebu/mv98dx3236.c                     | 144 +++++++++++++++++++++
> >
> > This mixes dts and clk driver changes. Any chance it can be split
> > up and just have the clk part go through clk tree? Otherwise, I
> > can ack this if you want to take it all through arm-soc?
> 
> I'm happy to split it if it will make life easier.
> 

Well do things keep booting if the clk driver parts merge without
the associated dts changes? It's nice to maintain backwards
compatibility even for a short time to make the merge path
easier.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
