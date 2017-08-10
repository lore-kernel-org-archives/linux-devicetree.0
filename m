From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/tinydrm: add support for LEGO MINDSTORMS EV3
 LCD
Date: Thu, 10 Aug 2017 10:40:11 -0500
Message-ID: <20170810154011.tofgtfxcny4oe6p4@rob-hp-laptop>
References: <1501625510-16727-1-git-send-email-david@lechnology.com>
 <1501625510-16727-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501625510-16727-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 05:11:48PM -0500, David Lechner wrote:
> LEGO MINDSTORMS EV3 has an LCD with a ST7586 controller. This adds a new
> module for the ST7586 controller with parameters for the EV3 LCD display.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  .../devicetree/bindings/display/st7586.txt         |  26 +

Please split bindings to a separate patch.

>  drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
>  drivers/gpu/drm/tinydrm/Makefile                   |   1 +
>  drivers/gpu/drm/tinydrm/st7586.c                   | 579 +++++++++++++++++++++
>  include/drm/tinydrm/st7586.h                       |  34 ++
>  5 files changed, 650 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st7586.txt
>  create mode 100644 drivers/gpu/drm/tinydrm/st7586.c
>  create mode 100644 include/drm/tinydrm/st7586.h
> 
> diff --git a/Documentation/devicetree/bindings/display/st7586.txt b/Documentation/devicetree/bindings/display/st7586.txt
> new file mode 100644
> index 0000000..acf784aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st7586.txt
> @@ -0,0 +1,26 @@
> +Sitronix ST7586 display panel
> +
> +Required properties:
> +- compatible:	"lego,ev3-lcd".
> +
> +The node for this driver must be a child node of a SPI controller, hence
> +all mandatory properties described in ../spi/spi-bus.txt must be specified.
> +
> +Optional properties:
> +- dc-gpios:	D/C pin. The presence/absence of this GPIO determines
> +		the panel interface mode (IM[3:0] pins):
> +		- present: IM=x110 4-wire 8-bit data serial interface
> +		- absent:  IM=x101 3-wire 9-bit data serial interface

This is a Lego specific pin which in turn drives IM (or IF) signals? 
This should have a vendor prefix with either lego or Sitronix depending 
on the answer.

Presence/absence doesn't sense. Doesn't the state of the GPIO line 
matter? You should just say if not present, the interface defaults to 
3-wire mode.

> +- reset-gpios:	Reset pin
> +- power-supply:	A regulator node for the supply voltage.
> +- backlight:	phandle of the backlight device attached to the panel
> +- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> +
> +Example:
> +	display@0{
> +		compatible = "lego,ev3-lcd";
> +		reg = <0>;
> +		spi-max-frequency = <10000000>;
> +		dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
