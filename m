From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 18:07:13 +0200
Message-ID: <20160610180713.6f09f802@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
	<20160609200128.5b7a6e29@bbrezillon>
	<CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
	<20160609222307.5db4e67f@bbrezillon>
	<alpine.DEB.2.02.1606101433170.30757@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1606101433170.30757@lnxricardw1.se.axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Mychaela Falconia <mychaela.falconia@gmail.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jun 2016 16:22:38 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> On Thu, 9 Jun 2016, Boris Brezillon wrote:
> 
> > > >
> > > > By supporting only a subset of what NAND chips actually support, and
> > > > preventing any raw access, you just limit the compatibility of the NAND
> > > > controller with rather old NAND chips. For example, your controller
> > > > cannot deal with MLC/TLC NANDs because it just can't send the private
> > > > commands required to have reliable support for these NANDs.    
> > > 
> > > I am not the one who designed the controller IP, so please don't shoot
> > > the messenger.  
> > 
> > Yes, sorry, I was just over-reacting because I'm tired earing that the
> > only solution to get a high performances is to hide everything in the
> > controller which is likely to be incompatible with NANDs we'll see in a
> > few month from there.  
> 
> I don't know what the situation is with other NAND drivers and controller 
> IP's, but in my case, the set of NAND flashes which the SoC in which the 
> Evatronix IP is included is intended to operate with is fairly limited, 
> partly because our products don't require a great veriety, and partly for 
> SoC verification reasons (the fewer flash types tested, the less time and 
> money, essentially). So the mindset from the outset was 'we need to 
> support these flashes, can we do it', rather than 'we want a general 
> driver', which in the end is reflected in the somewhat limited set of 
> flash types initially supported by the driver.
> 
> I fully understand that the opposite is true of the Linux kernel, which is 
> intended to be as general as possible, I'm just trying to offer an 
> explanation for the somewhat limited scope of driver developers, 
> especially those working on company time, the understanding of which 
> eventually might lead to use finding ways to solve this dilemma.
> 
> FWIW, in the Evatronix case, it wasn't any performance issue that drove 
> the driver development, it just seemed like the Right Thing to Do.
> 
> > > > I've been told many times that NAND controllers were not supporting raw
> > > > accesses (disabling the ECC engine when accessing the NAND), and most
> > > > of the time it was false, but the developers just didn't care about
> > > > supporting this feature, and things like that make the whole subsystem
> > > > unmaintainable.    
> 
> Yeah, I've come across a driver (not in mainline though) with precisely 
> this problem. The hardware supported hardware BCH ECC, but without 
> returning the number of corrected bits, which made almost useless, as 
> there was no way of detecting when the number of bits in an ECC block was 
> nearing the limit for a read failure. The solution was to implement 
> software ECC, but the driver didn't really support this mode to start with 
> and it had to be added.
> 
> (FWIW, the Evatronix driver does support both hardware and software ECC, 
> the latter mostly intended for verification and debugging purposes).
> 
> > Now back to the Evatronix IP. I had a closer look at Ricard's code, and
> > it seems the controller is actually supporting a low-level mode
> > (command seq 18 and 19 + MAKE_GEN_CMD()).  
> 
> Yes, that's true, it is labelled as a 'generic command sequence' in the 
> document. Well, it's not really a low level mode, as you can see you still 
> need to do the whole operation in one go, but in the end that is what it 
> accomplishes.
> 
> > So my suggestion is to implement ->cmd_ctrl() and use these generic
> > commands. And of course optimized/packed accesses (using specific
> > commands) can be used in ecc->read/write_page().  
> 
> Actually, the use of ECC or not is governed outside the IP command set. I 
> already use the generic command sequence (SEQ18/19) for ECC reads and 
> writes towards flashes with 4 byte addresses. So it should be doable to 
> use the generic command sequencer for any number of address bytes, both 
> with and without ECC.
> 
> > This would require a flag to ask the core to not send the READ/WRITE 
> > commands before calling ecc->read/write_page(), but that's doable.  
> 
> Ok, so a change required in the core to get this to work then. I've tended 
> to avoid writing driver code so that it requires changes to the framwork 
> unless absolutely necessary, as the changes tend to be rather specific and 
> clutter up the general code (which, honestly, is bad enough as it is, not 
> trying to blame anyone here, just an observation), and can usually be 
> resolved in the driver with a bit of ingenuity.

