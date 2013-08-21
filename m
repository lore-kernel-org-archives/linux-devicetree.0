Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:46601 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523Ab3HUQKL (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 12:10:11 -0400
Message-ID: <5214E65F.50101@wwwdotorg.org>
Date: Wed, 21 Aug 2013 10:10:07 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [Device-tree] mailing list responsiveness and discoverability
References: <CAN8TOE_8f_vhCAhRaBGXk9=F8=-2YtY5eSNgypSuxiL5z-B-=Q@mail.gmail.com>
In-Reply-To: <CAN8TOE_8f_vhCAhRaBGXk9=F8=-2YtY5eSNgypSuxiL5z-B-=Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 08:25 PM, Brian Norris wrote:
> Hello device tree maintainers,
> 
> I (sub)maintain the Linux MTD subsystem and hang out on the
> linux-mtd@infradead.org mailing list. I have been seeing an increasing
> number of submissions that involve device-tree changes. Many of these
> changes are ill thought out and may even cause ABI breakage.
> 
> According to discussions I've seen on LKML, you want to see better
> bindings merged into the kernel, and you want to maintain more control
> over the acceptance of bindings in general. However, I see a few
> problems that have inhibited this.
> 
> (1) Mailing list change: it just so happens that you recently moved
> your mailing list to @vger.kernel.org. Some people are still CC'ing
> the old one (if they CC any DT list at all). I'm not sure what can be
> done about this, exactly. Perhaps a forwarding rule + a warning
> response would have been better for a transition period, rather than
> just shutting down and rejecting from the old one.

Indeed.

> (2) Responsiveness: when we finally do CC devicetree@vger.kernel.org,
> I don't see much feedback, even for those which (when I get around to
> reviewing them myself) look like they have obvious issues that
> device-tree maintainers should care about.

The problem here is that the mail volume is extremely high. Even keeping
up with the content that I'm explicitly CC'd on is difficult, let alone
the stuff that goes to the list that doesn't CC the binding maintainers.
