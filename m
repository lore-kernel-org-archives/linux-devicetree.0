From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv7 08/17] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Mon, 8 Apr 2013 23:34:12 +0200
Message-ID: <201304082334.13186.arnd@arndb.de>
References: <1364395234-11195-1-git-send-email-thomas.petazzoni@free-electrons.com> <CAErSpo7fGPe3wFha36kNMxeRP4gBpBWgfw85aTLey-DSz2ZYew@mail.gmail.com> <20130408225741.74fc383c@skate>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20130408225741.74fc383c@skate>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 April 2013, Thomas Petazzoni wrote:
> > > +                       pcie->io.name = "I/O";
> > > +                       pcie->realio.start = PCIBIOS_MIN_IO;
> > > +                       pcie->realio.end =
> > > min(resource_size(&pcie->io),
> > > +                                              IO_SPACE_LIMIT);
> > 
> > Using "resource_size(&pcie->io)" here seems strange -- are you
> > assuming that pcie->io starts at address zero?
> 
> No, I'm assuming PCIBIOS_MIN_IO is always 0. So presumarly, this should
> be something like:
> 
>         pcie->realio.end = min(PCIBIOS_MIN_IO +
>                                 resource_size(&pcie->io),
>                                 IO_SPACE_LIMIT);
> 

Normally PCIBIOS_MIN_IO is 0x1000, since the first 4096 ports are reserved
for ISA and PCMCIA compatible drivers and should not be assigned to
PCI devices. So the first port should get ports 0x1000 to 0xffff, later
ones can used the entire 65536 ports e.g. 0x10000 to 0x1ffff.

	Arnd
