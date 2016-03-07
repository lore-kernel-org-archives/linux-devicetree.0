From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v17 2/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
Date: Mon, 7 Mar 2016 10:09:24 -0600
Message-ID: <alpine.DEB.2.02.1603071000590.29657@linuxheads99>
References: <1456442711-29138-1-git-send-email-atull@opensource.altera.com> <1456442711-29138-3-git-send-email-atull@opensource.altera.com> <20160305043455.GA19011@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160305043455.GA19011@rob-hp-laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Sat, 5 Mar 2016, Rob Herring wrote:

> On Thu, Feb 25, 2016 at 05:25:07PM -0600, Alan Tull wrote:
> > Add bindings documentation for Altera SOCFPGA bridges:
> >  * fpga2sdram
> >  * fpga2hps
> >  * hps2fpga
> >  * lwhps2fpga
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > Signed-off-by: Matthew Gerlach <mgerlach@altera.com>
> > Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> > ---
> > v2:  separate into 2 documents for the 2 drivers
> > v12: bump version to line up with simple-fpga-bus version
> >      remove Linux specific notes such as references to sysfs
> >      move non-DT specific documentation elsewhere
> >      remove bindings that would have been used to pass configuration
> >      clean up formatting
> > v13: Remove 'label' property
> >      Change property from init-val to bridge-enable
> >      Fix email address
> > v14: Add resets
> >      Change order of bridges to put lw bridge (controlling bridge) first
> > v15: No change in this patch for v15 of this patch set
> > v16: Added regs property, cleaned up unit addresses
> > v17: No change to this patch in v17 of patch set
> > ---
> >  .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   15 +++++++
> >  .../bindings/fpga/altera-hps2fpga-bridge.txt       |   47 ++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> >  create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> 
> Just a few minor things.
> 
> > diff --git a/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> > new file mode 100644
> > index 0000000..4479a79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> > @@ -0,0 +1,15 @@
> > +Altera FPGA To SDRAM Bridge Driver
> > +
> > +Required properties:
> > +- compatible		: Should contain "altr,socfpga-fpga2sdram-bridge"
> > +
> > +Optional properties:
> > +- bridge-enable		: 0 if driver should disable bridge at startup
> > +			  1 if driver should enable bridge at startup
> > +			  Default is to leave bridge in current state.
> > +
> > +Example:
> > +	fpga2sdram_br {
> 
> fpga-bridge@??

The hardware is messy here as the control of this bridge is
lumped into the sdram controller.  I could give the address
of the one register that enables/disable the bridge here.

> 
> > +		compatible = "altr,socfpga-fpga2sdram-bridge";
> > +		bridge-enable = <0>;
> > +	};
> > diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > new file mode 100644
> > index 0000000..e6b7474
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > @@ -0,0 +1,47 @@
> > +Altera FPGA/HPS Bridge Driver
> > +
> > +Required properties:
> > +- regs		: base address and size for AXI bridge module
> > +- compatible	: Should contain one of:
> > +		  "altr,socfpga-lwhps2fpga-bridge",
> > +		  "altr,socfpga-hps2fpga-bridge", or
> > +		  "altr,socfpga-fpga2hps-bridge"
> > +- reset-names	: Should contain one of:
> > +		  "lwhps2fpga",
> > +		  "hps2fpga", or
> > +		  "fpga2hps"
> 
> Names should be the input signal names. Do you need names with only one?

Right, I will use
of_reset_control_get_by_index(dev->of_node, 0) and eliminate
the reset-names here.

> 
> > +- resets	: Phandle and reset specifier for the reset listed in
> > +		  reset-names
> > +- clocks	: Clocks used by this module.
> > +
> > +Optional properties:
> > +- bridge-enable	: 0 if driver should disable bridge at startup.
> > +		  1 if driver should enable bridge at startup.
> > +		  Default is to leave bridge in its current state.
> > +
> > +Example:
> > +	hps_fpgabridge0: fpgabridge@ff400000 {
> 
> No underscores.
> 
> fpga-bridge@...

OK, will add these fixes in v18.

> 
> > +		compatible = "altr,socfpga-lwhps2fpga-bridge";
> > +		reg = <0xff400000 0x100000>;
> > +		resets = <&rst LWHPS2FPGA_RESET>;
> > +		reset-names = "lwhps2fpga";
> > +		clocks = <&l4_main_clk>;
> > +		bridge-enable = <0>;
> > +	};
> > +
> > +	hps_fpgabridge1: fpgabridge@ff500000 {
> > +		compatible = "altr,socfpga-hps2fpga-bridge";
> > +		reg = <0xff500000 0x10000>;
> > +		resets = <&rst HPS2FPGA_RESET>;
> > +		reset-names = "hps2fpga";
> > +		clocks = <&l4_main_clk>;
> > +		bridge-enable = <1>;
> > +	};
> > +
> > +	hps_fpgabridge2: fpgabridge@ff600000 {
> > +		compatible = "altr,socfpga-fpga2hps-bridge";
> > +		reg = <0xff600000 0x100000>;
> > +		resets = <&rst FPGA2HPS_RESET>;
> > +		reset-names = "fpga2hps";
> > +		clocks = <&l4_main_clk>;
> > +	};
> > -- 
> > 1.7.9.5
> > 
> 
