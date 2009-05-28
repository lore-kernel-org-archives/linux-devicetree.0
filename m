From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 20:11:33 +1000
Message-ID: <1243505493.5573.29.camel@pasglop>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528.025739.16559619.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2009-05-28 at 02:57 -0700, David Miller wrote:
> From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Date: Thu, 28 May 2009 10:15:13 +0100
> 
> > For example, how would an IrDA transceiver be expressed in OF?
> 
> As a child device node of the IRDA device, with associated
> properties.
> 
> You can express _ANYTHING_ using the OF device tree.  It is
> not even something to discuss, it's flexible enough.

Well, that example is interesting because you may not want the
transceiver to be a child of the UART :-) The tree hierachy is mostly
about addressing, and addressing below a UART doesn't mean much.

So if the transceiver has a bunch of MMIO registers, it might be better
off located elsewhere, and have the UART have a "fir-transceiver"
property with a phandle to the actual device...

But yes, I definitely agree, it's flexible enough for a lot of that
stuff. Where things get tricky is to express "methods" rather than just
relationships. This is where x86 loses big time with ACPI, Apple lost
with their platform functions in OF properties, and appart from having a
real OF implementation under the hood that is kept alive along with the
kernel to call in, the tree doesn't provide a simple solution.

However, it doesn't either invalidate existing solutions based on
function pointers into the platform code... it might even make it nicer
by naming those functions into some kind of directory where they can be
registered by the platform code and "named" by a property in the node,
though I tend to prefer the approach of having a property with a phandle
to a node that is a pseudo-device ("power-control") or so, which has its
own driver providing the methods.

The possibilities are endless. _BUT_ it does require some careful
thinking to get things right. To that extent, I do agree with Russell
that rather than a "violent" conversion, ARM should first try things out
as an opt-in for a few platforms and see how it goes.

Cheers,
Ben.
