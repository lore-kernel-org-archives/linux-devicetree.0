From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Tue, 2 Jun 2009 10:48:11 +0100
Message-ID: <20090602094811.GC19390@rakim.wolfsonmicro.main>
References: <20090527234801.GP6805@pengutronix.de>
	<1243677166.440.12.camel@pasglop>
	<20090530102153.GA6910@n2100.arm.linux.org.uk>
	<200906020957.20493.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200906020957.20493.hs4233-x6+DxXLjN1AJvtFkdXX2Hg4jNU5vUVPG@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Holger Schurig <hs4233-x6+DxXLjN1AJvtFkdXX2Hg4jNU5vUVPG@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 02, 2009 at 09:57:20AM +0200, Holger Schurig wrote:

> > 1. implementers of the clock API which have not been subject
> > to my rigorous review abuse it to the point of making the API
> > essentially useless, and that causes Mark problems.

> If that's a problem, when something needs changes. An API that 
> can only be managed by implementers due to rigorous review lacks 
> something, maybe easy-of-use, maybe documentation. Can it be the 
> case that the current state makes you a single-point of failure?

The problem is more that a lot of platform maintainers have treated the
clock API as being a bit of platform support code not intended to be
used by drivers, causing them to take lots of shortcuts when
implementing it that only work in their specific use cases - at times to
the point where it's not even possible to register new clocks.  Since
this means that the API is essentially unusable in generic driver code
you end up with nobody using it there and no back pressure other than
code review on maintainers to provide a good implementation.

> If yes, I'd at least suggest better docs in linux/Documentation, 
> e.g. describe the big-picture, the implementation and common 
> cave-ats, e.g. why an approach "uniquely name every single 
> clock ... makes the API pointless" doesn't work.

None of which means that better documentation wouldn't help, of course.
