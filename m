From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/5] uio: dt-bindings: document existing binding for
 uio-pdrv-genirq
Date: Fri, 13 Oct 2017 15:24:01 -0500
Message-ID: <20171013202401.nqz5spgc4jpmk52j@rob-hp-laptop>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
 <20171009224655.6173-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171009224655.6173-2-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 10, 2017 at 11:46:51AM +1300, Chris Packham wrote:
> Document the device tree bindings for the uio-prv-genirq driver. Provide
> some examples on how it can be used.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> Changes in v3:
> - New. Document existing binding first.
> 
>  .../devicetree/bindings/uio/uio-pdrv-genirq.txt    | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
> 
> diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
> new file mode 100644
> index 000000000000..5a92b1f8825f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
> @@ -0,0 +1,27 @@
> +*Generic UIO platform driver with interrupts

This document is a how to use the UIO driver, not a DT binding. Using 
UIO versus a proper kernel driver is purely a kernel decision that has 
nothing to do with DT.

> +
> +Required properties:
> +- compatible: Should be a value set with the of_id module parameter.
> +
> +Optional properties:
> +- interrupts: Should contain the interrupt to be associated with this device
> +  (only a single interrupt is supported per device).
> +- interrupt-parent: Specifies the phandle to the parent interrupt controller.
> +- reg: Should specify the physical address spaces used by this device.
> +
> +Example:
> +
> +/* Device with MM IO and interrupt assuming of_id="me,my-device" */
> +my-device@10000 {
> +	compatible = "me,my-device";
> +	reg = <0x10000 0x40>;
> +	interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
> +	interrupt-parent = <&gic>;
> +};
> +
> +/* Device with interrupt only assuming of_id="me,my-device" */
> +my-int {
> +	compatible = "me,my-device";
> +	interrupts = <6 IRQ_TYPE_EDGE_BOTH>;
> +	interrupt-parent = <&gic>;
> +};
> -- 
> 2.14.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
