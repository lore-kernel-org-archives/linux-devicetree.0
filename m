From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v2 5/5] vf610-soc: Add Vybrid SoC device tree binding
 documentation
Date: Thu, 5 May 2016 13:57:58 +0530
Message-ID: <20160505082758.GB18151@Sanchayan-Arch.localdomain>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
 <65f3a7bd7a9faf1b390644d7c599c69683c753c4.1462171990.git.maitysanchayan@gmail.com>
 <20160504023026.GB5382@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160504023026.GB5382@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 16-05-03 21:30:26, Rob Herring wrote:
> On Mon, May 02, 2016 at 12:35:04PM +0530, Sanchayan Maity wrote:
> > Add device tree binding documentation for Vybrid SoC.
> > 
> > Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../bindings/arm/freescale/fsl,vf610-soc.txt       | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> > new file mode 100644
> > index 0000000..bdd95e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-soc.txt
> > @@ -0,0 +1,35 @@
> > +Vybrid System-on-Chip
> > +---------------------
> > +
> > +Required properties:
> > +
> > +- #address-cells: must be 1
> > +- #size-cells: must be 1
> > +- compatible: "fsl,vf610-soc-bus", "simple-bus"
> 
> If this is a bus, put the file in bindings/bus/...

The fsl,vf610-soc-bus binding is used to bind the driver in question with
an appropriate compatible node.

Basically being a standalone platform driver, there was need of a compatible
property to bind on. Introducing a separate device tree node for it's sake
didn't seem appropriate so the alteration to SoC node's compatible.

> 
> > +- interrupt-parent: phandle to the MSCM interrupt router node
> > +- ranges
> > +- fsl,rom-revision: phandle to the on-chip ROM node and address of rom
> > +  revision register
> 
> Why is this needed here? Can't you search the tree for the ROM node and 
> get this info.

Strictly per say this and next two can be specified in their respective nodes
of ocrom and mscm cpucfg, however they would then require the use of syscon_
regmap_lookup_by_compatible and this seems clean along with the introduction
of new syscon_regmap_read_from_offset function used with SoC node.

> 
> > +- fsl,cpu-count: phandle to the MSCM CPU configuration node and address of
> > +  CPU count register
> > +- fsl,l2-size: phandle to the MSCM CPU configuration node and address of
> > +  L2 cache size register
> > +- nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> > +- nvmem-cell-names: should contain string names "cfg0" and "cfg1"
> 
> How are all these properties used?

All the above five are used to get the relevant values from the registers and
expose the information for SoC sysfs device.
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-devices-soc

nvmem are consumer nodes which are accessed using the NVMEM consumer API's
leveraging the NVMEM framework and NVMEM vf610 ocotp driver.

Regards,
Sanchayan.

> 
> > +
> > +Example:
> > +
> > +	soc {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "fsl,vf610-soc-bus", "simple-bus";
> > +		interrupt-parent = <&mscm_ir>;
> > +		ranges;
> > +		fsl,rom-revision = <&ocrom 0x80>;
> > +		fsl,cpu-count = <&mscm_cpucfg 0x2C>;
> > +		fsl,l2-size = <&mscm_cpucfg 0x14>;
> > +		nvmem-cells = <&ocotp_cfg0>, <&ocotp_cfg1>;
> > +		nvmem-cell-names = "cfg0", "cfg1";
> > +
> > +		...
> > +	};
> > -- 
> > 2.8.2
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
