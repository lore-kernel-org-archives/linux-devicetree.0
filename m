From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 07/11] x86/dtb: add support for PCI devices backed by
	dtb nodes
Date: Mon, 29 Nov 2010 09:32:06 +1100
Message-ID: <1290983526.32570.187.camel@pasglop>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-8-git-send-email-bigeasy@linutronix.de>
	<1290897231.32570.168.camel@pasglop>
	<20101128140436.GB30784@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101128140436.GB30784-Hfxr4Dq0UpYb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2010-11-28 at 15:04 +0100, Sebastian Andrzej Siewior wrote:
> Microblaze had its own copy of this code so I though there is
> something
> specific about it. If it is okay with you, I would move it to
> drivers/of
> and share. Then I would have the swizzle part :)

Appart from the accessor pci_device_to_OF_node() which might or might
not be specific, I thin the code is pretty common, probably something
Grant didn't have time to tackle yet :-)
 
> >Eventually we want that matching between PCI devices and OF nodes to
> be
> >in generic code, so that's not a big deal to have an "inferior"
> version
> >temporarily in there I suppose.
> 
> Inferior, I see :)

Hehe yeah :-) It's actually not a simple problem. For example, we can't
just move the powerpc variant over to generic code as-is bcs ... we have
2 completely different ways of doing it between ppc32 and ppc64 for
historical reasons :-) They also have different "features". This is
something I need to reconcile at some stage.

For example our ppc32 variant support bus renumbering (ie, Linux
assigning different bus numbers than what the DT encodes) while our
ppc64 doesn't, but our ppc64 variant has additional "stuff" to deal with
hotplug for example etc...

> >Also, aren't you missing a pci_dev_put() after pci_get_slot() ?
> probably. I will check.

Cheers,
Ben.
