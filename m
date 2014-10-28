From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Tue, 28 Oct 2014 16:19:03 -0500
Message-ID: <alpine.DEB.2.02.1410281601570.11910@atx-linux-37>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <20141024070042.GL10262@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141024070042.GL10262-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 Oct 2014, Steffen Trumtrar wrote:

> Hi!
> 

Hi,

I see that my documentation sucks and needs cleanup.  I'll try to
answer some of the flames and get a more coherent version out soon.

> On Thu, Oct 23, 2014 at 06:51:06PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> > From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> (...)
> 
> > diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > new file mode 100644
> > index 0000000..bc24a2e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > @@ -0,0 +1,53 @@
> > +Altera FPGA/HPS Bridge Driver
> > +
> > +This driver manages a bridge between a FPGA and a host processor system (HPS).
> > +User space can enable or disable the bridge by writing a "1" or a "0",
> > +respectively, to its enable file under bridge's entry in
> > +/sys/class/fpga-bridge.  Typically, one disables the bridges before
> > +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bridges are
> > +reenabled.
> > +
> 
> NAK.
> 
> This is all linux specific and doesn't belong here.

Right.  This stuff shouldn't be in this document.  While I was squashing
patches and cleaning up for posting on the mailing list, I added a sysfs
document and forgot to clean up my DT bindings documents.

> 
> > +Required properties:
> > +
> > + - compatible     : should contain one of:
> > +                     "altr,socfpga-hps2fpga-bridge"
> > +                     "altr,socfpga-lwhps2fpga-bridge"
> > +                     "altr,socfpga-fpga2hps-bridge"
> > +
> > + - clocks         : clocks used by this module
> > +
> > + - altr,l3-syscon : phandle of the l3 interconnect module
> > +
> 
> L3 shouldn't be a syscon.

L3 is actually a good candidate for syscon.  Lots of registers, each one
affects a different hardware block.

> Have you tried dumping the regmap in the debugfs if L3
> is a syscon? Doesn't work.

Is that a bug in regmap or is that because the register in L3 that
I am actully interested in here is write-only (ugh)?

> 
> > +Optional properties:
> > + - label          : name that you want this bridge to show up as under
> > +                    /sys/class/fpga-bridge.  Default is br<device#> if this is
> > +                    not specified.
> > +
> 
> Why? Linux-specific.

That was a convience for the user.  I can take that out and won't miss it.

> 
> > + - init-val       : 0 if driver should disable bridge at startup
> > +                    1 if driver should enable bridge at startup
> > +                    driver leaves bridge in current state if property not
> > +                    specified.
> > +
> 
> Configuration in the DT? Really?
> 
> > +Example:
> > +	hps_fpgabridge0: fpgabridge@0 {
> > +		compatible = "altr,socfpga-hps2fpga-bridge";
> > +		label = "hps2fpga";
> > +		altr,l3-syscon = <&l3regs>;
> > +		clocks = <&l4_main_clk>;
> > +		init-val = <1>;
> > +	};
> > +
> > +	hps_fpgabridge1: fpgabridge@1 {
> > +		compatible = "altr,socfpga-lwhps2fpga-bridge";
> > +		label = "lwhps2fpga";
> > +		altr,l3-syscon = <&l3regs>;
> > +		clocks = <&l4_main_clk>;
> > +		init-val = <0>;
> > +	};
> > +
> > +	hps_fpgabridge2: fpgabridge@2 {
> > +		compatible = "altr,socfpga-fpga2hps-bridge";
> > +		label = "fpga2hps";
> > +		altr,l3-syscon = <&l3regs>;
> > +		clocks = <&l4_main_clk>;
> > +	};
> 
> The bridges are the buses into the FPGA. This has to be accomodated.
> The bridges have two specified memory ranges: one the address space
> of the bus, the second the register space for configuration.
> 
> This binding does NOT correctly describe the hardware. Sorry.
> 

OK that was outdated.  More cleanup needed.  How about this type of
binding?  Here's an actual use case for something that has multiple
pieces of soft IP in the FPGA (sysid, gpio).  I eliminated a few.

*snippet of DT*
sopc@0 {
	device_type = "soc";
	ranges;
	#address-cells = <0x1>;
	#size-cells = <0x1>;
	compatible = "ALTR,avalon", "simple-bus";
	bus-frequency = <0x0>;

	bridge@0xc0000000 {
		compatible = "altr,bridge-14.0", "simple-bus";
		reg = <0xc0000000 0x20000000 0xff200000 0x200000>;
		reg-names = "axi_h2f", "axi_h2f_lw";
		clocks = <0x2 0x2 0x2>;
		clock-names = "h2f_axi_clock", "h2f_lw_axi_clock",
		              "f2h_sdram0_clock";
		#address-cells = <0x2>;
		#size-cells = <0x1>;
		ranges = <0x0 0x0 0xc0000000 0x10000
		          0x1 0x10000 0xff210000 0x8
			  0x1 0x10040 0xff210040 0x20 
			  0x1 0x10080 0xff210080 0x10 
			  0x1 0x100c0 0xff2100c0 0x10 
			  0x1 0x20000 0xff220000 0x8>;

		sysid@0x100010000 {
			compatible = "altr,sysid-14.0", "altr,sysid-1.0";
			reg = <0x1 0x10000 0x8>;
			clocks = <0x2>;
			id = <0xacd51402>;
			timestamp = <0x540a048e>;
		};

		gpio@0x100010040 {
			compatible = "altr,pio-14.0", "altr,pio-1.0";
			reg = <0x1 0x10040 0x20>;
			clocks = <0x2>;
			altr,gpio-bank-width = <0x4>;
			resetvalue = <0x0>;
			#gpio-cells = <0x2>;
			gpio-controller;
			linux,phandle = <0x2a>;
		};

		/* other hardware that exists on FPGA here */

	};
};

Alan

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
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
