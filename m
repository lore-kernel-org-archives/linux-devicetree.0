From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 15:17:43 +0100
Message-ID: <20090528141743.GA16199@trinity.fluff.org>
References: <1243408083.13460.14.camel@debian-nb> <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com> <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com> <20090527150527.GK6805@pengutronix.de> <87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com> <20090527175609.GB31861@flint.arm.linux.org.uk> <4A1D8FBA.6040802@freescale.com> <9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763111AbZE1OSU@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Smirl <jonsmirl@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>, Russell King <rmk+lkml@arm.linux.org.uk>, Peter Korsgaard <jacmet@sunsite.dk>, Robert Schwebel <r.schwebel@pengutronix.de>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, Janboe Ye <yuan-bo.ye@motorola.com>, Timur Tabi <timur@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 03:13:55PM -0400, Jon Smirl wrote:
> On Wed, May 27, 2009 at 3:08 PM, Scott Wood <scottwood@freescale.com>=
 wrote:
> > I'm not talking about platform specific code, I'm talking about cod=
e to
> > retrieve information about a device from the device tree. =A0There =
would not
> > be separate instances of this for "platforms X, Y and Z", just one
> > of_platform binding in each driver. =A0It's no different than havin=
g a
> > platform bus binding, except in the data structures used.
> >
> > But to restate, having external glue to create platform devices fro=
m the
> > device tree is fine if that's what you want to do. =A0We used to do=
 that, but
> > it was a pain compared to keeping everything in one place. =A0Your =
experience
> > may differ.
>=20
> Could 'struct platform_device' and 'struct of_platform_device" be
> unified into a single structure? It's personal preference whether the
> internal representation of the hardware is done via a device tree or
> snippets of platform code, but do we need to have to different device
> types?

I was wondering what the pros/cons of having a system that takes a
device tree and manufactures platform devices / etc from it? I think
one of the cons is that if you change the platform device data, then
you have not only the board definitions to change, but the of->platform
code to modify as well...

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
