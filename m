Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:54167 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758610Ab3HNSZG (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 14:25:06 -0400
Received: by mail-qc0-f169.google.com with SMTP id m15so5109197qcq.14
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 11:25:04 -0700 (PDT)
Date: Wed, 14 Aug 2013 14:25:02 -0400
From: Tom Rini <trini@ti.com>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814182502.GC2983@bill-the-cat>
References: <20130814151345.GA2983@bill-the-cat>
 <520BB3E6.7000205@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520BB3E6.7000205@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, cross-distro@lists.linaro.org
Cc: Tom Rini <tom.rini@gmail.com>, devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <Mark.Rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2013 at 10:44:22AM -0600, Stephen Warren wrote:
> On 08/14/2013 09:13 AM, Tom Rini wrote:
> > Hey all,
> > 
> > Do we have a document yet talking about the best practices for how we
> > would like a hardware vendor to ship, store and possibly update a device
> > tree, on the hardware?  "However they like" seems likely to invite
> > problems down the line with everyone trying their own thing.  Thanks!
> 
> I don't believe there's any written guidance, no.
> 
> The initial guidance Grant gave (IIRC at the first Linaro Connect last
> year, or perhaps the ARM workshop in Prague, or perhaps also in various
> ARM kernel list threads?) was that the DTBs should be stored/accessed in
> exactly the same way as the kernel, which on many systems implies it's a
> file in /boot (although MTD partitions, ... are also possible kernel
> locations). The idea here was to explicitly make upgrading the DTB as
> easy as upgrading the kernel, and explicitly without having to upgrade
> any firmware, since that's a more dangerous process in most cases.
> 
> Now perhaps that advice was only intended to apply very early on when DT
> was really new on ARM, and has "aged out" by now? If so, I don't recall
> that every being explicitly mentioned or communicated later.
[snip out a bit more of Stephen's answer]

Yes, this notion certainly is the opposite of what was suggested on the
cross-distro list, both as part of a "what should a bootloader provide
to get commodity distros to support the board" thread and the "where
should a device tree live in the filesystem" thread.  Cc'ing them now
because this is one of those things that feels like it needs solving,
solving soon, and done in a way the least number of folks get surprised
about it.

-- 
Tom
