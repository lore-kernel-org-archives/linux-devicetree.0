From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 23/24] ARM: dts: sun8i: r40: Add HDMI pipeline
Date: Thu, 28 Jun 2018 10:50:09 +0800
Message-ID: <CAGb2v66d-L4+TAgOMoPfpK2WAc3LKfprLB7tiAFL4YeL3Ogoow@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-24-jernej.skrabec@siol.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6EZ2HMQKGQEJH45WWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-24-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 8:03 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Add all entries needed for HDMI to function properly.
>
> Since R40 has highly configurable pipeline, both mixers and both TCON
> TVs are added. Board specific DT should then connect them together
> trough TCON TOP muxers to best fit the purpose of the board.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 269 +++++++++++++++++++++++++++++++
>  1 file changed, 269 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 173dcc1652d2..a2a75fb04caf 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -42,8 +42,11 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun8i-de2.h>
>  #include <dt-bindings/clock/sun8i-r40-ccu.h>
> +#include <dt-bindings/clock/sun8i-tcon-top.h>
>  #include <dt-bindings/reset/sun8i-r40-ccu.h>
> +#include <dt-bindings/reset/sun8i-de2.h>
>
>  / {
>         #address-cells = <1>;
> @@ -99,12 +102,76 @@
>                 };
>         };
>
> +       de: display-engine {
> +               compatible = "allwinner,sun8i-r40-display-engine",
> +                            "allwinner,sun8i-h3-display-engine";

Given that the display pipeline looks different, they should not be
compatible.

> +               allwinner,pipelines = <&mixer0>, <&mixer1>;
> +               status = "disabled";
> +       };
> +
>         soc {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
>
> +               display_clocks: clock@1000000 {
> +                       compatible = "allwinner,sun8i-r40-de2-clk",
> +                                    "allwinner,sun8i-h3-de2-clk";
> +                       reg = <0x01000000 0x100000>;
> +                       clocks = <&ccu CLK_DE>,
> +                                <&ccu CLK_BUS_DE>;
> +                       clock-names = "mod",
> +                                     "bus";
> +                       resets = <&ccu RST_BUS_DE>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +               };
> +
> +               mixer0: mixer@1100000 {
> +                       compatible = "allwinner,sun8i-r40-de2-mixer-0";
> +                       reg = <0x01100000 0x100000>;
> +                       clocks = <&display_clocks CLK_BUS_MIXER0>,
> +                                <&display_clocks CLK_MIXER0>;
> +                       clock-names = "bus",
> +                                     "mod";
> +                       resets = <&display_clocks RST_MIXER0>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               mixer0_out: port@1 {
> +                                       reg = <1>;
> +                                       mixer0_out_tcon_top: endpoint {
> +                                               remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               mixer1: mixer@1200000 {
> +                       compatible = "allwinner,sun8i-r40-de2-mixer-1";
> +                       reg = <0x01200000 0x100000>;
> +                       clocks = <&display_clocks CLK_BUS_MIXER1>,
> +                                <&display_clocks CLK_MIXER1>;
> +                       clock-names = "bus",
> +                                     "mod";
> +                       resets = <&display_clocks RST_WB>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               mixer1_out: port@1 {
> +                                       reg = <1>;
> +                                       mixer1_out_tcon_top: endpoint {
> +                                               remote-endpoint = <&tcon_top_mixer1_in_mixer1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
>                 nmi_intc: interrupt-controller@1c00030 {
>                         compatible = "allwinner,sun7i-a20-sc-nmi";
>                         interrupt-controller;
> @@ -451,6 +518,163 @@
>                         #size-cells = <0>;
>                 };
>
> +               tcon_top: tcon-top@1c70000 {
> +                       compatible = "allwinner,sun8i-r40-tcon-top";
> +                       reg = <0x01c70000 0x1000>;
> +                       clocks = <&ccu CLK_BUS_TCON_TOP>,
> +                                <&ccu CLK_TCON_TV0>,
> +                                <&ccu CLK_TVE0>,
> +                                <&ccu CLK_TCON_TV1>,
> +                                <&ccu CLK_TVE1>,
> +                                <&ccu CLK_DSI_DPHY>;
> +                       clock-names = "bus",
> +                                     "tcon-tv0",
> +                                     "tve0",
> +                                     "tcon-tv1",
> +                                     "tve1",
> +                                     "dsi";
> +                       clock-output-names = "tcon-top-tv0",
> +                                            "tcon-top-tv1",
> +                                            "tcon-top-dsi";
> +                       resets = <&ccu RST_BUS_TCON_TOP>;
> +                       #clock-cells = <1>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               tcon_top_mixer0_in: port@0 {
> +                                       reg = <0>;
> +
> +                                       tcon_top_mixer0_in_mixer0: endpoint {
> +                                               remote-endpoint = <&mixer0_out_tcon_top>;
> +                                       };
> +                               };
> +
> +                               tcon_top_mixer0_out: port@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +
> +                                       tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
> +                                               reg = <0>;
> +                                       };
> +
> +                                       tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
> +                                               reg = <1>;
> +                                       };
> +
> +                                       tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
> +                                               reg = <2>;
> +                                       };
> +
> +                                       tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
> +                                               reg = <3>;
> +                                       };
> +                               };
> +
> +                               tcon_top_mixer1_in: port@2 {
> +                                       reg = <2>;
> +
> +                                       tcon_top_mixer1_in_mixer1: endpoint {
> +                                               remote-endpoint = <&mixer1_out_tcon_top>;
> +                                       };
> +                               };
> +
> +                               tcon_top_mixer1_out: port@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +
> +                                       tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
> +                                               reg = <0>;
> +                                       };
> +
> +                                       tcon_top_mixer1_out_tcon_lcd1: endpoint@1 {
> +                                               reg = <1>;
> +                                       };
> +
> +                                       tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
> +                                               reg = <2>;
> +                                       };
> +
> +                                       tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
> +                                               reg = <3>;
> +                                       };
> +                               };
> +
> +                               tcon_top_hdmi_in: port@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +
> +                                       tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
> +                                               reg = <0>;
> +                                       };
> +
> +                                       tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
> +                                               reg = <1>;
> +                                       };
> +                               };
> +
> +                               tcon_top_hdmi_out: port@5 {
> +                                       reg = <5>;
> +
> +                                       tcon_top_hdmi_out_hdmi: endpoint {
> +                                               remote-endpoint = <&hdmi_in_tcon_top>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               tcon_tv0: lcd-controller@1c73000 {
> +                       compatible = "allwinner,sun8i-r40-tcon-tv",
> +                                    "allwinner,sun8i-a83t-tcon-tv";
> +                       reg = <0x01c73000 0x1000>;
> +                       interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_TCON_TV0>, <&tcon_top 0>;
> +                       clock-names = "ahb", "tcon-ch1";
> +                       resets = <&ccu RST_BUS_TCON_TV0>;
> +                       reset-names = "lcd";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               tcon_tv0_in: port@0 {
> +                                       reg = <0>;
> +                               };
> +
> +                               tcon_tv0_out: port@1 {
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
> +
> +               tcon_tv1: lcd-controller@1c74000 {
> +                       compatible = "allwinner,sun8i-r40-tcon-tv",
> +                                    "allwinner,sun8i-a83t-tcon-tv";
> +                       reg = <0x01c74000 0x1000>;
> +                       interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_TCON_TV1>, <&tcon_top 1>;
> +                       clock-names = "ahb", "tcon-ch1";
> +                       resets = <&ccu RST_BUS_TCON_TV1>;
> +                       reset-names = "lcd";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               tcon_tv1_in: port@0 {
> +                                       reg = <0>;
> +                               };
> +
> +                               tcon_tv1_out: port@1 {
> +                                       reg = <1>;

You are missing the remote-endpoints for all the TCON-TOP <-> TCON connections.
Also, on the driver side, there's no code to handle dynamically mapping mixers
to the TCONs that are being used. In the past we had simple 1:1 mappings. This
is no longer the case, and it needs to be dealt with.

ChenYu

> +                               };
> +                       };
> +               };
> +
>                 gic: interrupt-controller@1c81000 {
>                         compatible = "arm,gic-400";
>                         reg = <0x01c81000 0x1000>,
> @@ -461,6 +685,51 @@
>                         #interrupt-cells = <3>;
>                         interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
> +
> +               hdmi: hdmi@1ee0000 {
> +                       compatible = "allwinner,sun8i-r40-dw-hdmi",
> +                                    "allwinner,sun8i-a83t-dw-hdmi";
> +                       reg = <0x01ee0000 0x10000>;
> +                       reg-io-width = <1>;
> +                       interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_HDMI0>, <&ccu CLK_HDMI_SLOW>,
> +                                <&ccu CLK_HDMI>;
> +                       clock-names = "iahb", "isfr", "tmds";
> +                       resets = <&ccu RST_BUS_HDMI1>;
> +                       reset-names = "ctrl";
> +                       phys = <&hdmi_phy>;
> +                       phy-names = "hdmi-phy";
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               hdmi_in: port@0 {
> +                                       reg = <0>;
> +
> +                                       hdmi_in_tcon_top: endpoint {
> +                                               remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
> +                                       };
> +                               };
> +
> +                               hdmi_out: port@1 {
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
> +
> +               hdmi_phy: hdmi-phy@1ef0000 {
> +                       compatible = "allwinner,sun8i-r40-hdmi-phy",
> +                                    "allwinner,sun50i-a64-hdmi-phy";
> +                       reg = <0x01ef0000 0x10000>;
> +                       clocks = <&ccu CLK_BUS_HDMI1>, <&ccu CLK_HDMI_SLOW>,
> +                                <&ccu 7>, <&ccu 16>;
> +                       clock-names = "bus", "mod", "pll-0", "pll-1";
> +                       resets = <&ccu RST_BUS_HDMI0>;
> +                       reset-names = "phy";
> +                       #phy-cells = <0>;
> +               };
>         };
>
>         timer {
> --
> 2.18.0
>
