From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 2/4] dtc: Document the dynamic plugin internals
Date: Fri, 2 Dec 2016 14:25:10 +1100
Message-ID: <20161202032510.GD10089@umbus.fritz.box>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-3-git-send-email-pantelis.antoniou@konsulko.com>
 <583CDB95.5000902@gmail.com>
 <234832FB-F181-46AF-9732-E5780FFC38B9@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <234832FB-F181-46AF-9732-E5780FFC38B9-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 01:21:40PM +0200, Pantelis Antoniou wrote:
> Hi Frank,
>=20
> > On Nov 29, 2016, at 03:36 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> > On 11/25/16 04:32, Pantelis Antoniou wrote:
> >> Provides the document explaining the internal mechanics of
> >> plugins and options.
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >> Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++++=
++++++++
> >> 1 file changed, 318 insertions(+)
> >> create mode 100644 Documentation/dt-object-internal.txt
> >>=20
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
> >> +that need to dynamically insert device tree fragments to the
> >> +running kernel's live tree.
> >> +
> >> +This document explains the the device tree object format and the
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
> >> +	/* FOO platform */
> >> +	/ {
> >> +		compatible =3D "corp,foo";
> >> +
> >> +		/* shared resources */
> >> +		res: res {
> >> +		};
> >> +
> >> +		/* On chip peripherals */
> >> +		ocp: ocp {
> >> +			/* peripherals that are always instantiated */
> >> +			peripheral1 { ... };
> >> +		};
> >> +	};
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
> >=20
> >                                     ^^^^^^^^^^  conflicting
> >=20
> > I assume conflicting because, for instance, the different peripherals m=
ight
> > occupy the same address space, use the same interrupt, or use the same =
gpio.
> > Mentioning that would provide a fuller picture for the neophyte.
> >=20
>=20
> Yes, thanks for bringing this to my attention. This document is heavy on =
the neophyte for sure.
>=20
> >> +
> >> +So for the bar peripheral we would have this:
> >> +
> >> +---- foo+bar.dts ----------------------------------------------------=
---------
> >> +	/* FOO platform + bar peripheral */
> >> +	/ {
> >> +		compatible =3D "corp,foo";
> >> +
> >> +		/* shared resources */
> >> +		res: res {
> >> +		};
> >> +
> >> +		/* On chip peripherals */
> >> +		ocp: ocp {
> >> +			/* peripherals that are always instantiated */
> >> +			peripheral1 { ... };
> >> +
> >> +			/* bar peripheral */
> >> +			bar {
> >> +				compatible =3D "corp,bar";
> >> +				... /* various properties and child nodes */
> >> +			};
> >> +		};
> >> +	};
> >> +---- foo+bar.dts ----------------------------------------------------=
---------
> >> +
> >> +While for the baz peripheral we would have this:
> >> +
> >> +---- foo+baz.dts ----------------------------------------------------=
---------
> >> +	/* FOO platform + baz peripheral */
> >> +	/ {
> >> +		compatible =3D "corp,foo";
> >> +
> >> +		/* shared resources */
> >> +		res: res {
> >> +			/* baz resources */
> >> +			baz_res: res_baz { ... };
> >> +		};
> >> +
> >> +		/* On chip peripherals */
> >> +		ocp: ocp {
> >> +			/* peripherals that are always instantiated */
> >> +			peripheral1 { ... };
> >> +
> >> +			/* baz peripheral */
> >> +			baz {
> >> +				compatible =3D "corp,baz";
> >> +				/* reference to another point in the tree */
> >> +				ref-to-res =3D <&baz_res>;
> >> +				... /* various properties and child nodes */
> >> +			};
> >> +		};
> >> +	};
> >> +---- foo+baz.dts ----------------------------------------------------=
---------
> >> +
> >> +We note that the baz case is more complicated, since the baz peripher=
al needs to
> >> +reference another node in the DT tree.
> >=20
> > I know that there are other situations that can justify overlays, so not
> > contesting the basic need with this comment.  But the above situation c=
ould
> > be handled in a much simpler fashion by setting the status property of =
each
> > of the conflicting devices to disabled, then after probing setting the =
status
> > to ok.  That method removes a lot of complexity.
> >=20
> > A big driver for the concept of overlays was being able to describe dif=
ferent
> > add on boards at run time, instead of when the base dtb was created.  I=
 think
