From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] gpio: revert bank bindings
Date: Tue, 19 Apr 2016 09:06:47 -0500
Message-ID: <CAL_JsqKY=koMGXp0XUd-C6BqXZAs9JnV-G088H7KY0NxbHX8Ow@mail.gmail.com>
References: <1461070196-15382-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461070196-15382-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+DT list

On Tue, Apr 19, 2016 at 7:49 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Keep the words talking about what a GPIO bank is, but remove the
> binding. We have not agreed that this is something we want to have.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index f509ecf03ece..c88d2ccb05ca 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -138,12 +138,6 @@ exposed in the device tree as an individual gpio-controller node, reflecting
>  the fact that the hardware was synthesized by reusing the same IP block a
>  few times over.
>
> -A GPIO controller may specify a bank ID. This is a hardware index that
> -indicate the logical order of the GPIO controller in the hardware architecture,
> -usually in the sequence 0, 1, 2 .. n. The hardware index may be different
> -from the order of register ranges and related to the backplane of how this
> -one bank is connected to the outside through a pin controller for example.
> -
>  Optionally, a GPIO controller may have a "ngpios" property. This property
>  indicates the number of in-use slots of available slots for GPIOs. The
>  typical example is something like this: the hardware register is 32 bits
> @@ -165,7 +159,6 @@ gpio-controller@00000000 {
>         reg = <0x00000000 0x1000>;
>         gpio-controller;
>         #gpio-cells = <2>;
> -       gpio-bank = <0>;
>         ngpios = <18>;
>  }
>
> --
> 2.4.11
>
