Return-Path: <SRS0=BvA/=NY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-2-chris.brandt@renesas.com> <CAMuHMdWePvqbv_SmkGQAWm8aynkXBjmf25BuA3O09_H9Xdtjyg@mail.gmail.com>
 <OSAPR01MB15531B62B24C0DA3834592628AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdWVGYaT+WOhks-8YwK0KO96COO0Rgvp9DNMhhQpZfA7kQ@mail.gmail.com> <OSAPR01MB155359D363399BD62BB29D788AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB155359D363399BD62BB29D788AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 23:18:48 +0100
Message-ID: <CAMuHMdWsp-zSTbO6EyL_x814fDRcHj10f+YJQqV=b_Bf6znFVA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Nov 13, 2018 at 8:26 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, November 13, 2018, Geert Uytterhoeven wrote:
> > > It makes the files show up under /sys look nice.
> > >
> > > For example, P5_6 is button SW4:
> > >
> > >  $ echo 912 > /sys/class/gpio/export
> > >
> > > Then you end up with "/sys/class/gpio/P5_6/"
> > >
> > >  $ echo in > /sys/class/gpio/P5_6/direction
> > >  $ cat /sys/class/gpio/P5_6/direction
> > >  $ cat /sys/class/gpio/P5_6/value
> >
> > (Ah, the legacy and deprecated sysfs GPIO interface, being replaced
> >  by /dev/gpiochip[0-9]+ and https://github.com/brgl/libgpiod)
> >
> > Cool, I didn't know that.
> > But you still need to know which number to write to the export file
> > in the first place?
>
> True, meaning the table does not help you as much as you want.
> Jacopo also mentioned the new libgpiod.
> So, I think I might just drop this table in the next revision.
>
> What I really want to do is just say "make P5_6 an input" and
> not have to convert to a global ID number. But, I'm not sure how
> libgpiod is going to know what "P5_6" is.

There are two parts:
  1. New kernel /dev/gpiochip[0-9]+ interface

     Sample code comes with the kernel under tools/gpio/.
     E.g.
     root@koelsch:~# lsgpio -n gpiochip7
     GPIO chip: gpiochip7, "e6055800.gpio", 26 GPIO lines
      line  0: unnamed "SW30" [kernel active-low]
      line  1: unnamed "SW31" [kernel active-low]
      line  2: unnamed "SW32" [kernel active-low]
      line  3: unnamed "SW33" [kernel active-low]
      line  4: unnamed "SW34" [kernel active-low]
      line  5: unnamed "SW35" [kernel active-low]
      line  6: unnamed "SW36" [kernel active-low]
      line  7: unnamed unused
      line  8: unnamed unused
      line  9: unnamed unused
      line 10: unnamed unused
      line 11: unnamed unused
      line 12: unnamed unused
      line 13: unnamed unused
      line 14: unnamed unused
      line 15: unnamed unused
      line 16: unnamed unused
      line 17: unnamed "regulator-vcc-sdhi0" [kernel output]
      line 18: unnamed "regulator-vcc-sdhi1" [kernel output]
      line 19: unnamed "regulator-vcc-sdhi2" [kernel output]
      line 20: unnamed unused
      line 21: unnamed unused
      line 22: unnamed unused
      line 23: unnamed unused
      line 24: unnamed unused
      line 25: unnamed unused

  2. Userspace library libgpiod, incl. a few tools like
gpioinfo/gpioset/gpioget.
     These accept whatever reference to identify a GPIO.
     As your driver fills in pins[i].name, I expect you can pass names
like P5_6.

Have fun! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
