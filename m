From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: Add ANX7814 bridge binding.
Date: Fri, 25 Mar 2016 09:36:27 -0500
Message-ID: <20160325143627.GA17311@rob-hp-laptop>
References: <1458816106-11596-1-git-send-email-enric.balletbo@collabora.com>
 <1458816106-11596-3-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458816106-11596-3-git-send-email-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, span-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, jb.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cjiao-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 11:41:45AM +0100, Enric Balletbo i Serra wrote:
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/video/bridge/anx7814.txt   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> new file mode 100644
> index 0000000..5a47a42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> @@ -0,0 +1,41 @@
> +Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +-----------------------------------------------
> +
> +The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> +designed for portable devices.
> +
> +Required properties:
> +
> + - compatible		: "analogix,anx7814"
> + - reg			: I2C address of the device
> + - interrupt-parent	: Should be the phandle of the interrupt controller
> +			  that services interrupts for this device
> + - interrupts		: Should contain the INTP interrupt
> + - cable-det-gpios	: Which GPIO to use for cable detection

hpd-gpios is the more standard name.

> + - pd-gpios		: Which GPIO to use for power down
> + - reset-gpios		: Which GPIO to use for reset
> +
> +Optional properties:
> +
> + - v10-gpios		: Which GPIO to use for V10 control.
> + - Video port for HDMI output, using the DT bindings defined in [1].

It is HDMI input from this node's perspective, right?

> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	anx7814: anx7814@38 {
> +		compatible = "analogix,anx7814";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> +		cable-det-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> +		pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
> +		v10-gpios = <&pio 35 GPIO_ACTIVE_HIGH>;
> +		port {
> +			anx7814_in: endpoint {
> +				remote-endpoint = <&hdmi0_out>;
> +			};
> +		};
> +	};
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
