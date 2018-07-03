Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 16:42:39 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] doc: uartlite: Add binding for the driver
Message-ID: <20180703224239.GA6756@rob-hp-laptop>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1530102225-6459-3-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530102225-6459-3-git-send-email-shubhrajyoti.datta@xilinx.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 05:53:44PM +0530, Shubhrajyoti Datta wrote:
> Add uartlite binding for the driver
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../bindings/serial/xlnx,opb-uartlite.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> 
> diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> new file mode 100644
> index 0000000..df8aba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> @@ -0,0 +1,24 @@
> +Xilinx Axi Uartlite controller Device Tree Bindings
> +---------------------------------------------------------
> +
> +Required properties:
> +- compatible           : Can be either of
> +                               "xlnx,xps-uartlite-1.00.a"
> +                               "xlnx,opb-uartlite-1.00.b"
> +- reg                  : Physical base address and size of the Axi Uartlite
> +                         registers map.
> +- interrupts           : Property with a value describing the interrupt
> +                         number.

Just describe how many interrupts, what they are and order.

> +- interrupt-parent     : Must be core interrupt controller.

Doesn't match the example already in bindings/xilinx.txt...

> +
> +Optional properties:
> +- port-number          : Set Uart port number

Nope. Use aliases.

> +
> +Example:
> +serial@800C0000 {

Lower case hex please.

> +       compatible = "xlnx,xps-uartlite-1.00.a";
> +       reg = <0x0 0x800c0000 0x10000>;
> +       interrupt-parent = <&gic>;
> +       interrupts = <0x0 0x6e 0x1>;
> +       port-number = <0>;
> +};
> --
> 2.7.4
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