No offense, that's my feeling too, hence the various reworks I've
recently initiated. Getting rid of the ->cmd_ctrl() ->cmdfunc()
approach in favor of a more generic ->exec_op() approach is one of them,
just need some time to figure a way to do it smoothly.

> 
> > All other commands would use the generic mode, since they don't require
> > high performances or any specific handling.
> > 
> > This way you don't have to implement your own ->cmdfunc() function, you
> > can get rid of all the specific ID/ONFI detection logic (the generic
> > commands should allow you to retrieve those information)  
> 
> FWIW, there isn't much ID detection logic, although looking at it some of 
> the comments imply that there is (and that should be changed of course), 
> because the ID type byte is actually identical to what the controller uses 
> to select the relevant type.
> 
> > and rely on the default implementation.
> > 
> > Ricard, would that work?  
> 
> The main reason the I've been using the ->cmdfunc() interface is that the 
> API is on a fairly high level ("here's a sequence of address bytes", "read 
> a page", etc) which is on similar level to the API to the actual IP (i.e.  
> "read a page from this address").
> 
> In contrast, using the ->cmd_ctrl() interface means that I've got to 
> interpret a sequence of bytes coming in as multiple function calls. It 
> just seemed like a bad idea compared to interpreting a set of high level 
> commands, given that the controller also has a high level API. It seemed a 
> bit like a roundabout way letting someone (i.e. nand_command) encode a 
> high level command into several low level operations, which must then be 
> deciphered by the flash driver one by one in order to assemble another 
> high level command. It seemed much more direct to process the high level 
> commands directly - and easier to read, as the required operations are 
> directly visible as macros. The ->cmd_ctrl() interface is fine for 
> byte-banging an 8-bit I/O port as that was what it was designed for, but 
> quite simply seemed to be the wrong level for anything more advanced than 
> that. Sortof akin to reading a file with getc() rather than read(), which 
> is why I never really considered it.
> 
> But I can definitely see your point, especially as maintainer with the 
> goal of supporting as many devices as possible, and also considering your 
> plans (as you mentioned in another reply) to rework the API, which would 
> mean that the ->cmdfunc() API would be changing, with the associated 
> changes in drivers that use that API.
> 
> Looking at the documentation, it does look doable, but to a certain extent 
> it's in the category "can't really tell until I've tried it". In the worst 
> case, some operations would still need to use specific IP commands but 
> they should be few.
> 
> It's a fairly extensive rewrite though, as a lot of the internal logic of 
> the driver is based on the external API being a high level, even if the 
> code in the end will be simpler.
> 
> The company I work for has an explicit goal of getting as much of the 
> Linux port for our SoC upstream, so hopefully I can find time to rewrite 
> this in the near future, although I'm off on a fairly long summer vacation 
> shortly. I'll try to get it underway as soon as I'm back.
> 
> Something that I am mildly miffed about is that I've posted this driver 
> twice before on the mtd list (although, admittedly, not directly addressed 
> to any maintainer), first as an RFC and later as a complete patch, without 
> a single response. (Apparently Boris you did respond with comments on 
> Oleksij's driver though which I must have missed). Although an RFC might 
> not have initiated a detailed review, it would have been a large advantage 
> (and wasted less time for all) if the point of using 'wrong' driver 
> interface had been brought up and consequently discussed earlier. Yes I 
> know, everyone is busy, it's easy to miss things, each and every driver 
> can't be reviewed in detail, etc.

Yes, I know. I was not maintainer at that time, and was only reviewing
a few patches from time to time.
Now that I am, I try to answer as fast as possible. Note that the set
of requirements might have change with me, so even if someone add
agreed on you first submission but not taken the patches, I would have
required the same set of changes ;).



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
