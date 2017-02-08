From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: bus: Add documentation for the
 Technologic Systems NBUS
Date: Wed, 8 Feb 2017 15:48:57 -0600
Message-ID: <20170208214857.snplcpp55daa47so@rob-hp-laptop>
References: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
 <20170203194729.20995-4-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170203194729.20995-4-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, lucile.quirion-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 02:47:26PM -0500, Sebastien Bourdelin wrote:
> Add binding documentation for the Technologic Systems NBUS that is used
> to interface with peripherals in the FPGA of the TS-4600 SoM.
> 
> ---
> Changes v1 -> v2:
>   - rebase on master
>   - remove the simple-bus compatibility as the root node will now
>   populate child nodes (suggested by Rob Herring)
>   - use the ts vendor prefix for gpios (suggested by Rob Herring)
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/bus/ts-nbus.txt | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/ts-nbus.txt
> 
> diff --git a/Documentation/devicetree/bindings/bus/ts-nbus.txt b/Documentation/devicetree/bindings/bus/ts-nbus.txt
> new file mode 100644
> index 000000000000..c8a1f2cbe6a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ts-nbus.txt
> @@ -0,0 +1,50 @@
> +Technologic Systems NBUS
> +
> +The NBUS is a bus used to interface with peripherals in the Technologic
> +Systems FPGA on the TS-4600 SoM.
> +
> +Required properties :
> + - compatible     : "technologic,ts-nbus"
> + - #address-cells : must be 1
> + - #size-cells    : must be 0
> + - pws            : The PWM binded to the FPGA

Should be pwms?

s/binded/bound/

> + - data-gpios	  : The GPIO pin connected to the data line on the FPGA

lines? How many? Always 8 like the example?

> + - csn-gpios	  : The GPIO pin connected to the csn line on the FPGA
> + - txrx-gpios	  : The GPIO pin connected to the txrx line on the FPGA
> + - strobe-gpios	  : The GPIO pin connected to the stobe line on the FPGA
> + - ale-gpios	  : The GPIO pin connected to the ale line on the FPGA
> + - rdy-gpios	  : The GPIO pin connected to the rdy line on the FPGA
> +
> +Child nodes:
> +
> +The NBUS node can contain zero or more child nodes representing peripherals
> +on the bus.
> +
> +Example:
> +
> +	nbus {
> +		compatible = "technologic,ts-nbus";
> +		pinctrl-0 = <&nbus_pins>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pwms = <&pwm 2 83>;
> +		ts-data-gpios   = <&gpio0 0 GPIO_ACTIVE_HIGH
> +				   &gpio0 1 GPIO_ACTIVE_HIGH
> +				   &gpio0 2 GPIO_ACTIVE_HIGH
> +				   &gpio0 3 GPIO_ACTIVE_HIGH
> +				   &gpio0 4 GPIO_ACTIVE_HIGH
> +				   &gpio0 5 GPIO_ACTIVE_HIGH
> +				   &gpio0 6 GPIO_ACTIVE_HIGH
> +				   &gpio0 7 GPIO_ACTIVE_HIGH>;
> +		ts-csn-gpios    = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> +		ts-txrx-gpios   = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +		ts-strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +		ts-ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
> +		ts-rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;
> +
> +		watchdog@2a {
> +			compatible = "...";
> +
> +			/* ... */
> +		};
> +	};
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
