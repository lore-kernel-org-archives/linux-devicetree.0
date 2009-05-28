From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 18:10:58 +1000
Message-ID: <1243498258.3171.166.camel@pasglop>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527192909.GA32398-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2009-05-27 at 20:29 +0100, Russell King wrote:
> 
> 
> Bus width?  Register offset spacing?  SMC LED configuration?  Whether
> to use the hardware wait signal from the SMC?

Yes. Anything. Basically just a bunch of named properties with
arbitrary content in the nodes for the various devices.
  
> If you're going to say yes to all that, I'm going to start asking how
> you cope with verifying that the data for ethernet driver A doesn't
> get accidentally used for ethernet driver B.

I'm not sure about the question. If it's about identifying which
instance of a device is using the data, it's basically easy since
you used that device-node to create the device in the kernel in
the first place, so you just stick that node pointer into the
achdata as we do on powerpc and can use it to retrieve all the
properties.

If you are talking about different drivers for the same device,
well we try to define bindings such that they describe the hardware
itself in a way that is reasonably agnostic to whatever driver will be
used... 

> I assume you have some kind of compiler, which needs a set of
> specification files to tell it what's required for each driver which
> is OF compatible. If not, I can see no way for OF trees to ever be
> safe and correct.

No, the format at boot time is a flattened tree of nodes with arbitrary
named nodes containing other nodes and named properties (names are
ASCII) and properties have arbitrary binary content.

_Bindings_ define what to put in these things for various bus and device
types, and we do have a compiler, dtc, that goes from a C-like textual
representation and generates the blob.

It makes it easy to create properties that contains strings, numbers,
phandles (references to other nodes), etc...

Cheers,
Ben.
