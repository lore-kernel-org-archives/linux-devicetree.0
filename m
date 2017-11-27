From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/13] ARM: dts: imx6qdl: SolidRun: move AR8035 into microsom
Date: Mon, 27 Nov 2017 18:12:38 -0200
Message-ID: <CAOMZO5C+z2nFv0pFz5XDY-DGtj2YvhU_kNh1H8mdq6GOUqc_Mg@mail.gmail.com>
References: <20171127165134.GH31757@n2100.armlinux.org.uk> <E1eJMdi-0002qY-Ta@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1eJMdi-0002qY-Ta-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 2:52 PM, Russell King
<rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> +               pinctrl_microsom_enet_ar8035: microsom-enet-ar8035 {
> +                       fsl,pins = <
> +                               MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0x1b8b0
> +                               MX6QDL_PAD_ENET_MDC__ENET_MDC           0x1b0b0
> +                               /* AR8035 reset */
> +                               MX6QDL_PAD_KEY_ROW4__GPIO4_IO15         0x130b0
> +                               /* AR8035 interrupt */
> +                               MX6QDL_PAD_DI0_PIN2__GPIO4_IO18         0x80000000

Please avoid  0x80000000 and use the real IOMUX value instead.

> +                               /* GPIO16 -> AR8035 25MHz */
> +                               MX6QDL_PAD_GPIO_16__ENET_REF_CLK        0xc0000000

Ditto.

> +                               MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x80000000

Ditto.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
