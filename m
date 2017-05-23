From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] gpio: arizona: Add support for GPIOs that need to be
 maintained
Date: Tue, 23 May 2017 09:56:12 +0100
Message-ID: <20170523085612.GM1594@localhost.localdomain>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1494948714-15203-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdZHVWrHWBon+TubnV_B5mCAoOtmcJKyXt4C5iP01OSQuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZHVWrHWBon+TubnV_B5mCAoOtmcJKyXt4C5iP01OSQuQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 10:46:29AM +0200, Linus Walleij wrote:
> On Tue, May 16, 2017 at 5:31 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> 
> > The Arizona devices only maintain the state of output GPIOs whilst the
> > CODEC is active, this can cause issues if the CODEC suspends whilst
> > something is relying on the state of one of its GPIOs. However, in
> > many systems the CODEC GPIOs are used for audio related features
> > and thus the state of the GPIOs is unimportant whilst the CODEC is
> > suspended. Often keeping the CODEC resumed in such a system would
> > incur a power impact that is unacceptable.
> >
> > Allow the user to select whether a GPIO output should keep the
> > CODEC resumed, by adding a flag through the second cell of the GPIO
> > specifier in device tree.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> This adds the handling locally in the driver for a certain Arizona chip.
> 
> And then the next time you have to duplicate the code again and again.
> 
> That's not working, put this in the core.
> 
> >  static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
> >  {
> >         struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
> >         struct arizona *arizona = arizona_gpio->arizona;
> > +       int status = arizona_gpio->status[offset];
> 
> Don't use a local array for this.
> 
> This should be something like gpiochip_get_sleep_persistance(chip, offset)
> 
> > +       if (change && !(status & GPIO_SLEEP_MAY_LOOSE_VALUE)) {
> 
> That us a dt-binfings header define, that is not a Linux constant.
> 
> Add FLAG_MAY_LOOSE_VALUE_DURING_SLEEP or something in
> drivers/gpio/gpiolib.h, store this inside the struct gpio_desc like all
> other flags and retrieve it from there.
> 
> Augment the code in gpiolib.c and gpiolib-of.c to parse this and
> store it properly in the gpio_desc and use it as described above.
> 
> Then it is reusable for others.
> 

Apologies hadn't realised you wanted me to put so much of the
functionality into the core, will respin again.

Thanks,
Charles
