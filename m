From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 3/3] ARM: dts: sun6i: Add SPDIF to the Mele I7
Date: Sun, 8 Jan 2017 03:16:22 +0800
Message-ID: <CAGb2v66atehFNDu-G94_WoFXzCPfZev4xsGD8ghr7+_gx-PZJg@mail.gmail.com>
References: <20161220104038.22532-1-codekipper@gmail.com> <20161220104038.22532-4-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220104038.22532-4-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2016 at 6:40 PM,  <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Enable the S/PDIF transmitter that is present on the Mele I7.
>
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

This patch should be ready to be merged. The associated clk
and dtsi changes are already in Maxime's tree.

> ---
>  arch/arm/boot/dts/sun6i-a31-i7.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun6i-a31-i7.dts b/arch/arm/boot/dts/sun6i-a31-i7.dts
> index a2193309a199..2bc57d2dcd80 100644
> --- a/arch/arm/boot/dts/sun6i-a31-i7.dts
> +++ b/arch/arm/boot/dts/sun6i-a31-i7.dts
> @@ -69,6 +69,23 @@
>                         gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>;
>                 };
>         };
> +
> +       sound {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "On-board SPDIF";
> +               simple-audio-card,cpu {
> +                       sound-dai = <&spdif>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai = <&spdif_out>;
> +               };
> +       };
> +
> +       spdif_out: spdif-out {
> +               #sound-dai-cells = <0>;
> +               compatible = "linux,spdif-dit";
> +       };
>  };
>
>  &codec {
> @@ -138,6 +155,13 @@
>         status = "okay";
>  };
>
> +&spdif {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spdif_pins_a>;
> +       spdif-out = "okay";
> +       status = "okay";
> +};
> +
>  &uart0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart0_pins_a>;
> --
> 2.11.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
