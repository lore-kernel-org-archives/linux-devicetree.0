From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: berlin4ct: switch to Cortex-A53 specific pmu
 nodes
Date: Tue, 15 Dec 2015 14:52:43 +0000
Message-ID: <20151215145243.GB7041@leverpostej>
References: <1450190172-1161-1-git-send-email-jszhang@marvell.com>
 <8261316.NuheDtlQ6N@wuerfel>
 <20151215224709.2d71d2ba@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151215224709.2d71d2ba@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 10:47:09PM +0800, Jisheng Zhang wrote:
> Dear Arnd,
> 
> On Tue, 15 Dec 2015 15:43:53 +0100 Arnd Bergmann wrote:
> 
> > On Tuesday 15 December 2015 22:36:12 Jisheng Zhang wrote:
> > > -               compatible = "arm,armv8-pmuv3";
> > > +               compatible = "arm,cortex-a53-pmu";
> > >   
> > 
> > Should this list both?
> 
> IMHO, we don't need to list both. The pmu binding document also says:
> "compatible : should be one of ...."
> 
> Dear Mark,
> 
> Could you please give suggestions?

That should probably reads as "should contain at least one of".

It's probably best to keep "arm,armv8-pmuv3" as a fallback in the
compatible list.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
