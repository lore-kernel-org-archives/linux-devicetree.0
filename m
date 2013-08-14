Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:17276 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1759287Ab3HNRUu (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 13:20:50 -0400
Date: Wed, 14 Aug 2013 13:20:41 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814172041.GA13964@titan.lakedaemon.net>
References: <20130814151345.GA2983@bill-the-cat>
 <520BB3E6.7000205@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520BB3E6.7000205@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tom Rini <tom.rini@gmail.com>, devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <Mark.Rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2013 at 10:44:22AM -0600, Stephen Warren wrote:
...
> Certainly, that approach actively causes issues whereby every distro
> must somehow install ensure the DTBs get into /boot, rather than the
> system "just providing" them somehow. Having distros have to manage this
> probably doesn't scale very well, hence people are advocating that the
> DTB be part of the firmware image, so it's already there without the
> distro having to put it into the filesystem.

I advocate that it be stored on the same media as the bootloader (eg
flash), but separate from the bootloader, similar to how u-boot has a
separate flash partition for it's environment.

This way, a distro can upgrade the DTB if they _choose_ to, but managing
the dtbs *isn't* mandatory.

It makes bootloader init via DT a little more difficult, since the flash
chip/bus parameters would have to be hardcoded into the bootloader.
Plus the offset to the dtb.  But bootloader init via DT is at best a
nice-to-have, imho.  I don't think it should get in the way of a
properly upgradeable system.

thx,

Jason.
