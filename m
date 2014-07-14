From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 9/9] pci: Remap I/O bus resources into CPU space with
 pci_remap_iospace()
Date: Mon, 14 Jul 2014 20:15:48 +0200
Message-ID: <7345495.UDsgOtKzyQ@wuerfel>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-10-git-send-email-Liviu.Dudau@arm.com>
 <20140714165443.GI1112@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140714165443.GI1112@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Sinan Kaya <okaya@codeaurora.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Device Tree ML <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Tanmay Inamdar <tinamdar@apm.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 14 July 2014 17:54:43 Catalin Marinas wrote:
> On Tue, Jul 01, 2014 at 07:43:34PM +0100, Liviu Dudau wrote:
> > Introduce a default implementation for remapping PCI bus I/O resources
> > onto the CPU address space. Architectures with special needs may
> > provide their own version, but most should be able to use this one.
> [...]
> > +/**
> > + *   pci_remap_iospace - Remap the memory mapped I/O space
> > + *   @res: Resource describing the I/O space
> > + *   @phys_addr: physical address where the range will be mapped.
> > + *
> > + *   Remap the memory mapped I/O space described by the @res
> > + *   into the CPU physical address space. Only architectures
> > + *   that have memory mapped IO defined (and hence PCI_IOBASE)
> > + *   should call this function.
> > + */
> > +int __weak pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
> > +{
> > +     int err = -ENODEV;
> > +
> > +#ifdef PCI_IOBASE
> > +     if (!(res->flags & IORESOURCE_IO))
> > +             return -EINVAL;
> > +
> > +     if (res->end > IO_SPACE_LIMIT)
> > +             return -EINVAL;
> > +
> > +     err = ioremap_page_range(res->start + (unsigned long)PCI_IOBASE,
> > +                             res->end + 1 + (unsigned long)PCI_IOBASE,
> > +                             phys_addr, __pgprot(PROT_DEVICE_nGnRE));
> 
> Except that PROT_DEVICE_nGnRE is arm64 only. I think that's a function
> that should remain arch specific.
> 

How about #defining a macro with the correct pgprot value in asm/pci.h
or asm/pgtable.h?
We can provide a default for that in another architecture independent
location.

	Arnd
