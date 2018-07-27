From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] MIPS: mscc: ocelot: add interrupt controller
 properties to GPIO controller
Date: Fri, 27 Jul 2018 12:36:21 +0200
Message-ID: <20180727103621.GA7701@piout.net>
References: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 25/07/2018 14:26:20+0200, Quentin Schulz wrote:
> The GPIO controller also serves as an interrupt controller for events
> on the GPIO it handles.
> 
> An interrupt occurs whenever a GPIO line has changed.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> index d7f0e3551500..afe8fc9011ea 100644
> --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> @@ -168,6 +168,9 @@
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			gpio-ranges = <&gpio 0 0 22>;
> +			interrupt-controller;
> +			interrupts = <13>;
> +			#interrupt-cells = <2>;
>  
>  			uart_pins: uart-pins {
>  				pins = "GPIO_6", "GPIO_7";
> -- 
> 2.14.1
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
