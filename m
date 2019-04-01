Return-Path: <gregkh@linuxfoundation.org>
Date: Mon, 1 Apr 2019 19:09:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] dt-bindings: xilinx-uartps: Add support for nomodem
Message-ID: <20190401170954.GA19314@kroah.com>
References: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1554136640-25194-2-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554136640-25194-2-git-send-email-shubhrajyoti.datta@gmail.com>
To: shubhrajyoti.datta@gmail.com
Cc: devicetree@vger.kernel.org, michal.simek@xilinx.com, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 01, 2019 at 10:07:19PM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Vivado has a configurationo for selecting the modem control.
> Add a dt binding to check for the same.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> index 227bb77..3e96619 100644
> --- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> @@ -12,6 +12,10 @@ Required properties:
>    See ../clocks/clock-bindings.txt for details.
>  
>  
> +Optional properties:
> +- xlnx,nomodem: The presence of this property indicates that the
> +    UART does not support modem lines for RTS/CTS hardware flow control.

Shouldn't that be something like "noflowcontrol" or "nortscts"?  "modem"
has nothing to do with rts/cts flow control, right?

thanks,

greg k-h
