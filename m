From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Wed, 01 Dec 2010 07:31:40 +1100
Message-ID: <1291149100.32570.393.camel@pasglop>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>	<20101128160449.GC30784@www.tglx.de>
	<1290984809.32570.208.camel@pasglop>
	<20101129130720.7d060e1c@udp111988uds.am.freescale.net>
	<1291061128.32570.298.camel@pasglop> <4CF40DF4.9060204@firmworks.com>
	<4CF4E54D.5040403@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CF4E54D.5040403-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2010-11-30 at 12:51 +0100, Sebastian Andrzej Siewior wrote:
> My PCI node does not have a reg property but its child nodes.
> In x86_of_pci_init() [0] I walk through the PCI child nodes, read the reg
> property of each node  which gives me the devfn of the device. I pass this
> pci_get_slot() and get the pci_dev struct where I attach the of_node. So
> it can by used by the pci driver.
> 
> How do I create the PCI device <-> OF node mapping with this? I think your
> isa node has this as well. 00008800 is the devfn and I simply forgot the
> four blocks of zeros.

I think Mitch meant the PCI host bridge usually has a reg property in
the address space of the parent, used to identify the bridge uniquely if
you have multiple of them.

Cheers,
Ben.
