From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] of: Add generic device tree DMA helpers
Date: Mon, 19 Mar 2012 15:45:40 +0000
Message-ID: <201203191545.40933.arnd@arndb.de>
References: <4F22DEF2.5000807@ti.com> <201203191501.10232.arnd@arndb.de> <4F674BC4.2070802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <4F674BC4.2070802@wwwdotorg.org>
Sender: linux-omap-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, rob.herring@calxeda.com, Stephen Warren <swarren@nvidia.com>, linux-omap@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 19 March 2012, Stephen Warren wrote:
> > Maybe one can use named properties in a new device node in that case,
> > like this:
> > 
> >       bus {
> >               dma: dma-controller {
> >                       #dma-cells = <1>;
> >               };
> > 
> >               device {
> >                       compatible = "device";
> >                       channel: dma-channel {
> >                               type = <0x1>;
> >                               name = "foo";
> >                               number = <23>;
> >                               direction = <3>;
> >                       };
> >                       dma-requests = <&dma &channel>;
> >               };
> >       };
> 
> For reference, this is very similar to how the pinctrl bindings work,
> except that they require the "channel" node to be a child of the DMA
> controller, and hence "dma-requests" doesn't contain <&dma &channel>,
> just <&channel>, since "dma" is the parent (or grand-parent) of "channel".

Right, but the difference beytween the pinctrl binding and what I
describe here is that the channel description would be part of the
dma engine driver specific binding, not the generic binding that
is visible to device drivers.

As I said, one dmaengine could use a phandle while another one could
just use a single number or nothing at all. If it chooses to use
a phandle (or possible a combination of phandle and number), the
binding could mandate for the device node to be either a child of the
dma controller or the device using it. In either case it would be
sensible to do it the same way for all dmaengine drivers that want
to have a phandle in the argument.

	Arnd
