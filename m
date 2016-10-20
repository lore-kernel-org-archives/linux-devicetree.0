From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/2] ARM: dts: imx6ul: Add DTS for liteBoard
Date: Thu, 20 Oct 2016 17:04:46 +0800
Message-ID: <CAJBJ56K53ua4htobTUQN2eQgvdqwtCjpmEXOWEr1YDn-BUmmSw@mail.gmail.com>
References: <20160930093626.3843-1-m.niestroj@grinn-global.com> <20160930093626.3843-2-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160930093626.3843-2-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 5:36 PM, Marcin Niestroj
<m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org> wrote:
> +       regulators {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               reg_usb_otg1_vbus: usb_otg1_regulator {
> +                       compatible = "regulator-fixed";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_usb_otg1_vbus>;
> +                       regulator-name = "usb_otg1_vbus";
> +                       regulator-min-microvolt = <5000000>;
> +                       regulator-max-microvolt = <5000000>;
> +                       gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +               };
> +       };

Please put it directly under root in the following naming schema to
save that fake simple-bus container node.

        reg_xxx: regulator-xxx {
                ...
        }

Note: underscore is in label name, while hyphen is in node name.

Shawn

> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
