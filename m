From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] gpio: of: make it possible to name GPIO lines
Date: Mon, 9 May 2016 12:54:53 -0500
Message-ID: <20160509175453.GA20267@rob-hp-laptop>
References: <1462227850-7756-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462227850-7756-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Mandala <david.mandala@linaro.org>, Lee Campbell <leecam@google.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 03, 2016 at 12:24:10AM +0200, Linus Walleij wrote:
> Make it possible to name the producer side of a GPIO line using
> a "gpio-line-names" property array, modeled on the
> "clock-output-names" property from the clock bindings.
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
> The gpio-line-names attribute is completely optional.
> 
> Example output from lsgpio on a patched Snowball tree:
> 
> GPIO chip: gpiochip6, "8000e180.gpio", 32 GPIO lines
>         line  0: unnamed unused
>         line  1: "AP_GPIO161" "extkb3" [kernel]
>         line  2: "AP_GPIO162" "extkb4" [kernel]
>         line  3: "ACCELEROMETER_INT1_RDY" unused [kernel]
>         line  4: "ACCELEROMETER_INT2" unused
>         line  5: "MAG_DRDY" unused [kernel]
>         line  6: "GYRO_DRDY" unused [kernel]
>         line  7: "RSTn_MLC" unused
>         line  8: "RSTn_SLC" unused
>         line  9: "GYRO_INT" unused
>         line 10: "UART_WAKE" unused
>         line 11: "GBF_RESET" unused
>         line 12: unnamed unused
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: David Mandala <david.mandala@linaro.org>
> Cc: Lee Campbell <leecam@google.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Michael Welling <mwelling@ieee.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Do not use the bool accessor to see if a line is there, use
>   the return value from counting the strings to bail out if
>   <= 0.
> - Augment the naming loop to be smarter.
> ChangeLog v2->v3:
> - Swap "gpio-names" for "gpio-line-names" as "gpio-names" indicate
>   a consumer endpoint in DT terminology.
> - Index to either:
>   (A) The end of the gpio-names array or
>   (B) ngpios
>   So we don't risk going out of bounds on either
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
> 
> This patch is not about assigning initial values to GPIO lines.
> That is an orthogonal usecase. This is just about naming lines.
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 19 ++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpio/gpiolib-of.c                       | 49 +++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
