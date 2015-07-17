From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 3/7] staging: add bindings document for simple fpga bus
Date: Fri, 17 Jul 2015 16:22:07 -0500
Message-ID: <alpine.DEB.2.02.1507171550200.17004@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
 <20150717194913.GD20836@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150717194913.GD20836@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, pavel@denx.de, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jul 2015, Steffen Trumtrar wrote:

> Hi!
> 
> On Fri, Jul 17, 2015 at 10:51:13AM -0500, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > New bindings document for simple fpga bus.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> >  .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > 
> > diff --git a/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > new file mode 100644
> > index 0000000..221e781
> > --- /dev/null
> > +++ b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> > @@ -0,0 +1,61 @@
> > +Simple FPGA Bus
> > +===============
> > +
> > +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> > +before populating the devices below its node.
> > +
> > +Required properties:
> > +- compatible : should contain "simple-fpga-bus"
> > +- #address-cells, #size-cells, ranges: must be present to handle address space
> > +  mapping for children.
> > +
> > +Optional properties:
> > +- fpga-mgr : should contain a phandle to a fpga manager.
> > +- fpga-firmware : should contain the name of a fpga image file located on the
> > +  firmware search path.
> > +- partial-reconfig : boolean property should be defined if partial
> > +  reconfiguration is to be done.
> > +- resets : should contain a list of resets that should be released after the
> > +  fpga has been programmed i.e. fpga bridges.
> > +- reset-names : should contain a list of the names of the resets.
> > +
> > +Example:
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +	fragment@0 {
> > +		target-path="/soc";
> > +		__overlay__ {
> > +			#address-cells = <1>;
> > +	                #size-cells = <1>;
> > +
> > +			bridge@0xff200000 {
> > +				compatible = "simple-fpga-bus";
> > +				#address-cells = <0x2>;
> > +				#size-cells = <0x1>;
> > +				ranges = <0x1 0x10040 0xff210040 0x20>;
> > +
> > +				clocks = <0x2 0x2>;
> > +				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
> > +
> > +				fpga-mgr = <&hps_0_fpgamgr>;
> > +				fpga-firmware = "soc_system.rbf";
> > +
> > +				resets = <&hps_fpgabridge0 0>, <&hps_fpgabridge1 0>, <&hps_fpgabridge2 0>;
> > +				reset-names = "hps2fpga", "lwhps2fpga", "fpga2hps";
> > +
> > +				gpio@0x100010040 {
> > +					compatible = "altr,pio-14.0", "altr,pio-1.0";
> > +					reg = <0x1 0x10040 0x20>;
> > +					clocks = <0x2>;
> > +					altr,gpio-bank-width = <0x4>;
> > +					resetvalue = <0x0>;
> > +					#gpio-cells = <0x2>;
> > +					gpio-controller;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> 
> Just some quick thougths for the Socfpga case:
> 
> What you are describing here is a virtual bus, that is not existing on
> at least the Socfpga, right? I don't like this.
> You are mixing different independent busses/devices into one and I don't
> see why.

Hi Steffen,

It is a multi-interface bridge.  It is likely that a device will use more than
one at a time.  This is normal in the kernel and the device tree supports it.
My example is too simplistic.  It is common for a device to use the lwh2f
bridge for register access and the h2f bridge for data.  So you'd have

   reg = <0xc0000000 0x20000000>,
         <0xff200000 0x00200000>;

and ranges that map from those areas.

> I see that this is just an example, but why
>   a) isn't the fpga-mgr the one knowing about the bitstream ?

The fpga-mgr doesn't know much.  Someone has to tell it what to load.  I think
that is a good thing.

>      You can't have two of these busses with different bitstreams anyway
>      And if you have multipe FPGAs you have multiple fpga-mgrs, no?

You would have one fpga-mgr and a separate set of bridges per fpga.

>   b) shouldn't the h2f/lwh2f/f2h bridges be the "simple-bus devices" instead of
>      just reset-controllers ?

That's an artificial division of things.  These aren't really separate busses.
You would have a device that needs to be the child of two separate bridges then.

> What about e.g. the bus width of the bridges?
>      It can change depending on the bitstream. When I have an IP core that does
>      DMA I might want my driver to be able to configure the bus width accordingly.
>      There are other settings in the bridges that I can not set when they are just
>      reset controllers.

I was hoping to avoid adding another framework to the kernel.  Looks like a
bus framework will be necessary that can be controlled by the simple fpga bus.
I'd add simple fpga bus DT bindings like

    bridges = <&hps_fpgabridge0>, <&hps_fpgabridge1>;

The bindings for the bridges have already been proposed (you didn't like them)
and could be used in the overlay here to change bus width.

    https://lkml.org/lkml/2014/10/23/681

I'll revive those patches, but tear out the sysfs interface and just export
API's for enabling/disabling bridges that I could call from simple-fpga-bus.c

Alan

> 
> I can understand that this is just an example, but again for the Socfpga case it
> is IMHO wrong. I don't know about e.g. the Zynq without researching, though.
> 
> Regards,
> Steffen
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
