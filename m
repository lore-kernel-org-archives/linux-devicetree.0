From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] DT updates for Hummingboard and new Cubox-i
Date: Fri, 24 Jan 2014 19:44:45 -0800
Message-ID: <CAOesGMhp1S-XJjGZQBPmH7RFT_pobSFLTBT+4fSKdZ3zhukEhA@mail.gmail.com>
References: <20140116182211.GX15937@n2100.arm.linux.org.uk>
	<20140119031816.GD16158@S2101-09.ap.freescale.net>
	<20140119185246.GB28056@quad.lixom.net>
	<20140124150927.GA2780@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140124150927.GA2780-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 24, 2014 at 7:09 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Jan 19, 2014 at 10:52:46AM -0800, Olof Johansson wrote:
>> I'm well aware that the DT branch has not been merged, and that's because
>> there has been no consensus from DT maintainers on the massive rework
>> you did as the base of the branch.
>
> I guess the 'massive rework' you're talking about is the patch series
> that begins with 'ARM: dts: imx6qdl: make pinctrl nodes board specific'?
> If so, I hope you would agree that we're trying to solve a real
> problem [1], even though the solution does not look like the best to
> you.
>
> So which specific part of the solution are you objecting to?  Those
> MX6QDL_*_PINGRP macros defined in imx6qdl-pingrp.h?  If that's the
> case, I can send a follow-up patch to kill the macros by filling in the
> pin group definitions directly.  The pros is that the pin group
> definitions for given board will be more intuitive, and the cons is that
> the change set will be even more massive, because the same multi-lines
> pin group definitions will be duplicated in multiple board dts files,
> which use the same group of pins for given device.
>
> Or any other better idea?

I haven't heard any other maintainers being positive to this change.
Not Linus W, as the pinctrl maintainer, and none of the DT
maintainers. I asked for their review, which should mean acks or
general approval from them, and I haven't seen any come in. Or did I
miss it?

>> Given the timing, it's not looking like it will be resolved in time for
>> the 3.14 merge window (which might open today).
>
> That's frustrating and will be surprising a lot of people who expect to
> see their board support in 3.14 release.

Yes, it is very unfortunate.

See this as a chance to adjust your process. Next time you send a
large pull request that gets questions like these, please consider
splitting off the controversial part in a separate branch so that the
bulk of the changes can go in. That's what other maintainers tend to
do. Right now you have chosen to let your pinctrl header file changes
hold up everything for everyone that merges code through you.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
