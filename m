From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] fsl: Add binding for RCPM
Date: Thu, 24 Sep 2015 05:29:17 -0700
Message-ID: <20150924122917.GQ3529@tiger>
References: <1443083354-37369-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443083354-37369-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 04:29:13PM +0800, Dongsheng Wang wrote:
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> RCPM is the Run Control and Power Management module performs all
> device-level tasks associated with device run control and power
> management.
> 
> Add this for freescale powerpc platform and layerscape platform.
> 
> Signed-off-by: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> *v3*
> - Add "fsl,#rcpm-wakeup-cells" for rcpm node. The number of cells
>   correspond rcpm-wakeup property.
> - Modify rcpm-wakeup property description.
> 
> *v2*
> - Remove P4080 example.
> - Modify rcpm-wakeup property description.
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> new file mode 100644
> index 0000000..52110ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -0,0 +1,63 @@
> +* Run Control and Power Management
> +-------------------------------------------
> +The RCPM performs all device-level tasks associated with device run control
> +and power management.
> +
> +Required properites:
> +  - reg : Offset and length of the register set of RCPM block.
> +  - fsl,#rcpm-wakeup-cells : The number of cells in rcpm-wakeup property.
> +  - compatible : Sould contain a chip-specific RCPM block compatible string
> +	and (if applicable) may contain a chassis-version RCPM compatible
> +	string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
> +	such as:
> +	* "fsl,p2041-rcpm"
> +	* "fsl,p3041-rcpm"
> +	* "fsl,p4080-rcpm"
> +	* "fsl,p5020-rcpm"
> +	* "fsl,p5040-rcpm"
> +	* "fsl,t4240-rcpm"
> +	* "fsl,b4420-rcpm"
> +	* "fsl,b4860-rcpm"
> +
> +	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
> +	such as:
> +	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
> +	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
> +	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
> +
> +All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> +which the chip complies.
> +Chassis Version		Example Chips
> +---------------		-------------------------------
> +1.0				p4080, p5020, p5040, p2041, p3041
> +2.0				t4240, b4860, b4420
> +2.1				t1040, ls1021
> +
> +Example:
> +The RCPM node for T4240:
> +	rcpm: global-utilities@e2000 {
> +		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> +		reg = <0xe2000 0x1000>;
> +		fsl,#rcpm-wakeup-cells = <2>;
> +	};
> +
> +* Freescale RCPM Wakeup Source Device Tree Bindings
> +-------------------------------------------
> +Required rcpm-wakeup property should be added to a device node if the device
> +can be used as a wakeup source.
> +
> +  - rcpm-wakeup: The value of the property consists of cells, the number of

Shouldn't this vendor specific property be prefixed with 'fsl,' as well?

> +	cells defined in "fsl,#rcpm-wakeup-cells". The first cell is a pointer
> +	to the rcpm node, the second cell is the bit mask that should be set
> +	in IPPDEXPCR0, and the third cell is for IPPDEXPCR1, and so on.

I guess that IPPDEXPCR0 and IPPDEXPCR1 need some documentation too, or a
pointer to hardware documents containing more detailed info about them.

Shawn

> +
> +Example:
> +	lpuart0: serial@2950000 {
> +		compatible = "fsl,ls1021a-lpuart";
> +		reg = <0x0 0x2950000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&sysclk>;
> +		clock-names = "ipg";
> +		rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> +		status = "disabled";
> +	};
> -- 
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
