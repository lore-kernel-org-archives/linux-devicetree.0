From: Mychaela Falconia <mychaela.falconia@gmail.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 21:07:49 -0800
Message-ID: <CA+uuBqb-g1PC1WKR36Rbd5fd1YqreprzG_N57xOn43JOSeDqVw@mail.gmail.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
 <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
 <20160609200128.5b7a6e29@bbrezillon> <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
 <20160609222307.5db4e67f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160609222307.5db4e67f@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On 6/9/16, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> Hm, I think it's changing now that a lot of SoCs are advertised to be
> running Linux. But you're right in that existing IPs might not support
> this low-level mode.

Faraday (the IP vendor in the present case) advertise Linux support as
well, but they never mainlined any of it, and instead they provide
their own vendor Linux trees. The one I got is based on linux-3.3; I
don't know if they have a newer one. They do "support" FTNANDC024
under Linux as well, but their driver for it is gawdawful - see below.

> Hm, I don't understand why it's not possible to implement basic
> sequences, but I don't know anything about FTNANDC024, so let's assume
> you're right.

Read the datasheet (link below) and tell me what you think.

> Sure, feel free to send it to me, I'll have a look. And maybe you can
> also share your code (both the new and old versions of the driver).

I decided to go ahead and abuse my personal web space on another
(nothing to do with Linux or with NAND flash) project's server for the
purpose of sharing this stuff:

https://www.freecalypso.org/members/falcon/linux-mtd/

There you will find the IP datasheet, the vendor's driver (GPL), and a
current snapshot of my work-in-progress replacement.

> Hm, so you can't even move the column pointer within a page
> (NAND_CMD_RNDOUT)?

See the FTNANDC024 microcode listings on datasheet PDF pages 108
through 117. Every FTNANDC024 operation is an execution of one of
these complete microcode routines from start to finish. Just because a
given microcode flow includes the issuance of a given NAND command
(such as Change Read Column or Change Write Column) does not mean that
you could just ask the controller to issue that command by itself,
without executing a complete microcode flow which also includes the
Read Page or Program Page command.

The only workaround would be to write our own microcode. I think this
approach would actually work: we could write shorter microcode
routines which *just* issue a given NAND opcode and then stop there,
and another separate microcode routine (to be invoked via a separate
command) which would only do what they call "RD_SP" or "WR_SP" (raw
byte transfers of 1 to 32 bytes), without issuing a Read Page command
before or a Program Page command after. This approach would allow us
to perform truly raw page reads and writes, but it would be very ugly
and inefficient. It would also require a separate microcode routine
for each different command, NOT one generic microcode routine that
would correspond to ->cmd_ctrl() or ->cmdfunc().

M~
