From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: add usb_otg and
 OHCI/EHCI for usbc0 on H3
Date: Tue, 28 Feb 2017 23:46:05 +0800
Message-ID: <CAGb2v67fsuhRnGp7X8PDkH_t_gb+gPb6VrY-pVu0B4HhD6d8qA@mail.gmail.com>
References: <20170228152702.42602-1-icenowy@aosc.xyz> <20170228152702.42602-2-icenowy@aosc.xyz>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVNW23CQKGQEYUZYCCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170228152702.42602-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 11:27 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> Allwinner H3 have a dual-routed USB PHY0 -- routed to either OHCI/EHCI
> or MUSB controller.
>
> Add device nodes for these controllers.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 27780b97c863..bc9a53edf371 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -206,6 +206,19 @@
>                         #size-cells = <0>;
>                 };
>
> +               usb_otg: usb@01c19000 {
> +                       compatible = "allwinner,sun8i-h3-musb";
> +                       reg = <0x01c19000 0x0400>;
> +                       clocks = <&ccu CLK_BUS_OTG>;
> +                       resets = <&ccu RST_BUS_OTG>;
> +                       interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "mc";
> +                       phys = <&usbphy 0>;
> +                       phy-names = "usb";
> +                       extcon = <&usbphy 0>;
> +                       status = "disabled";
> +               };
> +
>                 usbphy: phy@01c19400 {
>                         compatible = "allwinner,sun8i-h3-usb-phy";
>                         reg = <0x01c19400 0x2c>,
> @@ -238,6 +251,29 @@
>                         #phy-cells = <1>;
>                 };
>
> +               ehci0: usb@01c1a000 {
> +                       compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
> +                       reg = <0x01c1a000 0x100>;
> +                       interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> +                       resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> +                       phys = <&usbphy 0>;
> +                       phy-names = "usb";

So this bit is slightly concerning. IIRC the xHCI drivers power on the phy when
probed, which means VBUS is _always_ going to be powered on, even when it's
supposed to be in peripheral mode. You're probably going to need to rework
either the phy or the musb driver to cope with this.

Or maybe just dropping the phy handle here and letting the musb driver handle
it would work, but that requires the musb driver be loaded.

ChenYu

> +                       status = "disabled";
> +               };
> +
> +               ohci0: usb@01c1a400 {
> +                       compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
> +                       reg = <0x01c1a400 0x100>;
> +                       interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> +                                <&ccu CLK_USB_OHCI0>;
> +                       resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> +                       phys = <&usbphy 0>;
> +                       phy-names = "usb";
> +                       status = "disabled";
> +               };
> +
>                 ehci1: usb@01c1b000 {
>                         compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
>                         reg = <0x01c1b000 0x100>;
> --
> 2.11.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
