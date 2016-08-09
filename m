From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Tue, 9 Aug 2016 14:38:07 +0200
Message-ID: <20160809123807.GB5878@verge.net.au>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
 <87y44l2uy1.wl%kuninori.morimoto.gx@renesas.com>
 <20160808105901.GH17838@verge.net.au>
 <f2d0ede3-6776-6c50-cdbc-2825295182ce@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f2d0ede3-6776-6c50-cdbc-2825295182ce-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 08, 2016 at 09:54:54PM +0300, Sergei Shtylyov wrote:
> On 08/08/2016 01:59 PM, Simon Horman wrote:
> 
> >>>   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
> >>>'renesas-devel-20160725-v4.7-rc7' tag. I'm adding the sound device tree support
> >>>for the R8A7794 SoC based SILK board.
> >>>
> >>>[1/6] ARM: dts: r8a7794: add audio clocks
> >>>[2/6] ARM: dts: r8a7794: add MSTP5 clocks
> >>>[3/6] ARM: dts: r8a7794: add MSTP10 clocks
> >>>[4/6] ARM: dts: r8a7794: add Audio-DMAC support
> >>>[5/6] ARM: dts: r8a7794: add sound support
> >>>[6/6] ARM: dts: silk: add sound support
> >>
> >>For all patches
> >>
> >>Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> >
> >Thanks, I have queued these up.
> 
>    Great, TY!
>    However, I noticed that the the latest devel tag is said to be still
> based on v4.7-rc7 while in practice it's based on v4.8-rc1...

Thanks for pointing that out, I have fixed it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
