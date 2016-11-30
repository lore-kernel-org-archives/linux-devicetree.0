From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Wed, 30 Nov 2016 12:49:37 +1100
Message-ID: <20161130014937.GF19891@umbus>
References: <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
 <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com>
 <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org>
 <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com>
 <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ba8e2ed3-9798-3074-1167-3f6851321a25-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 12:11:15PM +0000, Phil Elwell wrote:
> Pantelis,
>=20
> On 29/11/2016 10:55, Pantelis Antoniou wrote:
> > Manually adding symbols by targeting __symbols__ is just bad. There is =
absolutely
> > no guarantee that the symbol/fixup node(s) will still be there in follo=
wing iterations
> > of the patches.
> Remember that this is now part of the Linux kernel - it isn't something
> you can just change at will.
> > I am thinking of parsing them, recording the information in kernel stru=
ctures and then
> > deleting them altogether.
> >
> >> How does your patch handle duplicate symbols?
> >>
> > It doesn=E2=80=99t. Having duplicate global symbols is bad.=20
> >
> > It appears you want scoping rules instead. Care to paste a concrete exa=
mple?
>=20
> Concrete non-trivial examples are hard to come by. There are some simple
> cases where we've attached labels to __overlay__ nodes so that the
> contents can be patched by our overlay parameter mechanism - they could
> just be given unique names instead of just "frag0", "frag1" etc. I'm
> more concerned about parameterised macro-expanded overlays.
>=20
> Consider an overlay that defines a CAN controller on an SPI bus. We
> currently have two such overlays in the RPi tree, one for SPI 0.0 and
> one for SPI 0.1. Here's an extract from one of them:
>=20
>     /* the interrupt pin of the can-controller */
>     fragment@2 {
>         target =3D <&gpio>;
>         __overlay__ {
>             can0_pins: can0_pins {
>                 brcm,pins =3D <25>;
>                 brcm,function =3D <0>; /* input */
>             };
>         };
>     };
> ...
>     fragment@4 {
>         target =3D <&spi0>;
>         __overlay__ {
>             /* needed to avoid dtc warning */
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>             can0: mcp2515@0 {
>                 reg =3D <0>;
>                 compatible =3D "microchip,mcp2515";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&can0_pins>;
>                 spi-max-frequency =3D <10000000>;
>                 interrupt-parent =3D <&gpio>;
>                 interrupts =3D <25 0x2>;
>                 clocks =3D <&can0_osc>;
>             };
>         };
>     };
>=20
> One day I'd like to merge these into a single parameterised version that
> could target any CS line on any SPI controller. This requires that any
> created node names are unique with the scope of the parent ("mcp2515@0",
> "can0_pins"), and that the name of the target label (spi0) is patched to
> select the correct SPI bus. Our existing, limited overlay parameter
> mechanism uses labels to identify properties to patch:

Yeah, I think this is basically out of scope for the simple overlay
format.  It's really not designed to do this - it works directly with
the global namespace everywhere.

The connector proposals are designed to address this sort of case.

This sort of limitation is, incidentally, why I objected to the dtb
overlay stuff when it was originally proposed (I would have preferred
something closer to the connector proposals which are now floating
again).  That in turn is why it's taken so long to get on its way into
mainline dtc.  But despite the limitations, people wanted it badly
enough that it's become widely used, so now we have to cope with it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPjAxAAoJEGw4ysog2bOSLnUP/3MLn/MS86K2/x80kfELhzUR
q1XvdmMdZapurcEvV9E3QR+oU315jVp57jKG4Bk3vvKc8OBHI432raJQwkuyuYFE
xMa+lWgJxQYO7dfDPQfERo0t9Bf8t9tHdBJqolHw7xPkIsHYGn9GZotcL+Jsj3XZ
y2u5QtulLpCwIGzjvvJXgXqAdYhqlwQR3xYWmGSGdu27rDlv3nB0OBDKSw5OWCOx
IZDJe1eCJObhZckSImqrS+k8MeoZbA7nlQIcr1Hlo+kAHu48tbF20LvB6K/BkAmg
rID08rZ4i/uqhfUDdycVG0E2neBN/0ubKvTwkEivumuGxrgro+kkjcECifFOjRl+
fuaUwfjvnEvl0BhCFMn9ebqAx0Qyxo5iti3yGb9BNWSAVQz3y0ZK3Y90XZD3mk+2
wmKyo3Ce63PjIZgQIT3alaB3ZI98sSdLWyVd0V2p1qiCWNWhMUfKMMAS/XuFpkZO
GK+k4gtPbBRVQgZMHuQagrHkLen0kFipcTY2aeDO2jK8AnKPOdXTDhdXiQaXIlVr
iiYsON/oTpb/hVqw7wA6ULCvgszm7OJ95rCFUT6SHy3/CwbG5jfaEZg+1djH38DR
pgsC+5iJOQs43Dbdb8dOCgZPC/i8m0ViJruukQ91QHdg1JpgnmJ6vrubve1FEu1K
OxobJ1dtZFIZl1uJHUyg
=2r3J
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
