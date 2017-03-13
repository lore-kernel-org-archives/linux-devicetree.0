From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] doc: Add bindings document for Xilinx LogiCore PR
 Decoupler
Date: Mon, 13 Mar 2017 11:29:06 +0100
Message-ID: <91f745a9-5ab5-345c-3e46-cac7191012f9@xilinx.com>
References: <1489181435-3151-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489181435-3151-1-git-send-email-mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10.3.2017 22:30, Moritz Fischer wrote:
> This adds the binding documentation for the Xilinx LogiCORE PR
> Decoupler soft core.
> 
> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../bindings/fpga/xilinx-pr-decoupler.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
> new file mode 100644
> index 0000000..b82b928
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
> @@ -0,0 +1,24 @@
> +Xilinx LogiCORE Partial Reconfig Decoupler Softcore
> +
> +The Xilinx LogiCORE Partial Reconfig Decoupler  manages one or more
> +decouplers / fpga bridges.
> +The controller can decouple/disable the bridges which prevents signal
> +changes from passing through the bridge.  The controller can also
> +couple /enable the bridges which allows traffic to pass through the
> +bridge normally.
> +
> +Required properties:
> +- compatible		: Should contain "xlnx,pr-decoupler-1.00"
> +- regs			: base address and size for decoupler module
> +
> +Optional properties:
> +- bridge-enable		: 0 if driver should disable bridge at startup
> +			  1 if driver should enable bridge at startup
> +			  Default is to leave bridge in current state.
> +
> +Example:
> +	fpga-bridge@100000450 {
> +		compatible = "xlnx,pr-decoupler-1.00";
> +		regs = <0x1000 0x10>;
> +		bridge-enable = <0>;
> +	};
> 

Look at.
https://github.com/Xilinx/linux-xlnx/blob/master/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt


And you miss above required clk property. I do use aclk because this is
what it is shown in vivado.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
