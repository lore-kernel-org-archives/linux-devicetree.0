From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Sun, 12 Jun 2016 18:08:48 +0200
Message-ID: <20160612180848.56454802@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
	<20160609200128.5b7a6e29@bbrezillon>
	<CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
	<20160609222307.5db4e67f@bbrezillon>
	<CA+uuBqb-g1PC1WKR36Rbd5fd1YqreprzG_N57xOn43JOSeDqVw@mail.gmail.com>
	<20160610144000.6101cc2c@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160610144000.6101cc2c@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Mychaela Falconia <mychaela.falconia@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mychaela,

On Fri, 10 Jun 2016 14:40:00 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu, 9 Jun 2016 21:07:49 -0800
> Mychaela Falconia <mychaela.falconia@gmail.com> wrote:
> 
> > On 6/9/16, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:  
> > > Hm, I think it's changing now that a lot of SoCs are advertised to be
> > > running Linux. But you're right in that existing IPs might not support
> > > this low-level mode.    
> > 
> > Faraday (the IP vendor in the present case) advertise Linux support as
> > well, but they never mainlined any of it, and instead they provide
> > their own vendor Linux trees. The one I got is based on linux-3.3; I
> > don't know if they have a newer one. They do "support" FTNANDC024
> > under Linux as well, but their driver for it is gawdawful - see below.
> >   
> > > Hm, I don't understand why it's not possible to implement basic
> > > sequences, but I don't know anything about FTNANDC024, so let's assume
> > > you're right.    
> > 
> > Read the datasheet (link below) and tell me what you think.
> >   
> > > Sure, feel free to send it to me, I'll have a look. And maybe you can
> > > also share your code (both the new and old versions of the driver).    
> > 
> > I decided to go ahead and abuse my personal web space on another
> > (nothing to do with Linux or with NAND flash) project's server for the
> > purpose of sharing this stuff:
> > 
> > https://www.freecalypso.org/members/falcon/linux-mtd/
> > 
> > There you will find the IP datasheet, the vendor's driver (GPL), and a
> > current snapshot of my work-in-progress replacement.  
> 
> Thanks for sharing that. That's actually a quite interesting beast, and
> it's way more evolved than I first thought.
> 
> I might be wrong, but it seems that ->cmd_ctrl() can be supported using
> the custom NAND op approach (custom uCode in SRAM).
> 
> This doesn't prevent you from optimizing things for operations where
> performances really matter (read/write with ECC), by using advanced
> sequencing (reusing the supported cmdset, or even implementing your
> own). I'm actually impressed by the degree of liberty this controller
> gives: while some sequences are provided you can create you own ones
> and still benefit from the controller optimizations.
> 
> Didn't look at the code yet, but I'm pretty confident we'll be able to
> make the driver fit in the existing model, and that moving to the new
> model (where I plan to give more freedom to the controller), will make
> it even more interesting.
> 
> I'll try to come with a proposal for you to test/review after reviewing
> the code.

Okay, I had a closer look at both implementations, and indeed Faraday's
implementation was trying to convert different NAND operations into
their associated 'faraday' program flow (referenced by program
address), which not only complicates the implementation, but also
implies adapting the ->cmdfunc() logic each time a new feature is added
to the core.
In the other hand, your driver, while exposing an higher level
interface, lacks all the detection logic that is part of the code
(actually I haven't looked to deeply in the code, but even if the
detection logic is here, this means you're more or less duplicating the
nand_base.c code).

So, my suggestion is to still use the NAND framework, but try to be
smarter to avoid bloating the ->cmdfunc() implementation. Here is a
draft showing the direction (it's not been tested at all, and should
serve a reference rather than a real implementation).
Of course this implementation is not perfect, but it should still
provide basic support for your NAND controller until we come with a
NAND framework v2 allowing for more optimizations at the NAND level.

Don't hesitate to ask questions or point problems in my approach.

Best Regards,

Boris

[1]http://code.bulix.org/kxg9dz-101056

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
