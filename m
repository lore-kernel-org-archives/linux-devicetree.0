From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v14 1/7] fpga: add usage documentation for fpga area
Date: Fri, 11 Dec 2015 12:33:43 -0600
Message-ID: <alpine.DEB.2.02.1512111158170.15210@linuxheads99>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com> <1449790629-5517-2-git-send-email-atull@opensource.altera.com> <20151211150505.GA27164@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151211150505.GA27164@rob-hp-laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Fri, 11 Dec 2015, Rob Herring wrote:

Hi Rob,

> > +Device Tree Example: Partial Reconfiguration with no Bridges
> > +============================================================
> > +
> > +Live Device Tree contains:
> > +	fpgamgr@0 {
> 
> Unit address should be ffd03000 here.

I'll clean up the addresses (and add that to my checklist!).

> 
> > +		compatible = "altr,socfpga-a10-fpga-mgr", "simple-bus";
> 
> This should not have simple-bus. This would be broken in the case of 
> applying the overlay before booting the kernel. You don't want the 
> devices probed before the fpgamgr has programmed them.
> 

I debugged this and had to add the simple-bus's to see my child devices
probe.  Otherwise I can apply the overlay, but when I call
of_platform_populate, no child nodes get populated.
In drivers/of/platform.c's of_platform_notify(), the OF_POPULATED_BUS
flag has to be set for the parent (implying it was set for its parents
or it wouldn't be set).  The child nodes do not get populated unless
the insertion point and all the ancestors of the insertion point are
simple-bus's.  

So the issue of applying the overlay before booting the kernel:
if FPGA Area gets probed before its children get populated, then
I'm K since FPGA Area is responsible for programming the FPGA.

I can rework this to have a virtualized fpgabus that has the fpgamgr
and bridges as its children if that is more correct.  I actually
worked this up several different ways so I have the code.  I still
would like to keep the FPGA Area because that gives me a module that
gets probed that can be in charge of programming the FPGA.  If I were
to rid of FPGA Area and just have an overlay of "firmware-name" plus
child nodes, then I have to add a notifier to the fpgabus.  This I
can do (and have done and seen it work) so if that is preferable,
that's what v15 of this can easily be.

In that case, the target path for the overlay could be the fpgabus.
The fpgabus would need to also be a simple-bus but not the manager
or bridges.

So if I have a fpgabus, the live tree would be:
	fpgabus@0 {
		compatible = "altr,fpga-bus", "simple-bus";
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		ranges;

		fpgamgr@ff706000 {
			compatible = "altr,socfpga-fpga-mgr";
			reg = <0xff706000 0x1000
			       0xffb90000 0x1000>;
			interrupts = <0 175 4>;
		};

		bridge@0 {
			compatible = "altr,socfpga-lwhps2fpga-bridge";
			resets = <&rst LWHPS2FPGA_RESET>;
			reset-names = "lwhps2fpga";
			clocks = <&l4_main_clk>;
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			ranges;
		};

		bridge@1 {
			compatible = "altr,socfpga-hps2fpga-bridge";
			resets = <&rst HPS2FPGA_RESET>;
			reset-names = "hps2fpga";
			clocks = <&l4_main_clk>;
		};
	};

Alan
