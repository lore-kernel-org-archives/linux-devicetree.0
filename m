Return-Path: <SRS0=BvA/=NY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-2-chris.brandt@renesas.com> <CAMuHMdWePvqbv_SmkGQAWm8aynkXBjmf25BuA3O09_H9Xdtjyg@mail.gmail.com>
 <OSAPR01MB15531B62B24C0DA3834592628AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15531B62B24C0DA3834592628AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 20:00:14 +0100
Message-ID: <CAMuHMdWVGYaT+WOhks-8YwK0KO96COO0Rgvp9DNMhhQpZfA7kQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Nov 13, 2018 at 7:43 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, November 12, 2018, Geert Uytterhoeven wrote:
> > > +static const char * const rza2_gpio_names[] = {
> > > +       "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
> > > +       "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> > > +       "P2_0", "P2_1", "P2_2", "P2_3", "P2_4", "P2_5", "P2_6", "P2_7",
> > > +       "P3_0", "P3_1", "P3_2", "P3_3", "P3_4", "P3_5", "P3_6", "P3_7",
> > > +       "P4_0", "P4_1", "P4_2", "P4_3", "P4_4", "P4_5", "P4_6", "P4_7",
> > > +       "P5_0", "P5_1", "P5_2", "P5_3", "P5_4", "P5_5", "P5_6", "P5_7",
> > > +       "P6_0", "P6_1", "P6_2", "P6_3", "P6_4", "P6_5", "P6_6", "P6_7",
> > > +       "P7_0", "P7_1", "P7_2", "P7_3", "P7_4", "P7_5", "P7_6", "P7_7",
> > > +       "P8_0", "P8_1", "P8_2", "P8_3", "P8_4", "P8_5", "P8_6", "P8_7",
> > > +       "P9_0", "P9_1", "P9_2", "P9_3", "P9_4", "P9_5", "P9_6", "P9_7",
> > > +       "PA_0", "PA_1", "PA_2", "PA_3", "PA_4", "PA_5", "PA_6", "PA_7",
> > > +       "PB_0", "PB_1", "PB_2", "PB_3", "PB_4", "PB_5", "PB_6", "PB_7",
> > > +       "PC_0", "PC_1", "PC_2", "PC_3", "PC_4", "PC_5", "PC_6", "PC_7",
> > > +       "PD_0", "PD_1", "PD_2", "PD_3", "PD_4", "PD_5", "PD_6", "PD_7",
> > > +       "PE_0", "PE_1", "PE_2", "PE_3", "PE_4", "PE_5", "PE_6", "PE_7",
> > > +       "PF_0", "PF_1", "PF_2", "PF_3", "P0_4", "PF_5", "PF_6", "PF_7",
> > > +       "PG_0", "PG_1", "PG_2", "P0_3", "PG_4", "PG_5", "PG_6", "PG_7",
> > > +       "PH_0", "PH_1", "PH_2", "PH_3", "PH_4", "PH_5", "PH_6", "PH_7",
> > > +       /* port I does not exist */
> >
> > Hence shouldn't you have 8 NULL entries here?
>
> But there is no such port named "I". And even in the dt-bindings and other
> documentation, the global pin ID is based off and a world where "I" is not
> in the alphabet. So if I put 8 NULLs here, wouldn't that screw up all the
> indexing??

I'd swear there's an "I" in port_names[], but upon checking again, it must
have been my eyes that mislead me. Sorry for that.
Hence please forget my comment above.

> > > +static struct gpio_chip chip = {
> > > +       .names = rza2_gpio_names,
> >
> > BTW, is their much value in filling gpio_chip.names[]?
> > I had never seen that before.
>
> It makes the files show up under /sys look nice.
>
> For example, P5_6 is button SW4:
>
>  $ echo 912 > /sys/class/gpio/export
>
> Then you end up with "/sys/class/gpio/P5_6/"
>
>  $ echo in > /sys/class/gpio/P5_6/direction
>  $ cat /sys/class/gpio/P5_6/direction
>  $ cat /sys/class/gpio/P5_6/value

(Ah, the legacy and deprecated sysfs GPIO interface, being replaced
 by /dev/gpiochip[0-9]+ and https://github.com/brgl/libgpiod)

Cool, I didn't know that.
But you still need to know which number to write to the export file
in the first place?

> > > +       .get = rza2_chip_get,
> > > +       .set = rza2_chip_set,
> >
> > You may want to implement .[gs]et_multiple(), too.
>
> OK, I will have a look.

You can add that later.  It doesn't add functionality, but may improve
performance for bitbanging multiple pins.


> > > +{
> > > +       struct rza2_pinctrl_priv *priv =
> > pinctrl_dev_get_drvdata(pctldev);
> > > +       struct property *of_pins;
> > > +       int i;
> > > +       unsigned int *pins;
> > > +       unsigned int *psel_val;
> > > +       const char **pin_fn;
> > > +       int ret, npins;
> > > +       int gsel, fsel;
> >
> > Some people prefer "reverse Xmas tree ordering" i.e. sorted by decreasing
> > declaration length.
>
> https://lwn.net/Articles/758552/
>
> "only a few maintainers insist on that, while most really do not care or
> think that it's actively silly."
>
> So are you one of those maintainers?????   :)

Sorry, got baptised by Laurent...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
