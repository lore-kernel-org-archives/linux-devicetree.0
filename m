From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 2/4] dtc: Document the dynamic plugin internals
Date: Tue, 29 Nov 2016 13:01:45 +1100
Message-ID: <20161129020145.GA13307@umbus.fritz.box>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-3-git-send-email-pantelis.antoniou@konsulko.com>
 <148036343076.23275.14028691096221007535@sboyd-linaro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <148036343076.23275.14028691096221007535@sboyd-linaro>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 12:03:50PM -0800, Stephen Boyd wrote:
> Quoting Pantelis Antoniou (2016-11-25 04:32:09)
> > diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-ob=
ject-internal.txt
> > new file mode 100644
> > index 0000000..d5b841e
> > --- /dev/null
> > +++ b/Documentation/dt-object-internal.txt
> > @@ -0,0 +1,318 @@
> > +Device Tree Dynamic Object format internals
> > +-------------------------------------------
> > +
> > +The Device Tree for most platforms is a static representation of
> > +the hardware capabilities. This is insufficient for many platforms
>=20
> s/many//
>=20
> > +that need to dynamically insert device tree fragments to the
>=20
> that need to dynamically insert device tree fragments into the
>=20
> Also, should device tree be capitalized here?
>=20
> > +running kernel's live tree.
>=20
> Drop "running kernel's" as it's implicit with "live tree"?
>=20
> > +
> > +This document explains the the device tree object format and the
>=20
> s/the//
>=20
> > +modifications made to the device tree compiler, which make it possible.
> > +
> > +1. Simplified Problem Definition
> > +--------------------------------
> > +
> > +Assume we have a platform which boots using following simplified devic=
e tree.
> > +
> > +---- foo.dts ---------------------------------------------------------=
--------
> > +       /* FOO platform */
> > +       / {
> > +               compatible =3D "corp,foo";
> > +
> > +               /* shared resources */
> > +               res: res {
> > +               };
> > +
> > +               /* On chip peripherals */
> > +               ocp: ocp {
> > +                       /* peripherals that are always instantiated */
> > +                       peripheral1 { ... };
> > +               };
> > +       };
> > +---- foo.dts ---------------------------------------------------------=
--------
> > +
> > +We have a number of peripherals that after probing (using some undefin=
ed method)
> > +should result in different device tree configuration.
> > +
> > +We cannot boot with this static tree because due to the configuration =
of the
> > +foo platform there exist multiple conficting peripherals DT fragments.
> > +
> > +So for the bar peripheral we would have this:
> > +
> > +---- foo+bar.dts -----------------------------------------------------=
--------
> > +       /* FOO platform + bar peripheral */
> > +       / {
> > +               compatible =3D "corp,foo";
> > +
> > +               /* shared resources */
> > +               res: res {
> > +               };
> > +
> > +               /* On chip peripherals */
> > +               ocp: ocp {
> > +                       /* peripherals that are always instantiated */
> > +                       peripheral1 { ... };
> > +
> > +                       /* bar peripheral */
> > +                       bar {
> > +                               compatible =3D "corp,bar";
> > +                               ... /* various properties and child nod=
es */
> > +                       };
> > +               };
> > +       };
> > +---- foo+bar.dts -----------------------------------------------------=
--------
> > +
> > +While for the baz peripheral we would have this:
> > +
> > +---- foo+baz.dts -----------------------------------------------------=
--------
> > +       /* FOO platform + baz peripheral */
> > +       / {
> > +               compatible =3D "corp,foo";
> > +
> > +               /* shared resources */
> > +               res: res {
> > +                       /* baz resources */
> > +                       baz_res: res_baz { ... };
> > +               };
> > +
> > +               /* On chip peripherals */
> > +               ocp: ocp {
> > +                       /* peripherals that are always instantiated */
> > +                       peripheral1 { ... };
> > +
> > +                       /* baz peripheral */
> > +                       baz {
> > +                               compatible =3D "corp,baz";
> > +                               /* reference to another point in the tr=
ee */
> > +                               ref-to-res =3D <&baz_res>;
> > +                               ... /* various properties and child nod=
es */
> > +                       };
> > +               };
> > +       };
> > +---- foo+baz.dts -----------------------------------------------------=
--------
> > +
> > +We note that the baz case is more complicated, since the baz periphera=
l needs to
> > +reference another node in the DT tree.
> > +
> > +2. Device Tree Object Format Requirements
> > +-----------------------------------------
> > +
> > +Since the device tree is used for booting a number of very different h=
ardware
> > +platforms it is imperative that we tread very carefully.
> > +
> > +2.a) No changes to the Device Tree binary format for the base tree. We=
 cannot
