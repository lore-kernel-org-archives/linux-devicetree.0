From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 2/4] dtc: Document the dynamic plugin internals
Date: Tue, 29 Nov 2016 13:04:21 +1100
Message-ID: <20161129020421.GB13307@umbus.fritz.box>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-3-git-send-email-pantelis.antoniou@konsulko.com>
 <148036343076.23275.14028691096221007535@sboyd-linaro>
 <D1B6ABA4-34A3-42BA-9B10-85CAE4DA6A28@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D1B6ABA4-34A3-42BA-9B10-85CAE4DA6A28-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 10:29:05PM +0200, Pantelis Antoniou wrote:
> Hi Stephen,
>=20
> > On Nov 28, 2016, at 22:03 , Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
> >=20
> > Quoting Pantelis Antoniou (2016-11-25 04:32:09)
> >> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-o=
bject-internal.txt
> >> new file mode 100644
> >> index 0000000..d5b841e
> >> --- /dev/null
> >> +++ b/Documentation/dt-object-internal.txt
> >> @@ -0,0 +1,318 @@
> >> +Device Tree Dynamic Object format internals
> >> +-------------------------------------------
> >> +
> >> +The Device Tree for most platforms is a static representation of
> >> +the hardware capabilities. This is insufficient for many platforms
> >=20
> > s/many//
> >=20
> >> +that need to dynamically insert device tree fragments to the
> >=20
> > that need to dynamically insert device tree fragments into the
> >=20
> > Also, should device tree be capitalized here?
> >=20
> >> +running kernel's live tree.
> >=20
> > Drop "running kernel's" as it's implicit with "live tree"?
> >=20
> >> +
> >> +This document explains the the device tree object format and the
> >=20
> > s/the//
> >=20
> >> +modifications made to the device tree compiler, which make it possibl=
e.
> >> +
> >> +1. Simplified Problem Definition
> >> +--------------------------------
> >> +
> >> +Assume we have a platform which boots using following simplified devi=
ce tree.
> >> +
> >> +---- foo.dts --------------------------------------------------------=
---------
> >> +       /* FOO platform */
> >> +       / {
> >> +               compatible =3D "corp,foo";
> >> +
> >> +               /* shared resources */
> >> +               res: res {
> >> +               };
> >> +
> >> +               /* On chip peripherals */
> >> +               ocp: ocp {
> >> +                       /* peripherals that are always instantiated */
> >> +                       peripheral1 { ... };
> >> +               };
> >> +       };
> >> +---- foo.dts --------------------------------------------------------=
---------
> >> +
> >> +We have a number of peripherals that after probing (using some undefi=
ned method)
> >> +should result in different device tree configuration.
> >> +
> >> +We cannot boot with this static tree because due to the configuration=
 of the
> >> +foo platform there exist multiple conficting peripherals DT fragments.
> >> +
> >> +So for the bar peripheral we would have this:
> >> +
> >> +---- foo+bar.dts ----------------------------------------------------=
---------
> >> +       /* FOO platform + bar peripheral */
> >> +       / {
> >> +               compatible =3D "corp,foo";
> >> +
> >> +               /* shared resources */
> >> +               res: res {
> >> +               };
> >> +
> >> +               /* On chip peripherals */
> >> +               ocp: ocp {
> >> +                       /* peripherals that are always instantiated */
> >> +                       peripheral1 { ... };
> >> +
> >> +                       /* bar peripheral */
> >> +                       bar {
> >> +                               compatible =3D "corp,bar";
> >> +                               ... /* various properties and child no=
des */
> >> +                       };
> >> +               };
> >> +       };
> >> +---- foo+bar.dts ----------------------------------------------------=
---------
> >> +
> >> +While for the baz peripheral we would have this:
> >> +
> >> +---- foo+baz.dts ----------------------------------------------------=
---------
> >> +       /* FOO platform + baz peripheral */
> >> +       / {
> >> +               compatible =3D "corp,foo";
> >> +
> >> +               /* shared resources */
> >> +               res: res {
> >> +                       /* baz resources */
> >> +                       baz_res: res_baz { ... };
> >> +               };
> >> +
> >> +               /* On chip peripherals */
> >> +               ocp: ocp {
> >> +                       /* peripherals that are always instantiated */
> >> +                       peripheral1 { ... };
> >> +
> >> +                       /* baz peripheral */
> >> +                       baz {
> >> +                               compatible =3D "corp,baz";
> >> +                               /* reference to another point in the t=
ree */
> >> +                               ref-to-res =3D <&baz_res>;
> >> +                               ... /* various properties and child no=
des */
> >> +                       };
> >> +               };
> >> +       };
> >> +---- foo+baz.dts ----------------------------------------------------=
---------
> >> +
> >> +We note that the baz case is more complicated, since the baz peripher=
al needs to
> >> +reference another node in the DT tree.
> >> +
> >> +2. Device Tree Object Format Requirements
> >> +-----------------------------------------
> >> +
> >> +Since the device tree is used for booting a number of very different =
hardware
> >> +platforms it is imperative that we tread very carefully.
> >> +
> >> +2.a) No changes to the Device Tree binary format for the base tree. W=
e cannot
> >> +modify the tree format at all and all the information we require shou=
ld be
> >> +encoded using device tree itself. We can add nodes that can be safely=
 ignored
> >> +by both bootloaders and the kernel. The plugin dtb's are optionally t=
agged
> >=20
> > s/dtb's/dtbs/
> >=20
> >> +with a different magic number in the header but otherwise they too ar=
e simple
> >> +blobs.
> >=20
> > but otherwise they're simple blobs.
> >=20
>=20
> OK on the spelling/grammar fixes above.
>=20
> >> +
> >> +2.b) Changes to the DTS source format should be absolutely minimal, a=
nd should
> >> +only be needed for the DT fragment definitions, and not the base boot=
 DT.
