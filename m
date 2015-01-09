From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] dts: versatile: add sysregs nodes
Date: Fri, 9 Jan 2015 11:53:37 +0000
Message-ID: <20150109115337.GA18609@red-moon>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
 <1419967718-26909-6-git-send-email-robherring2@gmail.com>
 <CACRpkdbinR3Uvi5zZmQJFxJgnWfvE6JZouMVxxRRGVtMNXkBQQ@mail.gmail.com>
 <CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg@mail.gmail.com>
 <CACRpkdZFxToT5L0sJXap-NQGtjkryn4KTZVnweKCxXL9WvFLEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZFxToT5L0sJXap-NQGtjkryn4KTZVnweKCxXL9WvFLEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc'ing Pawel since he wrote the sysreg code

On Fri, Jan 09, 2015 at 07:10:36AM +0000, Linus Walleij wrote:
> On Fri, Jan 9, 2015 at 12:53 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, Jan 8, 2015 at 1:44 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
> >> On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> compatible = "syscon";
> >
> > maybe? VExpress is missing that then...
> 
> I don't like the way some vexpress stuff has been done I think, just
> not enough reviewing power :(

I think that "syscon" is not meant to be there in the first place and it
was done on purpose for vexpress but I need Pawel to confirm and shed
light on this.

> I've tried to make an as clean separation as possible in the Integrator
> as it has been refactored with a minimum of time pressure and
> I tried to make it as reusable as possible. But it doesn't necessarily
> mean I did the right thing all the time ...
> 
> >>> +                               reg = <0x00000 0x1000>;
> >>> +
> >>> +                               v2m_led_gpios: sys_led@08 {
> >>> +                                       compatible = "arm,vexpress-sysreg,sys_led";
> >>> +                                       gpio-controller;
> >>> +                                       #gpio-cells = <2>;
> >>> +                               };
> >>
> >> These are not GPIOs. These are LED registers really.
> >
> > A register bit that controls an i/o signal sounds like a GPIO to me.
> 
> Are they described as general purpose in the manual for the
> board?
> 
> In the ARM reference design manuals I've seen these bits are
> described as for one purpose only. I mean you can claim the
> memory RE signal is "a bit that controls an I/O signal" as well,
> but we have to think about the abstraction here.

I will have a look into this.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
