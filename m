From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: Add parsing of DT GPIO line-names
Date: Tue, 15 Mar 2016 09:41:26 +0100
Message-ID: <CACRpkdby+VUhZTwD9c3Q0t2BGqQYTbaypaM-L1WzXXrshNLbYw@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456214089-13954-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This patch reuses the DT bindings that are already in place for the
> gpio-hogging mechanism. These bindings define line-name properties for
> GPIOs inside the gpio-chip device node.
>
> of_parse_own_gpio() now sets the gpio descriptor name using the newly
> introduced gpiod_set_name(). It checks for name collisions within a GPIO
> chip to avoid GPIOs with the same name that are exported over the same
> GPIO character device.
>
> The GPIO flags that describe the GPIO state are not required anymore in
> general but are checked if the gpio-hog property was found.
>
> This can be used to use the line names from the schematic. Example of lsgpio on
> a modified i.MX6s Riotboard:
>
>         GPIO chip: gpiochip0, "209c000.gpio", 32 GPIO lines
>                 line 0: unnamed unlabeled
>                 line 1: unnamed unlabeled
>                 line 2: SD2_WP "wp" [kernel output open-drain]
>                 line 3: GPIO_3_CLK unlabeled
>                 line 4: SD2_CD "cd" [kernel output open-drain]
>                 ...
>
> The modified DT:
>          &gpio1 {
>                 sd2_wp {
>                         gpios = <2 0>;
>                         line-name = "SD2_WP";
>                 };
>
>                 gpio_3_clk {
>                         gpios = <3 0>;
>                         line-name = "GPIO_3_CLK";
>                 };
>
>                 sd2_cd {
>                         gpios = <4 0>;
>                         line-name = "SD2_CD";
>                 };
>         };
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

I discussed the method for naming the GPIO lines with Rob Herring, Grant
Likely and Arnd Bergmann in person last week.

Rob strongly prefers that we just assign the names to the indices using an
array, like is done in the clock framework so we don't deviate from their
pattern for clock-output-names:
Documentation/devicetree/bindings/clock/clock-bindings.txt

In our case I proposed that it be named gpio-line-names, so:

gpio-line-names = "foo", "bar", "baz" ... ;

It needs to be named gpio-line-names, since they are
bidirectional so gpio-output-names would not work, also
gpio-names = ... would be ambigous. So I suggest gpio-line-names.

Further, there is a problem that I did not realize with reusing the
hog names: the name specified in there is for the consumer side:
so it will result in gpiod_get("name") and name the consumer
side (label) of the GPIO. It is confusing if the same scheme is
used to name the producer side: so let's leave hogs to be hogs:
they are a kind of consumer nothing else.

We also discussed initial values/set up. This is another issue
and we didn't reach a conclusion on that.

Anyways: we need a line naming patch, are you interested
in hacking it up (keep DT bindings and code changed in the
same file) or should I do it?

Yours,
Linus Walleij
