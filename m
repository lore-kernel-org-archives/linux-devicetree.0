From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Fri, 13 Jan 2017 18:31:43 +0100
Message-ID: <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com> <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Jan 13, 2017 at 6:16 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> > But...that would make me think on boot it would be set to '01' (setting prohibited).
>>
>> Yeah, running with enabled SDHI core and disabled card detect sounds silly.
>
> I just did some testing and with only 1 clock enabled ('01'), the core works but
> card detect doesn't work. If you boot with the card in, you can read it fine, but
> if you pull it...no removal is detected.
> As soon as I turn the other clock on ('00'), card detect magically starts working.
>
> So from my experiments:
>
>   00: SD Host Interface 1 Module runs.
>       >> everything works
>
>   01: Setting prohibited.
>       >> core runs, but no card detect
>
>   10: Only card detect block in SD Host Interface 1 Module runs.
>       >> SDHI address space all 00s (core not running)
>
>   11: Clock supply to SD Host Interface 1 Module is halted
>       >> nothing works (of course)
>
>
>> So typically you want to use 10 when idle, and 00 when active.
>
> I wonder if that would mean the system would get a CD interrupt. Of course
> if no ISR registered (SDHI not enabled), the kernel would throw it away.
>
>
>> No there isn't. That's another reason why a full-fledged clock driver with
>> tables in C is a better idea than trying to describe all clocks in DT.
>> The new CPG/MSSR based driver (renesas-cpg-mssr.c) supports "critical
>> module clocks" through CLK_ENABLE_HAND_OFF. Unfortunately that flag hasn't
>> made it upstream, so I really should convert the driver to use the new
>> CLK_IS_CRITICAL instead...
>
> So basically at the moment you're tell me it's going to stay broke (unless it's
> enabled in u-boot).
>
> In sh_mobile_sdhi.c, can we change sh_mobile_sdhi_probe() so that if there
> are 2 clocks specified (in DT or platform data), it automatically enables
> the 2nd clock (forever) and just uses the 1st clock as the on/off clock?

Of course the driver can handle the second interrupt, if you update the
binding, and add support code for that...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
