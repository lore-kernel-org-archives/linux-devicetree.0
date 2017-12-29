From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 07/11] ARM: sunxi: h3/h5: add simplefb nodes
Date: Fri, 29 Dec 2017 16:45:18 +0800
Message-ID: <CAGb2v66LGkzscbpCAwhPvA2VPL-8Qpc+e5vNFPq6vS2Hvh9DbA@mail.gmail.com>
References: <20171222122243.25735-1-icenowy@aosc.io> <20171222122243.25735-8-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222122243.25735-8-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 22, 2017 at 8:22 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> The H3/H5 SoCs have a HDMI output and a TV Composite output.
>
> Add simplefb nodes for these outputs.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index fcb909658cf0..31478c03790d 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -53,6 +53,35 @@
>         #address-cells = <1>;
>         #size-cells = <1>;
>
> +       chosen {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               framebuffer-hdmi {
> +                       compatible = "allwinner,simple-framebuffer",
> +                                    "simple-framebuffer";
> +                       allwinner,pipeline = "mixer0-lcd0-hdmi";
> +                       clocks = <&display_clocks CLK_BUS_MIXER0>,
> +                                <&ccu CLK_BUS_TCON0>, <&ccu CLK_BUS_HDMI>,

Are the bus clocks necessary? It's not like simplefb is going to access
any of the control registers.

> +                                <&display_clocks CLK_MIXER0>,
> +                                <&ccu CLK_TCON0>, <&ccu CLK_HDMI>,
> +                                <&ccu CLK_HDMI_DDC>;

Is the DDC clock necessary? There's no usage of DDC with simplefb.

ChenYu

> +                       status = "disabled";
> +               };
> +
> +               framebuffer-tve {
> +                       compatible = "allwinner,simple-framebuffer",
> +                                    "simple-framebuffer";
> +                       allwinner,pipeline = "mixer1-lcd1-tve";
> +                       clocks = <&display_clocks CLK_BUS_MIXER1>,
> +                                <&ccu CLK_BUS_TCON1>, <&ccu CLK_BUS_TVE>,
> +                                <&display_clocks CLK_MIXER1>,
> +                                <&ccu CLK_TVE>;
> +                       status = "disabled";
> +               };
> +       };
> +
>         clocks {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> --
> 2.14.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
