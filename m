From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add SAMA5D2 PIOBU support
Date: Tue, 4 Dec 2018 17:22:37 -0600
Message-ID: <20181204232237.GA16883@bogus>
References: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
 <1542701330-23466-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542701330-23466-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, mark.rutland@arm.com, Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 08:08:36AM +0000, Andrei.Stefanescu@microchip.com wrote:
> This patch describes the compatible and the device tree
> bindings necessary for the SAMA5D2 PIOBU GPIO.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> ---
>  .../bindings/gpio/gpio-sama5d2-piobu.txt           | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
> new file mode 100644
> index 0000000..2e260e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt

microchip,sama5d2-piobu.txt for the file name.

> @@ -0,0 +1,31 @@
> +GPIO controller for SAMA5D2 PIOBU pins.
> +
> +These pins have the property of not losing their voltage
> +during Backup/Self-refresh mode.
> +
> +These bindings should be set to a node in the dtsi file.
> +
> +Required properties:
> +- compatible:		"syscon", "microchip,sama5d2-piobu"

syscon should be removed.

> +- #gpio-cells:		There are 2. The pin number is the
> +			first, the second represents additional
> +			parameters such as GPIO_ACTIVE_HIGH/LOW.
> +- gpio-controller:	Marks the port as GPIO controller.
> +
> +Note that the driver uses syscon and should be the child of
> +the syscon node.

child of the "atmel,sama5d2-secumod" node to be more specific.

But why do you need a child node? The parent can be a gpio provider. 
What other nodes does this need?

> +
> +Example:
> +
> +	secumod@fc040000 {
> +		compatible = "atmel,sama5d2-secumod", "syscon", "simple-mfd";

This is not documented as being a simple-mfd.

> +		status = "okay";
> +		reg = <0xfc040000 0x100>;
> +
> +		pioBU: piobu {

gpio {

Is there not a register range you can put here?

> +			status = "okay";
> +			compatible = "microchip,sama5d2-piobu";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +	};
> -- 
> 2.7.4
> 
