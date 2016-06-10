From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 10 Jun 2016 17:54:54 +0200
Message-ID: <20160610175454.327f51a2@bbrezillon>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
	<20160603162207.0688c9e6@bbrezillon>
	<alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
	<20160608175018.16c88207@bbrezillon>
	<alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1606101641050.30757-0r+fHKsYbBpkgkEezDIDgepEb+yt5a1K@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jun 2016 17:35:24 +0200
Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org> wrote:

> On Wed, 8 Jun 2016, Boris Brezillon wrote:
> 
> > > > > +Optional properties:
> > > > > +- nand-on-flash-bbt: See nand.txt.
> > > > > +- #address-cells, #size-cells: See partition.txt.
> > > > > +- evatronix,use-bank-select : Use controller bank select function to access
> > > > > +			      multiple chips, rather than chip enable.    
> > > > 
> > > > You mean, using a dedicated logic to control the CS lines rather than a
> > > > GPIO (controlled by the SW using gpio_set_value())?    
> > > 
> > > No. In the SoC on which this has been developed, the nand flash controller 
> > > has dedicated I/O pins for all its functions.
> > > 
> > > The controller has the concept of 'banks' vs. 'devices'. Essentially, a 
> > > 'bank' is a group of multiple chips of the same geometry etc, and the 
> > > controller can send commands in parallel to all devices in the same bank. 
> > > In contrast, different 'banks' can have completely different devices, but 
> > > all devices must be idle before the controller can switch 'banks'.
> > > 
> > > The usecase for the former would be to increase performance and the latter 
> > > case would be if there were for instance one small NAND flash for program 
> > > storage and a large one for data.
> > > 
> > > The IP that the driver was tested on has two available chip selects, and 
> > > the DT property controls whether they refer to two devices in the same 
> > > bank vs. two separate banks.  
> > 
> > Still don't see how it can be used in real world (or maybe I don't
> > understand how it works).
> > 
> > Say the CS are both selected at the same time, this means you'll send
> > the same set of data to the 2 chips, right. I see two use cases for
> > this:
> > 1/ You have 2 chips connected to the same data bus, CS, RB and CLE/ALE
> >    lines and you want to mirror data written on chip0 on chip1
> > 2/ You have 2 chips connected to the same CS, RB, CLE/ALE lines, but
> >    chip0 is using the lower 8bits of the bus, and chip1 is using the
> >    remaining 8bits. This way you fake an 16bits bus
> > 
> > Both cases are unsafe, because of NAND unreliability. Say you're
> > writing on a block in chip0 this block in chip1 is bad. One of your
> > write will succeed, the other one will fail.
> > 
> > Could you give a real use case where this 'bank-select' method is
> > really usefull (and safe)?
> > If you can't, then drop this mode for now, and always operate in
> > 'chip-enable' mode.  
> 
> The use cases as I see are as follows:
> 
> a) Two identical chips sharing all but the CS lines, in order to implement 
> a seemingly-larger address space. (e.g. two 256 Mbit chips implementing a 
> 4 GB area). In this case, for certain operations, the controller does not 
> have to wait for one device to complete before issuing a command to 
> another. I'm not sure how the controller keeps track of the two devices 
> though.

I think it's the chip-enable use case, isn't it?

> 
> b) Two different chips with the same connection, which provide disjunct 
> functions, e.g. one (small) flash for program storage and one (large) for 
> data.

Then they can't share the CS line (or be actived at the same time), at
least it doesn't make any sense to me.

> 
> But your questions have convinced me to leave this part of the driver for 
> now, and as you say it can be added in when the need arises.
> 
> > > > BTW, you seem to support controlling several CS using the same
> > > > controller, which means you'll have to specify which CS the NAND chip
> > > > is connected to (see [1]).    
> > > 
> > > That is true. The driver as it stands currently only supports a single CS, 
> > > however, the IP as configured in the SoC in question can handle two CS 
> > > lines. My plan is to initially provide support for only the single-CS 
> > > case (there are places in the code where I felt it practical to prepare 
> > > for the multiple-CS case though).
> > > 
> > > As such, I realize that the previously mentioned property 
> > > (evatronix,use-bank-select) won't really have any meaning in the single-CS 
> > > case, so perhaps it should be omitted at this point completely, and added 
> > > in the future when it is really needed?  
> > 
> > Yes, but I'd still like to see a proper NAND controller/NAND chip 
> > separation in you binding.  
> 
> Yes, I understand that.
> 
> > > > > +- evatronix,rb-wired-and: Assume ready/busy signal from all flash chips are
> > > > > +			  connected using a wired-AND topology rather than
> > > > > +			  individually.    
> > > > 
> > > > Hm, is that really required? If the R/B line is shared among several
> > > > NAND chips, it should be transparent, you just have to specific which
> > > > chip is connected to which GPIO (or dedicated R/B pin).    
> > > 
> > > For the SoC in question, the wired-and vs individual R/B lines was a 
> > > choice made during the chip design, which is why I exported this choice as 
> > > a DT property, as it reflects a hardware choice done outside the IP but 
> > > inside the SoC.  
> > 
> > Okay, maybe it's worth keeping this property if the AND logic is
> > integrated in the SoC.  
> 
> Ok.
> 
> > > I didn't really want to have the added flexibility (and complexity) of 
> > > being able to use any R/B line for any connected flash chip. It seems an 
> > > unnecessary complication for the driver without much gain.  
> > 
> > Not really, at least if you properly separate the chip and controller
> > objects it's quite easy to deal with, and I'll ask you to do this clean
> > separation anyway (even if you say you only have a single chip per
> > controller) :P.  
> 
> Yes, the separation of chip and controller is needed, but the R/B line 
> flexibility requires an additional mapping functionality within the 
> driver. Not rocket science of course, but I can't see much point in it 
> (other than to cover up a potential routing mistake done by a PCB 
> designer).

