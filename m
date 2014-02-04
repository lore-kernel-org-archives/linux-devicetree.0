From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Tue, 4 Feb 2014 17:18:41 +0100
Message-ID: <201402041718.41931.arnd@arndb.de>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com>
 <20140204122951.GC27975@e106497-lin.cambridge.arm.com>
 <CAPcvp5HN4pBysOdS5_ep_3Lp7GDDKw4YrgmKjYzBet7PtaOLUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPcvp5HN4pBysOdS5_ep_3Lp7GDDKw4YrgmKjYzBet7PtaOLUg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <amurray@embedded-bits.co.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 February 2014, Andrew Murray wrote:
> On 4 February 2014 12:29, Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> > On Mon, Feb 03, 2014 at 10:34:40PM +0000, Andrew Murray wrote:
> >> On 3 February 2014 18:43, Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> >> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> >> > index 4cc813e..ce5bad2 100644
> >> > --- a/arch/arm64/include/asm/io.h
> >> > +++ b/arch/arm64/include/asm/io.h
> >> > @@ -120,9 +120,13 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
> >> >  /*
> >> >   *  I/O port access primitives.
> >> >   */
> >> > +#define arch_has_dev_port()    (0)
> >> >  #define IO_SPACE_LIMIT         0xffff
> >> >  #define PCI_IOBASE             ((void __iomem *)(MODULES_VADDR - SZ_2M))
> >> >
> >> > +#define ioport_map(port, nr)   (PCI_IOBASE + ((port) & IO_SPACE_LIMIT))
> >> > +#define ioport_unmap(addr)
> >>
> >> I'm not sure that this will work. The in[bwl], out[bwl] macros in
> >> arch/arm64/include/asm/io.h already add the PCI_IOBASE offset.
> >>
> >> Instead of these two #defines, why not just enforce that
> >> GENERIC_PCI_IOMAP is enabled? Or at least wrap these defines with 'if
> >> (!config_enabled(CONFIG_GENERIC_PCI_IOMAP))' or similar.
> >
> > GENERIC_PCI_IOMAP is enabled for AArch64. We have select GENERIC_IOMAP in
> > arch/arm64/Kconfig which in turn selects GENERIC_PCI_IOMAP in lib/Kconfig.
> 
> Sorry, it was intent to suggest using the ioport_[map|unmap] functions
> in lib/iomap.c instead of defining something similar here. I guess you
> will also need to also define CONFIG_HAS_IOPORT for this to happen.

We do want CONFIG_HAS_IOPORT, but I would say that we should not use
CONFIG_GENERIC_IOMAP. As I explained in another reply, enabling this
was probably a simple mistake, and we only need this if we want I/O
spaces that are /not/ memory mapped. IMHO any ARM64 system that doesn't
map its PCI I/O space into MMIO space can live without I/O port
access.

	Arnd
