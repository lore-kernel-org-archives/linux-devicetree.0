From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add INNOLUX P079ZCA panel bindings
Date: Tue, 14 Mar 2017 13:59:03 -0700
Message-ID: <20170314205901.GA26988@google.com>
References: <1488502909-22160-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488502909-22160-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Mar 03, 2017 at 09:01:48AM +0800, Chris Zhong wrote:
> The Innolux P079ZCA is a 7.85" panel with a 768X1024 resolution and
> connected to DSI using four lanes.
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  .../bindings/display/panel/innolux,p079zca.txt     | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> new file mode 100644
> index 0000000..c40c8e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> @@ -0,0 +1,22 @@
> +Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "innolux,p079zca"
> +- power-supply: phandle of the regulator that provides the supply voltage
> +- enable-gpios: panel enable gpio
> +
> +Optional properties:
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +	&mipi_dsi {
> +		panel {
> +			compatible = "innolux,p079zca";
> +			reg = <0>;

Where's the documentation for this property?

Brian

> +			power-supply = <...>;
> +			backlight = <&backlight>;
> +			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +			status = "okay";
> +		};
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
