From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 10 Jun 2016 19:03:57 +0200
Message-ID: <20160610190357.5f10c00f@bbrezillon>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
	<20160603162207.0688c9e6@bbrezillon>
	<alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
	<20160608175018.16c88207@bbrezillon>
	<alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
	<20160610175454.327f51a2@bbrezillon>
	<alpine.DEB.2.02.1606101803120.30757@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1606101803120.30757-0r+fHKsYbBpkgkEezDIDgepEb+yt5a1K@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jun 2016 18:46:24 +0200
Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org> wrote:

> On Fri, 10 Jun 2016, Boris Brezillon wrote:
> 
> > > The use cases as I see are as follows:
> > > 
> > > a) Two identical chips sharing all but the CS lines, in order to implement 
> > > a seemingly-larger address space. (e.g. two 256 Mbit chips implementing a 
> > > 4 GB area). In this case, for certain operations, the controller does not 
> > > have to wait for one device to complete before issuing a command to 
> > > another. I'm not sure how the controller keeps track of the two devices 
> > > though.  
> > 
> > I think it's the chip-enable use case, isn't it?
> >   
> > > 
> > > b) Two different chips with the same connection, which provide disjunct 
> > > functions, e.g. one (small) flash for program storage and one (large) for 
> > > data.  
> > 
> > Then they can't share the CS line (or be actived at the same time), at
> > least it doesn't make any sense to me.  
> 
> Sorry if I haven't been clear enough, but in neither case are the CS lines 
> shared between the devices. There is still a separate CS for each flash 
> chip. The question is how the controller handles the CS lines.
> 
> Basically, in the general case, the controller can handle a matrix of nand 
> flash chips. There can be a number of banks, each of which can have a 
> number of individual CS lines. For the (in this case academic) case of 3 
> banks and 4 chip selects per bank, there would be a total of 3 x 4 = 12 CS 
> lines.
> 
> For the IP configuration the driver was written for, there are only 2 CS 
> lines, and we can configure if they are to be viewed by the controller as 
> 2 CS lines within the same single bank, or 2 separate banks with one CS 
> each. This is what the DT property is intended to express. It basically 
> translates directly into a register write in the IP.

Okay, got it. I guess we should just expose the chip select in a linear
way (3 banks of 4 CS means the controller should support up to 12
chips), unless you really have a way to change the CS pins routing
internally.

> 
> But, as you are driving at below, the bindings should really cover the 
> more general case, for which a simple use-bank-select property doesn't 
> really cut it. Since the driver only supports a single CS at the time 
> being, I'm really proposing to drop it completely, alternatively we could 
> have two: 'banks' and 'devices-per-bank', which reflect what the general 
> IP case would be able to handle. For the version of the IP in use these 
> would have the permitted values of 1 and 2, with some combinations being 
> illegal. Unfortunately, the IP configuration cannot be read out (neither 
> the version of it), so it's not possible for the driver to verify the 
> DT settings against the actual IP configuration. I don't really know how 
> to solve that.

Yes, let's drop the property for now. Just trying to understand how the
IP works ;).

> 
> > > > > I didn't really want to have the added flexibility (and complexity) of 
> > > > > being able to use any R/B line for any connected flash chip. It seems an 
> > > > > unnecessary complication for the driver without much gain.    
> > > > 
> > > > Not really, at least if you properly separate the chip and controller
> > > > objects it's quite easy to deal with, and I'll ask you to do this clean
> > > > separation anyway (even if you say you only have a single chip per
> > > > controller) :P.    
> > > 
> > > Yes, the separation of chip and controller is needed, but the R/B line 
> > > flexibility requires an additional mapping functionality within the 
> > > driver. Not rocket science of course, but I can't see much point in it 
> > > (other than to cover up a potential routing mistake done by a PCB 
> > > designer).  
> > 
> > You seem to argue on all the minor things I'm asking. Honestly, it
> > should be hard or error-prone to do it. And let's say you don't support
> > it in your driver, you should still think about that when designing
> > your bindings.  
> 
> Sorry, it's just that over the years I've seen too much code that 
> introduces various flexibilities just because someone thought it might be 
> 'nice to have at some point' or 'because the hardware supports it', but 
> which in reality is never used and still must be maintained. Sure, one 
> small mapping function is certainly not going to break the bank, far from 
> it, but over time the matrix of things that can be configured can grow to 
> awkward proportions, and often something thought of as a minor issue can 
> turn out to be complex to support in the end. And given a stable API rule, 
> it's too late to simplify things once they have been implemented.
> 
> Of course, the code should not be written in a way to limit future 
> expansion either.
> 
> > > I mean, an IP may be capable of a lot of things, and we don't necessarily 
> > > want to implement them all in the driver to start with and have DT 
> > > propertes for them all do we?  
> > 
> > Hm, you should at least take the capabilities you know about into
> > account when defining a new binding, and you already know that some
> > SoCs might decide to expose 2 or more R/B pins, so it should already be
> > designed this way.  
> 
> Ok. I'll give it some more thought then.
> 
> > I'm opposed to the idea of putting information that can be
> > automatically deduced in the DT. For this specific case, the main
> > reason is that a board vendor can decide to use different NAND chips
> > on the same design, and they might not all share the same
> > capabilities (and you don't want to have a dts for each NAND).  
> 
> Yes, that makes sense of course, but what if someone would want to 
> override the automatic settings, for whatever reason, using an optional DT 
> property? I can think of several reasons either way, that's why I'm 
> asking.

You mean reducing the timings because the board design prevents using
the highest supported mode for example? That would actually be a valid
use case, and I guess we could make a generic property for that
(without the vendor prefix).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
