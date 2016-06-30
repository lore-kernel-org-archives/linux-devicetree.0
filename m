From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 30 Jun 2016 15:17:37 +1000
Message-ID: <20160630051737.GS8885@voom.fritz.box>
References: <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com>
 <20160526071243.GI17226@voom.fritz.box>
 <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com>
 <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA@mail.gmail.com>
 <57472A9A.1060903@gmail.com>
 <EAD64177-3519-4CD2-AFB6-5EB765CC7459@konsulko.com>
 <57476B27.9070008@gmail.com>
 <26CE3FC4-2B09-45E9-94E2-9EA7836A684F@konsulko.com>
 <20160530042210.GD17226@voom.fritz.box>
 <57748B01.4050601@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zn93sY2JrH9m7VZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57748B01.4050601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6zn93sY2JrH9m7VZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 07:59:13PM -0700, Frank Rowand wrote:
> Hi Pantelis,
>=20
> On 05/29/16 21:22, David Gibson wrote:
>=20
> < massive snip >
>=20
> >>> What other properties are you envisioning?  (Looking for the architec=
tural
> >>> vision that you have.)
> >>>
> >>
> >> Oh, there are a lot of properties that can be provided.
> >>
> >> For instance you can declare manufacturing info (like part numbers, ve=
rsion numbers,
> >> serial numbers that can be used for quirking). You can declare things =
like load order
> >> when you need precedence of overlays (i.e. on the bone the soldered on=
 hdmi output
> >> should be disabled when an add on cape with display capability is atta=
ched).
> >> You can declare resources (i.e. pins or power draw figures) to make a =
decision
> >> whether enabling an expansion board is safe.
> >>
> >> I=E2=80=99m sure more ideas will come when we put it into wide-spread =
use. =20
> >=20
> > Yeah.  I'm not entirely sure I'm convinced by the specific examples
> > given so far.  However, in general I can see the value in providing a
> > way we can extend to add more metadata.  The two level structure with
> > __overlay__ gives us that, whereas the one level approach doesn't.
>=20
> I'm not convinced about putting additional properties (beyond "target") i=
n the
> fragment nodes.  And I still find the two extra levels of "fragment" node=
s and
> "__overlay__" nodes extra complexity, and that the complexity is especial=
ly
> unwelcome if the overlay dts is hand written (as the beagle cape overlays
> that I have seen appear to be).  HOWEVER, I learned something new today t=
hat
> makes me more comfortable with the two extra node levels.  Here is an exa=
mple:
>=20
> $ cat ex_1_overlay.dts=20
>=20
> /dts-v1/;
>=20
> /plugin/;
>=20
> &tree_1 {
> 	remote_prop =3D <0xfeedfeed &foo>;
> };
>=20
> $ dtc -@ -O dts ex_1_overlay.dts=20
> Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no r=
eg property
> /dts-v1/;
>=20
> / {
>=20
> 	fragment@0 {
> 		target =3D <0xffffffff>;
>=20
> 		__overlay__ {
> 			remote_prop =3D <0xfeedfeed 0xffffffff>;
> 		};
> 	};
>=20
> 	__symbols__ {
> 	};
>=20
> 	__fixups__ {
> 		tree_1 =3D "/fragment@0:target:0";
> 		foo =3D "/fragment@0/__overlay__:remote_prop:4";
> 	};
>=20
> 	__local_fixups__ {
> 	};
> };
>=20
> That example is using dtc from:
>   url =3D https://github.com/pantoniou/dtc
>   branch: dt-overlays8
>   as of commit: 6f4db2fc2354
>=20
> I do not know if that is current or not.
>=20
> So the nice thing about that is that the overlay source file does not hav=
e to
> provide the fragment and __overlay__ nodes.  They just magically appear i=
n the
> compiled blob.  Is that behavior that I can count on continuing to exist =
in dtc?

Yes.  There are still some unclear points about how we want to
integrate this into upstream dtc.  However, automatically translating
the existing dts overlay syntax into the dtb encoding, including
constructing the fragment@ and other special nodes is absolutely the
intention.

> Note the warning about no reg property in /fragment@0.

