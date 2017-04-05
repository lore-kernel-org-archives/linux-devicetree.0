From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 01/11] arm64: allwinner: a64: enable RSB on A64
Date: Wed, 5 Apr 2017 11:48:43 +0800
Message-ID: <CAGb2v67wo1pDbLSLZzXHd+djinthfo0xhSgThHq2qcWjSktcYQ@mail.gmail.com>
References: <20170404180145.12897-1-icenowy@aosc.io> <20170404180145.12897-2-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBM6SSHDQKGQEBFIPODY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170404180145.12897-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 2:01 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> Allwinner A64 have a RSB controller like the one on A23/A33 SoCs.
>
> Add it and its pinmux.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 6bc606b4d74d..9a75b1c7c91a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -420,6 +420,27 @@
>                         #gpio-cells = <3>;
>                         interrupt-controller;
>                         #interrupt-cells = <3>;
> +
> +                       r_rsb_pins: rsb@0 {
> +                               pins = "PL0", "PL1";
> +                               function = "s_rsb";
> +                               drive-strength = <20>;

We don't need this. The hardware default should be enough.

> +                               bias-pull-up;

Boards should have external pull-ups for these pins, as the PMICs
start up in I2C mode. If any board actually doesn't have them and
needs the internal pull-ups, they should be set at the board level.

Otherwise,

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

> +                       };
> +               };
> +
> +               r_rsb: rsb@1f03400 {
> +                       compatible = "allwinner,sun8i-a23-rsb";
> +                       reg = <0x01f03400 0x400>;
> +                       interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&r_ccu 6>;
> +                       clock-frequency = <3000000>;
> +                       resets = <&r_ccu 2>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&r_rsb_pins>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
>                 };
>         };
>  };
> --
> 2.12.2
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
