From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 13:44:54 +1000
Message-ID: <20090528034454.GG1464@yookeroo.seuss>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<20090527174440.GA31861@flint.arm.linux.org.uk>
	<fa686aa40905271052k3f55eb73k2cb0c3cff3c94d7b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40905271052k3f55eb73k2cb0c3cff3c94d7b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 11:52:50AM -0600, Grant Likely wrote:
> On Wed, May 27, 2009 at 11:44 AM, Russell King
> <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > (For whatever reason, I don't have the initial email on this.)
> >
> > On Wed, May 27, 2009 at 08:27:10AM -0600, Grant Likely wrote:
> >> On Wed, May 27, 2009 at 1:08 AM, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org> w=
rote:
> >> > Hi, All
> >> >
> >> > Currently, ARM linux uses mach-type to figure out platform. But mach=
-type could not handle variants well and it doesn't tell the kernel about i=
nfo about attached peripherals.
> >> >
> >> > The device-tree used by powerpc and sparc could simplifiy board port=
s, less platform specific code and simplify device driver code.
> >> >
> >> > Please reference to Grant Likely and Josh Boyer's paper, A Symphony =
of Flavours: Using the device tree to describe embedded hardware , for the =
detail of device tree.
> >> >
> >> > www.kernel.org/doc/ols/2008/ols2008v2-pages-27-38.pdf
> >> >
> >> > Signed-off-by: janboe <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>
> >>
> >> Heeheehe, This is Fantastic. =A0I'm actually working on this too. =A0W=
ould
> >> you like to join our efforts?
> >
> > My position is that I don't like this approach. =A0We have _enough_ of a
> > problem getting boot loaders to do stuff they should be doing on ARM
> > platforms, that handing them the ability to define a whole device tree
> > is just insanely stupid.
> =

> The point of this approach is that the device tree is *not* create by
> firmware.  Firmware can pass it in if it is convenient to do so, (ie;
> the device tree blob stored in flash as a separate image) but it
> doesn't have to be and it is not 'owned' by firmware.
> =

> It is also true that there is the option for firmware to manipulate
> the .dts, but once again it is not required and it does not replace
> the existing ATAGs.
> =

> If a board port does get the device tree wrong; no big deal, we just
> fix it and ship it with the next kernel.

Indeed one of the explicit goals we had in mind in building the
flattened device tree system is that the kernel proper can rely on
having a usable device tree, without requiring that the bootloader /
firmware get all that right.

Firmware can supply a device tre, and if that's sufficiently good to
be usable, that's fine.  But alternatively our bootwrapper can use
whatever scraps of information the bootloader does provide to either
pick the right device tree for the platform, tweak it as necessary for
information the bootloader does supply correctly (memory and/or flash
sizes are common examples), or even build a full device tree from
information the firmware supplies in some other form (rare, but
occasionally usefule, e.g. PReP).

We explicitly had the ARM machine number approach in mind as one of
many cases that the devtree mechanism can degenerate to: the
bootwrapper just picks the right canned device tree based on the
machine number.  If the bootloader gets the machine number wrong, but
supplies a few other hints that let us work out what the right machine
is, we have logic to pick the device tree based on that.  Yes, still a
hack, but at least it's well isolated.

If the firmware does provide a device tree, but it's crap, code to
patch it up to something usable (which could be anything from applying
a couple of tweaks, up to replacing it wholesale with a canned tree
based on one or two properties in the original which let you identify
the machine) is again well isolated.

> > The end story is that as far as machine developers are concerned, a
> > boot loader, once programmed into the device, is immutable. =A0They nev=
er
> > _ever_ want to change it, period.

You're over focusing - as too many people do - on the firmware/kernel
communication aspects of the devtree.  Yes, the devtree does open some
interesting possibilities in that area, but as you say, firmware can
never be trusted so the devtree doesn't really bring anything new
(better or worse) here.

What it does bring is a *far* more useful and expressive way of
representing consolidated device information in the kernel than simple
tables.  And with the device tree compiler, it also becomes much more
convenient to prepare this information than building C tables.  I
encourage you to have a look at the sample device trees in
arch/powerpc/boot/dts and at the device tree compiler code (either in
scripts/dtc where it's just been moved, or from the upstream source at
git://git.jdl.com/software/dtc.git).

I have to agree with DaveM - a lot of people's objections to the
devtree stem from not actually understanding what it does and how it
works.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