> > +modify the tree format at all and all the information we require shoul=
d be
> > +encoded using device tree itself. We can add nodes that can be safely =
ignored
> > +by both bootloaders and the kernel. The plugin dtb's are optionally ta=
gged
>=20
> s/dtb's/dtbs/
>=20
> > +with a different magic number in the header but otherwise they too are=
 simple
> > +blobs.
>=20
> but otherwise they're simple blobs.
>=20
> > +
> > +2.b) Changes to the DTS source format should be absolutely minimal, an=
d should
> > +only be needed for the DT fragment definitions, and not the base boot =
DT.
> > +
> > +2.c) An explicit option should be used to instruct DTC to generate the=
 required
> > +information needed for object resolution. Platforms that don't use the
> > +dynamic object format can safely ignore it.
>=20
> Why? We can't figure that out based on the /plugin/ label within the dts
> file? And shouldn't we always generate a __symbols__ node in the base
> dtb?

No, given it's a nonstandard extension on the basic device tree
contents, I don't think we should generate the symbol information by
default.  /plugin/ can let you determine whether to generate fixups,
but you need the symbols for the base tree.

> > +
> > +2.d) Finally, DT syntax changes should be kept to a minimum. It should=
 be
> > +possible to express everything using the existing DT syntax.
> > +
> > +3. Implementation
> > +-----------------
> > +
> > +The basic unit of addressing in Device Tree is the phandle. Turns out =
it's
> > +relatively simple to extend the way phandles are generated and referen=
ced
> > +so that it's possible to dynamically convert symbolic references (labe=
ls)
> > +to phandle values. This is a valid assumption as long as the author us=
es
> > +reference syntax and does not assign phandle values manually (which mi=
ght
> > +be a problem with decompiled source files).
> > +
> > +We can roughly divide the operation into two steps.
> > +
> > +3.a) Compilation of the base board DTS file using the '-@' option
> > +generates a valid DT blob with an added __symbols__ node at the root n=
ode,
> > +containing a list of all nodes that are marked with a label.
> > +
> > +Using the foo.dts file above the following node will be generated;
> > +
> > +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
> > +$ fdtdump foo.dtb
> > +...
> > +/ {
> > +       ...
> > +       res {
> > +               ...
> > +               phandle =3D <0x00000001>;
> > +               ...
> > +       };
> > +       ocp {
> > +               ...
> > +               phandle =3D <0x00000002>;
> > +               ...
> > +       };
> > +       __symbols__ {
> > +               res=3D"/res";
> > +               ocp=3D"/ocp";
> > +       };
> > +};
> > +
> > +Notice that all the nodes that had a label have been recorded, and that
> > +phandles have been generated for them.
> > +
> > +This blob can be used to boot the board normally, the __symbols__ node=
 will
> > +be safely ignored both by the bootloader and the kernel (the only loss=
 will
> > +be a few bytes of memory and disk space).
>=20
> This never really mentions why we need to generate a symbols node.
> Perhaps we should say something like "we generate a __symbols__ node to
> record nodes that had labels in the base tree so they can be matched up
> with the fragments which reference the same labels"? Or something like
> that.
>=20
> I also wonder why it's even necessary. Couldn't we require overlays to
> be compiled with the original dts files? Then we could encode the full
> path of nodes referenced in the overlay into the overlay dtb itself.

