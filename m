From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 9/9] ARM: pxa27x: device tree support ICP DAS LP-8x4x
Date: Mon, 9 Dec 2013 17:39:27 +0100
Message-ID: <201312091739.27920.arnd@arndb.de>
References: <1386348542-9584-1-git-send-email-ynvich@gmail.com> <1386602213.7152.180.camel@host5.omatika.ru> <1386604530.7152.184.camel@host5.omatika.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386604530.7152.184.camel-7ZSkjCHmnyFmet/iJI8ZvA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 09 December 2013, Sergei Ianovich wrote:
> anovich wrote:
> > On Mon, 2013-12-09 at 02:47 +0100, Arnd Bergmann wrote:
> > > On Sunday 08 December 2013, Sergei Ianovich wrote:
> > > > +
> > > > +#ifdef CONFIG_PXA27x
> > > > +extern void __init pxa27x_dt_init_irq(void);
> > 
> > > > +static void __init pxa27x_init_early(void)
> > > > +{
> > > > +     pxa27x_skip_init();
> > > > +}
> > > 
> > > I would prefer not to have an init_early function at all, and instead
> > > check "if (of_have_populated_dt())" in pxa27x_init, or to split
> > > that function into two.
> 
> Although this is counterintuitive, it works. Since of_populate_dt() is
> not required for of_have_populated_dt() to return true, should we rename
> of_have_populated_dt() to of_have_dt()?

I don't think it's worth the change. The explanation for the current
terminoligy is that of_unflatten() populates the DT device_node structures
in the kernel from the FTD blob, while of_platform_populate populates the
platform_device infrastructure from the device nodes.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
