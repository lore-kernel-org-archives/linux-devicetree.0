Return-Path: <devicetree-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:52723 "HELO
	netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751586Ab3HQB3f (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 16 Aug 2013 21:29:35 -0400
Date: Fri, 16 Aug 2013 21:29:34 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Non-enumerable devices on USB and other enumerable buses
In-Reply-To: <20130816224654.GV30073@sirena.org.uk>
Message-ID: <Pine.LNX.4.44L0.1308162117240.24059-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 16 Aug 2013, Mark Brown wrote:

> > Besides, you need to get the platform information to the driver in any 
> > case, no matter how you decide to solve the chicken-and-egg problem.  
> > It shouldn't be a factor in deciding which solution to use.
> 
> It's not that this is hard, it's that I don't see how if you already
> have some concept of the device in the kernel data structures (which you
> must have in order to be able to provide platform data when it's needed)
> anything is gained by not using that when dealing with bootstrapping
> issues.

I agree.  In fact, there's no choice but to use this device concept
during startup.  Otherwise there's no way to get the platform data to
the driver when it is needed, because there's no way to tell which
device the data applies to.  The question is how elaborate the concept
needs to be and how it gets used.

Aong those lines, I would like to point out that the device concept
embodied in the kernel's data structures can be pretty thin.  For
example, it might be little more than a port number or bus address.

> Anyway, I think it's time to try to implement something rather than talk
> about it.

Hopefully this discussion has given you some ideas for alternative 
approachs, or at least helped to solidify your ideas.

Alan Stern

