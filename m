From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 2/6] fpga: add bindings document for simple fpga
 bus
Date: Wed, 28 Oct 2015 14:45:34 -0500
Message-ID: <alpine.DEB.2.02.1510281413000.21816@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-3-git-send-email-atull@opensource.altera.com> <20151028094002.GI1166@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151028094002.GI1166@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Steffen Trumtrar wrote:

> On Tue, Oct 27, 2015 at 05:09:11PM -0500, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > New bindings document for simple fpga bus.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> > v9:  initial version added to this patchset
> > v10: s/fpga/FPGA/g
> >      replace DT overlay example with slightly more complicated example
> >      move to staging/simple-fpga-bus
> > v11: No change in this patch for v11 of the patch set
> > v12: Moved out of staging.
> >      Changed to use FPGA bridges framework instead of resets
> >      for bridges.
> > ---
> >  .../devicetree/bindings/fpga/simple-fpga-bus.txt   |   81 ++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
> > new file mode 100644
> > index 0000000..2e742f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
> > @@ -0,0 +1,81 @@
> > +Simple FPGA Bus
> > +===============
> > +
> > +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> > +before populating the devices below its node.  All this happens when a device
> > +tree overlay is added to the live tree.  This document describes that device
> > +tree overlay.
> > +
> > +Required properties:
> > +- compatible : should contain "simple-fpga-bus"
> > +- #address-cells, #size-cells, ranges: must be present to handle address space
> > +  mapping for children.
> > +
> > +Optional properties:
> > +- fpga-mgr : should contain a phandle to a FPGA manager.
> > +- fpga-firmware : should contain the name of a FPGA image file located on the
> > +  firmware search path.
> > +- partial-reconfig : boolean property should be defined if partial
> > +  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
> > +  is done.
> > +- fpga-bridges : should contain a list of bridges that the bus will disable
> > +  before   programming the FPGA and then enable after the FPGA has been
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
> > +				reg = <0xc0000000 0x20000000>,
> > +				      <0xff200000 0x00200000>;
> > +				reg-names = "axi_h2f", "axi_h2f_lw";
> > +
> > +				#address-cells = <0x2>;
> > +				#size-cells = <0x1>;
> > +
> > +				ranges = <0x00000000 0x00000000 0xc0000000 0x00010000>,
> > +					 <0x00000001 0x00020000 0xff220000 0x00000008>,
> > +					 <0x00000001 0x00010040 0xff210040 0x00000020>;
> > +
> > +				clocks = <0x2 0x2>;
> > +				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
> > +
> > +				fpga-mgr = <&hps_0_fpgamgr>;
> > +				fpga-firmware = "soc_system.rbf";
> > +
> > +				fpga-bridges = <&hps_fpgabridge0>, <&hps_fpgabridge1>, <&hps_fpgabridge2>;
> 
> At least for Socfpga the HPS2FPGA and FPGA2HPS bridges can be configured to have
> a bus width of 32, 64, 128 depending on the bitstream. How does this fit into here?
> For DMA over this bus this is an interesting property to know, isn't it?

It's interesting if you want to change bridge width.

Most of the time I think people are not going to want or even be able to change
the width of their bridges dynamically.

> I guess something like "<&hps_fpgabridge0 64>" could be a possible solution,

Yes that does seem possible and easy to implement on the level of the simple
fpga bus and fpga bridge framework.  Each low level FPGA Bridge driver would
have #bridge-cells = <1> to support having a parameter.  Specifying
#bridge-cells = <0> would bring back to the current behaviour of no parameter.
A parameter could be added to struct fpga_bridge so that when the simple fpga
bus enables the bridge, it could pass the parameter back to the fpga bridge
driver.  All without changing any parameters of the functions.  Thanks for the
suggestion!

> but
> what is with the GPV registers of the bridges? Do they depend on the bitstream
> loaded? Then this would get really messy I guess as it not a generic property.

Not all low level drivers will be able to support this.  Those that can't support
this won't have to.  But it is a possibility without adding much code to the bridge
framework.

Alan

> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
