Return-Path: <robherring2@gmail.com>
Message-ID: <5ca841e5.1c69fb81.87c5.289f@mx.google.com>
Date: Sat, 06 Apr 2019 01:06:26 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: xilinx-uartps: Add support for
 noctsrts
References: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1554181578-13362-2-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554181578-13362-2-git-send-email-shubhrajyoti.datta@gmail.com>
To: shubhrajyoti.datta@gmail.com
Cc: devicetree@vger.kernel.org, michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 02, 2019 at 10:36:17AM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Vivado has a configurationo for selecting the flow control.

Vivado is ?

> Add a dt binding to check for the same.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> index 227bb77..5161a05 100644
> --- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> @@ -12,6 +12,10 @@ Required properties:
>    See ../clocks/clock-bindings.txt for details.
>  
>  
> +Optional properties:
> +- xlnx,nortscts: The presence of this property indicates that the
> +    UART does not support modem lines for RTS/CTS hardware flow control.

We already have 'uart-has-rtscts'. Please use that. Maybe you need a new 
compatible as I'd guess current users assume RTS/CTS is present.

> +
>  Example:
>  	uart@e0000000 {
>  		compatible = "cdns,uart-r1p8";
> -- 
> 2.1.1
> 