> > we have agreed that moving to a connector model instead of a raw overla=
y is
> > the proper way to address add on boards.
> >=20
> > Can you address how an overlay can be created that will work for a board
> > plugged into any of the identical sockets that is compatible with the
> > board?
> >=20
> >=20
>=20
> Yes, I will try to do so.
>=20
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
> >> +with a different magic number in the header but otherwise they too ar=
e simple
> >> +blobs.
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
> >> +	...
> >> +	res {
> >> +		...
> >> +		phandle =3D <0x00000001>;
> >> +		...
> >> +	};
> >> +	ocp {
> >> +		...
> >> +		phandle =3D <0x00000002>;
> >> +		...
> >> +	};
> >> +	__symbols__ {
> >> +		res=3D"/res";
> >> +		ocp=3D"/ocp";
> >> +	};
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
> >> +
> >> +3.b) The Device Tree fragments must be compiled with the same option =
but they
> >> +must also have a tag (/plugin/) that allows undefined references to n=
odes
> >> +that are not present at compilation time to be recorded so that the r=
untime
> >> +loader can fix them.
> >> +
> >> +So the bar peripheral's DTS format would be of the form:
> >> +
> >> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
> >> +/ {
> >> +	....	/* various properties for loader use; i.e. part id etc. */
> >> +	fragment@0 {
> >> +		target =3D <&ocp>;
> >> +		__overlay__ {
> >> +			/* bar peripheral */
> >> +			bar {
> >> +				compatible =3D "corp,bar";
> >> +				... /* various properties and child nodes */
> >> +			}
> >> +		};
> >> +	};
> >> +};
> >=20
> > The last version of your patches that I tested did not require specifyi=
ng
> > the target property, the fragment node, and the __overlay__ node.  dtc
> > properly created all of those items automatically.  For example, I could
> > go to all of the trouble of creating those items in a dts like:
> >=20
> > $ cat example_1_hand_coded.dts
> > /dts-v1/;
> > /plugin/;
> >=20
> > / {
> >=20
> > 	fragment@0 {
> > 		target =3D <&am3353x_pinmux>;
> >=20
> > 		__overlay__ {
> >=20
> > 			i2c1_pins: pinmux_i2c1_pins {
> > 				pinctrl-single,pins =3D <
> > 					0x158 0x72
> > 					0x15c 0x72
> > 				>;
> > 			};
> > 		};
> > 	};
> >=20
> > 	fragment@1 {
> > 		target =3D <&i2c1>;
> >=20
> > 		__overlay__ {
> > 			pinctrl-names =3D "default";
> > 			pinctrl-0 =3D <&i2c1_pins>;
> > 			clock-frequency =3D <400000>;
> > 			status =3D "okay";
> >=20
> > 			at24@50 {
> > 				compatible =3D "at,24c256";
> > 				pagesize =3D <64>;
> > 				reg =3D <0x50>;
> > 			};
> > 		};
> > 	};
> > };
> >=20
> >=20
> > Or I could let dtc automagically create all the special features
> > (target, fragment, __overlay__) from an equivalent dts:
> >=20
> > $ cat example_1.dts
> > /dts-v1/;
> > /plugin/;
> >=20
> >=20
> > 		&am3353x_pinmux {
> > 			i2c1_pins: pinmux_i2c1_pins {
> > 				pinctrl-single,pins =3D <
> > 					0x158 0x72
> > 					0x15c 0x72
> > 				>;
> > 			};
> > 		};
> >=20
> > 		&i2c1 {
> > 			#address-cells =3D <1>;
> > 			#size-cells =3D <0>;
> > 			pinctrl-names =3D "default";
> > 			pinctrl-0 =3D <&i2c1_pins>;
> > 			clock-frequency =3D <400000>;
> > 			status =3D "okay";
> >=20
> > 			at24@50 {
> > 				compatible =3D "at,24c256";
> > 				pagesize =3D <64>;
> > 				reg =3D <0x50>;
> > 			};
> > 		};
> >=20
> >=20
> > I would much prefer that people never hand code the target, fragment, a=
nd
> > __overlay__ in a dts source file.  Exposing them at the source level ad=
ds
> > complexity, confusion, and an increased chance of creating an invalid
> > overlay dtb.
> >=20
> > If possible, I would prefer target, fragment, and __overlay__ not be va=
lid
> > input to dtc.  It would probably be difficult to prohibit target and fr=
agment,
> > because however unlikely they are as property and node names, they are =
valid
> > dts syntax before adding the overlay enhancements to dtc.  However __ov=
erlay__
> > is not a valid node name without the overlay enhancements and could rem=
ain
> > invalid dts input.
> >=20
> > I prefer that target, fragment, and __overlay__ be documented as a dtb =
to
> > target system API.  In this case, for the normal developer, they are
> > hidden in the binary dtb format and in the kernel (or boot loader)
> > overlay framework code.
> >=20
> > I do recognize that if __overlay__ is not valid dtc input then it is not
> > possible to decompile an overlay into a dts containing __overlay__ and
> > then recompile that dts.  This could be resolved by a more complex
> > decompile that turned the overlay dtb back into the form of example_1.d=
ts
> > above.
> >=20
> > After reading to the end of this patch, I see that the simpler form of
> > .dts (like example_1.dts) is also noted as "an alternative syntax to
> > the expanded form for overlays".
> >=20
> >=20
>=20
> Phew.
>=20
> Let me address all that.
>=20
> When I started on this the main problem was that there was no support for=
 applying
