From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 11/12] arm64: allwinner: a64: Fix node with unit name
 and no reg property
Date: Sat, 23 Sep 2017 10:29:28 +0800
Message-ID: <CAGb2v67Gam27uNeNd1Ma-x=SgMNMN5OY1_juXLd63dXah+cNDA@mail.gmail.com>
References: <20170922184045.6498-1-clabbe.montjoie@gmail.com> <20170922184045.6498-12-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922184045.6498-12-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 23, 2017 at 2:40 AM, Corentin Labbe
<clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch fix the warning "xxx has a unit name, but no reg property" by
> removing "@0" from such node
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 662e8b7981b5..b02a8476b0c8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -347,7 +347,7 @@
>                                 function = "spi1";
>                         };
>
> -                       uart0_pins_a: uart0@0 {
> +                       uart0_pins_a: uart0 {

Same here. This should be uart0_pb_pins.

>                                 pins = "PB8", "PB9";
>                                 function = "uart0";
>                         };
> @@ -571,7 +571,7 @@
>                         interrupt-controller;
>                         #interrupt-cells = <3>;
>
> -                       r_rsb_pins: rsb@0 {
> +                       r_rsb_pins: rsb {

And this rsb_pins.

ChenYu

>                                 pins = "PL0", "PL1";
>                                 function = "s_rsb";
>                         };
> --
> 2.13.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
