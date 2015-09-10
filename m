From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv3 2/3] devicetree: Add new ANX7814 SlimPort transmitter binding.
Date: Thu, 10 Sep 2015 18:38:30 +0200
Message-ID: <CAFqH_52ZiAuK_KS9RHb1K8KKT6h_+3gneM92ejsPWKD1EEy3mA@mail.gmail.com>
References: <1441902952-14516-1-git-send-email-enric.balletbo@collabora.com>
	<1441902952-14516-3-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441902952-14516-3-git-send-email-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, span-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-09-10 18:35 GMT+02:00 Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices.
>
> You can add support to your board with current binding.
>
> Example:
>
>         anx7814: anx7814@38 {
>                 compatible = "analogix,anx7814";
>                 reg = <0x38>;
>                 pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
>                 reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
>         };
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/video/bridge/anx7814.txt   | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
>
> diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> new file mode 100644
> index 0000000..a8cc746
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> @@ -0,0 +1,22 @@
> +Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +-----------------------------------------------
> +
> +The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> +designed for portable devices.
> +
> +Required properties:
> +
> + - compatible  : "analogix,anx7814"
> + - reg         : I2C address of the device
> + - pd-gpios    : Which GPIO to use for power down
> + - reset-gpios : Which GPIO to use for reset
> +
> +Example:
> +
> +       anx7814: anx7814@38 {
> +               compatible = "analogix,anx7814";
> +               reg = <0x38>;
> +               pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +       };
> +
> --
> 2.1.0
>

I saw after sending the series that there was some discussion here,
let me paste to not forget it.

> > No ports needed for describing data connections?
>
> IMHO I'm not sure if this is applicable here, in this case the bridge
> is transparent so it's not required another device node. For example,
> I've an evaluation board, whre I connect in one side an HDMI input
> signal an in the other side a DP monitor, the driver only configures
> the chip and waits for different events (cable plug, cable unplug, etc
> ..)

But what if the chip is connected to a display controller, for instance to the
HDMI output of an SoC ? Is that a use case for the hardware ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
