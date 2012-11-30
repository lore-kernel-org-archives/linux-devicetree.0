From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: When constructing the bus id consider assigned-addresses as well
Date: Fri, 30 Nov 2012 09:48:05 +0000
Message-ID: <20121130094806.0D6D73E070C@localhost>
References: <20121121210240.GC15285@obsidianresearch.com> <20121126140316.99FE23E194B@localhost> <20121126182054.GA30177@obsidianresearch.com> <20121129162648.80DBC3E0912@localhost> <20121129193829.GA10145@obsidianresearch.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121129193829.GA10145@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, 29 Nov 2012 12:38:29 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> On Thu, Nov 29, 2012 at 04:26:48PM +0000, Grant Likely wrote:
> 
> > Hmmm. okay that makes sense, but something still isn't quite right. So
> > of_translate_address should take care of drilling down through the bus
> > layers, and when it gets to the PCI node it /should/ use
> > of_bus_pci_translate to handle traversing down to the parent node (which
> > uses the 'assigned-addresses' for the pci node.
> 
> The address translation machinery requires PCI format addresses (ie
> address-cells=3) for all nodes below a PCI bus. Part of this
> requirement is that 'assigned-addresses' is used for resources, *not*
> 'reg'.
> 
> If you attempt to stick a 'reg' in a block nested below a
> 'device_type="pci"' the kernel throws lots of error messsages and
> generates bad address mappings.

Have you added the appropriate #address-cells and #size-cells to the pci
device node to go back to a non-pci addressing mode? assigned-addresses
only makes sense in the pci-device node itself. reg should work for all
nodes below that, and if it doesn't then it is a bug that we need to
fix.

g.
