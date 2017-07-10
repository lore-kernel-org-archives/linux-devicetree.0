From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: renesas: Use SMP jump stub SRAM region from DT
Date: Mon, 10 Jul 2017 10:44:47 +0200
Message-ID: <CAMuHMdVi4YhvpEZqbdhVe3AT=8_2Yp8zvaB7sxAPMdMGrvKa9Q@mail.gmail.com>
References: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
 <CAMuHMdUFkaxoJCX5F3FH3vy=Sh50y02a3hF9HR3tkw-XwtiG2g@mail.gmail.com> <20170710083926.GI13680@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170710083926.GI13680-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Jul 10, 2017 at 10:39 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Tue, Jul 04, 2017 at 06:44:48PM +0200, Geert Uytterhoeven wrote:
>> On Tue, Jul 4, 2017 at 5:41 PM, Geert Uytterhoeven
>> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> > The R-Car Gen2 platform code for CPU core bringup needs to copy a jump
>> > stub to on-SoC SRAM.  Currently it uses a hardcoded address pointing to
>> > ICRAM1.
>> >
>> > This patch series adds support to specify this region from DT.  It
>> > consists of 3 parts:
>> >   - DT binding documentation for reserving SRAM for the jump stub,
>> >   - A platform code update to retrieve the information from DT, if
>> >     present (of course backwards-compatibility with old DTBs is
>> >     preserved),
>> >   - DT updates to reserve an SRAM region in DT on all R-Car Gen2 and
>> >     RZ/G1 SoCs.
>> >
>> > The DT patches in this series depend on "[PATCH 0/7] ARM: dts: renesas:
>> > Add Inter Connect RAM".
>> >
>> > Note that the current jump stub in Linux is 12 bytes long.  The patches
>> > reserve 16 bytes of SRAM.  Should this be increased?  The mapping
>> > granularity is PAGE_SIZE anyway.
>> >
>> > Thanks for your comments!
>> >
>> > Geert Uytterhoeven (9):
>> >   dt-bindings: sram: Document renesas,smp-sram
>> >   ARM: shmobile: rcar-gen2: Obtain jump stub region from DT
>> >   ARM: dts: r8a7743: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7745: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7790: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7791: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7792: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7793: Reserve SRAM for the SMP jump stub
>> >   ARM: dts: r8a7794: Reserve SRAM for the SMP jump stub
>>
>> Forgot to mention: this has been tested on r8a7790/lager, r8a7791/koelsch,
>> r8a7792/blanche, r8a7793/gose, and r8a7794/alt (r8a7794 needs an
>> unrelated fix to enable SMP).
>
> Geert, these seem nice and clean to me.
> Are they ready to be applied?

Now the binding has been Acked by Rob, I think they are.
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
