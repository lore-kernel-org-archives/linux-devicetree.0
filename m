Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:46644 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760098Ab3HNQiZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 12:38:25 -0400
Date: Wed, 14 Aug 2013 12:38:23 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814163823.GD32395@titan.lakedaemon.net>
References: <20130814151345.GA2983@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130814151345.GA2983@bill-the-cat>
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <tom.rini@gmail.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hey Tom,

On Wed, Aug 14, 2013 at 11:13:45AM -0400, Tom Rini wrote:
> Do we have a document yet talking about the best practices for how we
> would like a hardware vendor to ship, store and possibly update a device
> tree, on the hardware?  "However they like" seems likely to invite
> problems down the line with everyone trying their own thing.  Thanks!

Speaking from my experience with the Marvell SoCs and after market
installation of mainline code (bootloaders, kernel, etc), I can say what
I'd like to see, if that helps ;-)

  1) individually upgradable (bootloader, dtb, config, kernel, etc)
      - separate flash partitions for each

  2) bootloader uses as well as passes off the dtb
      - Good for scenarios where user wants to modify flash partitions,
        he would only need to update the dtb.
      - facilitates fixes after deployment since dtb not bound to
        bootloader.

I'm sure there's more, but those jumped to mind when I read your
question.

thx,

Jason.
