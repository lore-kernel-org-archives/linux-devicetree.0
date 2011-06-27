From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC PATCH] irq: add irq_domain translation infrastructure
Date: Mon, 27 Jun 2011 20:14:29 +1000
Message-ID: <1309169669.32158.387.camel@pasglop>
References: <20110526065438.23444.69386.stgit@ponder>
	<20110627090059.GA31287@linutronix.de>
	<1309166659.32158.380.camel@pasglop>
	<4E08541A.4060302@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E08541A.4060302-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-06-27 at 11:57 +0200, Sebastian Andrzej Siewior wrote:

> I see. No, actually I don't. xics is pseries where I don't see the .dts. 
> So you are saying that we have one irq_domain but 2+ different
> interrupt-parents nodes?

Yes. Basically the various PCI bridges and other interrupt sources like
HEA contain what are called "source controllers" that control the
targetting of interrupts (toward a CPU thread), priority, masking etc...

Those act as device-tree parents as well, there's pretty much one per
PCI host bridge for example since that's where all of the
configuration/masking/etc... happens.

However, they then turn interrupts into a special bus message that
reaches eventually a presentation controller (there's one per HW
thread). Those messages are basically the "HW interrupt numbers" (along
with priority info etc...) and that number encodes a "BUID" which
identifies the source controller that shot the message.

Thus the "interrupt numbers" are unique accross the fabric and live in a
unique number space. It's one domain for all intend and purposes. But
several device-nodes.

Now as to whether it's several irq_chip or not .. well, it depends :-)
On pHyp and old style pseries, it's a single set of FW call, it's
abstracted, so it's also basically one chip. On WSP, the separate source
controllers (ICS) are exposed as individual chips.

> How do you distinguish then between two different controllers lets say
> xics and a gpio based controller? This implementation calls ->dt_translate
> until one controller returns 0 which looks like brute force.

It's a bit brute force but would work if the xics implementation of that
translate call checks that the device-node is indeed a XICS source
controller (which can be identified by its compatible property).

Now I have lost track a bit with what Grant is doing, is this the old DT
stuff I objected to ? I basically asked him to make the remapping
orthogonal from the DT matching.

> xics_host_xlate() returns always zero so you would have to go for
> the compatible and check it.
> Every device has an interrupt-parent node. Shouldn't the code call exact 
> this irq controller xlate function instead of trying them all?

Well, my powerpc code iterates the domains with "match" to check which
one claims to own the parent device-node, then calls xlate for that one,
but I see why one could collapse those two action after all.

Cheers,
Ben.

> >  
> > Cheers,
> > Ben.
> > 
> Sebastian
