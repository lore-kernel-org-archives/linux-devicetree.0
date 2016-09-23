From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] ARM: dts: r7s72100: add sdhi to device tree
Date: Fri, 23 Sep 2016 16:32:19 +0200
Message-ID: <CAMuHMdWkqE-wZE5gDHofO4j4UKg41eoU1i0f2VQyfKTujuR4ug@mail.gmail.com>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
 <20160922213211.7988-3-chris.brandt@renesas.com> <CAMuHMdU8PKGwJ+5JzMix_GHohdYdXPEXwDm4HwmQfSxDY4h95w@mail.gmail.com>
 <SG2PR06MB1165C71A8C201614AC2463168AC80@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165C71A8C201614AC2463168AC80@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Sep 23, 2016 at 4:20 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> (due to lack of documentation about SDHI, for the interrupt numbers only)
>>
>> > --- a/arch/arm/boot/dts/r7s72100.dtsi
>> > +++ b/arch/arm/boot/dts/r7s72100.dtsi
>> > @@ -458,4 +458,32 @@
>> >                 #size-cells = <0>;
>> >                 status = "disabled";
>> >         };
>> > +
>> > +       sdhi0: sd@e804e000 {
>> > +               compatible = "renesas,sdhi-r7s72100";
>> > +               reg = <0xe804e000 0x100>;
>> > +               interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
>> > +                             GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
>> > +                             GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>> > +
>>
>> Cannot chcck the required order, but the interrupts are called SDHI0_3,
>> SDHI0_0, and SDHI0_1 in the datasheet.
>
> From the hardware manual, "Table 7.3 List of Interrupt IDs":
>
> SD host Interface, Channel 0:
> -----------------------------
>   SDHI0_3 = ID 302   (302 - 32 = 270)
>   SDHI0_0 = ID 303   (303 - 32 = 271)
>   SDHI0_1 = ID 304   (304 - 32 = 272)
>
>
> #NOTE: The new 3.0 version of the hardware manual that will be coming out will now have the SDHI chapter included.
>
> So, in reference to that 3.0 manual:
>
>  "50.3.3 Interrupt Request and DMA Transfer Request"
>  "Table 50.4 Interrupt Request"
>  -----------------------------
>   Card detect interrupt = SDHI3
>   Card access interrupt = SDHI0
>   SDIO access interrupt = SDHI1

Thanks for checking!

However, this is another driver that doesn't document anything about the
interrupts in the DT bindings :-(

> Regardless, in sh_mobile_sdhi.c, they all get mapped to the same ISR function anyway:
>
>         i = 0;
>         while (1) {
>                 irq = platform_get_irq(pdev, i);
>                 if (irq < 0)
>                         break;
>                 i++;
>                 ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
>                                   dev_name(&pdev->dev), host);
>                 if (ret)
>                         goto eirq;
>         }

Uuh, then it doesn't matter much ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
