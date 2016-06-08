From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Wed, 8 Jun 2016 17:50:18 +0200
Message-ID: <20160608175018.16c88207@bbrezillon>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
	<20160603162207.0688c9e6@bbrezillon>
	<alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 7 Jun 2016 17:01:41 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> Hi Boris,
> 
> First of all, thanks for reviewing this.
> 
> On Fri, 3 Jun 2016, Boris Brezillon wrote:
> 
> > > +
> > > +Optional properties:
> > > +- nand-on-flash-bbt: See nand.txt.
> > > +- #address-cells, #size-cells: See partition.txt.
> > > +- evatronix,use-bank-select : Use controller bank select function to access
> > > +			      multiple chips, rather than chip enable.  
> > 
> > You mean, using a dedicated logic to control the CS lines rather than a
> > GPIO (controlled by the SW using gpio_set_value())?  
> 
> No. In the SoC on which this has been developed, the nand flash controller 
> has dedicated I/O pins for all its functions.
> 
> The controller has the concept of 'banks' vs. 'devices'. Essentially, a 
> 'bank' is a group of multiple chips of the same geometry etc, and the 
> controller can send commands in parallel to all devices in the same bank. 
> In contrast, different 'banks' can have completely different devices, but 
> all devices must be idle before the controller can switch 'banks'.
> 
> The usecase for the former would be to increase performance and the latter 
> case would be if there were for instance one small NAND flash for program 
> storage and a large one for data.
> 
> The IP that the driver was tested on has two available chip selects, and 
> the DT property controls whether they refer to two devices in the same 
> bank vs. two separate banks.

Still don't see how it can be used in real world (or maybe I don't
understand how it works).

Say the CS are both selected at the same time, this means you'll send
the same set of data to the 2 chips, right. I see two use cases for
this:
1/ You have 2 chips connected to the same data bus, CS, RB and CLE/ALE
   lines and you want to mirror data written on chip0 on chip1
2/ You have 2 chips connected to the same CS, RB, CLE/ALE lines, but
   chip0 is using the lower 8bits of the bus, and chip1 is using the
   remaining 8bits. This way you fake an 16bits bus

Both cases are unsafe, because of NAND unreliability. Say you're
writing on a block in chip0 this block in chip1 is bad. One of your
write will succeed, the other one will fail.

Could you give a real use case where this 'bank-select' method is
really usefull (and safe)?
If you can't, then drop this mode for now, and always operate in
'chip-enable' mode.

> 
> > BTW, you seem to support controlling several CS using the same
> > controller, which means you'll have to specify which CS the NAND chip
> > is connected to (see [1]).  
> 
> That is true. The driver as it stands currently only supports a single CS, 
> however, the IP as configured in the SoC in question can handle two CS 
> lines. My plan is to initially provide support for only the single-CS 
> case (there are places in the code where I felt it practical to prepare 
> for the multiple-CS case though).
> 
> As such, I realize that the previously mentioned property 
> (evatronix,use-bank-select) won't really have any meaning in the single-CS 
> case, so perhaps it should be omitted at this point completely, and added 
> in the future when it is really needed?

Yes, but I'd still like to see a proper NAND controller/NAND chip
separation in you binding.

> 
> > > +- evatronix,rb-wired-and: Assume ready/busy signal from all flash chips are
> > > +			  connected using a wired-AND topology rather than
> > > +			  individually.  
> > 
> > Hm, is that really required? If the R/B line is shared among several
> > NAND chips, it should be transparent, you just have to specific which
> > chip is connected to which GPIO (or dedicated R/B pin).  
> 
> For the SoC in question, the wired-and vs individual R/B lines was a 
> choice made during the chip design, which is why I exported this choice as 
> a DT property, as it reflects a hardware choice done outside the IP but 
> inside the SoC.


Okay, maybe it's worth keeping this property if the AND logic is
integrated in the SoC.

> 
> I didn't really want to have the added flexibility (and complexity) of 
> being able to use any R/B line for any connected flash chip. It seems an 
> unnecessary complication for the driver without much gain.

Not really, at least if you properly separate the chip and controller
objects it's quite easy to deal with, and I'll ask you to do this clean
separation anyway (even if you say you only have a single chip per
controller) :P.

