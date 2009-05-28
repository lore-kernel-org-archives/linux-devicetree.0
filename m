From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 11:37:46 +0100
Message-ID: <20090528103745.GA19523@sirena.org.uk>
References: <20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com>
	<20090528000707.GR6805@pengutronix.de>
	<20090527.171525.204909140.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090527.171525.204909140.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 05:15:25PM -0700, David Miller wrote:
> From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> > It works badly for corner cases, and embedded land is full
> > of it. The effort to get the oftree stuff right is often more than a
> > magnitude of order higher than the effort for the actual functionality.
> > That should be an alarm sign that something is wrong.

> And here you speak about the negatives purely in generalities that
> cannot be discussed concretely.

> And, sadly, I think this is on purpose.

A concrete example that was mentioned elsewhere in the thread is audio
subsystems.  The audio subsystem for an embedded system will contain
multiple chips - a mobile phone could have the CPU, an audio CODEC,
bluetooth and GSM for example.  These will be interconnected by a
combination of analogue and digital links.  The digital links consist of
six wires (data, sync clock and bit clock for each of transmit and
recieve), some of which may be tied together in hardware.  Some of these
links may be shared either with switches or using TDM.  The devices will
also have master clocks from various sources and will often have PLLs or
FLLs able to generate clocks if the inputs aren't directly usable.  Each
clock domain within the audio subsystem will need some level of
synchronisation of the clocks and there may be multiple clock domains
within the system.

In principle we could describe the links between the devices, provide
some additional use case based constraints then take this information
and figure out a suitable runtime configuration automatically; this is
probably the only viable OS neutral way of doing things.  In practice
we're nowhere near having a clock framework which is able to support
implementing this.

The current approach is to write custom code that knows a suitable way
to set things up in a given system (which is a much more tractable
problem).  The PowerPC people have mostly accepted using this approach
but they're really not happy with it and it's been difficult to get the
general community understanding that it's hard to cope with this in the
device tree.
