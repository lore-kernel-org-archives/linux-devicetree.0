From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 12:57:18 +1000
Message-ID: <20090528025718.GC1464@yookeroo.seuss>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
	<20090527162000.GM6805@pengutronix.de>
	<fa686aa40905271335o1165419hda2334bef42aa3f@mail.gmail.com>
	<20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com>
	<20090528000707.GR6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090528000707.GR6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 02:07:07AM +0200, Robert Schwebel wrote:
> On Wed, May 27, 2009 at 06:58:24PM -0500, Scott Wood wrote:
> > Robert Schwebel wrote:
> >> The oftree by design wants to be a complete hardware description. As
> >> you mention above, there are cases where you *nevertheless* need
> >> ad-hoc information about things *not* encoded into the device tree.
> >>
> >> This renders the whole concept ad absurdum. You need a machine number
> >> again - and if you need that: why not stay with the ARM model, define
> >> everything with platform data and avoid the whole thing?
> >
> > Because it's better to have a little platform specific code than a lot
> > of it?
> 
> Until now, oftree has created more problems than it has solved for us.
> The idea works fine for well-known things like memory maps and
> interrupts. It works badly for corner cases, and embedded land is full
> of it. The effort to get the oftree stuff right is often more than a
> magnitude of order higher than the effort for the actual functionality.
> That should be an alarm sign that something is wrong.

It's true that going to a device tree model does take quite a bit of
time and effort to get up to speed.  As Grant said, we've made quite a
few errors along the way on powerpc, as people experimented with the
unfamiliar idea.  Along the way a lot of people complained about how
we were much better off without the device tree.

However, I think nowadays, with most of the community at least roughly
up to speed on device tree conventions, and the worst mistakes over, a
lot of people who doubted the value of the device tree approach are
coming around.

Grant mentions the Xilinx devices as an example - they're interesting
because of the fancy stuff they're doing, autogenerating the devtree
from the FPGA configuration.  But to me the real indicator of the
device tree's value is the handful of platforms for which support has
been added with *only* a new dts - a single, fairly simple text file.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
