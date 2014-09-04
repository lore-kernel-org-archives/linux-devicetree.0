From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 1/3] RTC: RK808: add RTC driver for RK808
Date: Thu, 4 Sep 2014 13:08:44 -0700
Message-ID: <20140904200843.GF10224@core.coreip.homeip.net>
References: <1409793159-2573-1-git-send-email-zyw@rock-chips.com>
 <1409793159-2573-2-git-send-email-zyw@rock-chips.com>
 <CAD=FV=U8XK945vJTnsY8FG3+WasOrMnoCYOF+b360HTyXVccfw@mail.gmail.com>
 <20140904173300.GC10224@core.coreip.homeip.net>
 <CAD=FV=VDG=PteMYCkju1GGpK1CNLZeY8precPJkgxYY4udD-eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VDG=PteMYCkju1GGpK1CNLZeY8precPJkgxYY4udD-eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xx
List-Id: devicetree@vger.kernel.org

On Thu, Sep 04, 2014 at 12:04:11PM -0700, Doug Anderson wrote:
> Dmitry,
> 
> On Thu, Sep 4, 2014 at 10:33 AM, Dmitry Torokhov
> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Sep 03, 2014 at 09:18:42PM -0700, Doug Anderson wrote:
> >> Chris,
> >>
> >> On Wed, Sep 3, 2014 at 6:12 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> >> > Adding RTC driver for supporting RTC device present inside RK808 PMIC.
> >> >
> >> > Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> > Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> >
> >> > Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >>
> >> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>
> >>
> >> > +       rk808_rtc->irq = platform_get_irq(pdev, 0);
> >> > +       if (rk808_rtc->irq < 0) {
> >> > +               dev_err(&pdev->dev, "Wake up is not possible as irq = %d\n",
> >> > +                       rk808_rtc->irq);
> >>
> >> Technically you shouldn't print the error if it's -EPROBE_DEFER.
> >> ...but I think that's really unlikely here (I can't imagine any real
> >> cases where the interrupt parent for RK808 would actually be deferred)
> >> so I won't push it.
> >
> > Doug, platform_get_irq() simply iterates through IRQ resources assigned to the
> > device, which are populated at platform device creation time. The only error it
> > returns ever is -ENXIO, so we are fine here.
> 
> I think maybe you're looking at older source code?  The source code I
> have for mainline Linux specifically includes code handling
> EPROBE_DEFER in platform_get_irq().

Ah, indeed. That -EPROBE_DEFER monstrosity keeps spreading :(

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
