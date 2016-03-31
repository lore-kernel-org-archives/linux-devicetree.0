From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Thu, 31 Mar 2016 08:22:40 -0500
Message-ID: <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459415459-8107-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 4:10 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

We generally avoid indexing blocks in DT.

> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 069cdf6f9dac..f509ecf03ece 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -131,6 +131,19 @@ Every GPIO controller node must contain both an empty "gpio-controller"
>  property, and a #gpio-cells integer property, which indicates the number of
>  cells in a gpio-specifier.
>
> +Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO bank is an
> +instance of a hardware IP core on a silicon die, usually exposed to the
> +programmer as a coherent range of I/O addresses. Usually each such bank is
> +exposed in the device tree as an individual gpio-controller node, reflecting
> +the fact that the hardware was synthesized by reusing the same IP block a
> +few times over.
> +
> +A GPIO controller may specify a bank ID. This is a hardware index that
> +indicate the logical order of the GPIO controller in the hardware architecture,
> +usually in the sequence 0, 1, 2 .. n. The hardware index may be different
> +from the order of register ranges and related to the backplane of how this
> +one bank is connected to the outside through a pin controller for example.

I still don't understand why do you need to know this? If you need
some mapping of gpio nodes into pin controller, the pin controller
should have a mapping using phandles.

> +
>  Optionally, a GPIO controller may have a "ngpios" property. This property
>  indicates the number of in-use slots of available slots for GPIOs. The
>  typical example is something like this: the hardware register is 32 bits
> @@ -152,6 +165,7 @@ gpio-controller@00000000 {
>         reg = <0x00000000 0x1000>;
>         gpio-controller;
>         #gpio-cells = <2>;
> +       gpio-bank = <0>;
>         ngpios = <18>;
>  }
>
> --
> 2.4.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
