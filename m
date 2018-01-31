From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC v3 11/25] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Wed, 31 Jan 2018 13:13:13 +0100
Message-ID: <CAMuHMdViQgCjVFbs0kkBObAAoFTzvz8yPFUHPWHrtYzkbnYm_g@mail.gmail.com>
References: <1517343778-27902-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1517343778-27902-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180130220504.GA16709@roeck-us.net> <TY1PR06MB0895ECB2936323F9D281C1EFC0FB0@TY1PR06MB0895.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <TY1PR06MB0895ECB2936323F9D281C1EFC0FB0-/PRLmSCtZ16EeHdvShrxA20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>linux
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Wed, Jan 31, 2018 at 11:47 AM, Fabrizio Castro
<fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
>> Subject: Re: [RFC v3 11/25] watchdog: renesas_wdt: Add R-Car Gen2 support
>> On Tue, Jan 30, 2018 at 08:22:44PM +0000, Fabrizio Castro wrote:
>> > On R-Car Gen2 and RZ/G1 the rwdt clock needs to be always ON, therefore
>> > when suspending to RAM we need to explicitly disable the counting by
>> > clearing TME from RWTCSRA.
>> > Also, on some systems RWDT is the only piece of HW that allows the SoC
>> > to be restarted, therefore this patch implements the restart callback.
>> >
>> > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> > ---
>> > Wolfram, was the restart callback implementation missing for a reason?
>> > Is its implementation going to break any Gen3 platform?
>>
>> The changes clearly are way more than claimed in the subject. Adding
>> restart handler and PM support may be prerequisites for Gen2, but the
>> changes apply to Gen3 as well. What happened to "one patch per logical
>> change" ?
>
> The PM implementation should be ok for Gen3 too, without this patch series the kernel
> would disable the rwdt clock when suspending to RAM, this would "pause" the counting.
> This patch series declares the rwdt clock as critical for Gen2 and RZ/G1, which means we
> need to explicitly disable the counting to keep the same behaviour in place.

Note that if the kernel crashes after rwdt_suspend(), the watchdog won't
restart the system. But that's an issue common to many watchdog driver, right?

> With respect to the restart callback implementation, that may well have consequences on
> Gen3, hopefully Wolfram will give us a feedback on this.
> In particular I would like to know if we should be installing the restart callback only when
> we use "renesas,rcar-gen2-wdt" as compatible string, or it's ok to make it available for
> Gen3 as well.

IIRC, the reason we don't have the restart callback on R-Car Gen3 is the
arm64 maintainers insisting on using PSCI, and vetoing other means,
to restart the system.

Which leaves us with a few boards where we have to use the watchdog, and
wait until the timeout triggers...

> The only way to reboot iWave's boards iwg20d and iwg22d is to use the internal watchdog,
> that's why the restart implementation was merged into this patch.
> I can split this patch in two, one for PM support and one for restart support for the next
> version, what do you think about this?

Splitting in individual logical changes sounds like a good idea to me.

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
