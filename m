From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Tue, 13 Sep 2011 08:43:56 +0200
Message-ID: <6360771.ouEC5EKNMR@wuerfel>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com> <20110912201102.GF23345@ponder.secretlab.ca> <1315869636.11280.26.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1315869636.11280.26.camel@deneb.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Mark Salter <msalter@redhat.com>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 12 September 2011 19:20:35 Mark Salter wrote:
> On Mon, 2011-09-12 at 14:11 -0600, Grant Likely wrote:
> > On Wed, Aug 31, 2011 at 05:26:41PM -0400, Mark Salter wrote:
> > > +           interrupt-controller;
> > > +           #interrupt-cells = <1>;
> > > +           compatible = "ti,c64x+core-pic";
> > 
> > The interrupt controller isn't addressable?  Is it integrated into
> > the CPU?
> 
> Yes, that core controller is controlled through registers accessed
> with special-purpose instructions, not MMIO. Other controllers, like
> megamodule and some as-yet unimplemented use MMIO.

Are these instructions specific to the interrupt controller or
do they access a register space that can contain arbitrary
devices?

If there is a separate address space for special devices, it might
be good to describe that in the device tree, like we do for PCI
I/O space.

	Arnd
