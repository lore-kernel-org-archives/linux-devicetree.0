From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] drm: rcar-du: Add a VSP channel index to the vsps
 DT property
Date: Mon, 26 Jun 2017 18:36:14 +0200
Message-ID: <CAMuHMdUy+qYi8cVg2JQNLUxSeuntnJ-KcMm5AwdVRKOW0A7A7A@mail.gmail.com>
References: <20170626162930.30240-1-laurent.pinchart+renesas@ideasonboard.com> <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Mon, Jun 26, 2017 at 6:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On some R-Car SoCs a single VSP can serve multiple DU channels through
> multiple LIF instances in the VSP. The current DT bindings don't support
> specifying that kind of SoC integration scheme. Extend them with a VSP
> channel index.
>
> Backward compatibility can be ensured in drivers by checking the length
> of the vsps property and setting the channel to 0 when the property
> doesn't contain channel indices.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -36,8 +36,10 @@ Required Properties:
>        When supplied they must be named "dclkin.x" with "x" being the input
>        clock numerical index.
>
> -  - vsps: A list of phandles to the VSP nodes that handle the memory
> -    interfaces for the DU channels.
> +  - vsps: A list of phandle and channel index tuples to the VSPs that handle
> +    the memory interfaces for the DU channels. The phandle identifies the VSP
> +    instance that serves the DU channel, and the channel index identifies the
> +    LIF instances in that VSP.

instance

> @@ -59,24 +61,24 @@ corresponding to each DU output.
>   R8A7796 (M3-W)        DPAD            HDMI            LVDS            -
>
>
> -Example: R8A7790 (R-Car H2) DU
> +Example: R8A7795 (R-Car H3) ES2.0 DU
>
> -       du: du@feb00000 {
> -               compatible = "renesas,du-r8a7790";
> -               reg = <0 0xfeb00000 0 0x70000>,
> -                     <0 0xfeb90000 0 0x1c>,
> -                     <0 0xfeb94000 0 0x1c>;
> -               reg-names = "du", "lvds.0", "lvds.1";
> -               interrupt-parent = <&gic>;
> -               interrupts = <0 256 IRQ_TYPE_LEVEL_HIGH>,
> -                            <0 268 IRQ_TYPE_LEVEL_HIGH>,
> -                            <0 269 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&mstp7_clks R8A7790_CLK_DU0>,
> -                        <&mstp7_clks R8A7790_CLK_DU1>,
> -                        <&mstp7_clks R8A7790_CLK_DU2>,
> -                        <&mstp7_clks R8A7790_CLK_LVDS0>,
> -                        <&mstp7_clks R8A7790_CLK_LVDS1>;
> -               clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
> +       du: display@feb00000 {
> +               compatible = "renesas,du-r8a7795";
> +               reg = <0 0xfeb00000 0 0x80000>,
> +                     <0 0xfeb90000 0 0x14>;
> +               reg-names = "du", "lvds.0";
> +               interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cpg CPG_MOD 724>,
> +                        <&cpg CPG_MOD 723>,
> +                        <&cpg CPG_MOD 722>,
> +                        <&cpg CPG_MOD 721>,
> +                        <&cpg CPG_MOD 727>;
> +               clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
> +               vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;

For increased readability, I suggest formatting this as:

        vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