That's one of many different design decisions that could have been
made, and might have been a better idea.  But the current design is
out in the wild now, flaws and all, so we do need to implement it.

> > +
> > +3.b) The Device Tree fragments must be compiled with the same option b=
ut they
> > +must also have a tag (/plugin/) that allows undefined references to no=
des
> > +that are not present at compilation time to be recorded so that the ru=
ntime
> > +loader can fix them.
> > +
> > +So the bar peripheral's DTS format would be of the form:
> > +
> > +/dts-v1/ /plugin/;     /* allow undefined references and record them */
> > +/ {
> > +       ....    /* various properties for loader use; i.e. part id etc.=
 */
> > +       fragment@0 {
> > +               target =3D <&ocp>;
> > +               __overlay__ {
> > +                       /* bar peripheral */
> > +                       bar {
> > +                               compatible =3D "corp,bar";
> > +                               ... /* various properties and child nod=
es */
> > +                       }
> > +               };
> > +       };
> > +};
> > +
> > +Note that there's a target property that specifies the location where =
the
> > +contents of the overlay node will be placed, and it references the node
> > +in the foo.dts file.
> > +
> > +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> > +$ fdtdump bar.dtbo
> > +...
> > +/ {
> > +       ... /* properties */
> > +       fragment@0 {
> > +               target =3D <0xffffffff>;
> > +               __overlay__ {
> > +                       bar {
> > +                               compatible =3D "corp,bar";
> > +                               ... /* various properties and child nod=
es */
> > +                       }
> > +               };
> > +       };
> > +       __fixups__ {
> > +           ocp =3D "/fragment@0:target:0";
> > +       };
> > +};
> > +
> > +No __symbols__ has been generated (no label in bar.dts).
>=20
> Add "node" after __symbols__ here?
>=20
> > +Note that the target's ocp label is undefined, so the phandle handle
>=20
> Drop handle after phandle?
>=20
> > +value is filled with the illegal value '0xffffffff', while a __fixups__
> > +node has been generated, which marks the location in the tree where
> > +the label lookup should store the runtime phandle value of the ocp nod=
e.
> > +
> > +The format of the __fixups__ node entry is
> > +
> > +       <label> =3D "<local-full-path>:<property-name>:<offset>";
> > +
> > +<label>                Is the label we're referring
> > +<local-full-path>      Is the full path of the node the reference is
> > +<property-name>                Is the name of the property containing =
the
>=20
> Weird alignment here.
>=20
> > +                       reference
> > +<offset>               The offset (in bytes) of where the property's
> > +                       phandle value is located.
>=20
> located within the property? Or "offset relative to the start of the
> property in bytes where the phandle value is located"?
>=20
> Is this a list? So multiple properties can be fixed up with the same
> label? If so that isn't clear from this description.
>=20
> > +
> > +Doing the same with the baz peripheral's DTS format is a little bit mo=
re
> > +involved, since baz contains references to local labels which require
> > +local fixups.
> > +
> > +/dts-v1/ /plugin/;     /* allow undefined label references and record =
them */
> > +/ {
> > +       ....    /* various properties for loader use; i.e. part id etc.=
 */
> > +       fragment@0 {
> > +               target =3D <&res>;
> > +               __overlay__ {
> > +                       /* baz resources */
> > +                       baz_res: res_baz { ... };
> > +               };
> > +       };
> > +       fragment@1 {
> > +               target =3D <&ocp>;
> > +               __overlay__ {
> > +                       /* baz peripheral */
> > +                       baz {
> > +                               compatible =3D "corp,baz";
> > +                               /* reference to another point in the tr=
ee */
> > +                               ref-to-res =3D <&baz_res>;
> > +                               ... /* various properties and child nod=
es */
> > +                       }
> > +               };
> > +       };
> > +};
> > +
> > +Note that &bar_res reference.
> > +
> > +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
> > +$ fdtdump baz.dtbo
> > +...
> > +/ {
> > +       ... /* properties */
> > +       fragment@0 {
> > +               target =3D <0xffffffff>;
> > +               __overlay__ {
> > +                       res_baz {
> > +                               ....
> > +                               phandle =3D <0x00000001>;
> > +                       };
> > +               };
> > +       };
> > +       fragment@1 {
> > +               target =3D <0xffffffff>;
> > +               __overlay__ {
> > +                       baz {
> > +                               compatible =3D "corp,baz";
> > +                               ... /* various properties and child nod=
es */
> > +                               ref-to-res =3D <0x00000001>;
> > +                       }
> > +               };
> > +       };
> > +       __fixups__ {
> > +               res =3D "/fragment@0:target:0";
> > +               ocp =3D "/fragment@1:target:0";
> > +       };
> > +       __local_fixups__ {
> > +               fragment@1 {
> > +                       __overlay__ {
> > +                               baz {
> > +                                       ref-to-res =3D <0>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +This is similar to the bar case, but the reference of a local label by=
 the
> > +baz node generates a __local_fixups__ entry that records the place tha=
t the
> > +local reference is being made. No matter how phandles are allocated fr=
om dtc
> > +the run time loader must apply an offset to each phandle in every dyna=
mic
> > +DT object loaded. The __local_fixups__ node records the place of every
>=20
> records the offset relative to the start of the property of every local
> reference within that property so that the loader...
>=20
> > +local reference so that the loader can apply the offset.
> > +
> > +There is an alternative syntax to the expanded form for overlays with =
phandle
> > +targets which makes the format similar to the one using in .dtsi inclu=
de files.
> > +
> > +So for the &ocp target example above one can simply write:
> > +
> > +/dts-v1/ /plugin/;
> > +&ocp {
> > +       /* bar peripheral */
> > +       bar {
> > +               compatible =3D "corp,bar";
> > +               ... /* various properties and child nodes */
> > +       }
> > +};
> > +
> > +The resulting dtb object is identical.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPOGHAAoJEGw4ysog2bOS6OQP/2HHSNXlTKvVRnrQCENysaLs
bBuDUecObD6gMvXw/Dc+0zgDOL3vCbdF9d8RkFig9e2NPM5YWHypjyLFC9oE7vlR
gRMEbVVP4yEycB3km0n9bLHJ7LDijaVFB3TvUmVRB941D0BBy4Ngs7J88IRWFebx
2McQ+Sjv4wzGI+SoAvp4xZSDtlC44fgZWRQjfMQFKh0716UtoYsgHnTOl8Udh3aM
DYmmJh5LxlXS9f3R4Eima/ZJCiUOcZp24fQ6vQF5KYeUhbhEWt65wqmBt6QFQ6k8
DSNDiwhsNLrqNoCEl26CzN1oiZjQFjcSP1Fe1IbMwScda90VJ6ETfgEPWA5iF2oR
r2IW3kitX9b4LkTcfgE1L3i+i4ymy6/gLQYFKZzmjHAW7RolOUiJWxYc40D0VorE
M1yRAmtbKnvM0LHmosD0S9atHiV6QTkyskzSqGIvd4uvhN56Qiz2j2fTyd9LPt4F
8itG9ah7kmL/ZIJwPuEZ8ISpfhtJBAkZ+SZ1tJO1RfnPhrN8A9WdWUr9sL4CKE78
G3Q6s3gdCkYdHYywsrG8/yfXpC7YdFYNnI5lfNImlXJ2249DkUSPe21VMozJUyhy
lVWI1EuKGUpb+XENSdjQ0yzSwsiXJom39MhgRL7z2LgImoXKl9hZLjp6xN/bE9c+
vg7TbE7b4Tch0VDhSwTl
=SJxg
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
