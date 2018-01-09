From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: Add OF properties to ov7670
Date: Mon, 8 Jan 2018 21:35:55 -0600
Message-ID: <20180109033555.vgofzbnpx37iqaon@rob-hp-laptop>
References: <1515059553-10219-1-git-send-email-jacopo+renesas@jmondi.org>
 <1515059553-10219-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515059553-10219-3-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: corbet-T1hC0tSOHrs@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 10:52:33AM +0100, Jacopo Mondi wrote:
> Describe newly introduced OF properties for ov7670 image sensor.
> The driver supports two standard properties to configure synchronism
> signals polarities and two custom properties already supported as
> platform data options by the driver.

Missing S-o-b.

> ---
>  Documentation/devicetree/bindings/media/i2c/ov7670.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
> index 826b656..57ded18 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov7670.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
> @@ -9,11 +9,22 @@ Required Properties:
>  - clocks: reference to the xclk input clock.
>  - clock-names: should be "xclk".
>  
> +The following properties, as defined by video interfaces OF bindings
> +"Documentation/devicetree/bindings/media/video-interfaces.txt" are supported:
> +
> +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.

Don't these go in the endpoint? Not sure offhand.

> +
> +Default is high active state for both vsync and hsync signals.
> +
>  Optional Properties:
>  - reset-gpios: reference to the GPIO connected to the resetb pin, if any.
>    Active is low.
>  - powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
>    Active is high.
> +- ov7670,pll-bypass: set to 1 to bypass PLL for pixel clock generation.

Boolean instead?

> +- ov7670,pclk-hb-disable: set to 1 to suppress pixel clock output signal during
> +  horizontal blankings.

ditto

>  
>  The device node must contain one 'port' child node for its digital output
>  video port, in accordance with the video interface bindings defined in
> @@ -34,6 +45,9 @@ Example:
>  			assigned-clocks = <&pck0>;
>  			assigned-clock-rates = <25000000>;
>  
> +			vsync-active = <0>;
> +			ov7670,pclk-hb-disable = <1>;
> +
>  			port {
>  				ov7670_0: endpoint {
>  					remote-endpoint = <&isi_0>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
