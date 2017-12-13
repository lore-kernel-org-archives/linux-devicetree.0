From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7743: Add CMT SoC specific support
Date: Wed, 13 Dec 2017 11:05:23 +0100
Message-ID: <CAMuHMdWEFttz_Shve+D1Ku2NoUYX-AomzXY9JFGRjzzM=hOc_A@mail.gmail.com>
References: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513104579-6333-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20171213083829.ptdeggbon3szmko4@verge.net.au> <TY1PR06MB0895B34EFC2A48F49AFF0694C0350@TY1PR06MB0895.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <TY1PR06MB0895B34EFC2A48F49AFF0694C0350-/PRLmSCtZ16EeHdvShrxA20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Wed, Dec 13, 2017 at 10:42 AM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
>> On Tue, Dec 12, 2017 at 06:49:38PM +0000, Fabrizio Castro wrote:
>> > Add CMT[01] support to SoC DT.
>> > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> > Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/r8a7743.dtsi | 30 ++++++++++++++++++++++++++++++
>> >  1 file changed, 30 insertions(+)
>>
>> I was expecting the cmt nodes to be "disabled" in the SoC file
>> and then enabled selectively in board files. Am I missing something?
>
> Since this component is just a compare and match timer, I  thought there was no harm in enabling it by default in the SoC specific DT. The system will park it and leave its clock disabled until actually needed for something.
> The user can still disable it in the board specific DT if he/she doesn't mean to even have the option to use it. Do you prefer I left it disabled by default?

It's debatable (thus up to Simon the maintainer ;-).
For I/O devices, we disable them in the SoC .dtsi file.
For core infrastructure like interrupt, DMA, and GPIO controllers, we keep
them enabled.

Timers are core functionality, but who's actually using these timers?

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
