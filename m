From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/6] ARM: dts: imx7d-sbc-iot: add initial iot gateway dts
Date: Sun, 10 Dec 2017 13:10:06 -0200
Message-ID: <CAOMZO5BW50xcqwjCuEs045VySDs5TmS++1Wj2SnV0Die1N5B_A@mail.gmail.com>
References: <20171205222707.11302-1-tyler@opensourcefoundries.com> <20171205222707.11302-2-tyler@opensourcefoundries.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205222707.11302-2-tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 8:27 PM,  <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org> wrote:

> +&usdhc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc1>;
> +       cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +       wp-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +       enable-sdio-wakeup;

This is a deprecated property.

Please use wakeup-source as stated in
Documentation/devicetree/bindings/mmc/mmc.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
