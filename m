From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Tue, 7 Jun 2016 09:37:36 +0900
Message-ID: <20160607003736.GB20591@verge.net.au>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
 <7d19e749-8264-9004-64f4-aefabda699c6@cogentembedded.com>
 <b77ad169-c9d1-4d67-0973-fc9639ddb613@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b77ad169-c9d1-4d67-0973-fc9639ddb613-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 06, 2016 at 09:11:17PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 05/13/2016 12:16 AM, Sergei Shtylyov wrote:
> 
> >>   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
> >>'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
> >>for the R8A7794 SoC based SILK board.
> >>
> >>[1/6] ARM: dts: r8a7794: add audio clocks
> >>[2/6] ARM: dts: r8a7794: add MSTP5 clocks
> >>[3/6] ARM: dts: r8a7794: add MSTP10 clocks
> >>[4/6] ARM: dts: r8a7794: add Audio-DMAC support
> >>[5/6] ARM: dts: r8a7794: add sound support
> >>[6/6] ARM: dts: silk: add sound support
> >
> >   Oops, forgot to mention that patch #5 depends on the R-Car sound patch
> >posted yesterday in order to get interpreted as intended (it uses a disabled
> >SRC node).
> 
>   Simon, that patch has already hit Linus' tree but this series seems to be
> stuck. Please merge!

Hi Sergei,

there seem to be some outstanding review comments for v3 of this patchset.
Could you address them and repost?

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
