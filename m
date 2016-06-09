From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 20:01:28 +0200
Message-ID: <20160609200128.5b7a6e29@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mychaela Falconia <mychaela.falconia@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 9 Jun 2016 09:24:19 -0800
Mychaela Falconia <mychaela.falconia@gmail.com> wrote:

> On 6/9/16, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> > The designers of this IP apparantly did not have Linux in mind when they
> > designed the controller, since it does all the low level stuff
> > autonomously (in the right IP configuration it can even remap flash blocks
> > transparently), with no way of intervening. For instance, when doing
> > hardware ECC, the OOB data is not available anywhere to the user, and if
> > one wants to actually read it a separate OOB write needs to be done. I
> > think the target market for the IP is really a general real time OS where
> > there is no NAND driver available, and you just want to fire off a single
> > high level command, wait for an interrupt, and have your data waiting for
> > you.  
> 
> I expect to see more and more newer NAND flash controllers that are
> like this. The one I am working with (FTNANDC024 from Faraday) is like
> this too - very very high-level.

Hm, I'm not so sure. I've seen a lot of recent drivers that still
provide this low-level interface, while providing means to optimize
things if the user care about implementing software support for it.

And AFAICT, these 'high-level controllers' are not a new thing.

> 
> > This latter property is actually advantageous in Linux too as the driver
> > doesn't have to do bit- and byte-banging against the NAND flash. I'm not
> > sure what the gain in overhead is in practice, but at any rate there's not
> > much of a choice.  
> 
> It should be advantageous to any OS that uses the abstractions
> provided by the hardware instead of fighting them.

True.

> The problem is that
> the Linux MTD system's current idea of what a NAND controller should
> look like is now out of sync with the new hardware realities.

I also agree on this aspect. Though what you consider an evolution with
these 'high-level' controllers is in my opinion a regression.

By supporting only a subset of what NAND chips actually support, and
preventing any raw access, you just limit the compatibility of the NAND
controller with rather old NAND chips. For example, your controller
cannot deal with MLC/TLC NANDs because it just can't send the private
commands required to have reliable support for these NANDs.

> 
> > Given that the controller does not have the transparency that the  
> > ->cmd_ctrl() approach requires, as noted above, I can't see how it could  
> > be simplified.
> >
> > I basically need to grab everything needed for a given operation and
> > interpret it before handing it over to the controller. I considered using
> > a higher level API, by replacing the default ->cmdfunc() (default
> > nand_command/nand_command_lp) with a specific version, which would have
> > avoided the need to interpret the NAND commands arriving via ->cmd_ctrl(),
> > but that meant duplicating some of the logic in nand_base.c which seemed
> > like a bad idea.  
> 
> For my FTNANDC024 driver I went for an ever more radical approach: I
> decided to forego the "nand" layer in Linux entirely and attach my
> driver directly to the MTD layer. There is very little that
> nand_base.c provides that is useful to a high-level controller whose
> abstractions are "read these logical sectors", "write these logical
> sectors" and "erase these blocks", it is really only useful for the
> simpler NAND controllers that don't do all of the heavy lifting in
> hardware.

Yep, except what you call simple controllers are actually not
simpler than yours, they just provide a raw interface in addition to
their advanced/high-level logic in order to let the software support
features that were not supported when the controller IP was designed.

This is IMO a much saner design than limiting the interface to higher
level abstraction, which are likely to be compatible with only a subset
of all the NAND devices available out there.

> 
> And it is NOT a question of "optimization" - the problem is not that
> going through the paradigm imposed by nand_base.c precludes the use of
> some optional higher-performance features of smart controllers -
> instead the controllers which you and I are working with *require* the
> use of their highly abstracted interfaces, and *do not* provide any
> kind of raw or transparent pass-through mode.

I understand this constraint, and I know some controllers are really
like this, but before deciding to move those controllers to some
'high-level NAND' framework, I'd like to make sure they are really not
providing this raw interface.

I've been told many times that NAND controllers were not supporting raw
accesses (disabling the ECC engine when accessing the NAND), and most
of the time it was false, but the developers just didn't care about
supporting this feature, and things like that make the whole subsystem
unmaintainable.

I fear the same will happen with this high-level interface: once we'll
add it, people will just decide to re-implement everything on their
own, and support only the set of feature they need. And we'll end-up
with another set of unmaintainable drivers.

So my answer is yes, I'm okay providing this high level NAND controller
framework, but I'd like to make sure drivers going in there are not
abusing it, just because it's simpler to implement a driver for their
specific use-case. And given the CMD registers exposed by the Evatronix
IP I had the feeling that this low level interface was available...

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
