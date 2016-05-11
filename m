From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] gpio: of: make it possible to name GPIO lines
Date: Wed, 11 May 2016 09:56:41 -0500
Message-ID: <20160511145641.GA32544@rob-hp-laptop>
References: <1462873819-7622-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462873819-7622-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Mandala <david.mandala@linaro.org>, Lee Campbell <leecam@google.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 11:50:19AM +0200, Linus Walleij wrote:
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

Trying to make me reconsider my ack on the previous v4? ;)

Acked-by: Rob Herring <robh@kernel.org>
