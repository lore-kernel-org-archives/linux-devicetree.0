From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: sun8i: a83t: add dwmac-sun8i
 ethernet driver
Date: Tue, 6 Jun 2017 21:54:11 +0800
Message-ID: <CAGb2v66jo7Fz2Uto_ymuwfHf1PXp2Q6gRRLb9N=tfvaJ=wPoqQ@mail.gmail.com>
References: <20170605192130.25320-1-clabbe.montjoie@gmail.com> <20170605192130.25320-6-clabbe.montjoie@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBG7I3LEQKGQEWB7ADRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170605192130.25320-6-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 6, 2017 at 3:21 AM, Corentin Labbe
<clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 speed.
> This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tree.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index ae559dc42caa..304a966c8048 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -200,6 +200,14 @@
>                         #interrupt-cells = <3>;
>                         #gpio-cells = <3>;
>
> +                       emac_rgmii_pins: emac0-pins {

I prefer emac-rgmii-pins for the node name.

> +                               pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +                                      "PD11", "PD12", "PD13", "PD14", "PD18",
> +                                      "PD19", "PD21", "PD22", "PD23";
> +                               function = "gmac";
> +                               drive-strength = <40>;
> +                       };
> +
>                         mmc0_pins: mmc0-pins {
>                                 pins = "PF0", "PF1", "PF2",
>                                        "PF3", "PF4", "PF5";
> @@ -266,6 +274,26 @@
>                         status = "disabled";
>                 };
>
> +               emac: ethernet@1c30000 {
> +                       compatible = "allwinner,sun8i-a83t-emac";
> +                       syscon = <&syscon>;
> +                       reg = <0x01c30000 0x104>;
> +                       interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq";
> +                       resets = <&ccu 13>;
> +                       reset-names = "stmmaceth";
> +                       clocks = <&ccu 27>;
> +                       clock-names = "stmmaceth";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       mdio: mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +
>                 gic: interrupt-controller@1c81000 {
>                         compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>                         reg = <0x01c81000 0x1000>,
> --
> 2.13.0
>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
