From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/5] MIPS: lantiq: add an irq_domain and irq_chip for EBU
Date: Sat, 3 Aug 2019 19:33:44 +0200
Message-ID: <CAFBinCDRBmG39Pa4XBa2Bu8K6GH7iz_YyKoJ795XKTnEz2b4VQ@mail.gmail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-4-martin.blumenstingl@googlemail.com>
 <86y30imq9p.wl-marc.zyngier@arm.com> <CAFBinCCb4aTfuxaSrUp8xbUjjefi_qHOUJLjzH+acUTLY+6Geg@mail.gmail.com>
 <86o916mx2m.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86o916mx2m.wl-maz@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Sat, Aug 3, 2019 at 11:12 AM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Martin,
>
> On Thu, 01 Aug 2019 18:42:42 +0100,
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> [...]
>
> > > > +static void ltq_ebu_irq_handler(struct irq_desc *desc)
> > > > +{
> > > > +     struct irq_domain *domain = irq_desc_get_handler_data(desc);
> > > > +     struct irq_chip *irqchip = irq_desc_get_chip(desc);
> > > > +
> > > > +     chained_irq_enter(irqchip, desc);
> > > > +
> > > > +     generic_handle_irq(irq_find_mapping(domain, 0));
> > >
> > > Having an irqdomain for a single interrupt is a bit over the top... Is
> > > that for the convenience of the DT infrastructure?
> > yes, I did it to get DT support
> > please let me know if there's a "better" way (preferably with another
> > driver as example)
>
> To be honest, the chained handler is what troubles me the most. You
> normally would use such a construct if you had a multiplexer. In your
> case, you have a 1:1 relationship between input and output. It is just
> that this irqchip allows the trigger to be adapted, which normally
> calls for a hierarchical implementation.
>
> In your case, with only a single interrupt, it doesn't matter much
> though.
I see, thank you for the explanation

can you name a driver for a hierarchical irqchip driver that you
consider "clean" which I could use as reference?
I am considering to still convert it to a hierarchical irqchip driver
to keep it consistent with at least two more upcoming Lantiq irqchip
drivers (which both seem to be similar use-cases as this one, they
just provide more than one interrupt):
- there's a PCI legacy interrupt controller in the PCIe controller's
app registers. it takes 4 parent interrupts and provides
PCI_INT{A,B,C,D}. the interrupts need to be enabled and ACK'ed in the
PCIe app registers as well as in the parent interrupt controller
- the EIU (External Interrupt Unit) in my own words is the GPIO
interrupt controller. it takes up to 6 parent interrupts and provides
one interrupt for each "EXIN GPIO". setting the IRQ type and ACK need
to happen through the EIU registers as well as the parent interrupt
controller

my initial thought is that it's best to follow one programming model
(which based on your suggestion would be a hierarchical irqchip) for
all three IRQ controllers

> >
> > [...]
> > > > +     irq_create_mapping(domain, 0);
> > >
> > > Why do you need to perform this eagerly? I'd expect this interrupt to
> > > be mapped when it is actually claimed by a driver.
> > I don't remember why I added it, it may be left-over from copying from
> > another driver
> > in v2 I'll try to drop it
> >
> > > > +
> > > > +     irq_set_chained_handler_and_data(irq, ltq_ebu_irq_handler, domain);
> > >
> > > And there is no HW initialisation whatsoever? I'd expect, at the very
> > > least, the sole interrupt to be configured as disabled/masked.
> > I can add that. is there any "best practice" on what I should
> > initialize (just disable it or also set a "default" mode like
> > LEVEL_LOW)?
>
> Whichever default state makes sense. What you want to avoid is to boot
> the kernel with a screaming interrupt because some firmware has left
> it enabled.
noted, thank you


Martin
