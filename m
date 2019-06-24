Return-Path: <SRS0=yzYA=UX=metux.net=lkml@kernel.org>
Subject: Re: [RFC] Initial state for GPIOs
References: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <716ee0b5-21b8-e245-e957-e3e18b3d44b1@metux.net>
Date: Mon, 24 Jun 2019 08:32:14 +0200
MIME-Version: 1.0
In-Reply-To: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Martyn Welch <martyn.welch@collabora.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com
List-ID: <devicetree@vger.kernel.org>

On 20.06.19 15:16, Martyn Welch wrote:

Hi,

I haven't followed the previous discussions, so please forgive me when
I'm missing something and asking dumb or already answered questions:

> An alternative that has been briefly raised[4] when I approached the> subject recently on the GPIO mailing list is to add a property to the>
controller node, rather than child nodes, that listed the expected>
initial states of the pins as an array, much like the line names are>
handled through "gpio-line-names".
If it's really about early setting a specific state *once*, then I think
this would be the best approach.

OTOH, I'm still a bit unsure, whether the whole idea is really correct
to begin with:

I'd guess if a specific initial state is required, the pin has some
special meaning, which indicates there should be a specific driver for
it. I've got a strange feeling on splitting the semantics between board
configuration like DT (or some board init code) and the driver - even if
the driver is just some script in userland.

What are the reasons for not just doing it in a bootup script ?

Another problem might be timing: in either case, we don't know when the
initial state is actually set. Doing it in the kernel instead of
userland certainly moves it to an earlier point in time, but still a
pretty much unpredictable one.

> --- gpio.h
>         /* Bit 4 express initial state */
>         #define GPIO_INPUT 0
>         #define GPIO_OUTPUT 16
> 
>         /* Bit 5 express initial state */
>         #define GPIO_INITIAL_LOW 0
>         #define GPIO_INITIAL_HIGH 32
>         
>         #define GPIO_OUTPUT_LOW (GPIO_OUTPUT | GPIO_INITIAL_LOW)
>         #define GPIO_OUTPUT_HIGH (GPIO_OUTPUT | GPIO_INITIAL_HIGH)

Does it need to be an int value in DT ?
Why not using human-readable strings, eg:

   "in"
   "out-low"
   "out-hi"

Yes, doing three strcmp()s takes more cycles than just a switch(),
but does that really matter ?

> An alternative option may be to provide the offset as the first item
> (though this is then different from "gpio-line-names"), so:
>
> 
> --- device tree
>         &gpiochip {
>                 gpio-line-names = "", "", "", "widget_en",
> 			"widget_signal";
>                 gpio-initial-states =
> 			<3 GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
> 			<4 GPIO_INPUT | GPIO_ACTIVE_LOW>;
>         };

hmm, feels a bit strange to me. Yes, it allows a shorter notation, if
one just wants to set very few lines, but IMHO complicates things.
I feel a list w/ possibly NULL entries is cleaner.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
