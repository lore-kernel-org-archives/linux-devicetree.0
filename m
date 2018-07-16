Return-Path: <robherring2@gmail.com>
Date: Mon, 16 Jul 2018 10:02:51 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 4/4] dt-bindings: serial: Add binding for uartlite
Message-ID: <20180716160251.GA11275@rob-hp-laptop>
References: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1531718634-17939-4-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531718634-17939-4-git-send-email-shubhrajyoti.datta@gmail.com>
To: shubhrajyoti.datta@gmail.com
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 16, 2018 at 10:53:54AM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Add binding doc for uartlite

A note that this binding is already in use and was undocumented would be 
nice.

> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> lowercase for hex values
> interrupt description updated
> v3:
> squashed the clock changes
> 
>  .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> 
> diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> new file mode 100644
> index 0000000..52719b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> @@ -0,0 +1,23 @@
> +Xilinx Axi Uartlite controller Device Tree Bindings
> +---------------------------------------------------------
> +
> +Required properties:
> +- compatible		: Can be either of
> +				"xlnx,xps-uartlite-1.00.a"
> +				"xlnx,opb-uartlite-1.00.b"
> +- reg			: Physical base address and size of the Axi Uartlite
> +			  registers map.
> +- interrupts		: Should contain UART controller interrupts.

How many?

> +
> +Optional properties:
> +- port-number		: Set Uart port number
> +- clock-names		: Should be "s_axi_aclk"
> +- clocks		: Input clock specifier. Refer to common clock bindings.

How do you calc baud rates if this is omitted?

> +
> +Example:
> +serial@800c0000 {
> +	compatible = "xlnx,xps-uartlite-1.00.a";
> +	reg = <0x0 0x800c0000 0x10000>;
> +	interrupts = <0x0 0x6e 0x1>;
> +	port-number = <0>;
> +};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
