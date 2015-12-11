From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Fri, 11 Dec 2015 11:39:02 +1100
Message-ID: <20151211003902.GE20139@voom.fritz.box>
References: <561E2BE6.2090807@imgtec.com>
 <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net>
 <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
 <56695201.2070807@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s8uQA167RD2xhjBe"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56695201.2070807-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--s8uQA167RD2xhjBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 10:20:49AM +0000, Qais Yousef wrote:
> On 12/09/2015 04:50 PM, Rob Herring wrote:
> >On Wed, Dec 9, 2015 at 9:27 AM, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wro=
te:
> >
> >>What I have in mind is:
> >>
> >>      coproc {
> >>              ipi-parent =3D <&gic>;
> >>
> >>              ipis =3D <CPU_VALUE IPI_SPEC>;
> >>              ipi-names =3D "in";
> >>      };
> >>
> >>This will allocate an IPI to go to cpu @CPU_VALUE passing @IPI_SPEC as
> >>parameters to the controller. Which means we need a new ipi-cells to
> >>define how many cells are in ipis property. Note the new ipi-parent too.
> >These are still interrupts, so I'd prefer to use or extend the
> >interrupt binding if possible.
>=20
> The IPIs have two properties that are different from a regular interrupts:
>=20
>     1. An IPI is not only received, it could also be sent.

Any interrupt is sent by the device, received by an interrupt
controller, so this isn't really anything fundamentally different.

>     2. The IPI is dynamic. There's an actual allocation from a pool of
> available
>         IPIs happening when we ask for one to be reserved.

It's not really clear to me what that means, and why it requires any
particular different information in the device tree.

> The difference might be borderline..
>=20
> Do you have any rough idea on what a possible extension could look like?
> Reusing means writing less code, which is always better of course :)
>=20
> By the way, on MIPS GIC, we can use interrupts property to describe an IPI
> the host system will receive. But to send one to the coprocessor, we need=
 to
> define an outgoing IPI.

Ah, ok, so is what you're trying to describe here (from the host OS
and CPU point of view) a purely outgoing signal to the coproc? =20

> In this case, the firmware will be hardcoded to send an interrupt to a
> specific hwirq, so one can then describe it in DT as a regular interrupt =
to
> the host system. Hardcoding is not ideal and less portable though.

Or is the signal that goes to the coproc then somehow being translated
into a host interrupt?  If that's so you should be able to represent
the coproc as an interrupt controller or interrupt nexus.




> >>ipis property also is similar to interrupts, so using it would be easier
> >>(I think).
> >>
> >>If we have 2 coprocessors that want to communicate using IPIs that are
> >>managed by the host we use ipi-refs property to refer to IPIs defined in
> >>another node.
> >>
> >>      coproc1 {
> >>              ipis =3D <CPU1>, <CPU2>, <CPU2>;
> >Don't you need to specify a certain IPI number in addition to which
> >cpu is the target?
>=20
> No. The way IPI reserving works is we just need to specify the target
> CPU(s).
>=20
> >
> >I'm thinking the cpu target could be part of the interrupts property
> >flags field or something.
>=20
> I'll look more at this option.
>=20
> >
> >>              ipi-names =3D "in", "coproc2data", "coproc2ctrl";
> >-names should be optional in general. So define something that works
> >without them.
>=20
> If it's not specified, then the driver can get the definition by index and
> it would have to define the order it expects the IPIs in the binding?
>=20
> >>      };
> >>
> >>      coproc2 {
> >>              ipi-refs =3D <&coproc1 "in">, <&coproc1 "coproc2data">, <=
&coproc1
> >>"corpoc2ctrl">;
> >This isn't actually parseable. You need a known length of cells after a =
phandle.
> >
>=20
> To clarify, what you're saying we can't pass strings, right?

So, I'm not entirely sure what point Rob was making.  The above
certainly isn't valid dts syntax - strings can't appear within
the < > construct.  But if you make the obvious fix to:
    ipi-refs =3D <&coproc1>, "in", <&coproc1>, "coproc2data";

then it's certainly a parseable property format.  It's kind of clunky
mixing integers and strings that way, but it's possible and there are
existing bindings using properties in a similar format.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s8uQA167RD2xhjBe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWahsmAAoJEGw4ysog2bOS3zEP/1lWzw08bWB6Oej6QdejsOwD
zcyIhxosZMoaVJf2Vc9tFVtv1STaLYYgp3Mt/omjppbmEep+kKdkfPcDsG8aOLs/
7dHtVz8PjnIJ81DZGnpXY9G84HEBzeUC9BATKRhcyQIvQMThb2EeVIMVtoXPndTQ
MdFFl6xxmawfTAGtqyRPgTa1YMBlpu4WA2YZ8dWRXU0a4LAyXjomraWUbgaGwbMF
xKO9gHgFkNaVh49OU7XBnpNTBflGpzqTy6nh/N3BdT0QFOBuCgrDGpy67VtTfVyz
+INfD9EmykT4C+TWvm0xH6RasvUUeh/HLq6te0tjTzenh2zGWCNPdGOna0qOk+nO
34tV9SN9Z380SUCQPZiUpkVrLIOU9e/sOYIjltKkPgcXtzdId+/GlY48TFovIAM+
NXiMKLgU7YLlEhsDBChlGHDU74bNcIkRyb9KGjLcbTzLSJCjnFgP9ODLFcHx6YIn
6FvnkMgvJ/WHUYBauQXx7MXWqwGCHWf+2GxXbdiixf9Wyvuu73O4INVZ7rtScOuG
NK7riwUwVRr0aMQ8X41lzwNiLYuhGB6rym3ARpSEaxhapCUtAaeqh7tp54z59VFV
wulB58YQZSxAKYVvbDJ49BHWd+OaFm0Au1TFWtIlpIKkmuo+m0ApRB7OaqRISgn5
lWSWIRJmKUrcsT2hJfW4
=GlX8
-----END PGP SIGNATURE-----

--s8uQA167RD2xhjBe--
