From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Date: Fri, 28 Apr 2017 16:27:45 +0200
Message-ID: <CAMuHMdXp75yepEMh-S0YNYqKRESb4m3DtcfG09x=uj1Fm51b_A@mail.gmail.com>
References: <20170427191045.21199-1-chris.brandt@renesas.com>
 <CAMuHMdXEtefpaUJbbJ7LYjYR2oHaE-epy=eZnAyE-+=GWsy9xg@mail.gmail.com>
 <20170428080400.GI10196@verge.net.au> <SG2PR06MB1165D398BD7100FAC5AAEDC68A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB1165D398BD7100FAC5AAEDC68A130-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Apr 28, 2017 at 2:47 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, April 28, 2017, Simon Horman wrote:
>> On Fri, Apr 28, 2017 at 09:34:54AM +0200, Geert Uytterhoeven wrote:
>> > On Thu, Apr 27, 2017 at 9:10 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>> > > This adds the USB0 and USB1 clocks to the device tree.

>> > Simon: see Section 29.3.2 (BUSWAIT) for the reference to the P1 clock.
>>
>> Thanks, I see that now.
>
> I was going to say that I simply look at sections:
>   6.10.6 Internal Clock Signals (1)
>   6.10.7 Internal Clock Signals (2)
>
> Because it lists all the IP blocks and their corresponding clock sources in one place.

Cool, I grew up with rev. 0.60 of the user manual, so I wasn't aware of
that secton.

Thanks!

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
