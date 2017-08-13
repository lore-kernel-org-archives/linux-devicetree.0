From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v3, resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Date: Sun, 13 Aug 2017 06:47:27 -0700
Message-ID: <20170813134727.GA6132@roeck-us.net>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170803084650.22298-1-c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 11:46:50AM +0300, Mykola Kostenok wrote:
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>  - Fix commit message.
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied to hwmon-next (removed version information from description)

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> index cf44605..367c820 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -11,6 +11,8 @@ Required properties for pwm-tacho node:
>  
>  - #size-cells : should be 1.
>  
> +- #cooling-cells: should be 2.
> +
>  - reg : address and length of the register set for the device.
>  
>  - pinctrl-names : a pinctrl state named "default" must be defined.
> @@ -28,12 +30,17 @@ fan subnode format:
>  Under fan subnode there can upto 8 child nodes, with each child node
>  representing a fan. If there are 8 fans each fan can have one PWM port and
>  one/two Fan tach inputs.
> +For PWM port can be configured cooling-levels to create cooling device.
> +Cooling device could be bound to a thermal zone for the thermal control.
>  
>  Required properties for each child node:
>  - reg : should specify PWM source port.
>  	integer value in the range 0 to 7 with 0 indicating PWM port A and
>  	7 indicating PWM port H.
>  
> +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> +                  which correspond to thermal cooling states.
> +
>  - aspeed,fan-tach-ch : should specify the Fan tach input channel.
>                  integer value in the range 0 through 15, with 0 indicating
>  		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> @@ -50,6 +57,7 @@ pwm_tacho_fixed_clk: fixedclk {
>  pwm_tacho: pwmtachocontroller@1e786000 {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
> +	#cooling-cells = <2>;
>  	reg = <0x1E786000 0x1000>;
>  	compatible = "aspeed,ast2500-pwm-tacho";
>  	clocks = <&pwm_tacho_fixed_clk>;
> @@ -58,6 +66,7 @@ pwm_tacho: pwmtachocontroller@1e786000 {
>  
>  	fan@0 {
>  		reg = <0x00>;
> +		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
>  		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>  	};
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
