From: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sun8i: Add dts file for the NanoPi NEO SBC
Date: Sun, 4 Sep 2016 22:13:22 +0200
Message-ID: <20160904201322.ec4rovp24fxp2dn5@x1-6-00-0f-9f-c6-3e-90.cpe.webspeed.dk>
References: <1472701734-1837-1-git-send-email-james@innovum.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472701734-1837-1-git-send-email-james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org
Cc: maxime.ripard-mcecTQevR9wyG8pML5beZAC/G2K4zDHf@public.gmane.org, robh+dt-XVmvHMARGATQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 01:48:54PM +1000, james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org wrote:

> +#include <dt-bindings/input/input.h>

You don't seem to use anything from that header file.

> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model = "FriendlyARM NanoPi NEO";
> +	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";

It is good practice to add new vendor prefixes to the list in
Documentation/devicetree/bindings/vendor-prefixes.txt (sorted alphabetially
by vendor prefix).

> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_opc>, <&leds_r_opc>;
> +
> +		pwr_led {
> +			label = "nanopi:green:pwr";
> +			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		status_led {
> +			label = "nanopi:blue:status";
> +			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
> +		};
> +	};

Node names should not have underscores in them. [1][2]
IMHO the _led suffix is unnecessary inside leds { }.
I think you should add a comment with the name of the GPIO pin like you
did with &mmc0/cd-gpios.

> +&pio {
> +	leds_opc: led_pins@0 {
> +		allwinner,pins = "PA10";
> +		allwinner,function = "gpio_out";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};

Use hyphens instead of underscores in node names. Also, unit addresses and
reg properties go together. Either you have both or you have neither. So
drop the @0 part of the node name. You'll get warnings about this sort of
mismatch when your device tree is compiled as part of Das U-Boot.

> +&r_pio {
> +	leds_r_opc: led_pins@0 {

Likewise.

[1] https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.html
[2] https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.html

-- 
Rask Ingemann Lambertsen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
