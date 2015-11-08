From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom NSP
Date: Sun, 8 Nov 2015 11:36:45 -0800
Message-ID: <CAGVrzcb_c9y6WbV0XoO7rHe6urEXUhCTtD3XieL7E6FHUnS=PQ@mail.gmail.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com> <563E6FC7.6070700@gmail.com>
 <20151108173116.GV8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151108173116.GV8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-11-08 9:31 GMT-08:00 Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>:

>> Is it really how the ROM code is implemented, as a pen holding/release
>> mechanism (which sounds like how this was implemented previously in the
>> kernel actually) or should this be described in a more generic way as
>> the physical address of the register where the secondary CPUs reset
>> vector address must be written to? Or something along these lines.
>
> Why do people insist on using holding pens to bring their secondary CPUs
> into existence?  I hope the hardware people aren't being dumb and have no
> way to hold in reset or power down their secondary CPUs, either of which
> is a vital feature for things like kexec and the like.  If they do have
> a way to hold secondary CPUs in reset or powered down, why aren't they
> using that at boot instead of implementing the stupid Versatile scheme,
> which exists because Versatile _can't_ hold its CPUs in reset or power
> them down...

There are few implementations out there which suffer from this same
mistake (mostly MIPS implementations) but that is not really relevant
here. Most of the time this comes from not understanding software
models and/or not properly taking into account a complex (too complex)
reset model.

>
> It's times like this that I wonder what kind of drugs the hardware SoC
> people are on, but I'm well aware that people contributing SMP bringup
> solutions are also dumb idiots who copy the Versatile scheme with very
> little thought... (as you can see, I'm not mincing my words here - if
> people want to be lazy in this regard despite this having been brought
> up multiple times, and the lead developers having said that the versatile
> pen_release stuff should not be used, they earn themselves the right to
> be called dumb idiots.  Simple solution to avoid that title: don't be a
> dumb idiot by copy the Versatile SMP bring up code!  It's not a sane
> model for any SoC sane SoC to follow.)
>
> Is this clear enough?

The actual implementation of the SMP code in the next patches do not
use a pen holding/release mechanism anymore as it used in the previous
iterations of these same patches, so I would say, lesson learned. My
question was whether the binding was documenting the hardware
implementation (which it should) or the software implementation (which
it should not).
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
