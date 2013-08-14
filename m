Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:51934 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757782Ab3HNSlw (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 14:41:52 -0400
Received: by mail-qc0-f173.google.com with SMTP id z10so5086700qcx.4
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 11:41:51 -0700 (PDT)
Date: Wed, 14 Aug 2013 14:41:48 -0400
From: Tom Rini <trini@ti.com>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814184148.GD2983@bill-the-cat>
References: <20130814151345.GA2983@bill-the-cat>
 <20130814163823.GD32395@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130814163823.GD32395@titan.lakedaemon.net>
Sender: devicetree-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2013 at 12:38:23PM -0400, Jason Cooper wrote:
> Hey Tom,
> 
> On Wed, Aug 14, 2013 at 11:13:45AM -0400, Tom Rini wrote:
> > Do we have a document yet talking about the best practices for how we
> > would like a hardware vendor to ship, store and possibly update a device
> > tree, on the hardware?  "However they like" seems likely to invite
> > problems down the line with everyone trying their own thing.  Thanks!
> 
> Speaking from my experience with the Marvell SoCs and after market
> installation of mainline code (bootloaders, kernel, etc), I can say what
> I'd like to see, if that helps ;-)
> 
>   1) individually upgradable (bootloader, dtb, config, kernel, etc)
>       - separate flash partitions for each

Well, that assumes it comes from the factory with flash flashed.  Forgot
to update my mutt rules before sending the first post, but a lot of TI
boards don't ship with NAND programmed, just an SD card, even in the
cases of boards with NAND.  On some families (am335x) we include a
relatively large EEPROM on the references, of which some customers throw
out and some keep and re-purpose with their own data.

>   2) bootloader uses as well as passes off the dtb
>       - Good for scenarios where user wants to modify flash partitions,
>         he would only need to update the dtb.
>       - facilitates fixes after deployment since dtb not bound to
>         bootloader.

Putting my U-Boot guy hat on, I'm happy to go down this path more, in
certain areas where we can afford it, once things in DT-land are stable
(and we have examples of this today, even).

-- 
Tom
