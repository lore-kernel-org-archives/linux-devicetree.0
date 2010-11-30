From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Tue, 30 Nov 2010 12:51:41 +0100
Message-ID: <4CF4E54D.5040403@linutronix.de>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>	<1290808645.32570.158.camel@pasglop>	<20101128160449.GC30784@www.tglx.de>	<1290984809.32570.208.camel@pasglop>	<20101129130720.7d060e1c@udp111988uds.am.freescale.net>
	<1291061128.32570.298.camel@pasglop>
	<4CF40DF4.9060204@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CF40DF4.9060204-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:
> Here are the properties for PCI and ISA on the OLPC XO-1.5
> platform (Via C7 x86 CPU with Via VX855 IO chip):
> 
> ok dev /pci/isa
> ok .properties
> reg                      00008800 00000000 00000000 00000000 00000000

> Note that the PCI node has no reg property.  On a system with multiple independent PCI buses at the top level, it would be necessary to distinguish them with reg properties reflecting their different addresses in the root address space.  PC-style architectures typically (always?) have a single top-level PCI domain, so I've never never needed to do that in x86 land.  It used to be pretty common on PPC "big iron".

My PCI node does not have a reg property but its child nodes.
In x86_of_pci_init() [0] I walk through the PCI child nodes, read the reg
property of each node  which gives me the devfn of the device. I pass this
pci_get_slot() and get the pci_dev struct where I attach the of_node. So
it can by used by the pci driver.

How do I create the PCI device <-> OF node mapping with this? I think your
isa node has this as well. 00008800 is the devfn and I simply forgot the
four blocks of zeros.

[0] http://lkml.org/lkml/2010/11/25/294

Sebastian
