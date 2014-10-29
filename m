From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 01/11] irqchip: Allow irq_reg_{readl,writel} to use __raw_{readl_writel}
Date: Wed, 29 Oct 2014 20:14:19 +0100
Message-ID: <2708949.pfRevDjuZe@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <11255905.1JsQYcArO7@wuerfel> <54512599.4080500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54512599.4080500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 10:36:25 Florian Fainelli wrote:
> On 10/29/2014 12:43 AM, Arnd Bergmann wrote:
> > On Tuesday 28 October 2014 20:58:48 Kevin Cernekee wrote:
> >>
> >> +#ifdef CONFIG_RAW_IRQ_ACCESSORS
> >> +
> >> +#ifndef irq_reg_writel
> >> +# define irq_reg_writel(val, addr)     __raw_writel(val, addr)
> >> +#endif
> >> +#ifndef irq_reg_readl
> >> +# define irq_reg_readl(addr)           __raw_readl(addr)
> >> +#endif
> >> +
> >> +#else
> >> +
> > 
> > No, this is just wrong: registers almost always have a fixed endianess
> > indenpent of CPU endianess, so if you use __raw_writel, it will be
> > broken on one or the other.
> 
> Our brcmstb platforms had an endian strap settings for MIPS-based
> platforms, and for most peripherals this would be just completely
> transparent, as the HW always will do the internal swapping, such that
> host CPU does read/writes in its native endianess regardless of the
> actual strap settings.

That's irrelevant, it just makes matters worse because then you
might run into all combinations of big-endian and little-endian
kernels vs MMIO registers.

> AFAICT bcm3384, a MIPS-based Cable Modem platform has only one endianess
> setting: BE, and the HW only supports that specific endianess.

But they might have a secondary interrupt controller on a PCI card that
uses the same driver in the little-endian mode.

> > If you have a machine that uses big-endian registers in the interrupt
> > controller, you need to find a way to use the correct accessors
> > (e.g. iowrite32be) and use them independent of what endianess the CPU
> > is running.
> > 
> > As this code is being used on all sorts of platforms, you can't assume
> > that they all use the same endianess, which makes it rather tricky.
> 
> I think the more general problem with the use of readl_*() I/O accessors
> is that they just happen to work fine on most platforms out there: ARM
> Little-endian, because this nicely matches the endianess expected by the
> HW and that does not enforce an audit of whether your actual peripheral
> expects little-endian writes to be done.

Most peripherals have registers that are designed for PCI compatibility,
and PCI mandates little-endian registers. This has very little to do with
the architecture.

We also have a lot of peripherals that have big-endian registers, e.g
for things that are shared between ARM and PowerPC.

The only hardware that is causing problems is the kind where the hardware
developer tried to be helpful by making it possible to change endianess,
and this is what causes endless nightmares for kernel developers.

I think the easiest solution here is to make this irqchip not use
the irq-generic logic, because it clearly is not generic.

> The other problem is that readl() on ARM implies a barrier, which is not
> necesarily true/necessary for some other platforms such as some MIPS
> processors.

readl has to provide the semantics that PCI devices expect on x86.
On x86, it implies a barrier, so everything else has to do the same.

If you know that a driver does not need barriers, you can use
readl_relaxed(). It doesn't currently work on all architectures, but
it works on MIPS and I have a patch series from Will Deacon that I want
to push to make it work everywhere.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
