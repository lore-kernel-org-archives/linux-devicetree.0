From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
Date: Mon, 10 Jun 2019 00:06:51 +0200
Message-ID: <CACRpkdYur+dwC1LqasQR-cvTWcpV12vr+8Wi5o9kXVWe-0teZw@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
 <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com> <CAFBinCBgoLb+Hfdo-sZ_0H6ct=UJm7j6wD_C6udbA6BTRvFOWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBgoLb+Hfdo-sZ_0H6ct=UJm7j6wD_C6udbA6BTRvFOWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 9, 2019 at 11:36 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> > If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
> > if it is not set it results in the sequence 0, 1, 0.
>
> I'm changing this logic with earlier patches of this series.
> can you please look at these as well because GPIO_OPEN_SOURCE doesn't
> work with the old version of stmmac_mdio_reset() that you are showing.

OK but the logic is the same, just that the polarity handling is moved
into gpiolib.

> > The high (reset) is asserted by switching the pin into high-z open drain
> > mode, which happens by switching the line into input mode in some
> > cases.
> >
> > I think the real reason it works now is that reset is actually active high.
>
> let me write down what I definitely know so far
>
> the RTL8211F PHY wants the reset line to be LOW for a few milliseconds
> to put it into reset mode.
> driving the reset line HIGH again takes it out of reset.
>
> Odroid-N2's schematics [0] (page 30) shows that there's a pull-up for
> the PHYRSTB pin, which is also connected to the NRST signal which is
> GPIOZ_15

Looks correct, R143 is indeed a pull up indicating that the line is
open drain, active low.

> > It makes a lot of sense, since if it resets the device when set as input
> > (open drain) it holds all devices on that line in reset, which is likely
> > what you want as most GPIOs come up as inputs (open drain).
> > A pull-up resistor will ascertain that the devices are in reset.
>
> my understanding is that the pull-up resistor holds it out of reset
> driving GPIOZ_15's (open drain) output LOW pulls the signal to ground
> and asserts the reset

Yep that seems correct.

Oh I guess it is this:

        amlogic,tx-delay-ns = <2>;
-       snps,reset-gpio = <&gpio GPIOZ_14 0>;
+       snps,reset-gpio = <&gpio GPIOZ_15 GPIO_OPEN_SOURCE>;
        snps,reset-delays-us = <0 10000 1000000>;
-       snps,reset-active-low;

Can you try:
snps,reset-gpio = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
?

Open source is nominally (and rarely) used for lines that are active high.
For lines that are active low, we want to use open drain combined
with active low.

Yours,
Linus Walleij
