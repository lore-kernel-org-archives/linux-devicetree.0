From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/7] soc: brcmstb: add wake-timer driver
Date: Fri, 19 Jun 2015 10:36:08 -0700
Message-ID: <20150619173608.GJ4917@ld-irv-0074>
References: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com>
 <1434672696-13632-6-git-send-email-computersforpeace@gmail.com>
 <CADtm3G7qui2Yi6j-pFSGO9sGdHde1hy-c9wAWfQ38Dg8rKq2Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADtm3G7qui2Yi6j-pFSGO9sGdHde1hy-c9wAWfQ38Dg8rKq2Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 07:20:26PM -0700, Gregory Fong wrote:
> On Thu, Jun 18, 2015 at 5:11 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Useful for waking the system from suspend after a specified period of
> > time.
> >
> > This IP could potentially be supported as an RTC driver (for use with
> > the 'rtcwake' utility), but it is not battery backed, so that's not a
> > great fit. Implement a custom sysfs interface instead.
> >
> > Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../ABI/testing/sysfs-driver-wktmr-brcmstb         |  12 +
> >  drivers/soc/brcmstb/Kconfig                        |   3 +
> >  drivers/soc/brcmstb/Makefile                       |   1 +
> >  drivers/soc/brcmstb/wktmr.c                        | 242 +++++++++++++++++++++
> >  4 files changed, 258 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-wktmr-brcmstb
> >  create mode 100644 drivers/soc/brcmstb/wktmr.c
> >
> > diff --git a/Documentation/ABI/testing/sysfs-driver-wktmr-brcmstb b/Documentation/ABI/testing/sysfs-driver-wktmr-brcmstb
> > new file mode 100644
> > index 000000000000..e563f8b8d969
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-wktmr-brcmstb
> > @@ -0,0 +1,12 @@
> > +What:          /sys/bus/platform/drivers/brcm-waketimer/<MMIO-address>.waketimer/timeout
> > +Date:          November 21, 2014
> > +KernelVersion: 3.14
> > +Contact:       Brian Norris <norris-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Shouldn't this be "Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>"?

Indeed, thanks. Wouldn't want things bouncing...

> > +Description:   The control file for the wakeup timer. This integer value
> > +               represents the number of seconds between a suspend operation
> > +               (e.g., S3 suspend-to-RAM) and the time at which the wakeup
> > +               timer should fire.
> > [...]
> > diff --git a/drivers/soc/brcmstb/wktmr.c b/drivers/soc/brcmstb/wktmr.c
> > new file mode 100644
> > index 000000000000..89f989724d3c
> > --- /dev/null
> > +++ b/drivers/soc/brcmstb/wktmr.c
> > @@ -0,0 +1,242 @@
> > [...]
> > +
> > +static void brcmstb_waketmr_set_alarm(struct brcmstb_waketmr *timer,
> > +               unsigned int secs)
> > +{
> > +       unsigned int t;
> 
> Use u32.

Sure.

> > +
> > +       brcmstb_waketmr_clear_alarm(timer);
> > +
> > +       t = readl_relaxed(timer->base + BRCMSTB_WKTMR_COUNTER);
> > +       writel_relaxed(t + secs + 1, timer->base + BRCMSTB_WKTMR_ALARM);
> > +}
> > +
> > [...]
> > +static int brcmstb_waketmr_probe(struct platform_device *pdev)
> > +{
> > [...]
> > +       /*
> > +        * Set wakeup capability before requesting wakeup interrupt, so we can
> > +        * process boot-time "wakeups" (e.g., from S5 soft-off)
> > +        */
> > +       device_set_wakeup_capable(dev, true);
> > +       device_wakeup_enable(dev);
> > +
> > +       timer->irq = platform_get_irq(pdev, 0);
> > +       if ((int)timer->irq < 0)
> 
> Probably better to just have timer->irq be a signed int so you don't
> need this cast.

That's the only place where it needs to be signed. All other APIs are
unsigned, I think. But sure, I can change that.

> > [snip]
> 
> Acked-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks for the review!

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
