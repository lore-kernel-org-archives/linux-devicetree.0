From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
Date: Fri, 2 Sep 2016 10:19:25 +0200
Message-ID: <20160902081925.GC16669@verge.net.au>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637850-15053-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <87d1knumv9.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87d1knumv9.wl%kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 01:19:49AM +0000, Kuninori Morimoto wrote:
> 
> Hi Vladimir
> 
> > This supports SSI sound for H3ULCB board.
> > SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > ---
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> 
> > +	audio_clkout: audio_clkout {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <11289600>;
> > +	};
> 
> I think having commont for AUDIO_CLKOUT is better for user, like Salvator-X.
> This "audio_clkout" is dummy. Actually, we don't need this dummy clock,
> and we should use "<&rcar_sound 0>" as AUDIO_CLKOUT,
> like AUDIO_CLKOUT3 as "<&rcar_sound 3>" which is used on ak4613. 
> But Salvator-X and this ULCB board has very complex connection,
> especially around CS2000.
> This means cs2000 requests rcar_sound, and rcar_sound requests cs2000.
> This audio_clkout exist to avoid probe dead-lock.
> This is the reason why audio_clkout and rcar_sound::clock-frequency
> has same value.

Vladimir,

please address the above and include it when you repost the patches
that I haven't queued up.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
