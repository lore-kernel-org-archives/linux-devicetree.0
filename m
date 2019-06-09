From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
Date: Sun, 9 Jun 2019 23:36:24 +0200
Message-ID: <CAFBinCBgoLb+Hfdo-sZ_0H6ct=UJm7j6wD_C6udbA6BTRvFOWQ@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-6-martin.blumenstingl@googlemail.com> <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: netdev <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Sun, Jun 9, 2019 at 11:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
> > The PHY reset line and interrupt line are swapped on the X96 Max
> > compared to the Odroid-N2 schematics. This means:
> > - GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
> > - GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)
> >
> > Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
> > that they are "3.3V input tolerant open drain (OD) output pins". This
> > means the GPIO controller can drive the output LOW to reset the PHY. To
> > release the reset it can only switch the pin to input mode. The output
> > cannot be driven HIGH for these pins.
> > This requires configuring the reset line as GPIO_OPEN_SOURCE because
> > otherwise the PHY will be stuck in "reset" state (because driving the
> > pin HIGH seeems to result in the same signal as driving it LOW).
>
> This far it seems all right.
...except the "seeems" typo which I just noticed.
thank you for sanity-checking this so far!

> > Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
> > the "snps,reset-active-low" property as this is now encoded in the
> > GPIO_OPEN_SOURCE flag.
>
> Open source doesn't imply active low.
>
> We have this in stmmac_mdio_reset():
>
>                 gpio_direction_output(data->reset_gpio,
>                                       data->active_low ? 1 : 0);
>                 if (data->delays[0])
>                         msleep(DIV_ROUND_UP(data->delays[0], 1000));
>
>                 gpio_set_value(data->reset_gpio, data->active_low ? 0 : 1);
>                 if (data->delays[1])
>                         msleep(DIV_ROUND_UP(data->delays[1], 1000));
>
>                 gpio_set_value(data->reset_gpio, data->active_low ? 1 : 0);
>                 if (data->delays[2])
>                         msleep(DIV_ROUND_UP(data->delays[2], 1000));
>
> If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
> if it is not set it results in the sequence 0, 1, 0.
I'm changing this logic with earlier patches of this series.
can you please look at these as well because GPIO_OPEN_SOURCE doesn't
work with the old version of stmmac_mdio_reset() that you are showing.

> The high (reset) is asserted by switching the pin into high-z open drain
> mode, which happens by switching the line into input mode in some
> cases.
>
> I think the real reason it works now is that reset is actually active high.
let me write down what I definitely know so far

the RTL8211F PHY wants the reset line to be LOW for a few milliseconds
to put it into reset mode.
driving the reset line HIGH again takes it out of reset.

Odroid-N2's schematics [0] (page 30) shows that there's a pull-up for
the PHYRSTB pin, which is also connected to the NRST signal which is
GPIOZ_15

> It makes a lot of sense, since if it resets the device when set as input
> (open drain) it holds all devices on that line in reset, which is likely
> what you want as most GPIOs come up as inputs (open drain).
> A pull-up resistor will ascertain that the devices are in reset.
my understanding is that the pull-up resistor holds it out of reset
driving GPIOZ_15's (open drain) output LOW pulls the signal to ground
and asserts the reset

> Other than the commit message:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
thank you for looking into this!


Martin


[0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.4_20190307.pdf
