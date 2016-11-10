From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Subject: Re: [PATCH] of/irq: improve error message on irq discovery process
 failure
Date: Fri, 11 Nov 2016 08:30:43 +1100
Message-ID: <1478813443.2592.2.camel@au1.ibm.com>
References: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
         <20161109190457.GC837@leverpostej>
Reply-To: benh@au1.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20161109190457.GC837@leverpostej>
Sender: linux-pci-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
Cc: devicetree@vger.kernel.org, marc.zyngier@arm.com, frowand.list@gmail.com, robh+dt@kernel.org, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-09 at 19:04 +0000, Mark Rutland wrote:
> 
> 
> If we don't have an interrupt-map on a PCI controller, why don't we
> instead log a message regarding that being missing, and give up
> early?

Why ? It's legit to not support LSIs.

> That sounds like a more generically useful error message; it's also
> possible that a DT author simply forgot to add the map, and the
> platform has suitable interrupts wired up.

But it's not necessarily an error...

> > This patch introduces a different message for this specific case,
> > and it also reduces the level of the message from error to warning.
> > Before this patch, when an adapter was plugged in a slot without
> Level
> > interrupts capabilities, we saw generic error messages like this:
> > 
> >     [54.239] pci 002d:70:00.0: of_irq_parse_pci() failed with rc=-
> 22
> > 
> > Now, with this applied, we see the following specific message:
> > 
> >     [19.947] pci 0014:60:00.0: of_irq_parse_pci() gave up. The slot
> of this
> >     device has no Level-triggered Interrupts capability.
> 
> Following my above example, this has gone from opaque to potentially
> misleading

I'm not sure. At least for some of our platforms this is the correct
message :-) Our Hypervisor doesn't allow LSIs on some slots.

I think it's not that misleading. It's obvious something is wrong with
LSIs, which you can easily figure out from there.

Cheers,
Ben.
