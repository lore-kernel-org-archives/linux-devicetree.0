From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree bindings
Date: Thu, 25 Sep 2014 21:26:38 +0200
Message-ID: <201409252126.38945.arnd@arndb.de>
References: <1411573068-12952-1-git-send-email-rric@kernel.org> <8057985.kyfsioKAVy@wuerfel> <CAErSpo4oFLKbtddzVoXBN-1dXZn5C4pmzY_QiFMwV+RWtmtjiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo4oFLKbtddzVoXBN-1dXZn5C4pmzY_QiFMwV+RWtmtjiQ@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sunil Kovvuri <sunil.kovvuri@gmail.com>, LAKML <linux-arm-kernel@lists.infradead.org>, Robert Richter <rric@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Sunil Goutham <sgoutham@cavium.com>
List-Id: devicetree@vger.kernel.org

On Thursday 25 September 2014, Bjorn Helgaas wrote:
> On Thu, Sep 25, 2014 at 1:31 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thursday 25 September 2014 00:37:00 Sunil Kovvuri wrote:
> >> On Thu, Sep 25, 2014 at 12:04 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> > On Wednesday 24 September 2014 23:34:04 Sunil Kovvuri wrote:
> 
> >> >> All on-board PCI devices connected to this PCI controller have fixed resources
> >> >> and doesn't have to be allocated/reassigned. Some of these devices are
> >> >> SRIOV based.
> >> >
> >> > I think you need to mark the ones that are nonrelocatable with flag
> >> > 0x80000000, otherwise the PCI core might decide to reassign them.
> >>
> >> Is this flag part of DT pci node properties ?
> >> I am using IORESOURCE_PCI_FIXED flag. Its there in other patches of
> >> the same series.
> >
> > Ah, right. I checked the source code again and it seems that we don't handle
> > this right at the moment. I think a range that has the nonrelocatable
> > flag set should be used for IORESOURCE_PCI_FIXED mappings without any
> > host specific code, but that needs to be implemented in common code.
> 
> What connection do you envision between nonrelocatable ranges and
> IORESOURCE_PCI_FIXED?  I don't know what a nonrelocatable range is,
> but for IORESOURCE_PCI_FIXED, all I intend is that the PCI core should
> not try to assign a different address, e.g., because the BAR is
> read-only or because it's a legacy IDE/VGA/etc. range for which there
> is no BAR at all.

I think that is exactly the definition of the nonrelocatable flag
in http://www.openfirmware.org/1275/bindings/pci/pci2_1.pdf

The example given in section 11.1.2 is for a VGA device that has some
relocatable BARs and some nonrelocatable BARs.

	Arnd
