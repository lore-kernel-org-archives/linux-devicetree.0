From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v9 3/7] staging: add bindings document for simple fpga bus
Date: Fri, 17 Jul 2015 21:49:13 +0200
Message-ID: <20150717194913.GD20836@pengutronix.de>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensourc
List-Id: devicetree@vger.kernel.org

Hi!

On Fri, Jul 17, 2015 at 10:51:13AM -0500, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> New bindings document for simple fpga bus.
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
>  .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> 
> diff --git a/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> new file mode 100644
> index 0000000..221e781
> --- /dev/null
> +++ b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
> @@ -0,0 +1,61 @@
> +Simple FPGA Bus
> +===============
> +
> +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> +before populating the devices below its node.
> +
> +Required properties:
> +- compatible : should contain "simple-fpga-bus"
> +- #address-cells, #size-cells, ranges: must be present to handle address space
> +  mapping for children.
> +
> +Optional properties:
> +- fpga-mgr : should contain a phandle to a fpga manager.
> +- fpga-firmware : should contain the name of a fpga image file located on the
> +  firmware search path.
> +- partial-reconfig : boolean property should be defined if partial
> +  reconfiguration is to be done.
> +- resets : should contain a list of resets that should be released after the
> +  fpga has been programmed i.e. fpga bridges.
> +- reset-names : should contain a list of the names of the resets.
> +
> +Example:
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@0 {
> +		target-path="/soc";
> +		__overlay__ {
> +			#address-cells = <1>;
> +	                #size-cells = <1>;
> +
> +			bridge@0xff200000 {
> +				compatible = "simple-fpga-bus";
> +				#address-cells = <0x2>;
> +				#size-cells = <0x1>;
> +				ranges = <0x1 0x10040 0xff210040 0x20>;
> +
> +				clocks = <0x2 0x2>;
> +				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
> +
> +				fpga-mgr = <&hps_0_fpgamgr>;
> +				fpga-firmware = "soc_system.rbf";
> +
> +				resets = <&hps_fpgabridge0 0>, <&hps_fpgabridge1 0>, <&hps_fpgabridge2 0>;
> +				reset-names = "hps2fpga", "lwhps2fpga", "fpga2hps";
> +
> +				gpio@0x100010040 {
> +					compatible = "altr,pio-14.0", "altr,pio-1.0";
> +					reg = <0x1 0x10040 0x20>;
> +					clocks = <0x2>;
> +					altr,gpio-bank-width = <0x4>;
> +					resetvalue = <0x0>;
> +					#gpio-cells = <0x2>;
> +					gpio-controller;
> +				};
> +			};
> +		};
> +	};
> +};
> +

Just some quick thougths for the Socfpga case:

What you are describing here is a virtual bus, that is not existing on
at least the Socfpga, right? I don't like this.
You are mixing different independent busses/devices into one and I don't
see why. I see that this is just an example, but why
  a) isn't the fpga-mgr the one knowing about the bitstream ?
     You can't have two of these busses with different bitstreams anyway
     And if you have multipe FPGAs you have multiple fpga-mgrs, no?
  b) shouldn't the h2f/lwh2f/f2h bridges be the "simple-bus devices" instead of
     just reset-controllers ? What about e.g. the bus width of the bridges?
     It can change depending on the bitstream. When I have an IP core that does
     DMA I might want my driver to be able to configure the bus width accordingly.
     There are other settings in the bridges that I can not set when they are just
     reset controllers.

I can understand that this is just an example, but again for the Socfpga case it
is IMHO wrong. I don't know about e.g. the Zynq without researching, though.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
