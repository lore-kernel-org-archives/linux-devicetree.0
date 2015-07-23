From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v9 3/7] staging: add bindings document for simple fpga bus
Date: Thu, 23 Jul 2015 09:31:48 +0200
Message-ID: <20150723073148.GA1762@pengutronix.de>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
 <20150717194913.GD20836@pengutronix.de>
 <alpine.DEB.2.02.1507171550200.17004@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1507171550200.17004@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Petr Cvek <petr.cvek-qphu/3gb4gc@public.gmane.org>, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Fri, Jul 17, 2015 at 04:22:07PM -0500, atull wrote:
> On Fri, 17 Jul 2015, Steffen Trumtrar wrote:
> 
> > Hi!
> > 
> > On Fri, Jul 17, 2015 at 10:51:13AM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> > > From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > > 
> > > New bindings document for simple fpga bus.
> > > 
> > > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > > ---
> > >  .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644 drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > > 
> > > diff --git a/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > > new file mode 100644
> > > index 0000000..221e781
> > > --- /dev/null
> > > +++ b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > > @@ -0,0 +1,61 @@
> > > +Simple FPGA Bus
> > > +===============
> > > +
> > > +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> > > +before populating the devices below its node.
> > > +
> > > +Required properties:
> > > +- compatible : should contain "simple-fpga-bus"
> > > +- #address-cells, #size-cells, ranges: must be present to handle address space
> > > +  mapping for children.
> > > +
> > > +Optional properties:
> > > +- fpga-mgr : should contain a phandle to a fpga manager.
> > > +- fpga-firmware : should contain the name of a fpga image file located on the
> > > +  firmware search path.
> > > +- partial-reconfig : boolean property should be defined if partial
> > > +  reconfiguration is to be done.
> > > +- resets : should contain a list of resets that should be released after the
> > > +  fpga has been programmed i.e. fpga bridges.
> > > +- reset-names : should contain a list of the names of the resets.
> > > +
> > > +Example:
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +/ {
> > > +	fragment@0 {
> > > +		target-path="/soc";
> > > +		__overlay__ {
> > > +			#address-cells = <1>;
> > > +	                #size-cells = <1>;
> > > +
> > > +			bridge@0xff200000 {
> > > +				compatible = "simple-fpga-bus";
> > > +				#address-cells = <0x2>;
> > > +				#size-cells = <0x1>;
> > > +				ranges = <0x1 0x10040 0xff210040 0x20>;
> > > +
> > > +				clocks = <0x2 0x2>;
> > > +				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
> > > +
> > > +				fpga-mgr = <&hps_0_fpgamgr>;
> > > +				fpga-firmware = "soc_system.rbf";
> > > +
> > > +				resets = <&hps_fpgabridge0 0>, <&hps_fpgabridge1 0>, <&hps_fpgabridge2 0>;
> > > +				reset-names = "hps2fpga", "lwhps2fpga", "fpga2hps";
> > > +
> > > +				gpio@0x100010040 {
> > > +					compatible = "altr,pio-14.0", "altr,pio-1.0";
> > > +					reg = <0x1 0x10040 0x20>;
> > > +					clocks = <0x2>;
> > > +					altr,gpio-bank-width = <0x4>;
> > > +					resetvalue = <0x0>;
> > > +					#gpio-cells = <0x2>;
> > > +					gpio-controller;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > 
> > Just some quick thougths for the Socfpga case:
> > 
> > What you are describing here is a virtual bus, that is not existing on
> > at least the Socfpga, right? I don't like this.
> > You are mixing different independent busses/devices into one and I don't
> > see why.
> 

Just to be clear: all in all I like this approach and I would prefer it to
go in the mainline kernel sooner than later. The thing is AFAIK we still
don't have a way to mark DT bindings as staging or in flux even if we do
have a staging area for drivers. That's why I want to be convinced that this
binding is "correct" from a binding perspective and not some linux driver
implementation. It's much easier to change a driver than breaking old dts files
with binding changes.

> It is a multi-interface bridge.  It is likely that a device will use more than
> one at a time.  This is normal in the kernel and the device tree supports it.
> My example is too simplistic.  It is common for a device to use the lwh2f
> bridge for register access and the h2f bridge for data.  So you'd have
> 
>    reg = <0xc0000000 0x20000000>,
>          <0xff200000 0x00200000>;
> 
> and ranges that map from those areas.
> 

Yeah, sure. I used that, too. Where is the problem with

	&hps2fpga {
		status = "okay";
		my-ip-core {
			config = <&lwhps2fpga>;
			...
		};
	};

	&lwhps2fpga {
		status = "okay";
	};

The typical "let's use syscon" case, no?!

> > I see that this is just an example, but why
> >   a) isn't the fpga-mgr the one knowing about the bitstream ?
> 
> The fpga-mgr doesn't know much.  Someone has to tell it what to load.  I think
> that is a good thing.
> 
> >      You can't have two of these busses with different bitstreams anyway
> >      And if you have multipe FPGAs you have multiple fpga-mgrs, no?
> 
> You would have one fpga-mgr and a separate set of bridges per fpga.
> 

Is that because of the framework or the hardware implementation?
What do I do, if I have a Socfpga+Bitstream and a Stratix that I program
via SPI/PCIe/whatever? Don't I have two different Managers now, hardware-wise?
System is done, dts is fixed. I would expect to provide two bitstreams in the
chosen-node and let the FPGA managers grep theirs.
But I can see, that it is not unreasonable to have this information in the bridge,
to have it describe what devices hang from it.

> >   b) shouldn't the h2f/lwh2f/f2h bridges be the "simple-bus devices" instead of
> >      just reset-controllers ?
> 
> That's an artificial division of things.  These aren't really separate busses.
> You would have a device that needs to be the child of two separate bridges then.
> 

phandle? Not an uncommon pattern, is it?!
The thing is: What level of hardware does a binding actually describe?
When I look into the TRM of the Socfpga, I see two seperate devices for HPS2FPGA
bridge and LWHPS2FPGA bridge. Both have their own address space, one port is connected
to the L3 main switch the other to the L3 Slave peripheral switch, both have different
AXI clocks and different bus width. This doesn't look like they are artificially
divided, but like they actually are divided. The TRM is the only thing I can use as
reference as a normal developer.

> > What about e.g. the bus width of the bridges?
> >      It can change depending on the bitstream. When I have an IP core that does
> >      DMA I might want my driver to be able to configure the bus width accordingly.
> >      There are other settings in the bridges that I can not set when they are just
> >      reset controllers.
> 
> I was hoping to avoid adding another framework to the kernel.  Looks like a
> bus framework will be necessary that can be controlled by the simple fpga bus.
> I'd add simple fpga bus DT bindings like
> 
>     bridges = <&hps_fpgabridge0>, <&hps_fpgabridge1>;
> 
> The bindings for the bridges have already been proposed (you didn't like them)
> and could be used in the overlay here to change bus width.
> 
>     https://lkml.org/lkml/2014/10/23/681
>

Still don't, sorry. That binding looks like it is backwards: it looks like it
starts from the use-case in linux and describes everything you need for that.
Instead of the other way around.

> I'll revive those patches, but tear out the sysfs interface and just export
> API's for enabling/disabling bridges that I could call from simple-fpga-bus.c
> 

I also posted an RFC for the bridges

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/310181.html

and no, I'm not trying to pimp my driver ;-)

Regards,
Steffen

PS: Thanks for still working on this and trying to get a mainlineable solution
instead of just dumping something into some vendor tree.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
