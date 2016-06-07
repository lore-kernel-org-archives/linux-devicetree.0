From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Tue, 7 Jun 2016 16:00:53 -0500
Message-ID: <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ@mail.gmail.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com> <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

+Mark R

On Fri, Jun 3, 2016 at 3:26 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> In certain cases it makes sense to create cascaded GPIO which
> are not real GPIOs, merely point to the real backend GPIO chip.

In what cases? Make it clear what this is for. Connectors of course,
but are there any other use cases you have in mind.

> In order to support this, cascaded of_xlate lookup need to be
> performed.
>
> For example let's take a connector that we want to abstract
> having two GPIO pins from different GPIO controllers, connector
> pin #0 connected to gpioA controller with offset 10 and gpioB
> with 4.

A connector's GPIO number may or may not be related to connector pins.

> In pseudo DT form this is analogous to:
>
>         gpioA: gpioa@80000 {
>                 compatible = "foocorp,gpio";
>                 ...
>         };
>
>         gpioB: gpiob@80800 {
>                 compatible = "foocorp,gpio";
>                 ....
>         };
>
>         gpioC: controller_gpio {
>                 compatible = "cascaded-gpio";

This compatible is kind of meaningless. I'd expect this to be a
connector compatible.

>                 gpios = <&gpioA 10>, <&gpioB 5>;

As we discussed at ELC, I think this should be modeled after
interrupt-map property like this:

gpio-map = <0 0 &soc_gpio 10 0>, <1 0 &soc_gpio 5 0>;
gpio-map-mask = <0xff 0>;

This is more flexible, a known pattern, and allows remapping of flag cells.

Also, we will likely have interrupt capable GPIOs, so they are going
to need interrupt-map anyway.

Rob
