Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:40224 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759978Ab3HNSxO (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 14:53:14 -0400
Date: Wed, 14 Aug 2013 14:53:12 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814185312.GB13964@titan.lakedaemon.net>
References: <20130814151345.GA2983@bill-the-cat>
 <20130814163823.GD32395@titan.lakedaemon.net>
 <20130814184148.GD2983@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130814184148.GD2983@bill-the-cat>
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <trini@ti.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2013 at 02:41:48PM -0400, Tom Rini wrote:
> On Wed, Aug 14, 2013 at 12:38:23PM -0400, Jason Cooper wrote:
> > On Wed, Aug 14, 2013 at 11:13:45AM -0400, Tom Rini wrote:
> > > Do we have a document yet talking about the best practices for how we
> > > would like a hardware vendor to ship, store and possibly update a device
> > > tree, on the hardware?  "However they like" seems likely to invite
> > > problems down the line with everyone trying their own thing.  Thanks!
> > 
> > Speaking from my experience with the Marvell SoCs and after market
> > installation of mainline code (bootloaders, kernel, etc), I can say what
> > I'd like to see, if that helps ;-)
> > 
> >   1) individually upgradable (bootloader, dtb, config, kernel, etc)
> >       - separate flash partitions for each
> 
> Well, that assumes it comes from the factory with flash flashed.  Forgot
> to update my mutt rules before sending the first post, but a lot of TI
> boards don't ship with NAND programmed, just an SD card, even in the
> cases of boards with NAND.  On some families (am335x) we include a
> relatively large EEPROM on the references, of which some customers throw
> out and some keep and re-purpose with their own data.

Ah, okay.  I'm more used to dealing with end-user devices that are sold
as consumer products (routers, NASs, APs, etc).  I suppose I could
amend the above to be 'place the dtb on the same media as the bootloader
as a separate entity'.  So if there's a filesystem, it's a separate
file, if it's a partitioned flash, then a separate partition.

thx,

Jason.
