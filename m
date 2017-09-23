From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 03/12] ARM: dts: sunxi: h3/h5: Fix node with unit name
 and no reg property
Date: Sat, 23 Sep 2017 09:50:47 +0800
Message-ID: <CAGb2v66Sd7wCJGBLK1XANMbr=9DOZM34v1SEHFBGg6g_vknaZw@mail.gmail.com>
References: <20170922184045.6498-1-clabbe.montjoie@gmail.com> <20170922184045.6498-4-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922184045.6498-4-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 23, 2017 at 2:40 AM, Corentin Labbe
<clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch fix the warning "xxx has a unit name, but no reg property" by
> removing "@0" from such node.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index 289f2cd06dfe..2e4bae988acd 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -322,7 +322,7 @@
>                                 function = "i2c2";
>                         };
>
> -                       mmc0_pins_a: mmc0@0 {
> +                       mmc0_pins_a: mmc0 {

All pinmux nodes should have the suffix "_pins" or "_pin".

In the case where there are multiple choices, the node name should convey
what or which pingroup the choice is. In this case the name should be
"mmc0_pf_pins".

>                                 pins = "PF0", "PF1", "PF2", "PF3",
>                                        "PF4", "PF5";
>                                 function = "mmc0";
> @@ -330,13 +330,13 @@
>                                 bias-pull-up;
>                         };
>
> -                       mmc0_cd_pin: mmc0_cd_pin@0 {
> +                       mmc0_cd_pin: mmc0_cd_pin {
>                                 pins = "PF6";
>                                 function = "gpio_in";
>                                 bias-pull-up;
>                         };
>
> -                       mmc1_pins_a: mmc1@0 {
> +                       mmc1_pins_a: mmc1 {

mmc1_pins

>                                 pins = "PG0", "PG1", "PG2", "PG3",
>                                        "PG4", "PG5";
>                                 function = "mmc1";
> @@ -354,7 +354,7 @@
>                                 bias-pull-up;
>                         };
>
> -                       spdif_tx_pins_a: spdif@0 {
> +                       spdif_tx_pins_a: spdif {

spdif_pin

>                                 pins = "PA17";
>                                 function = "spdif";
>                         };
> @@ -369,7 +369,7 @@
>                                 function = "spi1";
>                         };
>
> -                       uart0_pins_a: uart0@0 {
> +                       uart0_pins_a: uart0 {

uart0_pb_pins

>                                 pins = "PA4", "PA5";
>                                 function = "uart0";
>                         };
> @@ -697,7 +697,7 @@
>                         interrupt-controller;
>                         #interrupt-cells = <3>;
>
> -                       ir_pins_a: ir@0 {
> +                       ir_pins_a: ir {

ir_pin

ChenYu

>                                 pins = "PL11";
>                                 function = "s_cir_rx";
>                         };
> --
> 2.13.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