Yes - pretty much the next thing on my list when I get another chance
to look at this is how to properly apply checks in the preence of
overlays.  My intention is that some will be flagged as being run on
each overlay fragment individually, others only on the fully
constructed tree (and so not at all when in plugin mode).

This should address a number of problems with checks and overlays,
including this one.

> The other issue with the device tree source in my example is that I don't=
 think
> there is a way to add extra properties to node "fragment@0" in the genera=
l case
> where there are multiple fragments.  It _is_ possible to add a property a=
s I
> show in the next example, but it seems fragile to be able to count on the=
 order
> and names of fragments auto generated by dtc.  (And again, I don't really=
 want
> those extra properties anyway.)

Right, the below is indeed fragile.  I expect it will break once we've
fully implemented the upstream approach to overlays I'm intending -
that will delay resolution of the overlays until after the input is
fully parsed.

My expectation was that any extra properties in the fragment@ nodes
would be metadata and would therefore either be auto-generated by dtc,
or we'd create special dtc syntax to populate it if necessary.

> Example of adding a property to fragment@0:
>=20
> $ cat ex_1b_overlay.dts
>=20
> /dts-v1/;
>=20
> /plugin/;
>=20
> &tree_1 {
> 	remote_prop =3D <0xfeedfeed &foo>;
> };
>=20
> / {
> 	fragment@0 {
> 		another_fragment_prop =3D "frag property";
> 	};
> };
>=20
> $ dtc -@ -O dts ex_1b_overlay.dts=20
> Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no r=
eg property
> /dts-v1/;
>=20
> / {
>=20
> 	fragment@0 {
> 		target =3D <0xffffffff>;
> 		another_fragment_prop =3D "frag property";
>=20
> 		__overlay__ {
> 			remote_prop =3D <0xfeedfeed 0xffffffff>;
> 		};
> 	};
>=20
> 	__symbols__ {
> 	};
>=20
> 	__fixups__ {
> 		tree_1 =3D "/fragment@0:target:0";
> 		foo =3D "/fragment@0/__overlay__:remote_prop:4";
> 	};
>=20
> 	__local_fixups__ {
> 	};
> };
>=20
>=20
> >>> If load manager specific details are appropriate in the devicetree (a=
 whole
> >>> different discussion) then maybe a /chosen/load-manager node could ex=
ist to
> >>> hold them instead of putting them in /, where the patch currently loc=
ates
> >>> "/* various properties for loader use; i.e. part id etc. */".
>=20
> -Frank
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6zn93sY2JrH9m7VZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXdKtxAAoJEGw4ysog2bOSirAP/3HnLcjmCTxCvfaTEB+gOnS/
Tkr60Qbt2IlaxzonmZ66jI30VCZpvcnnO3ecvPvH+Gu0S6VWGfXmHS9p0bSEKZzc
jwcXQyjtlqNTRL9jpkfo/hRbuw9FIUGQUkWs+jAWi9/Fvsefh2qFmkeg7h9Arp7k
utPAiiwnn1byGz77cX/awZibYvub1RYQhp5UKsg8G/aQ76j+pr0FRojMRvWtxTkZ
b3/YjzCPlj8+H0WbgENCdc69P6+M5J0VZscQUjuUOC5hP7vy9K9o2//0QQL1FFfS
jB6GihliGWLFZBVxJu4GH/da4Aa3tlwTpxDE+KtssNJ1LI/jGsfTGMaosUNVLWfz
2BDbS/FOq/f2uouQEK+ihLMPJBPYSoxMKErBHbz7sb0RxU4kigShfwnaVIjaYmUl
aGVPFgqBjf0ixxAqJ8ia8MXKCXrq5vaHlMTftqXXKdC4wjD70ep05lWHRqDKvGCe
ruLW9j4WZilNiThfeLHqJTm3sNqXx/7BnytZ6yhfbfyAARfxkh6eQDqlCXeF5Joa
49e/egKhBbZaaYz+UXtMC7XmxS/hhqSOtf217dVQurAKxtfzAUGbazdUEi/8QRVR
ekGaNXhV74L2j3l3g8un/BfrRf/GweacCQVeoxP7Jbo94EKVjmR5BkMXFUaTC1wm
pcc445e/mkpvo598zPlX
=Fqhw
-----END PGP SIGNATURE-----

--6zn93sY2JrH9m7VZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
