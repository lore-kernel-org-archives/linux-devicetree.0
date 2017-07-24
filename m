From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch v2] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Mon, 24 Jul 2017 15:18:10 -0500
Message-ID: <20170724201810.qws2drb3aknyefom@rob-hp-laptop>
References: <20170720143039.821-1-c_mykolak@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170720143039.821-1-c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 05:30:39PM +0300, Mykola Kostenok wrote:
> This controller supports fan tacho channels and pwm channels.
> Without this change only tachometer channels can be configured.
> Add extra level of hierarchy - for tachometer channel
> with fan subnodes and pwm channels with pwm subnodes.
> 
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>  - Fix commit message.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
>  1 file changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> index cf44605..df85aa7 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -23,9 +23,18 @@ Required properties for pwm-tacho node:
>  - clocks : a fixed clock providing input clock frequency(PWM
>  	   and Fan Tach clock)
>  
> +tach-channels subnode format:
> +===================
> +Under tach-channels subnode there can be fan child nodes.
> +
> +Required properties for tach-channels node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 0.
> +
>  fan subnode format:
>  ===================
> -Under fan subnode there can upto 8 child nodes, with each child node
> +Under fan subnode there can be upto 8 child nodes, with each child node
>  representing a fan. If there are 8 fans each fan can have one PWM port and
>  one/two Fan tach inputs.
>  
> @@ -39,6 +48,24 @@ Required properties for each child node:
>  		Fan tach channel 0 and 15 indicating Fan tach channel 15.
>  		Atleast one Fan tach input channel is required.
>  
> +pwm-channels subnode format:
> +===================
> +Under pwm-channels subnode there can be pwm child nodes.
> +Required properties for tach-channels node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 0.
> +
> +- #cooling-cells : should be 2;
> +
> +pwm subnode format:
> +===================
> +- reg : should be <0x00>.
> +
> +- cooling-levels      : PWM duty cycle values in a range from 0 to 255
> +			which correspond to thermal cooling states.
> +
> +
>  Examples:
>  
>  pwm_tacho_fixed_clk: fixedclk {
> @@ -55,14 +82,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
>  	clocks = <&pwm_tacho_fixed_clk>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> -
> -	fan@0 {
> -		reg = <0x00>;

The 0 here was the "pwm channel". Otherwise, the reg value is just 
some made up index with no correlation to the h/w. So why can't you 
accomplish the same thing adding cooling-levels here?

> -		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	tach-channels {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		fan@0 {
> +			reg = <0x00>;
> +			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +		};
> +		fan@1 {
> +			reg = <0x01>;
> +			aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +		};
>  	};
> -
> -	fan@1 {
> -		reg = <0x01>;
> -		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +	pwm-channels {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#cooling-cells = <2>;
> +		pwm@0 {
> +			reg = <0x00>;
> +			cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +		};
>  	};
>  };
> -- 
> 2.8.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
