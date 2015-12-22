From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Generic DT binding for IPIs
Date: Tue, 22 Dec 2015 15:38:28 +1100
Message-ID: <20151222043828.GU3011@voom.redhat.com>
References: <561E2BE6.2090807@imgtec.com>
 <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net>
 <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
 <56695201.2070807@imgtec.com>
 <20151211003902.GE20139@voom.fritz.box>
 <566AA9DD.6040404@imgtec.com>
 <20151214014057.GM22783@voom.fritz.box>
 <CA+mqd+6Qbp9EsvT0-A7YUBLn7TeffzqWSbM9i+ZcKVWytt9rvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z118w8IfbP8nVdqq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+mqd+6Qbp9EsvT0-A7YUBLn7TeffzqWSbM9i+ZcKVWytt9rvA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qais Yousef <qsyousef@gmail.com>
Cc: Qais Yousef <qais.yousef@imgtec.com>, Rob Herring <robh+dt@kernel.org>, "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lisa Parratt <Lisa.Parratt@imgtec.com>
List-Id: devicetree@vger.kernel.org


--z118w8IfbP8nVdqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 11:31:14AM +0000, Qais Yousef wrote:
> > > Maybe it would help to look at the new IPI reservation API?
> > >
> > >     https://lkml.org/lkml/2015/12/8/249
> >
> > Hmm.. not as much as I might have hoped.
> >
> > From the API, it looks like you're reserving IPIs to signal between
> > different CPUs all of which are in Linux.  From your description here
> > it sounds like the coproc is a separate specialized thing not running
> > Linux (or at least, not the same Linux instance as the host OS which
> > this device tree is for).
>=20
> No the CPUs aren't only Linux CPUs. It should be any CPU that the interru=
pt
> controller can talk to.
> That CPU can be one of Linux CPUs, or a coproc.

Ok.. but it looks like anything you can reserve an IPI for must be
cpu_possible_mask, so I'm guessing they're CPUs that could be CPUs,
even if they're not at the present time.  Is that right?

I guess the point is that the targets of these IPIs are participating
in the same coherency fabric as the host CPUs, yes?

> > > I'm not sure I understood you completely but no, there's no translati=
on
> > > happening. When the IPI is allocated it would be routed
> > > to the coproc. When the host wants to send a signal, it'll use the
> allocated
> > > hwirq value (indirectly via the virq) to write to a register, which w=
ill
> > > cause an interrupt to be generated at the coproc.
> >
> > Where is this magic register located?  In the host cpu?  In the
> > coproc?  In some special IPI controller?
>=20
> The IPI controller. In my use case, the IPI controller is the same as the
> interrupt controller used by Linux. Generally they don't have to be the
> same though.

Ok.  So, the one existing thing I can think of which might fit -
although it seems a bit odd - is the gpio binding.  I'm not that
familiar with the binding, so it's possible I've overlooked something
that would make it unsuitable, still..

I think you might be able to treat the IPIs bound for a coproc as
gpios to that coproc device, with the IPI controller designated as the
gpio controller.  The driver for this gpio controller would know that
it uses the IPI reservation mechanism to trigger those "gpio" lines.

This scheme would have the advatage that if you ever have a version of
the coproc that exists as a separate piece of hardware *not* belonging
to the same coherency fabric as the host cpu - and with it's inbound
interrupts instead triggered by "real" gpios - then that should, at
least in theory, be supported without host kernel changes.

> > So as noted above, I'm now sure that 'interrupts' is not the right
> > thing.  I'm trying to understand the coprocs and the ipi mechanism a
> > bit better to work out if there is something existing which would make
> > sense, or if we do need something entirely new.
>=20
> Let me know if I can help.

I don't know what sort of software is running on the coproc.  If it
also uses a device tree, then the device tree from the coproc point of
view *would* represent these inbound IPIs as 'interrupts' properties -
probably on some node representing the host cpu / system.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z118w8IfbP8nVdqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWeNPEAAoJEGw4ysog2bOSD/UP/0xbb2os9EdK7mJ4I1AzSgSE
EkwewQ7mbR+Ou1EQ/huS2WZbmGjBQbWhJcush8FWgkm3iBp8GT/I0RJPmExW7lDO
xbHwWlj3DJ+tWPIGk2T+GboyQjzSXCE3KtrUli4jGNFvoE7zD5YZUOaEQ6iLOjfr
O5ZIcUFDX3tAYv/SdPGPsiRm20zX7yUyam7Iwc6d+ueYBgm7Qyqomi51pcdbrlYU
t5eNRzkeLXW78y7B9yrvZxmfR9mQbcCXZZnWAAD+sr8zZNczc4sPlRx3Pc2APhRU
sGo5CxQPu2G+dB2zlTvy5G2SzYjBOD1trDO8QW0/hSabKIkgWVE9zjj1jn3sAknN
QOVhJvtiy/q0f6TLtAnczKQEES0/c+nMGb0Kkh7UqMvhfW5F8UPcwKgnGffj5oOV
dtXbZagq6D/Ff6g0js3C0STH3bHwZqAxLEZTDYxK8/JoIhrXVIcH7HOgXvZnY6Ts
AVJsJLNrUVq0RP5XbnHtY20CjYbN8BxcFsl7DrSCmmapvJFn8W5FCYPITjALoILW
Ojfu9OQEWp4eVRoIRliO04TrIamaP9iCfbAKasXcjaAZyooUOQ3sfhHHCMEggMrk
ObsUlDp7GmyxpDgndhyH+fl2CwBfaztIETetsOLRuSe5A+LXv6XEht81Z7PG+EG6
Pol/3F22f9pJ5NFsK/8N
=NjSs
-----END PGP SIGNATURE-----

--z118w8IfbP8nVdqq--
