From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 01/14] ARM: dts: sun8i: Add SID node
Date: Fri, 24 Jun 2016 10:41:41 +0800
Message-ID: <CAGb2v677+abNOEg3iEoiH25Ji9tq0JXkrGUVvLPAbXAPD3Su_g@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-2-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623192104.18720-2-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 3:20 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> From: Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>
>
> Add a node describing the Security ID memory to the Allwinner H3 .dtsi file.
>
> Signed-off-by: Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 4a4926b..172576d 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -389,6 +389,13 @@
>                         #size-cells = <0>;
>                 };
>
> +               sid: eeprom@01c14000 {
> +                       compatible = "allwinner,sun4i-a10-sid";

This has been discussed before. The hardware is not compatible.
The write control registers are at different offsets.

ChenYu

> +                       reg = <0x01c14000 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +               };
> +
>                 usbphy: phy@01c19400 {
>                         compatible = "allwinner,sun8i-h3-usb-phy";
>                         reg = <0x01c19400 0x2c>,
> --
> 2.9.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
