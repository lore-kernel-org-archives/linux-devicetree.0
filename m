From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 02/12] pinctrl: axp209: add pinctrl features
Date: Tue, 10 Oct 2017 13:15:22 -0500
Message-ID: <20171010181522.y7moibamlghiw3lf@rob-hp-laptop>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-3-quentin.schulz@free-electrons.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBPE46THAKGQELRVB5AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171002120854.5212-3-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 02, 2017 at 02:08:44PM +0200, Quentin Schulz wrote:
> The X-Powers AXP209 has 3 GPIOs. GPIO0/1 can each act either as a GPIO,
> an ADC or a LDO regulator. GPIO2 can only act as a GPIO.
> 
> This adds the pinctrl features to the driver so GPIO0/1 can be used as
> ADC or LDO regulator.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-axp209.txt |  28 +-

In the future, please split bindings to separate patch.

>  drivers/pinctrl/pinctrl-axp209.c                   | 293 +++++++++++++++++++--
>  2 files changed, 300 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
> index a6611304dd3c..388c04492afd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
> @@ -1,4 +1,4 @@
> -AXP209 GPIO controller
> +AXP209 GPIO & pinctrl controller
>  
>  This driver follows the usual GPIO bindings found in
>  Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -28,3 +28,29 @@ axp209: pmic@34 {
>  		#gpio-cells = <2>;
>  	};
>  };
> +
> +The GPIOs can be muxed to other functions and therefore, must be a subnode of
> +axp_gpio.
> +
> +Example:
> +
> +&axp_gpio {
> +	gpio0_adc: gpio0_adc {

Use '-' rather than '_' for node names.

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +		pins = "GPIO0";
> +		function = "adc";
> +	};
> +};
> +
> +&example_node {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio0_adc>;
> +};
> +
> +GPIOs and their functions
> +-------------------------
> +
> +GPIO	|	Functions
> +------------------------
> +GPIO0	|	gpio_in, gpio_out, ldo, adc
> +GPIO1	|	gpio_in, gpio_out, ldo, adc
> +GPIO2	|	gpio_in, gpio_out