> >> +
> >> +2.c) An explicit option should be used to instruct DTC to generate th=
e required
> >> +information needed for object resolution. Platforms that don't use the
> >> +dynamic object format can safely ignore it.
> >=20
> > Why? We can't figure that out based on the /plugin/ label within the dts
> > file? And shouldn't we always generate a __symbols__ node in the base
> > dtb?
> >=20
>=20
> Actually now we do. The last patchset does automatically generate those n=
odes
> if a /plugin/ tag is encountered. For base dtbs I would suggest that gene=
rating
> the symbols node automatically is what=E2=80=99s sane too, but unfortunat=
ely there are
> some platforms out there that are having trouble with larger dtbs than wh=
at they
> expect.
>=20
> It is your call whether to enable it by default I guess.
>=20
> >> +
> >> +2.d) Finally, DT syntax changes should be kept to a minimum. It shoul=
d be
> >> +possible to express everything using the existing DT syntax.
> >> +
> >> +3. Implementation
> >> +-----------------
> >> +
> >> +The basic unit of addressing in Device Tree is the phandle. Turns out=
 it's
> >> +relatively simple to extend the way phandles are generated and refere=
nced
> >> +so that it's possible to dynamically convert symbolic references (lab=
els)
> >> +to phandle values. This is a valid assumption as long as the author u=
ses
> >> +reference syntax and does not assign phandle values manually (which m=
ight
> >> +be a problem with decompiled source files).
> >> +
> >> +We can roughly divide the operation into two steps.
> >> +
> >> +3.a) Compilation of the base board DTS file using the '-@' option
> >> +generates a valid DT blob with an added __symbols__ node at the root =
node,
> >> +containing a list of all nodes that are marked with a label.
> >> +
> >> +Using the foo.dts file above the following node will be generated;
> >> +
> >> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
> >> +$ fdtdump foo.dtb
> >> +...
> >> +/ {
> >> +       ...
> >> +       res {
> >> +               ...
> >> +               phandle =3D <0x00000001>;
> >> +               ...
> >> +       };
> >> +       ocp {
> >> +               ...
> >> +               phandle =3D <0x00000002>;
> >> +               ...
> >> +       };
> >> +       __symbols__ {
> >> +               res=3D"/res";
> >> +               ocp=3D"/ocp";
> >> +       };
> >> +};
> >> +
> >> +Notice that all the nodes that had a label have been recorded, and th=
at
> >> +phandles have been generated for them.
> >> +
> >> +This blob can be used to boot the board normally, the __symbols__ nod=
e will
> >> +be safely ignored both by the bootloader and the kernel (the only los=
s will
> >> +be a few bytes of memory and disk space).
> >=20
> > This never really mentions why we need to generate a symbols node.
> > Perhaps we should say something like "we generate a __symbols__ node to
> > record nodes that had labels in the base tree so they can be matched up
> > with the fragments which reference the same labels"? Or something like
> > that.
> >=20
>=20
> Hmm, yeah.
>=20
> > I also wonder why it's even necessary. Couldn't we require overlays to
> > be compiled with the original dts files? Then we could encode the full
> > path of nodes referenced in the overlay into the overlay dtb itself.
> >=20
>=20
> No, we can=E2=80=99t do that; the end-game of this is for overlays to be =
portable
> for use in platforms having the same kind of connectors.

That's kind of true, but actually I think we want to redesign the
connector format.  Obviously we'll take some stuff from the current
overlay format, but we can't be fully compatible with them, so we
should take the opportunity to remove some of the sillier design flaws
in the overlay format.

That said, even with their flaws and limitations, overlays in the
current format can sometimes be portable to multiple base trees.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPOIlAAoJEGw4ysog2bOSZl4QANjvF56ak1PfGjI6QaZVXsLH
ptEwrO1htBySlm8M8ZBAqfi3Hog1GGsBgBzjJwDCKTpxW6CjqOXX/O5ii0dVz6gu
TkxxoCjIMfxsKF55+rQPt4rG6KFfxklKLSFkWYttZBcr1lnb19ZpIeaZ5n5Cw5OQ
OixjBjPMFvt0qPWSHus/P14gaN2A0ERC4iMos47mw21bLTkz7bS37oMn4Rf82BkE
K38peUZ3Rb3/n0jqs0noscfLJtppVLuZKr1u62K13+cx7sWaxiDYhOddyChwn8d9
79zAzYNidqhGL8uslr5zbeY0j6iFflJ9yZVPnYL4O66vfGqvxyGgCduqj052pRu/
C89yOFw1/qb3z9O3l9Y75R/YGsLNQ+va94aX3PXpJP7FDH1wIyrPBraTdlzpYkb/
+tn0ABjvmBD1MiFAUrabigW+rE6C/1H1Dix1NzKSIdHNkoMgrrD7+u+QCEbyJqS3
+63d39OfrQWEKKI7H+DhSJI50DPhlb4Edd5BSzW8rtLq9ZnpzpeogVxdyf+VNcJl
gIEW9A3VUll5S7l+PL0Ou0tLXMovsqKckc83rJHZtd5JG4MeX7YIoprT0YoNlEez
8DT18yq8d3PeLTdSbd5huGHQL84oevVcYPyqECirB1gjEm6rO5YZhRCBUXINcqUt
0+KfbNOHhna3sq1OG2r+
=yZ/G
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
