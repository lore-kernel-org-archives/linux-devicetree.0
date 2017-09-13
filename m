From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add GPIO device nodes
Date: Wed, 13 Sep 2017 13:48:26 +0200
Message-ID: <CAMuHMdUiZyK3xA=_rYjbAaSYhm=-p5Spug0mmLc=mf+pRfxgoA@mail.gmail.com>
References: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX9qowD3039OxPyPoyUsnaq7e=kWyxqDdDqzz5RTZtSwQ@mail.gmail.com> <TY1PR06MB099246295272BBF0F08022C8D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <TY1PR06MB099246295272BBF0F08022C8D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 13, 2017 at 11:35 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Geert Uytterhoeven
>> Sent: Wednesday, September 13, 2017 6:22 PM
>> On Wed, Sep 13, 2017 at 8:52 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> > @@ -139,6 +139,118 @@
>> >                         #power-domain-cells = <1>;
>> >                 };
>> >
>> > +               gpio0: gpio@e6050000 {
>> > +                       compatible = "renesas,gpio-r8a77995",
>> > +                                    "renesas,rcar-gen3-gpio",
>> > +                                    "renesas,gpio-rcar";
>> > +                       reg = <0 0xe6050000 0 0x50>;
>> > +                       interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>> > +                       #gpio-cells = <2>;
>> > +                       gpio-controller;
>> > +                       gpio-ranges = <&pfc 0 0 9>;
>> > +                       #interrupt-cells = <2>;
>> > +                       interrupt-controller;
>> > +                       clocks = <&cpg CPG_MOD 912>;
>> > +                       power-domains = <&cpg>;
>>
>> All nodes lack the power domain index (32, to be replaced by
>> R8A77995_PD_ALWAYS_ON later):
>>
>>     power-domains = <&sysc 32>;
>
> The r8a77995.dtsi file already uses R8A77995_PD_ALWAYS_ON in scif2 node.

In my renesas-drivers it does.
In Simon's renesas/devel it doesn't, as the R8A77995_PD_* definitions
go upstream through a different branch than the DTS changes.

> So, should I fix this patch like the following?
>
>      power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;

For now you should use 32.
However, as soon as Simon merges v4.14-rc1 into renesas/devel, you
can start on using R8A77995_PD_ALWAYS_ON.
As that is expected to happen this Monday, he can just postpone applying
your updated patch until then, so I don't think there's a need to resend a
version with hardcoded numbers.

For R-Car V3M it's different, as the definitions for that SoC won't appear
in upstream for another full cycle, i.e. in v4.15-rc1 the earliest.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
