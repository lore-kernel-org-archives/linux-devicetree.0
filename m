From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 5/5] ARM: dts: sun8i: h2+: enable USB OTG
 for Orange Pi Zero board
Date: Wed, 15 Mar 2017 15:16:01 +0800
Message-ID: <CAGb2v67+FpOvPHVWbOX+R9wy0LnDya-ak41zO5W-wyAWTn2pWw@mail.gmail.com>
References: <20170306223449.21404-1-icenowy@aosc.xyz> <20170306223449.21404-6-icenowy@aosc.xyz>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBS6UUPDAKGQE23FRUHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170306223449.21404-6-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Mar 7, 2017 at 6:34 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> Orange Pi Zero board features a USB OTG port, which has a ID pin, and
> can be used to power up the board. However, even if the board is powered
> via +5V pin in GPIO/expansion headers, the VBUS in the OTG port cannot
> be powered up, thus it's impossible to use it in host mode with simple
> OTG cables.
>
> Add support for it in peripheral mode.
>
> If someone really want to use it in host mode, the mode of PHY can be
> switch via sysfs, then use a powered USB OTG cable or powered USB HUB to
> power up external USB devices.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> New patch in v3.
>
>  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> index b7ca916d871d..63f819394b98 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> @@ -96,6 +96,10 @@
>         };
>  };
>
> +&ehci0 {
> +       status = "okay";
> +};
> +
>  &ehci1 {
>         status = "okay";
>  };
> @@ -132,6 +136,10 @@
>         bias-pull-up;
>  };
>
> +&ohci0 {
> +       status = "okay";
> +};
> +
>  &ohci1 {
>         status = "okay";
>  };
> @@ -154,7 +162,13 @@
>         status = "disabled";
>  };
>
> +&usb_otg {
> +       dr_mode = "peripheral";
> +       status = "okay";
> +};
> +
>  &usbphy {
>         /* USB VBUS is always on */

This comment does not match your commit message, which says it's always off.

ChenYu

>         status = "okay";
> +       usb0_id_det-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
>  };
> --
> 2.11.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