> 
> But it would certainly be doable, as the R/B stuff is handled completely 
> in software. One would still need a new property that the child nand nodes 
> can use to select the R/B line (e.g. evatronix,rb-line). (In the 
> configuration we have, as with the CS lines, the R/B line has its own 
> dedicated pin, so it's not a GPIO). So it would still require a DT 
> property to manage it.

Yep. The sunxi_nand driver is using allwinner,rb = <X>.

> 
> Again, this property doesn't really have any meaning in the single-CS 
> case, so should I omit it completely?

Keep in mind that you're defining a DT binding, and this binding is
submitting to the 'stable ABI' rule, so you shouldn't think in term of
what your driver supports now, but what you're IP is capable of, and
it's definitely capable of handling several R/B pins.

> 
> > > +- evatronix,timings: Seven 32-bit values for initializing the TIME_SEQ_0,
> > > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> > > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.  
> > 
> > 
> > Can this be extracted from the timing mode exposed by the NAND chip.
> > IMO it shouldn't be defined in the DT.  
> 
> I agree, Ideally one would like to read timing parameters from the NAND 
> chip (ONFi or JEDEC parameter pages) and determine all the controller IP 
> timings from that. There are a couple of reasons I haven't gone that 
> route.
> 
> Mainly, the reason is that the part of the timing settings are influenced 
> by delays within the SoC which are not part of the controller itself, thus 
> they cannot be part of the driver code and must come from somewhere else.

Then you should have a way to retrieve these informations (proper clk
drivers, specific bus drivers, or any other means).

> 
> The other reason is that the resulting calculations would be rather 
> complex to express, given the general case of different controller 
> operating frequencies, different types of parameter pages (ONFi vs. 
> JEDEC), and a number of settable timing modes (ONFi mode 0, 1, 2, ...). It 
> would be a nightmare to test and probably even worse to make future 
> changes. At some point, the resulting register values will have to be 
> analyzed manually anyway to verify them, checking them against the timings 
> for the nand flash chips in question, so one might as well put those 
> values into the configuration to start with.

And my answer is no :). Just because it's complicated to extract
these information at the driver level level doesn't mean you should put
it in the DT. That's exactly the opposite: the DT is supposed to encode
the hardware representation, not how you want to configure it.

> 
> One route to go would be to have a number of 'timings' parameters in the 
> .dtsi file for the SoC in question, where the register values are defined 
> for different timing modes. The board (.dts) file could then either select 
> one of the .dtsi-defined timing modes, or it could be selected 
> automatically for those cases where it would be possible (i.e. ONFi timing 
> modes).

Nope, they should not be defined in the DT at all.

How about using a default/safe timing mode for now (ONFI timing mode 0
should work for all NANDs).
The only thing you'll have to do is retrieve the source clk rate and
calculate timing register values accordingly. Or you can even assume
you always have a 100MHz source clk and hardcode it in your driver.

> 
> > > +	/* ONFi mode 0 timing, assuming 100 MHz clock. */
> > > +	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
> > > +	 * TIME_GEN_SEQ_0, _1, _2, _3 */
> > > +	evatronix,timings = <0x0d151533 0x000b0515 0x00000046
> > > +			     0x00150000 0x00000000 0x00000005 0x00000015>;
> > > +	nand-ecc-mode = "hw";
> > > +	nand-ecc-algo = "bch";
> > > +	nand-on-flash-bbt;
> > > +	nand-ecc-strength = <8>;
> > > +	nand-ecc-step-size = <512>;
> > > +	evatronix,use-bank-select;
> > > +	evatronix,rb-wired-and;
> > > +};  
> > 
> > We recently added more constraints on the 'NAND controller/NAND chip'
> > representation in the DT [1].
> > You should rework your binding (and your code) to match these
> > constraints, even if you controller is only able to interface with a
> > single NAND chip.  
> 
> Just so I'm clear on this: what you're referring to here is that the 
> generic mtd properties (nand-*) are now per chip rather than per 
> controller? I will have to rework this.

Yes, and your NAND chip should be a sub-node of the NAND controller
node (and not mixed together as you've done here).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
