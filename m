From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] Documentation: dt: binding: fsl: add devicetree
 binding for describing RCPM
Date: Mon, 16 Nov 2015 11:26:11 -0600
Message-ID: <20151116172611.GA27814@rob-hp-laptop>
References: <1445841852-6830-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445841852-6830-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Sudeep

On Mon, Oct 26, 2015 at 02:44:12PM +0800, Dongsheng Wang wrote:
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> RCPM is the Run Control and Power Management module performs all
> device-level tasks associated with device run control and power
> management.
> 
> Add this for freescale powerpc platform and layerscape platform.

[...]

> @@ -0,0 +1,64 @@
> +* Run Control and Power Management
> +-------------------------------------------
> +The RCPM performs all device-level tasks associated with device run control
> +and power management.
> +
> +Required properites:
> +  - reg : Offset and length of the register set of the RCPM block.
> +  - fsl,#rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
> +	fsl,rcpm-wakeup property.

[...]

> +* Freescale RCPM Wakeup Source Device Tree Bindings
> +-------------------------------------------
> +Required fsl,rcpm-wakeup property should be added to a device node if the device
> +can be used as a wakeup source.
> +
> +  - fsl,rcpm-wakeup: Consists of a pointer to the rcpm node and the IPPDEXPCR
> +	register cells. The number of IPPDEXPCR register cells is defined in
> +	"fsl,#rcpm-wakeup-cells" in the rcpm node. The first register cell is
> +	the bit mask that should be set in IPPDEXPCR0, and the second register
> +	cell is for IPPDEXPCR1, and so on.

We just merged a common wakeup source binding[1]. It doesn't really work 
in a similar way to what you have done, but I'd like to see something 
common here. How exactly wakeup is done tends to depend on whether 
interrupts are also wakeup signals or wake-up signally is completely 
separate from interrupts. Depending on that, I think there are 2 options 
here:

- Use the common binding and implement a stacked irqdomain for the 
wakeup controller.

- Extend the common binding to allow a phandle+args value to point to 
the wakeup controller.

Rob

[1] Documentation/devicetree/bindings/power/wakeup-source.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
