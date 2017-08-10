From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt: xilinx: zynqmp: Add bindings for PM firmware
Date: Thu, 10 Aug 2017 14:10:56 -0500
Message-ID: <20170810191056.ur5b3zdrcgmb6sim@rob-hp-laptop>
References: <cover.1501854302.git.michal.simek@xilinx.com>
 <8c27b7eec6cc00d37dfe9b3998212ce9c9c27a31.1501854302.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8c27b7eec6cc00d37dfe9b3998212ce9c9c27a31.1501854302.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 03:45:30PM +0200, Michal Simek wrote:
> From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> Document the DT bindings for the Zynq UltraScale+ PM Firmware.
> 
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> 
>  .../devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt | 19 +++++++++++++++++++

bindings/firmware/

>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
> new file mode 100644
> index 000000000000..222a18ce07fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
> @@ -0,0 +1,19 @@
> +Xilinx Zynq MPSoC Firmware Device Tree Bindings
> +
> +The zynqmp-pm node describes the interface to platform firmware.

Please define this should be under /firmware node.

> +Required properties:
> + - compatible:	Must contain:  "xlnx,zynqmp-pm"
> + - method:	The method of calling the PM-API firmware layer.
> +		Permitted values are:
> +		 - "smc" : To be used in configurations without a hypervisor
> +		 - "hvc" : To be used when hypervisor is present

Do you really use both?

> + - interrupts:	Interrupt specifier
> +
> +Examples:
> +	zynqmp-firmware {
> +		compatible = "xlnx,zynqmp-pm";
> +		method = "smc";
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 35 4>;
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
