From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/7] arm: dts: r7s72100: Add pin controller node
Date: Fri, 3 Mar 2017 11:08:51 +0100
Message-ID: <CAMuHMdVdiMWNq1or9JgzAKfWXsDg1VD9ehG6U=E_snes04Y1Mg@mail.gmail.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-5-git-send-email-jacopo+renesas@jmondi.org>
 <3dd69ef5-e8a4-b69c-b4fa-1be6ba777cfa@jmondi.org> <SG2PR06MB1165DCCA724AD6A8325862668A280@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165DCCA724AD6A8325862668A280@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Mar 2, 2017 at 9:17 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, February 21, 2017, jacopo mondi wrote:
>> > +                   gpio-controller;
>> > +                   #gpio-cells = <2>;
>> > +                   gpio-ranges = <&pinctrl 0 0 16>;
>>
>> Not all ports have 16 pins available.
>> This is one of the differences between different RZ/A1 SoC versions
>> (RZ/A1H, RZ/A1L etc)
>>
>> I'll change the number of pins to the actual available ones on each port
>> for r7s72100 (RZ/A1H)
>
> But wait, what if someone wants to use a RZ/A1L???
>
> I don't want to make a separate dtsi file for RZ/A1L.
>
> Is it possible to change the number of port pins in the board dts file?
> For example:
>   RZ/A1H: P5_0 - P5_10
>   RZ/A1L: P5_0 - P5_16

That's 17 pins, not 16?

>
> So, in a rza1l-board.dts file I would put:
>
> &port5 {
>         gpio-ranges = <&pinctrl 0 80 16>;
> }
>
> Will this work?

Yes, overriding should work. But the number of pins is an SoC-property, not
a board-property?

Are the differences between RZ/A1H and RZ/A1L just the number of pins?
If yes, you could use a hierarchical DTS structure:

rza1h-<board>.dts:

    #include "rza1h.dtsi"

    // board specifics here

rza1l-<board>.dts:

    #include "rza1l.dtsi"

    // board specifics here

rza1h.dtsi:

    #include "rza.dtsi"  // r7s72100.dtsi?

    // base SoC overrides
    &port5 {
        gpio-ranges = <&pinctrl 0 80 11>;
    }

rza1l.dtsi:

    #include "rza.dtsi"  // r7s72100.dtsi?

    // base SoC overrides
    &port5 {
        gpio-ranges = <&pinctrl 0 80 16>;
    }

Actual naming of DTS files TBD.
We could also decide to not have rza1h.dtsi, and assume the base dtsi is for
RZ/A1H.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
