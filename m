Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:35697 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932815Ab3HNQuP (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 12:50:15 -0400
Message-ID: <520BB3E6.7000205@wwwdotorg.org>
Date: Wed, 14 Aug 2013 10:44:22 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC] Best practices for hardware shipping device trees
References: <20130814151345.GA2983@bill-the-cat>
In-Reply-To: <20130814151345.GA2983@bill-the-cat>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <tom.rini@gmail.com>
Cc: devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <Mark.Rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 09:13 AM, Tom Rini wrote:
> Hey all,
> 
> Do we have a document yet talking about the best practices for how we
> would like a hardware vendor to ship, store and possibly update a device
> tree, on the hardware?  "However they like" seems likely to invite
> problems down the line with everyone trying their own thing.  Thanks!

I don't believe there's any written guidance, no.

The initial guidance Grant gave (IIRC at the first Linaro Connect last
year, or perhaps the ARM workshop in Prague, or perhaps also in various
ARM kernel list threads?) was that the DTBs should be stored/accessed in
exactly the same way as the kernel, which on many systems implies it's a
file in /boot (although MTD partitions, ... are also possible kernel
locations). The idea here was to explicitly make upgrading the DTB as
easy as upgrading the kernel, and explicitly without having to upgrade
any firmware, since that's a more dangerous process in most cases.

Now perhaps that advice was only intended to apply very early on when DT
was really new on ARM, and has "aged out" by now? If so, I don't recall
that every being explicitly mentioned or communicated later.

Certainly, that approach actively causes issues whereby every distro
must somehow install ensure the DTBs get into /boot, rather than the
system "just providing" them somehow. Having distros have to manage this
probably doesn't scale very well, hence people are advocating that the
DTB be part of the firmware image, so it's already there without the
distro having to put it into the filesystem.
