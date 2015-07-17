From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v9 3/7] staging: add bindings document for simple fpga bus
Date: Fri, 17 Jul 2015 15:21:35 -0600
Message-ID: <20150717212135.GB21949@obsidianresearch.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
 <20150717194913.GD20836@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717194913.GD20836@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: atull@opensource.altera.com, gregkh@linuxfoundation.org, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.al
List-Id: devicetree@vger.kernel.org

On Fri, Jul 17, 2015 at 09:49:13PM +0200, Steffen Trumtrar wrote:
> What you are describing here is a virtual bus, that is not existing on
> at least the Socfpga, right?

I wouldn't get too hung up on bus or not bus, the HW these days
doesn't even use busses.

For AXI systems, which is all the ARM designs, the the bridge between
the CPU and FPGA is always a physical AXI link hanging off one of the
CPU block's internal AXI switches.

I choose to model these ports in DT explicitly, because they represent
swappable attachment points, and often the switch ports have
programmable registers related to that port.

FPGA logic is always hanging off one of these physical ports.

Usually there are multiple independent links between the CPU and the
FPGA (ie Xilinx Virtex 4 has at least 4 CPU to FPGA bus links, Zynq
has something like 7)

Ie on Zynq, I do things like this:

/ {
        /* This is a simplification of the 5 AXI interconnect switches
           hardwired inside the CPU block */
        ps7_axi_interconnect_0: amba@0 {
	        // This is the register block that programs the FPGA
                ps7-dev-cfg@f8007000 {
                        clock-names = "ref_clk", "fclk0", "fclk1", "fclk2", "fclk3";
                        clocks = <&clkc 12>, <&clkc 15>, <&clkc 16>, <&clkc 17>, <&clkc 18>;
                        compatible = "xlnx,zynq-devcfg-1.0";
                        interrupt-parent = <&ps7_scugic_0>;
                        interrupts = <0 8 4>;
                        reg = <0xf8007000 0x100>;
                };

        // This node bundles the entire FPGA side
        programmable: fpga@pl {
	        // This is a physical port on one of the CPU core's AXI swithces
                gp0_axi: axi@40000000 {
                        k_gpio@80000 {
                        k_sysmon@81000 {
                        gpio3: klina_gpio@80010 {
                        i2c_qsfp1 {
		}

	        // This is another physical port on one of the CPU core's AXI swithces
                gp1_axi: axi@80000000 {
		}

                // The FPGA bitstream also hooks up to a 3rd AXI port for initiating DMA
                // hp0_axi ...
        }
}

Zynq has 5 internal AXI switches, but the typical Linux DT models them
all as single DT 'bus'

I've brought the FPGA exposed AXI ports out under the programmable
node, purely for convenience of coding the dynamic load/unload of all
the FPGA elements. We do full hot swap of the FPGA during system
operation.

The physical ports could be located someplace within the amba@0, but
since amba@0 is basically already a lie, I don't really mind this
slight divergence as it makes logical sense and life easier.

Usually what my FPGA designs do is take the AXI port(s) and then fan
out to something else, either more AXI ports through yet another AXI
switch, or convert to a low speed multi-drop bus and fan that out to a
number of devices. I don't usually model this, because it provide no
value to Linux to know these details.

Ultimately the gp0_axi/gp1_axi have a number of peripheral childern,
each with their own drivers, interrupts, etc.

In this particular design gp1_axi bridges to a FPGA soft-core which
provides a physical bus to another FPGA, which is represented as more
nested nodes, and another FPGA programmable node.

DMA for the brdige side flows through the hp0_axi port. (it consumes 3
AXI ports IIRC)

I think the simplified DT modeling is a reasonable compromise.

>   b) shouldn't the h2f/lwh2f/f2h bridges be the "simple-bus devices" instead of
>      just reset-controllers ? What about e.g. the bus width of the
>      bridges?

On Zynq there are a variety of resets and clocks going from the CPU
block to the FPGA, they all need to be configured properly to run
correctly, and they need a home. The control registers for these are
located someplace under amba@0, but I'd be happy to see the actual
values to program contained under the programming node. That fits much
better with the overlay scheme.

There is also some AXI port-specific registers that may need tuning as
well, but they can naturally fit under the axi port nodes..

>      It can change depending on the bitstream. When I have an IP core that does
>      DMA I might want my driver to be able to configure the bus width accordingly.
>      There are other settings in the bridges that I can not set when they are just
>      reset controllers.

bridge@0xff200000 should be the bus port and it can have configuration...

AXI negotiates things like link width dynamically, and for AXI, DMA
doesn't flow through the same AXI port as the control registers
anyhow.

DT is a very poor fit for a modeling a modern AXI interconnect system,
so there is often some irrelevant lossage..

Jason