> overlays in the kernel. The original patch series for dtc is meant to sup=
port the
> encoding of the required information into device tree format.
>=20
> The syntax of overlays like this '&foo { };=E2=80=99 is a new thing that =
can be subject to
> change.

Well.. yes and no.  What I'm going to call "compile time overlays"
using that syntax have been around for ages (rather longer than
dynamic overlays).  The semantics you hve for runtime overlay
application are pretty much identical to those for compile time
overlays, except (duh) applied later.

That's why I want to unify the syntax between the two.  And, up to a
point, to unify the concepts as well.  This is why I want to treat
this as having dtc parse the source into a bundle of overlays which it
then decides whether it needs to apply immediately (compile time
overlay) or encode them into the dtbo format for the bootloader or
kernel to apply later (dynamic overlay).

> On the last patchset I=E2=80=99ve split it out so that it is clear.

Yeah, but you're splitting it based on the history, rather than what I
think is the conceptually clearer approach:  first, allow the overlay
(&ref { ... }) syntax to be either compile-time or dynamic.  second,
add in backwards compatiblity hacks for manually encoded dts files.

> Now, since we=E2=80=99ve settled on the internal encoding format (__overl=
ays__, target, etc)
> we can tackle the syntax cases and alternative target options.

But that's not an internal encoding format, it's an _external_
encoding format.

> So, yes we should forbid __overlay__ to be a valid node name eventually a=
long with
> a bunch of other syntax stuff.
>=20
> Having come to mind, we should see what we need for the connector
> format to work.

No argument there.

>=20
> >> +
> >> +Note that there's a target property that specifies the location where=
 the
