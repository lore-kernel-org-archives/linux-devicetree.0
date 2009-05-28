From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 15:47:14 +1000
Message-ID: <20090528054714.GM1464@yookeroo.seuss>
References: <20090528025258.GB1464@yookeroo.seuss>
	<20090527.212730.183576278.davem@davemloft.net>
	<20090528044732.GK1464@yookeroo.seuss>
	<20090527.223147.94364683.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090527.223147.94364683.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 10:31:47PM -0700, David Miller wrote:
> From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Date: Thu, 28 May 2009 14:47:32 +1000
> 
> > The conceptual problem becomes apparent when you consider things like
> > i2c.  The devtree is the obvious source to discover what i2c device
> > are present, but they need to be instantiated as i2c devices on the
> > i2c bus, not of platform devices.
> 
> Sure, but there is no reason there can't be an of_platform driver
> for those i2c devices.  And such instantiated devices get propagated
> either instantly to the parent, or later when the parent controller
> probes.

Right, but the point is the bus info is trying to do two things here -
one is to supply stuff that's actually common to the bus interface,
the other is the probing logic.  That's usually connected to the bus
interface, but in the case of non-probeable basses on a system with a
devtree, that's no longer the case.  As soon as the bus has some
common logic that's really related to the bus interface regardless of
platform, then you start losing to use of_platform instead of a
specific bus structure because you have to duplicate that -
essentially having both OF and non-OF variants of however many busses
we need.

I think its saner instead to have the device model stuff only
represent stuff that's actually related to the bus interface, and
separately instantiate things into those busses from an OF tree
traversal.  I think this can be made as convenient as the current
setup for OF systems, though obviously I'll have to get around to
actually implementing it to be sure.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
