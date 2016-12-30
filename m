From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: TS-4600: add NBUS support
Date: Fri, 30 Dec 2016 09:01:22 +0100
Message-ID: <CACRpkdbLnDEo-7k1rsD6NT6U165CHjTyZwT9eqv+w7MVHYgNEA@mail.gmail.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com> <20161214231237.17496-6-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214231237.17496-6-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel <kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2016 at 12:12 AM, Sebastien Bourdelin
<sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:

> This commit enables the NBUS on the TS-4600, using the ts-nbus driver.
>
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

> +       nbus {
> +               compatible = "technologic,ts-nbus", "simple-bus";
> +               pinctrl-0 = <&nbus_pins>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pwms = <&pwm 2 83>;
> +               data-gpios   = <&gpio0 0 GPIO_ACTIVE_HIGH
> +                               &gpio0 1 GPIO_ACTIVE_HIGH
> +                               &gpio0 2 GPIO_ACTIVE_HIGH
> +                               &gpio0 3 GPIO_ACTIVE_HIGH
> +                               &gpio0 4 GPIO_ACTIVE_HIGH
> +                               &gpio0 5 GPIO_ACTIVE_HIGH
> +                               &gpio0 6 GPIO_ACTIVE_HIGH
> +                               &gpio0 7 GPIO_ACTIVE_HIGH>;
> +               csn-gpios    = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> +               txrx-gpios   = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +               strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +               ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
> +               rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;

devm_gpiod_get(&pdev->dev, "csn", GPIOD_OUT_HIGH); etc will get these
from the spawned
platform device.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
