From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: dts: sun4i: Add touchscreen node
 to chuwi-v7 dts file
Date: Mon, 21 Dec 2015 13:56:18 +0800
Message-ID: <CAGb2v65C0ZxgAipgcCTJcjE8q80vpUd2u0XRATerAEqPXNnwBg@mail.gmail.com>
References: <1450611782-9494-1-git-send-email-hdegoede@redhat.com> <1450611782-9494-2-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGNJ32ZQKGQEM2XK2XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1450611782-9494-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 20, 2015 at 7:42 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add a node describing the focaltech ft5306de4 touchscreen found on
> chuwi-v7-cw0825 tablets.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> index 5366089..c71b654 100644
> --- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> @@ -45,6 +45,7 @@
>  #include "sunxi-common-regulators.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
>         model = "Chuwi V7 CW0825";
> @@ -88,6 +89,16 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c2_pins_a>;
>         status = "okay";
> +
> +       ft5306de4: touchscreen@38 {
> +               compatible = "edt,edt-ft5406";
> +               reg = <0x38>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>;
> +               pinctrl-names = "default";

Only a name and no references?

ChenYu

> +               touchscreen-size-x = <1024>;
> +               touchscreen-size-y = <768>;
> +       };
>  };
>
>  &lradc {
> --
> 2.5.0
>
