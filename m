From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 22:23:07 +0200
Message-ID: <20160609222307.5db4e67f@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
	<20160609200128.5b7a6e29@bbrezillon>
	<CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mychaela Falconia <mychaela.falconia@gmail.com>, Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 9 Jun 2016 11:35:53 -0800
Mychaela Falconia <mychaela.falconia@gmail.com> wrote:

> On 6/9/16, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > I also agree on this aspect. Though what you consider an evolution with
> > these 'high-level' controllers is in my opinion a regression.
> >
> > By supporting only a subset of what NAND chips actually support, and
> > preventing any raw access, you just limit the compatibility of the NAND
> > controller with rather old NAND chips. For example, your controller
> > cannot deal with MLC/TLC NANDs because it just can't send the private
> > commands required to have reliable support for these NANDs.  
> 
> I am not the one who designed the controller IP, so please don't shoot
> the messenger.

Yes, sorry, I was just over-reacting because I'm tired earing that the
only solution to get a high performances is to hide everything in the
controller which is likely to be incompatible with NANDs we'll see in a
few month from there.

> I fully agree that it would have been much safer if
> they just bothered to add a couple of registers to their IP that
> provide a raw bypass directly to the NAND interface pins - and it
> would have been trivial to do so, adding just a few transistors to the
> silicon - but apparently the IP vendor chose not to. I agree that it
> was a poor decision on their part, but as Linux geeks we don't get the
> power to change the IP we got hired to write drivers for.

Hm, I think it's changing now that a lot of SoCs are advertised to be
running Linux. But you're right in that existing IPs might not support
this low-level mode.

> 
> As for private commands which the IP does not know about, there is a
> way to send them, but it is not a truly raw way. With FTNANDC024 if
> you need to send a private command to the NAND, you have to write some
> custom FTNANDC024 microcode for it. The datasheet explains how to
> write your own microcode, and the IP includes a small SRAM where you
> can put your own microcode in addition to the mask ROM with the
> standard microcode. But this provision still would not allow a
> low-level driver implementation: there is still no way to implement a
> driver function that just sends any arbitrary command opcode without
> caring what it is, instead you would have to write a different special
> microcode routine for each non-standard command you need to support,
> and naturally the microcode SRAM has a finite size.

Hm, I don't understand why it's not possible to implement basic
sequences, but I don't know anything about FTNANDC024, so let's assume
you're right.

> 
> > I understand this constraint, and I know some controllers are really
> > like this, but before deciding to move those controllers to some
> > 'high-level NAND' framework, I'd like to make sure they are really not
> > providing this raw interface.  
> 
> I would be glad to share the datasheet for the controller I am working
> with, so you can verify with your own eyes that it does not provide
> any truly raw interface - but I don't have a place to post it. If you
> like, I can send it to you as an off-list email attachment (1775641
> bytes), and you can then repost it somewhere for others to see.

Sure, feel free to send it to me, I'll have a look. And maybe you can
also share your code (both the new and old versions of the driver).

> 
> > I've been told many times that NAND controllers were not supporting raw
> > accesses (disabling the ECC engine when accessing the NAND), and most
> > of the time it was false, but the developers just didn't care about
> > supporting this feature, and things like that make the whole subsystem
> > unmaintainable.  
> 
> With FTNANDC024 the closest you can get to a raw read are the
> following two features:

The raw vs ECC mode thing was just an example to illustrate my point:
people usually lie (intentionally or not) about what's really
supported :).

> 
> 1. You can disable the ECC engine and read the first "data size" bytes
> of the page raw, but it does not get you the OOB area. For example, on
> the Micron SLC chip I am working with currently, the raw page size is
> 4096+224 bytes, but the FTNANDC024 can only read the 4096 "data" bytes
> this way, and not the remaining 224.

Yes, that's a problem.

> 
> 2. There is a "byte read" command that performs a truly raw read of
> any range of bytes (any column address) within a page, but it can only
> read a maximum of 32 bytes per operation.

Raw access is usually not something you expect to be fast, it's here to
help people debugging their implementation, or providing a fallback
when ECC correction failed (which should not happen that often).
So it's fine if it's providing fast.

> 
> If I wanted to do a truly raw dump of a full NAND page with my
> controller and NAND chip (like I did when I wanted to reverse-engineer
> their hardware BCH implementation), I would have to issue one read
> command to get the first 4096 bytes, then another 7 "byte read"
> commands to get the remaining 224 bytes. 8 read commands in total to
> get a raw dump of one full NAND page, and each of those 8 FTNANDC024
> read commands internally involves sending a new Read Page command to
> the physical NAND - thus any read disturbs are invoked 8 times per
> page instead of once.

Hm, so you can't even move the column pointer within a page
(NAND_CMD_RNDOUT)?
Even if it's the case, as I said, raw access is mainly here for
debugging purpose, so the read-disturbance caused by the multiple page
load operations shouldn't be a problem.

> 
> It's even worse with raw writes - if I wanted to do a raw write of a
> full NAND page, I would have to do it in 8 separate write commands
> just like with the raw read. I assume that the NAND chip won't like it
> at all, as it would get 8 separate Page Program commands for the same
> page with different column addresses.

Nope, this one won't work. That's completely crazy to prevent one from
doing such basic things, but given you previous explanation I'm not
really surprised.

Now back to the Evatronix IP. I had a closer look at Ricard's code, and
it seems the controller is actually supporting a low-level mode
(command seq 18 and 19 + MAKE_GEN_CMD()).

So my suggestion is to implement ->cmd_ctrl() and use these generic
commands. And of course optimized/packed accesses (using specific
commands) can be used in ecc->read/write_page(). This would require a
flag to ask the core to not send the READ/WRITE commands before calling
ecc->read/write_page(), but that's doable.
All other commands would use the generic mode, since they don't require
high performances or any specific handling.

This way you don't have to implement your own ->cmdfunc() function, you
can get rid of all the specific ID/ONFI detection logic (the generic
commands should allow you to retrieve those information) and rely on the
default implementation.

Ricard, would that work?


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
