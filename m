From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: mailbox: Add Xilinx IPI Mailbox
Date: Fri, 1 Dec 2017 16:23:24 -0600
Message-ID: <20171201222324.afnws7ddew7tyzxc@rob-hp-laptop>
References: <1511999947-8274-1-git-send-email-jliang@xilinx.com>
 <1511999947-8274-3-git-send-email-jliang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1511999947-8274-3-git-send-email-jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wendy Liang <wendy.liang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wendy Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 03:59:07PM -0800, Wendy Liang wrote:
> Xilinx ZynqMP IPI(Inter Processor Interrupt) is a hardware block
> in ZynqMP SoC used for the communication between various processor
> systems.
> 
> Signed-off-by: Wendy Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
> new file mode 100644
> index 0000000..a118d00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
> @@ -0,0 +1,113 @@
> +Xilinx IPI Mailbox Controller
> +========================================
> +
> +The Xilinx IPI(Inter Processor Interrupt) mailbox controller is to manage
> +messaging between two Xilinx Zynq UltraScale+ MPSoC IPI agents. Each IPI
> +agent owns registers used for notification and buffers for message.
> +
> +               +-------------------------------------+
> +               | Xilinx ZynqMP IPI Controller        |
> +               +-------------------------------------+
> +    +--------------------------------------------------+
> +ATF                    |                     |
> +                       |                     |
> +                       |                     |
> +    +--------------------------+             |
> +                       |                     |
> +                       |                     |
> +    +--------------------------------------------------+
> +            +------------------------------------------+
> +            |  +----------------+   +----------------+ |
> +Hardware    |  |  IPI Agent     |   |  IPI Buffers   | |
> +            |  |  Registers     |   |                | |
> +            |  |                |   |                | |
> +            |  +----------------+   +----------------+ |
> +            |                                          |
> +            | Xilinx IPI Agent Block                   |
> +            +------------------------------------------+
> +
> +
> +Controller Device Node:
> +===========================
> +Required properties:
> +--------------------
> +- compatible:		Shall be: "xlnx,zynqmp-ipi-mailbox"
> +- reg:			IPI buffers address ranges
> +- reg-names:		Names of the reg resources. It should have:
> +			* local_request_region
> +			  - IPI request msg buffer written by local and read
> +			    by remote
> +			* local_response_region
> +			  - IPI response msg buffer written by local and read
> +			    by remote
> +			* remote_request_region
> +			  - IPI request msg buffer written by remote and read
> +			    by local
> +			* remote_response_region
> +			  - IPI response msg buffer written by remote and read
> +			    by local
> +- #mbox-cells:		Shall be 1. It contains:
> +			* tx(0) or rx(1) channel
> +- xlnx-ipi-ids:		Xilinx IPI agent IDs of the two peers of the
> +			Xilinx IPI communication channel.

xlnx,ipi-ids

> +- interrupt-parent:	Phandle for the interrupt controller
> +- interrupts:		Interrupt information corresponding to the
> +			interrupt-names property.
> +
> +Optional properties:
> +--------------------
> +- method:              The method of accessing the IPI agent registers.
> +                       Permitted values are: "smc" and "hvc". Default is
> +                       "smc".
> +

> +Client Device Node:
> +===========================
> +Required properties:
> +--------------------
> +- mboxes:		Standard property to specify a mailbox
> +			(See ./mailbox.txt)
> +- mbox-names:		List of identifier  strings for each mailbox
> +			channel.

This part is a standard part of the binding and doesn't need to be here.

> +
> +Example:
> +===========================
> +	/* APU<->RPU0 IPI mailbox controller */
> +	ipi_mailbox_rpu0: mailbox@ff90400 {
> +		compatible = "xlnx,zynqmp-ipi-mailbox";
> +		reg = <0x0 0xff990400 0x0 0x20>,
> +		      <0x0 0xff990420 0x0 0x20>,
> +		      <0x0 0xff990080 0x0 0x20>,
> +		      <0x0 0xff9900a0 0x0 0x20>;
> +		reg-names = "local_request_region", "local_response_region",
> +			    "remote_request_region", "remote_response_region";
> +		#mbox-cells = <1>;
> +		xlnx-ipi-ids = <0 1>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 29 4>;
> +	};
> +	/* APU<->RPU1 IPI mailbox controller */
> +	ipi_mailbox_rpu1: mailbox@ff990440 {
> +		compatible = "xlnx,zynqmp-ipi-mailbox";
> +		reg = <0x0 0xff990440 0x0 0x20>,
> +		      <0x0 0xff990460 0x0 0x20>,
> +		      <0x0 0xff990280 0x0 0x20>,
> +		      <0x0 0xff9902a0 0x0 0x20>;
> +		reg-names = "local_request_region", "local_response_region",
> +			    "remote_request_region", "remote_response_region";
> +		#mbox-cells = <1>;
> +		xlnx-ipi-ids = <0 2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 29 4>;
> +	};
> +	rpu0 {
> +		...
> +		mboxes = <&ipi_mailbox_rpu0 0>,
> +			 <&ipi_mailbox_rpu0 1>;
> +		mbox-names = "tx", "rx";
> +	};
> +	rpu1 {
> +		...
> +		mboxes = <&ipi_mailbox_rpu1 0>,
> +			 <&ipi_mailbox_rpu1 1>;
> +		mbox-names = "tx", "rx";
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
