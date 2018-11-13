Return-Path: <SRS0=BvA/=NY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-3-chris.brandt@renesas.com> <CAMuHMdX3QJq+QgU-wwFLawyLwqqoUDLS=uwNqRhJqVtP0_yLNQ@mail.gmail.com>
 <OSAPR01MB15538DC8B31310DF044242DF8AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15538DC8B31310DF044242DF8AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 18:28:06 +0100
Message-ID: <CAMuHMdV5QXj-O6NNOF0FjVEjukhQwa7BbvB1AW3jZNT9TenWaQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Nov 13, 2018 at 5:38 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, November 12, 2018 1, Geert Uytterhoeven wrote:
> > > +Required properties:
> > > +  - compatible: should be:
> > > +    - "renesas,r7s9210-pinctrl": for RZ/A2M
> >
> > On RZ/A1, the datasheet called this "Ports", and the corresponding
> > compatible
> > value is "renesas,r7s72100-ports".
> > On RZ/A2, the datasheet calls this "GPIO", so perhaps "renesas,r7s9210-
> > gpio"?
> > Hmm, then you may want to call the single node gpio-controller instead of
> > pin-controller (and all references to it)? It's really both.
> >
> > On RZ/A1, it's different, as you have a single pin-controller node, with
> > GPIO
> > subnodes.
>
> So here's where we get into the interesting discussions.
>
> You're going off the title of the chapters in the hardware manual. But,
> I'm looking at what the IP is (and where it was uses in other SoCs).
>
> For RZ/A1, the pin controller/GPIO is a horrible piece of HW I've never
> seen before and hope to never see again.
>
> For RZ/A2, the controllers came from the RZ/T1. In that manual, the
> chapter was call "Multi-Function Pin Controller (MPC)" (Chapter 18). The
> GPIO was in Chapter 17 called "I/O Ports".
> Then for RZ/A2, they simply combined the two chapters into one since the
> hardware was also 'combined' and just picked a name "GPIO". (they
> basically copy/pasted the text from the two chapters)
>
> So, what's the rule of naming? Does it really have to match exactly what
> it says in the hardware manual?
> I'm assuming an RZ/A3 would use this same pin controller.

Thanks for the explanation!

I'm fine with "renesas,r7s9210-pinctrl".

> > > +Example: Pin controller node for RZ/A2M SoC (r7s9210)
> > > +
> > > +       pinctrl: pin-controller@fcffe000 {
> > > +               compatible = "renesas,r7s9210-pinctrl";
> > > +               reg = <0xfcffe000 0x9D1>;
> >
> > 0x9d1
> >
> > BTW, that's a real odd number. What about rounding up to the hardware
> > granularity, i.e. 0x1000?
>
> I remember us getting into trouble once because numbers were rounded up
> or down and then conflicted with other nodes/register addresses. So, I
> was putting number exactly as they are. But if you want, I can round it
> up.

If you're worried for an overlap with another node in DT, keep on using
(lower case) 0x9d1.

The mapping will be rounded up to PAGE_SIZE anyway :-)

> > > +  For assigning GPIO pins, use the macro RZA2_PIN_ID also in r7s9210-
> > pinctrl.h
> >
> > RZA2_PIN
>
> Good catch! Thank you.

Note that you still do have RZA2_PIN_ID_TO_PORT() and
RZA2_PIN_ID_TO_PIN() macros in the driver.
But RZA2_PIN_TO_PIN() sounds really lame...

> > > +/* Port names as labeled in the Hardware Manual */
> > > +#define P0 0
> > > +#define P1 1
> > > +#define P2 2
> > > +#define P3 3
> > > +#define P4 4
> > > +#define P5 5
> > > +#define P6 6
> > > +#define P7 7
> > > +#define P8 8
> > > +#define P9 9
> > > +#define PA 10
> > > +#define PB 11
> > > +#define PC 12
> >
> > This may conflict with MIPS again ;-)
>
> Damn MIPS!
>
>
> > Oh, you don't include the bindings header in the driver source file, and
> > doing
> > so would cause issues with (previous version of) the enum...
> >
> > Still, would it make sense to call these PORTx instead of Px?
> > The register descriptions use PORTx.<reg>.
>
> I liked Px because it made my lines in the device tree shorter.
> But, I won't argue if you think it would be better to use PORTx (that's
> only 3 more characters).

Any preference from the DT people?

> > > +#define PM 21
> >
> > There's no PM in my datasheet. Should that be JP0?
> > Oh, the register descriptions do use PORTM.
>
> Like you mentioned, they made it confusing because instead of calling
> the on pin on Port M "PM0" they called it "JP0" for 'JTAG PORT'.
> From a hardware IP standpoint, it's a "Port M", so I wanted to call it
> that. I wanted to make it generic because if another SoC uses this same
> controller, it might have more ports, so port M will really be a port M.

OK.

Perhaps adding a convenience definition

    #define JP PM

may be a good idea? Or just a comment?

    #define PM 21        /* JP */


Anyway, we're getting closer to bikeshedding, so with the real issues fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
