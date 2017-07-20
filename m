From: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Subject: Test of [PATCH 1/1] staging: pi433: fix problem with division in
 rf69_set_deviation
Date: Thu, 20 Jul 2017 17:57:30 +0200 (CEST)
Message-ID: <40815037.7071.1500566250933@ox.hosteurope.de>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
 <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, driverdevel <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

Since I don't have an environment for m68k and I would appreciate not
having to set it up, I would be very happy, if someone could give
the patch, named in the subjext, a try on ARCH=m68k...

Thanks,

Marcus



> Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> hat am 20. Juli 2017 um 14:27
> geschrieben:
>
>
> Hi Dan,
>
> On Thu, Jul 20, 2017 at 1:37 PM, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> wrote:
> > On Thu, Jul 20, 2017 at 01:23:05PM +0200, Marcus Wolf wrote:
> >> below you can see the report with the error on m68k. It was sent to me from
> >> a
> >> test robot of intel.
> >>
> >> According to my research, this problem occured, because there is no
> >> hardware
> >> support for floating point on the m68k (or it was configured not to use
> >> it).
> >> Therefore gcc uses an internal function, provided by libgcc. Obviously
> >> libgcc
> >> wasn't linked...
> >>
> >> I don't know how to come arround this problem by modifying my code (except
> >> reducing the accuracy of the calculation by not using floating point).
> >
> > I don't see any floating point? You're not allowed to use floating
> > point in the kernel.
>
> Indeed. __udivdi3 is used for 64-bit by 32-bit division.
>
> >> Can we ignore the error or can I do something else?
> >> Maybe a special include just in case of m68k can help??!?
> >> I don't have an environment for building m68k.
>
> https://www.kernel.org/pub/tools/crosstool/
>
> > I think the answer is to use div_u64() and div64_u64 instead of
> > do_div()?
>
> do_div() is fine
> The link error is not caused by do_div(), but by not using do_div() where
> needed.
>
> > Or you could just add a depend in the Kconfig.
>
> Depend on what? !M68K? It's gonna fail on several 32-bit platforms.
> Gr{oetje,eeting}s,
>
> Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like
> that.
> -- Linus Torvalds
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
