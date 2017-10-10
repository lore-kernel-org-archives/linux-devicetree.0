From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Tue, 10 Oct 2017 12:50:21 +1100
Message-ID: <20171010015020.GE2668@umbus.fritz.box>
References: <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
 <59DAAFD3.9070900@gmail.com>
 <20171009000053.GQ10050@umbus.fritz.box>
 <8306BF82-3141-4994-8EFE-D5D2052F9FE1@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8306BF82-3141-4994-8EFE-D5D2052F9FE1@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 06:07:28PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Oct 9, 2017, at 03:00 , David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >=20
> > On Sun, Oct 08, 2017 at 04:08:03PM -0700, Frank Rowand wrote:
> >> On 10/07/17 03:23, Pantelis Antoniou wrote:
> >>> Hi Rob,
> >>>=20
> >>>> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2@gmail.com> wrote:
> >>>>=20
> >>>> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
> >>>> <pantelis.antoniou@konsulko.com> wrote:
> >>>>> Hi Rob,
> >>=20
> >> < snip >
> >>=20
> >>>>> eBPF is portable, can be serialized after compiling in the schema f=
ile
> >>>>> and can be executed in the kernel.
> >>>>=20
> >>>> Executing in the kernel is a non-goal for me.
> >>=20
> >> Executing in the kernel is an anti-goal for me.
> >>=20
> >> We are trying to reduce the device tree footprint inside the kernel,
> >> not increase it.
> >>=20
> >> 99.99% of the validation should be possible statically, in the compile
> >> phase.
> >>=20
> >>=20
> >>>>> By stripping out all documentation related properties and nodes kee=
ping
> >>>>> only the compiled filters you can generate a dtb blob that passed to
> >>>>> kernel can be used for verification of all runtime changes in the
> >>>>> kernel's live tree. eBPF is enforcing an execution model that is 's=
afe'
> >>>>> so we can be sure that no foul play is possible.
> >>=20
> >> Run time changes can be assumed correct (short of bugs in the overlay
> >> application code), if the base tree is validated, the overlay is valid=
ated,
> >> and the interface between the live tree and the overlay is a
> >> connector.
> >=20
> > In addition, no amount of schema validation can really protect the
> > kernel from a bad DT.  Even if the schemas can 100% verify that the DT
> > is "syntactically" correct, which is ambitious, it can't protect
> > against a DT which is in the right form, but contains information that
> > is simply wrong for the hardware in question.  That can stuff the
> > kernel at least as easily as an incorrectly formatted DT.
> >=20
>=20
> I disagree.
>=20
> There are multiple levels of validation. For now we=E2=80=99re only talki=
ng about
> binding validation. There can be SoC level validation, board level valida=
tion,
> revision level validation and finally application specific validation.
>=20
> Binding validation is making sure properties/nodes follow the binding doc=
ument.
> For instance that for a foo device there=E2=80=99s a mandatory interrupt =
property.
>=20
> Simplified
>=20
> interrupt =3D <X>;
>=20
> Binding validation would =E2=80=98catch=E2=80=99 errors like assigning a =
string or not having the
> interrupt property available.
>=20
> SoC level validation would list the available interrupt number that a giv=
en
> SoC would support for that device.
>=20
> For example that interrupt can only take the values 10 or 99 in a given S=
oC.
>=20
> Board level validation would narrow this down even further to a value of =
10 for
> a given board model.

> Similar revision level validation would place further restriction on the =
allowed
> configuration.
>=20
> Finally application specific validation could place restriction based on =
the intended
> application that piece of hardware is used for. For instance devices that=
 should not
> exceed a given power budget would have restrictions on the clock frequenc=
y of the processor
> or bus frequencies etc.

This doesn't help.  In order to do this, the validator would need
information that's essentially equivalent to the content of DT, at
which point there's no point to the DT at all - and you're left with
the problem of validating the information that the validator has.

Fundamentally a validator that's useful *cannot* tell the difference
between a correct tree and one which _could_ be correct for some
theoretical hardware, but isn't for this particular hardware.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlncJ1wACgkQbDjKyiDZ
s5JQ5xAA2+IuVgtMlcJwkzwAj6HXawQdBgESox0VuC0cbA4XtHAezloy+41c4WB+
9RU+TO3RXtuqWAhFxaS0C0752N8+f3pIHeWEIGMoT2OTS3KLEVu1GFpX/kplofLs
b3vEqOZXyATzD6utAxPNoBDseIMPOD3UI0qHHT0llpjyg76jQWdO5l/bLXE/7P82
PAQYWCUHO2qP9LPF0xxjyTFi+VCgIY+wPk+MTJu31llvCjHoSXA5pdZ7BB+btaah
JfCK1v28qneH/L1A5Nd9h1ZaFiHPfOf+c8oQNTl+kjhMRCyE5Rt4GrA6fCM74jWo
2iah0mefOQwj71q7aig56/U99/3IuQfIW8JILc/emzTV5SQdmJ6jO5WsHnu/gO3P
KL810R2GSg4W2QjpLzL1wbDwaBTr67WquJrOr4kVX3FnHNu9preRvA5R+7k4h1Il
SzbDiLcpPB1ApJAYvwvSICSq5dwXdDJYYRY999GSZVwsMRmCOfEJ4npcCfOG2oFO
KxlV67c2hNvjYUDM0pLoyzmsg2iD04K6/96FoiUYwcCtOk6h4M9vE6KC+2xy8nUU
Ely3xpRTBODiNOFZerhoHRQVwbkbn/JKIKVfcse3RUalWcmvDdYC+XflcOnI884m
req7W8+1P0wk6ibakfQJlsZwLyw1fBuljjz7O5nV1ZttXrVpeyA=
=EKJR
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--