> >> +contents of the overlay node will be placed, and it references the no=
de
> >> +in the foo.dts file.
> >> +
> >> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> >> +$ fdtdump bar.dtbo
> >> +...
> >> +/ {
> >> +	... /* properties */
> >> +	fragment@0 {
> >> +		target =3D <0xffffffff>;
> >> +		__overlay__ {
> >> +			bar {
> >> +				compatible =3D "corp,bar";
> >> +				... /* various properties and child nodes */
> >> +			}
> >> +		};
> >> +	};
> >> +	__fixups__ {
> >> +	    ocp =3D "/fragment@0:target:0";
> >> +	};
> >> +};
> >> +
> >> +No __symbols__ has been generated (no label in bar.dts).
> >> +Note that the target's ocp label is undefined, so the phandle handle
> >> +value is filled with the illegal value '0xffffffff', while a __fixups=
__
> >> +node has been generated, which marks the location in the tree where
> >> +the label lookup should store the runtime phandle value of the ocp no=
de.
> >> +
> >> +The format of the __fixups__ node entry is
> >> +
> >> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
> >> +
> >> +<label> 		Is the label we're referring
> >> +<local-full-path>	Is the full path of the node the reference is
> >> +<property-name>		Is the name of the property containing the
> >> +			reference
> >> +<offset>		The offset (in bytes) of where the property's
> >> +			phandle value is located.
> >> +
> >> +Doing the same with the baz peripheral's DTS format is a little bit m=
ore
> >> +involved, since baz contains references to local labels which require
> >> +local fixups.
> >> +
> >> +/dts-v1/ /plugin/;	/* allow undefined label references and record the=
m */
> >> +/ {
> >> +	....	/* various properties for loader use; i.e. part id etc. */
> >> +	fragment@0 {
> >> +		target =3D <&res>;
> >> +		__overlay__ {
> >> +			/* baz resources */
> >> +			baz_res: res_baz { ... };
> >> +		};
> >> +	};
> >> +	fragment@1 {
> >> +		target =3D <&ocp>;
> >> +		__overlay__ {
> >> +			/* baz peripheral */
> >> +			baz {
> >> +				compatible =3D "corp,baz";
> >> +				/* reference to another point in the tree */
> >> +				ref-to-res =3D <&baz_res>;
> >> +				... /* various properties and child nodes */
> >> +			}
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +Note that &bar_res reference.
> >> +
> >> +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
> >> +$ fdtdump baz.dtbo
> >> +...
> >> +/ {
> >> +	... /* properties */
> >> +	fragment@0 {
> >> +		target =3D <0xffffffff>;
> >> +		__overlay__ {
> >> +			res_baz {
> >> +				....
> >> +				phandle =3D <0x00000001>;
> >> +			};
> >> +		};
> >> +	};
> >> +	fragment@1 {
> >> +		target =3D <0xffffffff>;
> >> +		__overlay__ {
> >> +			baz {
> >> +				compatible =3D "corp,baz";
> >> +				... /* various properties and child nodes */
> >> +				ref-to-res =3D <0x00000001>;
> >> +			}
> >> +		};
> >> +	};
> >> +	__fixups__ {
> >> +		res =3D "/fragment@0:target:0";
> >> +		ocp =3D "/fragment@1:target:0";
> >> +	};
> >> +	__local_fixups__ {
> >> +		fragment@1 {
> >> +			__overlay__ {
> >> +				baz {
> >> +					ref-to-res =3D <0>;
> >> +				};
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +This is similar to the bar case, but the reference of a local label b=
y the
> >> +baz node generates a __local_fixups__ entry that records the place th=
at the
> >> +local reference is being made. No matter how phandles are allocated f=
rom dtc
> >> +the run time loader must apply an offset to each phandle in every dyn=
amic
> >> +DT object loaded. The __local_fixups__ node records the place of every
> >> +local reference so that the loader can apply the offset.
> >> +
> >> +There is an alternative syntax to the expanded form for overlays with=
 phandle
> >> +targets which makes the format similar to the one using in .dtsi incl=
ude files.
> >> +
> >> +So for the &ocp target example above one can simply write:
> >> +
> >> +/dts-v1/ /plugin/;
> >> +&ocp {
> >> +	/* bar peripheral */
> >> +	bar {
> >> +		compatible =3D "corp,bar";
> >> +		... /* various properties and child nodes */
> >> +	}
> >> +};
> >> +
> >> +The resulting dtb object is identical.
> >>=20
> >=20
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

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYQOmTAAoJEGw4ysog2bOSI8oP/ikNhPoK3HA7Vq0bBAZuTMZD
W6/Ye2Wg0swrYFHxNJGqeRzSS6KpR1+FAzI1fCzjCsewTq9Gs/N4JpUlqCcDoo7D
GXxZlWdwZJCZ1cCF5BiRP4uIcK6qdI1iwO0lM5hdjhpxsPQJuk7j5P5wNcgktd/j
3uhWpC0ekI0sWsckM1oebcAmGsu7g00ZSFm90j71tGPd/q8JXXFRG6n0Fg7eUi/8
E90uUisl0To2oBlzBlH4+GmZkW2Utr3FDj3/+wDwIbujeZDR+IgRKmln90yMR+z5
hvwx5gdc4VpIv5RMe158FaPsX5NpdMUIU4JN93z0KYtYN63M66Z42N6wLMEHvP0R
qMFyvBR/R7uI7OOGb2UlU2IxZapBjc/ryQVce8tfQ1o5w38mlx0Rjdh31J5+5l2U
cTKTTs29O8akie4zJKcWjtbGQ8W9eGLaMHrTooaGYnlH+9UMVzd88vJeF5kCxfAD
kwL5b2cfsJ6XBox/C0mG+4CjPN+URuhvwCiaCHrw5zGw7UHhRlQZoXlpcKCUfL5l
xPZwUjipL8mN7FUkzn3c/BB+PUPRfg97EDzUWOTLa9iJDcRSJ0LA549pCZQ32yH+
8z2dM64jTqoZA6xEQ2PRri5H+SrZCPOcU/cwk3s/N3oMdM9KuItmIdvRz2fi/8+u
YvfE24KHyql/nA2kgFsu
=MLol
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
