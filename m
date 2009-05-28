From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 12:52:58 +1000
Message-ID: <20090528025258.GB1464@yookeroo.seuss>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090527192116.GA31110-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 08:21:16PM +0100, Russell King - ARM Linux wrote:
> On Wed, May 27, 2009 at 03:13:55PM -0400, Jon Smirl wrote:
> > On Wed, May 27, 2009 at 3:08 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> w=
rote:
> > > I'm not talking about platform specific code, I'm talking about code =
to
> > > retrieve information about a device from the device tree. =A0There wo=
uld not
> > > be separate instances of this for "platforms X, Y and Z", just one
> > > of_platform binding in each driver. =A0It's no different than having a
> > > platform bus binding, except in the data structures used.
> > >
> > > But to restate, having external glue to create platform devices from =
the
> > > device tree is fine if that's what you want to do. =A0We used to do t=
hat, but
> > > it was a pain compared to keeping everything in one place. =A0Your ex=
perience
> > > may differ.
> > =

> > Could 'struct platform_device' and 'struct of_platform_device" be
> > unified into a single structure? It's personal preference whether the
> > internal representation of the hardware is done via a device tree or
> > snippets of platform code, but do we need to have to different device
> > types?
> =

> That's a damned good question - platform devices have been around since
> the dawn of the device model, so the real question which needs to be
> asked is: what was the reason that of_platform_device created rather
> than unifying it with the already provided platform_device ?
> =

> BTW, I can find no such struct "of_platform_device" in include/linux.
> Is it specific to each and every OF implementation?

They should be unified.  I believe the problem was at the time
of_platform devices came into existence there was no arch-specific
field in the device structure that could be used to hold a reference
to the devtree node.

Since then, the fiddliness of doing the conversion has always just
outweighed the impetus to do so.  The of_platform bus model is
conceptually completely broken, but in practice only slightly broken
for all common cases.

I've been meaning at several times to replace the of_platform bus
infrastructure with a system to traverse the OF tree and construct
platform devices (or other un-probeable bus devices, e.g. i2c) based
on a table of constructor functions.  It's just always been edged out
by other work.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
