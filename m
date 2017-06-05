From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 4/6] ARM: dts: imx6q-evi: support altera-ps-spi
Date: Mon, 5 Jun 2017 10:12:14 -0500
Message-ID: <CANk1AXQ3i-mmQRBKUpi7_6fYtLGtgKni5qKGLmvncWpkmw+tRQ@mail.gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
 <684ea151ba9aa2c6555a299daf56552ddc11f596.1496434383.git.stillcompiling@gmail.com>
 <8253d3ad7de8ba991de9f23fd68b8f9502c1ffe0.1496434383.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8253d3ad7de8ba991de9f23fd68b8f9502c1ffe0.1496434383.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 2, 2017 at 3:30 PM, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add support for Altera FPGA connected to an spi port
> to the evi devicetree file
>
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
> index 24fe093a66db..59aebbc95671 100644
> --- a/arch/arm/boot/dts/imx6q-evi.dts
> +++ b/arch/arm/boot/dts/imx6q-evi.dts
> @@ -82,6 +82,15 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>         status = "okay";
> +
> +       fpga: fpga@0 {
> +               compatible = "altr,fpga-passive-serial";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +               pinctrl-0 = <&pinctrl_fpgaspi>;
> +               nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +               nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +       };
>  };
>
>  &ecspi3 {
> @@ -313,6 +322,13 @@
>                 >;
>         };
>
> +       pinctrl_fpgaspi: fpgaspigrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_ROW1__GPIO4_IO09 0x1b0b0
> +                       MX6QDL_PAD_KEY_ROW2__GPIO4_IO11 0x1b0b0
> +               >;
> +       };
> +
>         pinctrl_gpminand: gpminandgrp {
>                 fsl,pins = <
>                         MX6QDL_PAD_NANDF_CLE__NAND_CLE 0xb0b1
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
