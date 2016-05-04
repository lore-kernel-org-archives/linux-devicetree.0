From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] vf610-soc: Add Vybrid SoC device tree binding
 documentation
Date: Tue, 3 May 2016 21:30:26 -0500
Message-ID: <20160504023026.GB5382@rob-hp-laptop>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
 <65f3a7bd7a9faf1b390644d7c599c69683c753c4.1462171990.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <65f3a7bd7a9faf1b390644d7c599c69683c753c4.1462171990.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 02, 2016 at 12:35:04PM +0530, Sanchayan Maity wrote:
> Add device tree binding documentation for Vybrid SoC.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/arm/freescale/fsl,vf610-soc.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> new file mode 100644
> index 0000000..bdd95e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> @@ -0,0 +1,35 @@
> +Vybrid System-on-Chip
> +---------------------
> +
> +Required properties:
> +
> +- #address-cells: must be 1
> +- #size-cells: must be 1
> +- compatible: "fsl,vf610-soc-bus", "simple-bus"

If this is a bus, put the file in bindings/bus/...

> +- interrupt-parent: phandle to the MSCM interrupt router node
> +- ranges
> +- fsl,rom-revision: phandle to the on-chip ROM node and address of rom
> +  revision register

Why is this needed here? Can't you search the tree for the ROM node and 
get this info.

> +- fsl,cpu-count: phandle to the MSCM CPU configuration node and address of
> +  CPU count register
> +- fsl,l2-size: phandle to the MSCM CPU configuration node and address of
> +  L2 cache size register
> +- nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> +- nvmem-cell-names: should contain string names "cfg0" and "cfg1"

How are all these properties used?

> +
> +Example:
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "fsl,vf610-soc-bus", "simple-bus";
> +		interrupt-parent = <&mscm_ir>;
> +		ranges;
> +		fsl,rom-revision = <&ocrom 0x80>;
> +		fsl,cpu-count = <&mscm_cpucfg 0x2C>;
> +		fsl,l2-size = <&mscm_cpucfg 0x14>;
> +		nvmem-cells = <&ocotp_cfg0>, <&ocotp_cfg1>;
> +		nvmem-cell-names = "cfg0", "cfg1";
> +
> +		...
> +	};
> -- 
> 2.8.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
