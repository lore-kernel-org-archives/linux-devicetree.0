From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: porter: add sound support
Date: Tue, 26 Jan 2016 09:43:10 +0900
Message-ID: <20160126004310.GJ26945@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <1872468.4EonQLNEFn@wasted.cogentembedded.com>
 <87k2mya48g.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87k2mya48g.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2016 at 12:35:57AM +0000, Kuninori Morimoto wrote:
> 
> Hi
> 
> > Define the Porter board dependent part of the R8A7791 sound device node.
> > Add device node for Asahi Kasei AK4642 stereo codec  to the I2C2 bus.
> > Add the "simple-audio-card" device node to interconnect the SoC sound
> > device  and the codec.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, I have queued this up.

> > +/*
> > + * SSI-AK4642
> > + *
> > + * SW3: 1: AK4642
> > + *      3: ADV7511
> 
> This is no a big deal, but according to my schematic,
> porter is using JP3, not SW3, but no one cares ;P

Sergei, please feel free to provide a follow-up patch to address this.
