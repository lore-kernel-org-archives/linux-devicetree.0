From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Wed, 11 Oct 2017 14:49:51 +1100
Message-ID: <20171011034951.GD10496@umbus.fritz.box>
References: <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
 <59DAAFD3.9070900@gmail.com>
 <20171009000053.GQ10050@umbus.fritz.box>
 <8306BF82-3141-4994-8EFE-D5D2052F9FE1@konsulko.com>
 <20171010015020.GE2668@umbus.fritz.box>
 <04D49C2F-9AB8-4007-AE30-7A80980220F0@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <04D49C2F-9AB8-4007-AE30-7A80980220F0-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 06:19:03PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Oct 10, 2017, at 04:50 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Mon, Oct 09, 2017 at 06:07:28PM +0300, Pantelis Antoniou wrote:
> >> Hi David,
> >>=20
> >>> On Oct 9, 2017, at 03:00 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >>>=20
> >>> On Sun, Oct 08, 2017 at 04:08:03PM -0700, Frank Rowand wrote:
> >>>> On 10/07/17 03:23, Pantelis Antoniou wrote:
> >>>>> Hi Rob,
> >>>>>=20
> >>>>>> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> >>>>>>=20
> >>>>>> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
> >>>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >>>>>>> Hi Rob,
> >>>>=20
> >>>> < snip >
> >>>>=20
> >>>>>>> eBPF is portable, can be serialized after compiling in the schema=
 file
> >>>>>>> and can be executed in the kernel.
> >>>>>>=20
> >>>>>> Executing in the kernel is a non-goal for me.
> >>>>=20
> >>>> Executing in the kernel is an anti-goal for me.
> >>>>=20
> >>>> We are trying to reduce the device tree footprint inside the kernel,
> >>>> not increase it.
> >>>>=20
> >>>> 99.99% of the validation should be possible statically, in the compi=
le
> >>>> phase.
> >>>>=20
> >>>>=20
> >>>>>>> By stripping out all documentation related properties and nodes k=
eeping
> >>>>>>> only the compiled filters you can generate a dtb blob that passed=
 to
> >>>>>>> kernel can be used for verification of all runtime changes in the
> >>>>>>> kernel's live tree. eBPF is enforcing an execution model that is =
'safe'
> >>>>>>> so we can be sure that no foul play is possible.
> >>>>=20
> >>>> Run time changes can be assumed correct (short of bugs in the overlay
> >>>> application code), if the base tree is validated, the overlay is val=
idated,
> >>>> and the interface between the live tree and the overlay is a
> >>>> connector.
> >>>=20
> >>> In addition, no amount of schema validation can really protect the
> >>> kernel from a bad DT.  Even if the schemas can 100% verify that the DT
> >>> is "syntactically" correct, which is ambitious, it can't protect
> >>> against a DT which is in the right form, but contains information that
> >>> is simply wrong for the hardware in question.  That can stuff the
> >>> kernel at least as easily as an incorrectly formatted DT.
> >>>=20
> >>=20
> >> I disagree.
> >>=20
> >> There are multiple levels of validation. For now we=E2=80=99re only ta=
lking about
> >> binding validation. There can be SoC level validation, board level val=
idation,
> >> revision level validation and finally application specific validation.
> >>=20
> >> Binding validation is making sure properties/nodes follow the binding =
document.
> >> For instance that for a foo device there=E2=80=99s a mandatory interru=
pt property.
> >>=20
> >> Simplified
> >>=20
> >> interrupt =3D <X>;
> >>=20
> >> Binding validation would =E2=80=98catch=E2=80=99 errors like assigning=
 a string or not having the
> >> interrupt property available.
> >>=20
> >> SoC level validation would list the available interrupt number that a =
given
> >> SoC would support for that device.
> >>=20
> >> For example that interrupt can only take the values 10 or 99 in a give=
n SoC.
> >>=20
> >> Board level validation would narrow this down even further to a value =
of 10 for
> >> a given board model.
> >=20
> >> Similar revision level validation would place further restriction on t=
he allowed
> >> configuration.
> >>=20
> >> Finally application specific validation could place restriction based =
on the intended
> >> application that piece of hardware is used for. For instance devices t=
hat should not
> >> exceed a given power budget would have restrictions on the clock frequ=
ency of the processor
> >> or bus frequencies etc.
> >=20
> > This doesn't help.  In order to do this, the validator would need
> > information that's essentially equivalent to the content of DT, at
> > which point there's no point to the DT at all - and you're left with
> > the problem of validating the information that the validator has.
>=20
> That would be the case if hardware IP only has a single way to be configu=
red.

Right, and if if there's more than one way, then the validator can't
possibly tell whether the DT has the right one.

DTs must always come from a trusted source, because if they don't,
then you don't need the DT in the first place (you could build your
own).

> The industry standard nowadays is picking reusable IP blocks and integrat=
ing them
> together in an SoC. The driver and the binding is common for every platfo=
rm that uses
> that block, but the allowed configuration varies according to what the ha=
rdware
> people uses in a given instance.

> > Fundamentally a validator that's useful *cannot* tell the difference
> > between a correct tree and one which _could_ be correct for some
> > theoretical hardware, but isn't for this particular hardware.
>=20
> That=E2=80=99s why there=E2=80=99s reason for a nested hierarchy of bindi=
ngs IMO.

Nothing about how you structure the validation can change the basic
fact that there are only two possibilities.  Either:

a) You know the hardware structure independent of the DT, in which
   case the DT is pointless

or

b) You don't know everything about the hardware without the DT, in
   which case you can't know if the DT is right for this hardware

> Completeness of validation schemes can be a differentiating factor when
> choosing parts for hardware design. They would sure cut down development =
time.
>=20
>=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlndlNwACgkQbDjKyiDZ
s5K3xxAAgZZdYdBTf9wPlZDlYFQ4/j+UBjgXKE7EenLM8CtIVBiUWaqbCq86Ckw/
Mu/fTgcpw03JT2/ufdJO26oWnvS1kbxhgfJBxP7/pRRJcw0VXvrwfTfdGMbxRogu
fgyDkSaBHrfM46SJzb8FAvHAELXrKSpOimt/BmWMFLQ1Hi/R/cf0a2pqIMs3EeNr
aB+/Ft/LK5VEHNWeyJ6EYZejYE7cxThgQ/kFsRNLgGBLzQe0IvLYt/vyz9xFnaTm
XoULFaI6Bi8mZl9zdgnWplxIdDO78UrFTIDAiXRx+iuG1+hY5Lma+A4riHl/xB2R
VHgXu/x4cyZHSF3PpYiBw/NWu9uPBjCbXB5vvnYxX9ks5YQu2/glwSVa2a0JRhdV
SUsgTjw5EAUt52irWRttRyBgnf2PRlcqk73zg7AJ/ezoVI3RTNZ2I3zbNFadey+Q
v1o/quys7x2GuZONdr5iODX03qIqts/xhmhSjRww0MzXVQcgVuVvZ33NihUKslfd
wnGpV4Q/dx+ysQ/4r44m5Sw5ph1B6LjUNcWZsN245R+eHK8vKtsajRDiQAf7uH1z
Ak5zKYbt7RG5LpoWbTBzJ7RdP7DTBSrqkaAKshABviXyIdCE+5G4pm9HNupCUW2e
/FJ//YoFS0okcdMw3NoqfH9ln9RouNQdhtXFY5x2p2+gj301m38=
=OTxx
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
