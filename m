From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: add veyron-jaq board
Date: Thu, 20 Aug 2015 01:29:40 +0200
Message-ID: <CABxcv=nQAfCzj_bQ9N-XYEPCNuihyrkUOz7=ogetKzye4KKNng@mail.gmail.com>
References: <1440022721-73712-1-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440022721-73712-1-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Brian,

[...]

> +
> +&rk808 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pmic_int_l &dvs_1 &dvs_2>;
> +       dvs-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>,
> +                   <&gpio7 15 GPIO_ACTIVE_HIGH>;

I see the dvs-gpios DT property is documented in the downstream
ChromiumOS 3.18 tree [0] but I don't see it neither mentioned in
Documentation/devicetree/bindings/mfd/rk808.txt in mainline nor code
that parses it in the drivers/regulator/rk808-regulator.c driver.

So I think this should be removed and also the dvs_{1,2} pinctrl
lines. The rest of the patch looks good to me though so with these
removed feel free to add:

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

[0]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-3.14/Documentation/devicetree/bindings/mfd/rk808.txt

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
