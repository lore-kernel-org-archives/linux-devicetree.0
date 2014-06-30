From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/4] Migrate PXA27x platforms to clock framework
Date: Mon, 30 Jun 2014 22:14:57 +0200
Message-ID: <4210399.Q2NclJgeeS@wuerfel>
References: <1404066744-13416-1-git-send-email-robert.jarzmik@free.fr> <7034630.fvV46PN35C@wuerfel> <877g3yp7ie.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <877g3yp7ie.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 30 June 2014 20:38:49 Robert Jarzmik wrote:
> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> > On Sunday 29 June 2014 20:32:20 Robert Jarzmik wrote:
> >> As this serie is holding the rest of the device-tree drivers
> >> port, I'd like it to be reviewed, even it's an old unsexy
> >> platform.
> >
> > I have one basic question about this series: if pxa27x gets moved
> > to used the common-clk framework but the others (pxa25x, pxa26x,
> > pxa3xx, pxa93x) don't, does that imply that they become mutually
> > exclusiv at compile-time?
> 
> Unfortunately yes, they become exclusive.
> The reason being that arch/arm/mach-pxa/clock.c defines the function
> "clk_enable()", which of course is also defined by the clock framework.

Ok. Are you able to make it a compile-time decision whether the old
or the new clock code is used?

That way, you can still build everything together (using the old
code) while you are working on the other SoCs.

> > If so, do you plan to first complete all of them before merging
> > upstream, or do you intend to have one or more kernel releases
> > that don't allow building a combined kernel for all pxa platforms?
> I intend to have first only pxa27x.
> Then in a second stage pxa27x + pxa25x + pxa3xx.
> 
> > I don't object to doing the latter, but if that is the plan, you
> > need to make that very clear in the changelog and have all the
> > relevant maintainers agree to that.
> OK, that would be Haojian then, I think he maintains all PXA platforms.
> 
> Haojian, are you ok with that ? And BTW, does a combined kernel for PXA
> platforms even exists (mixing pxa3xx and pxa2xx for example) ?

You can select all machines at compile-time and get a clean build.
I would also assume that it works fine.

> > Also (for my understanding) when you say that you plan to do
> > pxa25x and pxa3xx next, does that include pxa26x and pxa93x?
> I don't have the Technical Reference Manuals for these ones so the answer is
> no. And Google wasn't a great friend at providing them.

I only looked at the current source code, but pxa26x seems to be
basically identical to pxa25x (no relevant code changes at all)
and pxa93x uses the same code as pxa3xx, apparently the only difference
is the addition of the communication processor.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
