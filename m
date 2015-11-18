From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: doc: dwc3-xilinx: Add devicetree bindings
Date: Wed, 18 Nov 2015 16:53:31 -0600
Message-ID: <20151118225331.GA22325@rob-hp-laptop>
References: <1447851031-16241-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447851031-16241-1-git-send-email-sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 06:20:31PM +0530, Subbaraya Sundeep Bhatta wrote:
> This patch adds binding doc for Xilinx DWC3 glue driver.
> 
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

I really dislike how the DWC3 binding has been done. The sub-node here 
is pointless. The only thing the outer node does is add clocks which 
should simply be part of the DWC3 node. Presumably the IP block needs 
some clocks...

Anyway, it's self-contained within the DWC3, so I won't make you clean 
up the mess.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.txt        | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
> new file mode 100644
> index 0000000..30361b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
> @@ -0,0 +1,33 @@
> +Xilinx SuperSpeed DWC3 USB SoC controller
> +
> +Required properties:
> +- compatible:	Should contain "xlnx,zynqmp-dwc3"
> +- clocks:	A list of phandles for the clocks listed in clock-names
> +- clock-names:	Should contain the following:
> +  "bus_clk"	 Master/Core clock, have to be >= 125 MHz for SS
> +		 operation and >= 60MHz for HS operation
> +
> +  "ref_clk"	 Clock source to core during PHY power down
> +
> +Required child node:
> +A child node must exist to represent the core DWC3 IP block. The name of
> +the node is not important. The content of the node is defined in dwc3.txt.
> +
> +Example device node:
> +
> +		usb@0 {
> +			#address-cells = <0x2>;
> +			#size-cells = <0x1>;
> +			status = "okay";
> +			compatible = "xlnx,zynqmp-dwc3";
> +			clock-names = "bus_clk" "ref_clk";
> +			clocks = <&clk125>, <&clk125>;
> +			ranges;
> +
> +			dwc3@fe200000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0xfe200000 0x40000>;
> +				interrupts = <0x0 0x41 0x4>;
> +				dr_mode = "host";
> +			};
> +		};
> -- 
> 2.1.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
