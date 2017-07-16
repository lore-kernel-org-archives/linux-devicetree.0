From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] overlay: Documentation for the overlay sugar syntax
Date: Sun, 16 Jul 2017 16:32:34 +1000
Message-ID: <20170716063234.GN17539@umbus.fritz.box>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451986-15515-2-git-send-email-pantelis.antoniou@konsulko.com>
 <594C36F9.1070405@gmail.com>
 <1498199967.5656.4.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GOzekVbrLdOLv44p"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498199967.5656.4.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GOzekVbrLdOLv44p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 09:39:27AM +0300, Pantelis Antoniou wrote:
> Hi Frank,
>=20
> On Thu, 2017-06-22 at 14:30 -0700, Frank Rowand wrote:
> > Hi David, Pantelis,
> >=20
> > On 06/14/17 07:53, Pantelis Antoniou wrote:
> > > There exists a syntactic sugar version of overlays which
> > > make them simpler to write for the trivial case of a single target.
> > >=20
> > > Document it in the device tree object internals.
> > >=20
> > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >=20
> > > diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-=
object-internal.txt
> > > index 51d68ab..624aa43 100644
> > > --- a/Documentation/dt-object-internal.txt
> > > +++ b/Documentation/dt-object-internal.txt
> > > @@ -308,3 +308,20 @@ the run time loader must apply an offset to each=
 phandle in every dynamic
> > >  DT object loaded. The __local_fixups__ node records the offset relat=
ive to the
> > >  start of every local reference within that property so that the load=
er can apply
> > >  the offset.
> > > +
> > > +There is an alternative syntax to the expanded form for overlays wit=
h phandle
> > > +targets which makes the format similar to the one using in .dtsi inc=
lude files.
> > > +
> > > +So for the &ocp target example above one can simply write:
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +&ocp {
> > > +	/* bar peripheral */
> > > +	bar {
> > > +		compatible =3D "corp,bar";
> > > +		... /* various properties and child nodes */
> > > +	}
> > > +};
> > > +
> > > +The resulting dtb object is identical.
> >=20
> >=20
> > Ignoring the fact that this file describes the device tree internals
> > instead of the device tree source format -- did we decide that we can
> > deprecate specifying nodes __symbols__,  __overlay__, __fixups__, and
> > __local_fixups__ (any node name beginning with an underscore) in
> > device tree source.  Then at a future date make node names beginning
> > with an underscore an error (maybe with a command line flag to override
> > the error?)?
> >=20
>=20
> There are a few things in mind about this. In my TODO list is a patch
> that completely deprecates the manual overlay crafting.
>=20
> My goal is to have the overlay format be source identical to a .dtsi
> file that usually is included when crafting the single dtb blob we're
> booting with. That is a format that most are familiar with.
>=20
> For that to work, we need to handle transformations of the form
> /foo -> <&/foo> -> runtime phandle insertion of <&/foo> if it doesn't
> work.
>=20
> This patch is a prerequisite, and we can take it from there.=20

The information looks useful, but this is definitely the wrong place
for it.  The file describes internals and the source format is exactly
the opposite of that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GOzekVbrLdOLv44p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllrCH8ACgkQbDjKyiDZ
s5KMsBAAlmHGy9PRRIKX+IzXA1wv3M2hwB51sOfnzwO9n+5h/Ybr7HPmCJSo7Kqz
fT8gv0P+il4ARkqko6K0p6XROtyz3peoSnZOgVhF0Uyy0uGzz776OZj5CyuWvevO
sdSVs0MLbEakQGZuZjeoXAbvOJEFK+cvp0bHU4m4c5t3DIOUdn9WodQGT+953Kjt
uxGo7BJkLGDwkzyAs4LR24y/IzSyHAB9kOdNsNA6xk8lKM79Fv16YHI/tsYydNbY
KJxPgYjP4IVHscDshCNIEMLbBWiURiBQ2ocY5aWpcoIEKdzveOsca8W2PpPtngLa
8+GXC4PhOvZa73YveDH8vdQof2t86FS9KVhTPz/lE0y/il0v7Yx8MBvMabPrfZhk
heR8ClR9H2v3Uanmrjz8dsrCU9MR4zgPIHr81YU54L6eo4pKx55eEyYv2iKaX8xH
Cixo/NpUCM3+90IrMrsHDWS+YErY5a37hvhtLlNoq6unSxoRpLAeC/DWM4NUj5Wr
j+GJzWkRvHSqNV2bJz447pDeTM8/gYjnzHHID0Pv67mKDEh4SsmEk7s6khIdVRuU
X7MR5mQVUDKin5cRq6fCbtf0BYvOLr1/zSw8Wja/1b7noYGwQtZoMfXOV9uWMnH1
cwfKFNz42zd6SEPlhUSDkbCV9yKCXKCx5RMrgX26uao4pSbrzXM=
=DlxF
-----END PGP SIGNATURE-----

--GOzekVbrLdOLv44p--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
