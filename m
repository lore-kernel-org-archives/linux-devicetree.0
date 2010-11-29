From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Tue, 30 Nov 2010 10:58:52 +1100
Message-ID: <20101129235852.GC3604@yookeroo>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>
	<20101128160449.GC30784@www.tglx.de>
	<1290984809.32570.208.camel@pasglop>
	<20101129130720.7d060e1c@udp111988uds.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101129130720.7d060e1c-N/eSCTBpGwP7j4BuCOFQISmX4OfbXNuMKnGXBo5VDl8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 29, 2010 at 01:07:20PM -0600, Scott Wood wrote:
> On Mon, 29 Nov 2010 09:53:29 +1100
> Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Sun, 2010-11-28 at 17:04 +0100, Sebastian Andrzej Siewior wrote:
> > > >> +	isa@legacy {
> 
> What is "@legacy"?  I don't think I've seen that in a unit address
> before, googling only turns up this device tree, and a quick grep
> through the ISA and base OF specs turns up nothing.
> 
> > > >> +		device_type = "isa";
> > > >> +		compatible = "simple-bus";
> > > >
> > > >What does "simple-bus" means ?
> > > I added simple bus in order to get probed. But I now I rember that this
> > > is also supported per device_type. I get rid of it.
> > 
> > device_type is a nasty bugger, we are trying to get rid of Linux
> > reliance on it.
> > 
> > Things like "simple-bus" don't rock my boat either, it's adding to the
> > device-tree "informations" that are specific to the way Linux will
> > interpret it, which is not how it should be.
> 
> The motivation for simple-bus comes from Linux, but its definition is
> OS-neutral.  It indicates that no special bus knowledge is required to
> access the devices under it.

Well, sort of.  More specifically, that plus it indicates that the bus
does not support any method of dynamic probing, so the device tree is
the *only* way to figure out what's on it.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
