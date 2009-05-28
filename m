From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 22:48:17 +1000
Message-ID: <20090528124817.GB4565@yookeroo.seuss>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
	<gvlvcs$ub5$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <gvlvcs$ub5$1@ger.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 12:17:32PM +0000, Dmitry Eremin-Solenikov wrote:
> David Miller wrote:
> 
> > From: Russell King - ARM Linux
> > <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> Date: Thu, 28 May 2009
> > 10:15:13 +0100
> > 
> >> For example, how would an IrDA transceiver be expressed in OF?
> > 
> > As a child device node of the IRDA device, with associated properties.
> > 
> > You can express _ANYTHING_ using the OF device tree.  It is not even
> > something to discuss, it's flexible enough.
> 
> Hmmm. How to express the following situation:
> On one of my platforms (sharp tosa) the backlight controller
> is separated into two parts: one sitting on SPI, one on the I2C.
> The tricky part is that the I2C part is only available when some
> of registers of SPI part are programmed in a specific way.

Put nodes under both the SPI and I2C busses, they have properties with
phandles to refer to each other (could be one way or both depending on
needs).  Sprinkle with any additional information properties as
necessary.  Your driver (in the broad sense, rather than the "struct
device_driver" sense) binds both devices and does what it needs to do.

The I2C part should possibly have a status property with value
"disabled" to indicate that it's not usable, until something activates
it (in this case the other part of the driver frobbing the SPI side).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
