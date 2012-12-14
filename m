From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Support a PCI device that is compatible with 'simple-bus'
Date: Fri, 14 Dec 2012 20:26:29 +0000
Message-ID: <20121214202629.BD40C3E0BDD@localhost>
References: <20121210215119.GA32011@obsidianresearch.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121210215119.GA32011@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2012 14:51:19 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> The intended use for this feature is to let a PCI device declare
> itself a 'simple-bus' and then describe additional devices
> (such as GPIOs, I2C, etc) nested below itself.
> 
> The devices nested below the PCI device will use 'reg' addressing
> with the 5 dw format used by PCI.
> 
> This is for embedded cases where the PCI device may be a complex
> SOC with no PCI based partitioning of sub-functionality.
> 
> Tested on an ARM kirkwood system
> 
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> ---
>  drivers/of/address.c |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
> 
> Grant:
> 
> > If the soc_devices are getting triggered on that and they shouldn't be,
> > then we need a mechanism in the soc_bridge node to kick out of that
> > behavoir for its children.
> 
> Is this what you were thinking?

Not really. I see what you're trying to do, but doing it this way forces
all children of PCI nodes to use the PCI addressing space. Others have
had simple children of PCI devices and didn't use the PCI address layout
at all. Those users would break with this approach.

However, if you want to pass a unity mapping from the PCI device to the
a child of it, it should be sufficient to use an empty 'ranges;'
property in the PCI device node instead of listing out the ranges that
you want to translate.

g.
