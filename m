From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 8/9] arm64: allwinner: dts: h6: add USB3
 device nodes
Date: Sat, 7 Jul 2018 11:35:22 +0800
Message-ID: <CAGb2v67=FeGJ6PJLsru5ScXdTyLdCczQ7BNRmOnh-+4g7iCFqg@mail.gmail.com>
References: <20180706153805.25842-1-icenowy@aosc.io> <20180706153805.25842-9-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBEPKQDNAKGQEBEL4NII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706153805.25842-9-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 6, 2018 at 11:38 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> Allwinner H6 SoC features USB3 functionality, with a DWC3 controller and
> a custom PHY.
>
> Add device tree nodes for them.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Rebased on top of the USB2 support patch.
> - Dropped the dwc3-of-simple device.
>
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 62fc0f5e10ba..6738e97ee37f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -229,6 +229,30 @@
>                         status = "disabled";
>                 };
>
> +               dwc3: dwc3 {
> +                       compatible = "snps,dwc3";
> +                       reg = <0x5200000 0x10000>;
> +                       interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +                       /* The only clock is shared. */
> +                       clocks = <&ccu CLK_BUS_XHCI>,
> +                                <&ccu CLK_BUS_XHCI>,
> +                                <&ccu CLK_BUS_XHCI>;
> +                       clock-names = "ref", "bus_early", "suspend";

The diagram in the user manual also shows the low speed 32k oscillator
being fed into DWC3. Maybe someone with more knowledge of what the IP
block expects can give us a clue about which one of these it is.

ChenYu

> +                       resets = <&ccu RST_BUS_XHCI>;
> +                       /*
> +                        * The datasheet of the chip doesn't declare the
> +                        * peripheral function, and there's no boards known
> +                        * to have a USB Type-B port routed to the port.
> +                        * In addition, no one has tested the peripheral
> +                        * function yet.
> +                        * So set the dr_mode to "host" in the DTSI file.
> +                        */
> +                       dr_mode = "host";
> +                       phys = <&usb3phy>;
> +                       phy-names = "usb3-phy";
> +                       status = "disabled";
> +               };
> +
>                 usb3phy: phy@5210000 {
>                         compatible = "allwinner,sun50i-h6-usb3-phy";
>                         reg = <0x5210000 0x10000>;
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
