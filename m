From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: dt: misc: Add Aspeed ast2400/2500
 LPC Control bindings
Date: Thu, 19 Jan 2017 11:19:23 +1100
Message-ID: <1484785163.4097.5.camel@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-3-cyrilbur@gmail.com>
         <20170118211645.v54xvmxcsfzxior2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170118211645.v54xvmxcsfzxior2@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-18 at 15:16 -0600, Rob Herring wrote:
> On Thu, Jan 12, 2017 at 11:29:08AM +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 78 ++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > new file mode 100644
> > index 000000000000..f84ac83211ec
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > @@ -0,0 +1,78 @@
> > +ASpeed LPC Control
> > +==================
> > +This binding defines the LPC control for ASpeed SoCs. Partitions of
> > +the LPC bus can be access by other processors on the system, address
> > +ranges on the bus can map accesses from another processor to regions
> > +of the ASpeed SoC memory space.
> > +
> > +Reserved Memory:
> > +================
> > +The driver provides functionality to map the LPC bus to a region of
> > +ASpeed ram. A phandle to a reserved memory node must be provided so
> > +that the driver can safely use this region.
> > +
> > +Flash:
> > +======
> > +The driver provides functionality to unmap the LPC bus from ASpeed
> > +RAM, historically the default mapping has been to the SPI flash
> > +controller on the ASpeed SoC, a phandle to this node should be
> > +supplied.
> > +
> > +Device Node:
> > +============
> > +
> > +As LPC bus configuration registers are at the start of the LPC bus
> > +memory space, it makes most sense for the device to be within the LPC
> > +host node. See Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +for more information. This does not have to be the case, provided the
> > +reg property can give the full address of the LPC bus.
> 
> Same comment here.
> 

Hi Rob,

Yes, thanks.

> > +
> > +Required properties:
> > +--------------------
> > +
> > +- compatible:		"aspeed,ast2400-lpc-ctrl" for ASpeed ast2400 SoCs
> > +					"aspeed,ast2500-lpc-ctrl" for ASpeed ast2500 SoCs
> > +
> > +- reg:				Location and size of the configuration registers
> > +					for the LPC bus. Note that if the device node is
> > +					within the LPC host node then base is relative to
> > +					that.
> > +
> > +- memory-region:	phandle of the reserved memory region
> > +- flash:			phandle of the SPI flash controller
> > +
> > +Example:
> > +--------
> > +
> > +reserved-memory {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	ranges;
> > +
> > +	...
> > +
> > +	flash_memory: region@54000000 {
> > +		compatible = "aspeed,ast2400-lpc-ctrl";
> 
> This doesn't look right?
> 

Correct, my mistake, I'll remove.

> > +		no-map;
> > +		reg = <0x54000000 0x04000000>; /* 64M */
> 
> Is this system RAM? reserved-memory is generally for carveouts in system 
> RAM (e.g. the memory node).
> 

Yes it will be a chunk of system RAM. Our intended use case is to use
system ram to buffer host accesses to system flash (on the bmc). This
provides control over concurrent access to the flash and place to add
security measures to prevent the host from backdooring through the
flash. With the use of a protocol through the platform mailbox.

Having said that I don't want to limit myself to just that - there has
been other ideas for a host<->bmc ram buffer which may or may not see
the light of day.

I hope that makes sense,

Thanks for the review,

Cyril

> > +	};
> > +};
> > +
> > +host_pnor: spi@1e630000 {
> > +	reg = < 0x1e630000 0x18
> > +			0x30000000 0x02000000 >;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	compatible = "aspeed,ast2400-smc";
> > +
> > +	...
> > +
> > +};
> > +
> > +lpc-ctrl@0 {
> > +	compatible = "aspeed,ast2400-lpc-ctrl";
> > +	memory-region = <&flash_memory>;
> > +	flash = <&host_pnor>;
> > +	reg = <0x0 0x80>;
> > +};
> > +
> > -- 
> > 2.11.0
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
