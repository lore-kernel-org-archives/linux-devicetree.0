From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v8 14/34] ARM: dts: imx6-sabreauto: add the ADV7180 video decoder
Date: Thu, 8 Jun 2017 13:25:27 -0700
Message-ID: <CAJ+vNU0C0=4hUq+g1P7yTzLzFPidfauQROPOVr4WQWKNZz_xmQ@mail.gmail.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com> <1496860453-6282-15-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496860453-6282-15-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Nick Dyer <nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org>, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe TROTIN <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renes>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 7, 2017 at 11:33 AM, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Enables the ADV7180 decoder sensor. The ADV7180 connects to the
> parallel-bus mux input on ipu1_csi0_mux.
>
> The ADV7180 power pin is via max7310_b port expander.
>
> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>
> - Use IRQ_TYPE_LEVEL_LOW instead of 0x8 for interrupt type for clarity.
> - For 8-bit parallel IPU1-CSI0 bus connection only data[12-19] are used.
>
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> index 1212f82..c24af28 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> @@ -124,6 +124,21 @@
>                         #size-cells = <0>;
>                         reg = <1>;
>
> +                       adv7180: camera@21 {
> +                               compatible = "adi,adv7180";
> +                               reg = <0x21>;
> +                               powerdown-gpios = <&max7310_b 2 GPIO_ACTIVE_LOW>;
> +                               interrupt-parent = <&gpio1>;
> +                               interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +                               port {
> +                                       adv7180_to_ipu1_csi0_mux: endpoint {
> +                                               remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> +                                               bus-width = <8>;
> +                                       };
> +                               };
> +                       };
> +
>                         max7310_a: gpio@30 {
>                                 compatible = "maxim,max7310";
>                                 reg = <0x30>;
> @@ -151,6 +166,25 @@
>         };
>  };
>
> +&ipu1_csi0_from_ipu1_csi0_mux {
> +       bus-width = <8>;
> +};
> +
> +&ipu1_csi0_mux_from_parallel_sensor {
> +       remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
> +       bus-width = <8>;
> +};
> +
> +&ipu1_csi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ipu1_csi0>;
> +
> +       /* enable frame interval monitor on this port */
> +       fim {
> +               status = "okay";
> +       };

Steve,

You need to remove the fim node now that you've moved this to V4L2 controls.

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
