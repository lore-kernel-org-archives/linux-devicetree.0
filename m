From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Sun, 06 Apr 2014 19:49:53 +1000
Message-ID: <1396777793.3671.15.camel@pasglop>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-2-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140405001953.GE15806@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-04-04 at 18:19 -0600, Bjorn Helgaas wrote:
> > Introduce a pci_register_io_range() helper function that can be used
> > by the architecture code to keep track of the I/O ranges described by the
> > PCI bindings. If the PCI_IOBASE macro is not defined that signals
> > lack of support for PCI and we return an error.
> 
> I don't quite see how you intend to use this, because this series doesn't
> include any non-stub implementation of pci_register_io_range().
> 
> Is this anything like the ia64 strategy I mentioned above?  If so, it would
> be really nice to unify some of this stuff.

We also use two different strategies on ppc32 and ppc64

 - On ppc32, inb/outb turn into an MMIO access to _IO_BASE + port

That _IO_BASE is a variable which is initialized to the ioremapped address
of the IO space MMIO aperture of the first bridge we discover. Then port
numbers are "fixed up" on all other bridges so that the addition _IO_BASE + port
fits the ioremapped address of the IO space on that bridge. A bit messy... and breaks
whenever drivers copy port numbers into variables of the wrong type such as shorts.

 - On ppc64, we have more virtual space, so instead we reserve a range
of address space (fixed) for IO space, it's always the same. Bridges IO spaces
are then mapped into that range, so we always have a positive offset from _IO_BASE
which makes things a bit more robust and less "surprising" than ppc32. Additionally,
the first 64k are reserved. They are only mapped if we see an ISA bridge (which some
older machines have). Otherwise it's left unmapped, so crappy drivers trying to
hard code x86 IO ports will blow up immediately which I deem better than silently
whacking the wrong hardware. In addition, we have a mechanism we use on powernv to
re-route accesses to that first 64k to the power8 built-in LPC bus which can
have some legacy IOs on it such as a UART or a RTC.

Cheers,
Ben.
