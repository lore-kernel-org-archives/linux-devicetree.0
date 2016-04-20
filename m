From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] gpio: of: make it possible to name GPIO lines
Date: Wed, 20 Apr 2016 18:41:34 -0500
Message-ID: <CAL_JsqJb+T+r=jOpF+nNkMD_gzB6B7=08_+mNRc-ZRA2TZNpiA@mail.gmail.com>
References: <1461190600-20955-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461190600-20955-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 5:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Make it possible to name the producer side of a GPIO line using
> a "gpio-names" property array, modeled on the "clock-names"
> property from the clock bindings.

Except clock-names is the consumer side. There is clock-output-names
for the clock controller side though.

>
> This naming is especially useful for:
>
> - Debugging: lines are named after function, not just opaque
>   offset numbers.
>
> - Exploration: systems where some or all GPIO lines are available
>   to end users, such as prototyping, one-off's "makerspace usecases"
>   users are helped by the names of the GPIO lines when tinkering.
>   This usecase has been surfacing recently.
>
> The gpio-names attribute is completely optional.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Make the naming function return void: we continue at all times
>   and always return 0 anyway.
> - Fix a return value check.
>
> This has been discussed at some length now.
>
> Why we are not using hogs: these are consumer side, not producer
> side. The gpio-controller in DT (gpio_chip in Linux) is a
> producer, not a consumer.

Arguably, the names you have are the consumer side. The consumer side
is what defines the function. The consumer name is typically local
like vddio being the input supply pin, but the producer names are more
global like ldo3.

> This patch is not about assigning initial values to GPIO lines.
> That is an orthogonal usecase. This is just about naming lines.

It is unless we decide that both should use the same structure.

I'm also worried that just putting in somewhat random names doesn't
buy much. If you have to figure out what the name is for the GPIO line
you want from userspace, then you might as well know the chip and
offset. I'm doubtful we could standardize naming across platforms.

I'm not saying yes or no yet, just raising some of the concerns I have.

Rob
