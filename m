From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm64: allwinner: h6: add EMAC
 device nodes
Date: Wed, 14 Nov 2018 18:30:24 +0800
Message-ID: <CAGb2v64nj45kYCdn94eEvk+yQZSh5zy8m3=65q1WRR=d1j_Tgw@mail.gmail.com>
References: <20181103123238.4665-1-icenowy@aosc.io> <20181103123238.4665-3-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBTXSV7PQKGQECWHTL7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181103123238.4665-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 3, 2018 at 8:33 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
> Allwinner H6 SoC has an EMAC like the one in A64.
>
> Add device tree nodes for the H6 DTSI file.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Dropped unneeded cells property.
>
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 040828d2e2c0..11f7ce7d1876 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -149,6 +149,14 @@
>                         interrupt-controller;
>                         #interrupt-cells = <3>;
>
> +                       ext_rgmii_pins: rgmii_pins {
> +                               pins = "PD0", "PD1", "PD2", "PD3", "PD4",
> +                                      "PD5", "PD7", "PD8", "PD9", "PD10",
> +                                      "PD11", "PD12", "PD13", "PD19", "PD20";
> +                               function = "emac";
> +                               drive-strength = <40>;
> +                       };
> +
>                         mmc0_pins: mmc0-pins {
>                                 pins = "PF0", "PF1", "PF2", "PF3",
>                                        "PF4", "PF5";
> @@ -258,6 +266,26 @@
>                         status = "disabled";
>                 };
>
> +               emac: ethernet@5020000 {
> +                       compatible = "allwinner,sun50i-a64-emac",
> +                                    "allwinner,sun50i-h6-emac";

These are in the wrong order. Since this is already merged, please send
a fix for it.

ChenYu

> +                       syscon = <&syscon>;
> +                       reg = <0x05020000 0x10000>;
> +                       interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq";
> +                       resets = <&ccu RST_BUS_EMAC>;
> +                       reset-names = "stmmaceth";
> +                       clocks = <&ccu CLK_BUS_EMAC>;
> +                       clock-names = "stmmaceth";
> +                       status = "disabled";
> +
> +                       mdio: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +
>                 r_ccu: clock@7010000 {
>                         compatible = "allwinner,sun50i-h6-r-ccu";
>                         reg = <0x07010000 0x400>;
> --
> 2.18.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
