From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 14:40:00 +0200
Message-ID: <20160610144000.6101cc2c@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
	<20160609200128.5b7a6e29@bbrezillon>
	<CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
	<20160609222307.5db4e67f@bbrezillon>
	<CA+uuBqb-g1PC1WKR36Rbd5fd1YqreprzG_N57xOn43JOSeDqVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+uuBqb-g1PC1WKR36Rbd5fd1YqreprzG_N57xOn43JOSeDqVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mychaela Falconia <mychaela.falconia@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 9 Jun 2016 21:07:49 -0800
Mychaela Falconia <mychaela.falconia@gmail.com> wrote:

> On 6/9/16, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > Hm, I think it's changing now that a lot of SoCs are advertised to be
> > running Linux. But you're right in that existing IPs might not support
> > this low-level mode.  
> 
> Faraday (the IP vendor in the present case) advertise Linux support as
> well, but they never mainlined any of it, and instead they provide
> their own vendor Linux trees. The one I got is based on linux-3.3; I
> don't know if they have a newer one. They do "support" FTNANDC024
> under Linux as well, but their driver for it is gawdawful - see below.
> 
> > Hm, I don't understand why it's not possible to implement basic
> > sequences, but I don't know anything about FTNANDC024, so let's assume
> > you're right.  
> 
> Read the datasheet (link below) and tell me what you think.
> 
> > Sure, feel free to send it to me, I'll have a look. And maybe you can
> > also share your code (both the new and old versions of the driver).  
> 
> I decided to go ahead and abuse my personal web space on another
> (nothing to do with Linux or with NAND flash) project's server for the
> purpose of sharing this stuff:
> 
> https://www.freecalypso.org/members/falcon/linux-mtd/
> 
> There you will find the IP datasheet, the vendor's driver (GPL), and a
> current snapshot of my work-in-progress replacement.

Thanks for sharing that. That's actually a quite interesting beast, and
it's way more evolved than I first thought.

I might be wrong, but it seems that ->cmd_ctrl() can be supported using
the custom NAND op approach (custom uCode in SRAM).

This doesn't prevent you from optimizing things for operations where
performances really matter (read/write with ECC), by using advanced
sequencing (reusing the supported cmdset, or even implementing your
own). I'm actually impressed by the degree of liberty this controller
gives: while some sequences are provided you can create you own ones
and still benefit from the controller optimizations.

Didn't look at the code yet, but I'm pretty confident we'll be able to
make the driver fit in the existing model, and that moving to the new
model (where I plan to give more freedom to the controller), will make
it even more interesting.

I'll try to come with a proposal for you to test/review after reviewing
the code.

> 
> > Hm, so you can't even move the column pointer within a page
> > (NAND_CMD_RNDOUT)?  
> 
> See the FTNANDC024 microcode listings on datasheet PDF pages 108
> through 117. Every FTNANDC024 operation is an execution of one of
> these complete microcode routines from start to finish. Just because a
> given microcode flow includes the issuance of a given NAND command
> (such as Change Read Column or Change Write Column) does not mean that
> you could just ask the controller to issue that command by itself,
> without executing a complete microcode flow which also includes the
> Read Page or Program Page command.

True.

> 
> The only workaround would be to write our own microcode. I think this
> approach would actually work: we could write shorter microcode
> routines which *just* issue a given NAND opcode and then stop there,
> and another separate microcode routine (to be invoked via a separate
> command) which would only do what they call "RD_SP" or "WR_SP" (raw
> byte transfers of 1 to 32 bytes), without issuing a Read Page command
> before or a Program Page command after. This approach would allow us
> to perform truly raw page reads and writes, but it would be very ugly
> and inefficient. It would also require a separate microcode routine
> for each different command, NOT one generic microcode routine that
> would correspond to ->cmd_ctrl() or ->cmdfunc().

Let's see if we can do something smarter.
Note that my proposal was to bypass ->cmd_ctrl() usage for path that
are requiring high-perfs (ecc->read/write_page()), and only rely on
if for the other operations, where performances are not important, but
re-usability of existing code is (I'm thinking of NAND detection here).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