You seem to argue on all the minor things I'm asking. Honestly, it
should be hard or error-prone to do it. And let's say you don't support
it in your driver, you should still think about that when designing
your bindings.

> 
> > > 
> > > Again, this property doesn't really have any meaning in the single-CS 
> > > case, so should I omit it completely?  
> > 
> > Keep in mind that you're defining a DT binding, and this binding is
> > submitting to the 'stable ABI' rule, so you shouldn't think in term of
> > what your driver supports now, but what you're IP is capable of, and
> > it's definitely capable of handling several R/B pins.  
> 
> Yes, I understand about the stable API rule, but at the same time that R/B 
> mapping could be added without violating that rule at a later date if 
> someone really needed it, couldn't it?
> 
> I mean, an IP may be capable of a lot of things, and we don't necessarily 
> want to implement them all in the driver to start with and have DT 
> propertes for them all do we?

Hm, you should at least take the capabilities you know about into
account when defining a new binding, and you already know that some
SoCs might decide to expose 2 or more R/B pins, so it should already be
designed this way.

> 
> > > > > +- evatronix,timings: Seven 32-bit values for initializing the TIME_SEQ_0,
> > > > > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> > > > > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.    
> > > > 
> > > > 
> > > > Can this be extracted from the timing mode exposed by the NAND chip.
> > > > IMO it shouldn't be defined in the DT.    
> > > 
> > > I agree, Ideally one would like to read timing parameters from the NAND 
> > > chip (ONFi or JEDEC parameter pages) and determine all the controller IP 
> > > timings from that. There are a couple of reasons I haven't gone that 
> > > route.
> > >   
> 
> I think what I'm worried about is that say we add the functionality to 
> take the appropriate parameters and create a set of timing values. We can 
> verify those values only under a very limited set of circumstances (a 
> certain clock frequency, certain pad delays on a given SoC, limited range 
> of flash chips etc). At a later date, the IP is used in a different SoC 
> and the original calculation turns out to be wrong in that case. Updating 
> the timing calcuation function to work with the original SoC and the new 
> one would be a bit of a nightmare I. Since at some point a set of specific 
> timing values need to be calculated for a given SoC anyway, we might as 
> well use those values as they are.
> 
> > And my answer is no :).   
> 
> :-)
> 
> > Just because it's complicated to extract these information at the driver 
> > level level doesn't mean you should put it in the DT. That's exactly the 
> > opposite: the DT is supposed to encode the hardware representation, not 
> > how you want to configure it.  
> 
> I would say that the complexity and error-proneness of automatic timing 
> calculation outweighs the benefit, but I see I'm fighting a loosing battle 
> here...
> 
> > How about using a default/safe timing mode for now (ONFI timing mode 0
> > should work for all NANDs).
> > The only thing you'll have to do is retrieve the source clk rate and
> > calculate timing register values accordingly. Or you can even assume
> > you always have a 100MHz source clk and hardcode it in your driver.  
> 
> Yes, that is certainly possible of course, and the driver already has a 
> hard-coded default setup for this case.
> 
> In that case though the driver could have pre-set setups for other ONFi 
> modes, and we could have an _optional_ DT property to select them, the 
> reason for that being in order to handle non-ONFi flashes whose timing 
> cannot be gleaned from the device itself.
> 
> I.e. something like
> 
> evatronix,onfi-timing-mode = <2>;
> 
> Would that be acceptable?

Actually this has been added to the nand_flash_dev structure, and it's
called onfi_timing_mode_default [1].
If you need a different timing, define a full ID entry for your NAND.

Note that I'm also reworking the NAND detection code to let vendor
specific code initialize a few things [2], which should allow us to get
rid of the full-id entries. This timing mode tweaking could/should be
done at this level.

I'm opposed to the idea of putting information that can be
automatically deduced in the DT. For this specific case, the main
reason is that a board vendor can decide to use different NAND chips
on the same design, and they might not all share the same
capabilities (and you don't want to have a dts for each NAND).

[1]http://lxr.free-electrons.com/source/include/linux/mtd/nand.h#L871
[2]https://lkml.org/lkml/2016/5/27/264


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
