From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] dt-bindings: bus: Add documentation for the
 Technologic Systems NBUS
Date: Mon, 19 Dec 2016 16:12:47 -0600
Message-ID: <20161219221247.cgcvssqo23qyslyj@rob-hp-laptop>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161214231237.17496-4-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161214231237.17496-4-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, lucile.quirion-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 06:12:33PM -0500, Sebastien Bourdelin wrote:
> Add binding documentation for the Technologic Systems NBUS that is used
> to interface with peripherals in the FPGA of the TS-4600 SoM.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/bus/ts-nbus.txt | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/ts-nbus.txt
> 
> diff --git a/Documentation/devicetree/bindings/bus/ts-nbus.txt b/Documentation/devicetree/bindings/bus/ts-nbus.txt
> new file mode 100644
> index 0000000..2f777ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ts-nbus.txt
> @@ -0,0 +1,50 @@
> +Technologic Systems NBUS
> +
> +The NBUS is a bus used to interface with peripherals in the Technologic
> +Systems FPGA on the TS-4600 SoM.
> +
> +Required properties :
> + - compatible     : "technologic,ts-nbus", "simple-bus"
> + - #address-cells : must be 1
> + - #size-cells    : must be 0
> + - pws            : The PWM pin connected to the clock line on the FPGA

Using PWM binding?

> + - data-gpios	  : The GPIO pin connected to the data line on the FPGA
> + - csn-gpios	  : The GPIO pin connected to the csn line on the FPGA
> + - txrx-gpios	  : The GPIO pin connected to the txrx line on the FPGA
> + - strobe-gpios	  : The GPIO pin connected to the stobe line on the FPGA
> + - ale-gpios	  : The GPIO pin connected to the ale line on the FPGA
> + - rdy-gpios	  : The GPIO pin connected to the rdy line on the FPGA

These all need vendor prefix.

This is not any sort of standard bus?

> +
> +Child nodes:
> +
> +The NBUS node can contain zero or more child nodes representing peripherals
> +on the bus.
> +
> +Example:
> +
> +	nbus {
> +		compatible = "technologic,ts-nbus", "simple-bus";

I don't think simple-bus is really valid here. Don't you need the nbus 
driver before the devices are usable?

> +		pinctrl-0 = <&nbus_pins>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pwms = <&pwm 2 83>;
> +		data-gpios   = <&gpio0 0 GPIO_ACTIVE_HIGH
> +				&gpio0 1 GPIO_ACTIVE_HIGH
> +				&gpio0 2 GPIO_ACTIVE_HIGH
> +				&gpio0 3 GPIO_ACTIVE_HIGH
> +				&gpio0 4 GPIO_ACTIVE_HIGH
> +				&gpio0 5 GPIO_ACTIVE_HIGH
> +				&gpio0 6 GPIO_ACTIVE_HIGH
> +				&gpio0 7 GPIO_ACTIVE_HIGH>;
> +		csn-gpios    = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> +		txrx-gpios   = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +		strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +		ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
> +		rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;
> +
> +		wdt@2a {

watchdog@...

> +			compatible = "...";
> +
> +			/* ... */
> +		};
> +	};
> -- 
> 2.10.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
