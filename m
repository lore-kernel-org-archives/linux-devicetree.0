From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Support a PCI device that is compatible with 'simple-bus'
Date: Mon, 04 Mar 2013 10:55:36 +0800
Message-ID: <20130304025536.4CC7E3E17F8@localhost>
References: <20121210215119.GA32011@obsidianresearch.com> <20121214202629.BD40C3E0BDD@localhost> <20121214215814.GA14149@obsidianresearch.com> <20121219125451.3F1FB3E0AD7@localhost> <20121219191800.GA1169@obsidianresearch.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121219191800.GA1169@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Dec 2012 12:18:00 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> On Wed, Dec 19, 2012 at 12:54:51PM +0000, Grant Likely wrote:
> > In both cases, the type of transfer is encoded by the BAR address and
> > does not get exposed to the child device. Exposing the PCI flags into
> > the child bus(es) really isn't a very good idea because they don't make
> > sense in that context. It may seem expedient, but it will be fragile.
> 
> Well, it makes as much sense as for a PCI driver - each of the three
> transfer types has different coding requirements in the driver, so
> each of the three type must be kept separate.
> 
> I haven't looked super closely at this, but the basic desire is to
> have IORESOURCE_PREFETCH tagged on the struct resource that reaches
> the platform driver. 'get_flags' for a non-PCI addresses scheme always
> returns IORESOURCE_MEM, and translating through a ranges doesn't
> appear to fix that. This is where 3dw is desirable because it uses a
> get_flags that understands the three resource types.

We could possibly change the ranges translation code to pick up
IORESOURCE_PREFETCH when a translation crosses a PREFETCH bar. That
would also ensure that child nodes don't have to keep the flags field
consistent with the ranges mapping.

g.
