From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH] of: When constructing the bus id consider
 assigned-addresses as well
Date: Mon, 26 Nov 2012 11:20:54 -0700
Message-ID: <20121126182054.GA30177@obsidianresearch.com>
References: <20121121210240.GC15285@obsidianresearch.com>
 <20121126140316.99FE23E194B@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121126140316.99FE23E194B@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2012 at 02:03:16PM +0000, Grant Likely wrote:
> On Wed, 21 Nov 2012 14:02:40 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> > 'assigned-addresses' is used for certain PCI device type nodes in
> > lieu of 'reg',  since this is enforced by of/address.c, have
> > of_device_make_bus_id look there as well.
> > 
> > Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> 
> If it is a PCI device, then of_device_make_bus_id() shouldn't come into
> play. PCI devices already have their own naming scheme. Only
> platform_bus device creation uses of_device_make_bus_id(). What am I
> missing?

In my embedded case I have a complex PCI-E connected SOC device.

This is modeled in OF by having a PCI-E bus, a PCI-E device node, and
then all of the SOC devices (I2C, GPIO, drivers, etc) placed under the
PCI-E device node.

The PCI driver that matches the device just turns it on and calls
of_platform_populate(..) with its own node as an argument.

So of_device_make_bus_id isn't called on a PCI-E device node, it is
called on the platform_device children of that node, and due to the
way the other code works, and what the OF rules seem to be, those
childen all use assigned-addresses. Without this patch the code just
assigns monotonic ids to those nodes.

Jason
