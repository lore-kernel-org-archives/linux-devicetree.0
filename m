From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] regulator: pwm: Add DT binding details for Linear
 Equal Step Mode
Date: Thu, 17 Mar 2016 10:27:31 -0500
Message-ID: <20160317152731.GA1274@rob-hp-laptop>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
 <1457434405-30372-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457434405-30372-6-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2016 at 04:23:25PM +0530, Laxman Dewangan wrote:
> Add support for Linear Equal Step mode  in pwm regulators on which
> specified regulator's minimum and maximum voltages are divided into
> specified equal steps. The number of steps must divided the range of
> minimum to maximum as well as PWM periods in equal parts.
> 
> Add DT property to specify number of steps and its details.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/regulator/pwm-regulator.txt           | 32 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> index ed936f0..b61ff59 100644
> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> @@ -1,7 +1,7 @@
>  Bindings for the Generic PWM Regulator
>  ======================================
>  
> -Currently supports 2 modes of operation:
> +Currently supports following modes of operation:
>  
>  Voltage Table:		When in this mode, a voltage table (See below) of
>  			predefined voltage <=> duty-cycle values must be
> @@ -23,20 +23,34 @@ Continuous Voltage:	This mode uses the regulator's maximum and minimum
>  			regulator voltage to run at half way between the
>  			supplied max_uV and min_uV values.
>  
> +Linear Equal Step:	This modes divides the regulator's maximum and minimum
> +			supplied voltages into specified equal steps. The
> +			number of steps must equally divides the PWM periods.

s/divides/divide/

> +			On this case, step is translated into number of pulse

In this case...

s/pulse/pulses/

> +			in PWM periods and then multiplied by voltage
> +			selectors number to get the duty cycles of PWM.

This description is not so clear to me. This equates to Vmax-Vmin/steps 
== step voltage?

> +
>  Required properties:
>  --------------------
>  - compatible:		Should be "pwm-regulator"
>  
>  - pwms:			PWM specification (See: ../pwm/pwm.txt)
>  
> -Only required for Voltage Table Mode:
> +Optional properties:
> +--------------------
> +For Voltage Table Mode, following properties must be supplied:
>  - voltage-table: 	Voltage and Duty-Cycle table consisting of 2 cells
>  			    First cell is voltage in microvolts (uV)
>  			    Second cell is duty-cycle in percent (%)
>  
> +For Linear Equal Steps, following properties must be supplied:
> +- regulator-n-voltages:	Number of voltage steps between regulator's minimum
> +			and maximum.
> +
>  NB: To be clear, if voltage-table is provided, then the device will be used
> -in Voltage Table Mode.  If no voltage-table is provided, then the device will
> -be used in Continuous Voltage Mode.
> +in Voltage Table Mode.  If regulator-n-voltages is provided then the device
> +will be used in Linear Equal Step Mode. If both properties are not provided,

"both properties" provided would be invalid. "If neither property is 
provided" would be a bit more clear.

> +then the device will be used in Continuous Voltage Mode.
>  
>  Any property defined as part of the core regulator binding can also be used.
>  (See: ../regulator/regulator.txt)
> @@ -66,3 +80,13 @@ Voltage Table Example:
>  				<1036000 40>,
>  				<1016000 50>;
>  	};
> +
> +Linear Equal Step Mode Example:
> +	pwm-regulator@1 {

Drop the unit address. No reg property.

> +		compatible = "pwm-regulator";
> +		pwms = <&pwm 1 4880>;
> +		regulator-name = "vdd-gpu";
> +		regulator-min-microvolt = <710000>;
> +		regulator-max-microvolt = <1320000>;
> +		regulator-n-voltages = <62>;
> +	};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
