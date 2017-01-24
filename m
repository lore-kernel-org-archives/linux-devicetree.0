From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 3/3] ARM: dts: imx6q-evi: support cyclone-ps-spi
Date: Mon, 23 Jan 2017 22:00:15 -0200
Message-ID: <CAOMZO5AmQhjGOa2NaFn0Az4Xnza8jmK=9gpPJpnkmAvN_zxzeA@mail.gmail.com>
References: <cover.1485211400.git.stillcompiling@gmail.com> <c429cec34a880c0d5438091f436a5946a4db3fc0.1485211400.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c429cec34a880c0d5438091f436a5946a4db3fc0.1485211400.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 8:51 PM, Joshua Clayton
<stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add support for Altera cyclone V FPGA connected to an spi port
> to the evi devicetree file
>
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
> index 24fe093..a0cbb2d 100644
> --- a/arch/arm/boot/dts/imx6q-evi.dts
> +++ b/arch/arm/boot/dts/imx6q-evi.dts
> @@ -82,6 +82,15 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>         status = "okay";
> +
> +       fpga_spi: cyclonespi@0 {
> +               compatible = "altr,fpga-passive-serial";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +               pinctrl-0 = <&pinctrl_fpgaspi>;
> +               nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +               nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;

Your binding doc says that 'confd-gpios ' is a required property, but
you did not put it here.

Either it is missing here or you should mention that it is optional in
the binding doc.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
