From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 00/23] soc: renesas: Add R-Car RST driver for obtaining
 mode pin state
Date: Wed, 26 Oct 2016 13:56:29 +0200
Message-ID: <CAMuHMdUsuoLni1FUwCPXM2WrGpwKVR4UA85zujpbcwmdPMXpdg@mail.gmail.com>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be> <1477064730.2508.24.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477064730.2508.24.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philip,

On Fri, Oct 21, 2016 at 5:45 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Freitag, den 21.10.2016, 15:17 +0200 schrieb Geert Uytterhoeven:
>>         Hi Philipp, Mike, Stephen, Simon, Magnus,
>>       (see questions *** below!)
>>
>> Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
>> state of the mode pins either by a call from the platform code, or
>> directly by using a hardcoded register access. This is a bit messy, and
>> creates a dependency between driver and platform code.
>>
>> This patch series converts the various Renesas R-Car clock drivers
>> and support code from reading the mode pin states using a hardcoded
>> register access to using a new minimalistic R-Car RST driver.

[...]

>>   - Philip: While this is a driver for a reset-controller, currently it
>>     doesn't provide any reset-controller functionality. Hence I added it
>>     to drivers/soc/renesas/. Is that OK for you?
>
> Absolutely, as long as the driver isn't even a reset controller
> provider, this is the right place.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
