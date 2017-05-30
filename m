From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-cm-fx6: add sdio wifi/bt nodes
Date: Tue, 30 May 2017 17:40:06 -0300
Message-ID: <CAOMZO5Ca+8U2r5hHcUd__d8EPWHQzKg5-WOY8d2NxBGEz18=yw@mail.gmail.com>
References: <1a13681b84564bc18937eb54b8345957@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a13681b84564bc18937eb54b8345957-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Christopher,

On Tue, May 30, 2017 at 5:16 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:

> +       awnh387_pwrseq: pwrseq {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pwrseq>;
> +               compatible = "mmc-pwrseq-sd8787";
> +               powerdown-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio6 16 GPIO_ACTIVE_HIGH>;

At least in the AW-NH387 datasheet I found it says:

RESETn: Reset(active low at least 10ns)

Please double check the polarity in device tree.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
