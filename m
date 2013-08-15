Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qe0-f50.google.com ([209.85.128.50]:48087 "EHLO
	mail-qe0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758349Ab3HOAhb (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 20:37:31 -0400
Received: by mail-qe0-f50.google.com with SMTP id q19so92692qeb.9
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 17:37:30 -0700 (PDT)
Date: Wed, 14 Aug 2013 20:37:28 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [RFC] Best practices for hardware shipping device trees
In-Reply-To: <20130814182502.GC2983@bill-the-cat>
Message-ID: <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg>
References: <20130814151345.GA2983@bill-the-cat> <520BB3E6.7000205@wwwdotorg.org> <20130814182502.GC2983@bill-the-cat>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <trini@ti.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, cross-distro@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, Tom Rini <tom.rini@gmail.com>, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 14 Aug 2013, Tom Rini wrote:

> On Wed, Aug 14, 2013 at 10:44:22AM -0600, Stephen Warren wrote:
> > On 08/14/2013 09:13 AM, Tom Rini wrote:
> > > Hey all,
> > > 
> > > Do we have a document yet talking about the best practices for how we
> > > would like a hardware vendor to ship, store and possibly update a device
> > > tree, on the hardware?  "However they like" seems likely to invite
> > > problems down the line with everyone trying their own thing.  Thanks!
> > 
> > I don't believe there's any written guidance, no.
> > 
> > The initial guidance Grant gave (IIRC at the first Linaro Connect last
> > year, or perhaps the ARM workshop in Prague, or perhaps also in various
> > ARM kernel list threads?) was that the DTBs should be stored/accessed in
> > exactly the same way as the kernel, which on many systems implies it's a
> > file in /boot (although MTD partitions, ... are also possible kernel
> > locations). The idea here was to explicitly make upgrading the DTB as
> > easy as upgrading the kernel, and explicitly without having to upgrade
> > any firmware, since that's a more dangerous process in most cases.
> > 
> > Now perhaps that advice was only intended to apply very early on when DT
> > was really new on ARM, and has "aged out" by now? If so, I don't recall
> > that every being explicitly mentioned or communicated later.
> [snip out a bit more of Stephen's answer]
> 
> Yes, this notion certainly is the opposite of what was suggested on the
> cross-distro list, both as part of a "what should a bootloader provide
> to get commodity distros to support the board" thread and the "where
> should a device tree live in the filesystem" thread.  Cc'ing them now
> because this is one of those things that feels like it needs solving,
> solving soon, and done in a way the least number of folks get surprised
> about it.

I don't think the "however they like" approach is that bad.  It is 
certainly less of a problem than "exactly the same way as the kernel" is.

Using /boot implies a distro filesystem and we'd rather wish for DT to 
be independent from a distro or even Linux.  The DTB should therefore be 
stored and accessed in a way which is hardware/bootloader specific.  The 
distro being installed on top shouldn't have to care.


Nicolas
