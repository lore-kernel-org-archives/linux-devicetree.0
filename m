From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] dtc: Document the dynamic plugin internals
Date: Tue, 24 May 2016 20:50:02 +1000
Message-ID: <20160524105002.GD17226@voom.fritz.box>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20160524045840.GC29005@voom.fritz.box>
 <53E9201A-5D63-4A8E-8179-F96980F76BED@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53E9201A-5D63-4A8E-8179-F96980F76BED-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 10:43:29AM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On May 24, 2016, at 07:58 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > One small nit in the document itself.
> >=20
> > I have other comments, but they're about the overlay format itself,
> > rather than this patch as such.
> >=20
>=20
> OK.
>=20
> > On Thu, May 05, 2016 at 10:48:41PM +0300, Pantelis Antoniou wrote:
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
> >> index 0000000..734f447
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
> >> +Notice that all the nodes that had a reference have been recorded, an=
d that
> >=20
> > s/reference/label/
> >=20
>=20
> OK
>=20
> >> +phandles have been generated for them.
> >=20
> >=20
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
> >> +
> >> +Note that there's a target property that specifies the location where=
 the
> >> +contents of the overlay node will be placed, and it references the no=
de
> >> +in the foo.dts file.
> >=20
> > Ugh.. I really don't like the target stuff appearing in the dts like
> > this.  I thought we were changing this so these appeared in the blob,
> > but in the source we just used the existing overlay syntax, so for the
> > above, something like:
> >=20
> > &ocp {
> > 	...
> > };
> >=20
>=20
> This works, but it=E2=80=99s just syntactic sugar.

Hmmm....  The target=3D property and fragment@ nodes are part of the
internal overlay glue, rather than actual DT content.  So, I *really*
dislike including it inline in the dts file.  Come to that, I dislike
including it in the dtb, but I can see the rationale and we're kind of
stuck with it anyway.  The dts, not so much.

> It does not cover the cases where the target is a path, or a different
> kind of target.

Huh?  It certainly covers the case of a path
	&{/some/path} { ... }
What other sort of target did you have in mind?

> Besides the sugary part, a target is something that doesn=E2=80=99t have =
anything to
> do with the plugin format.
>=20
> > Or have I gotten confused by the history of things.
> >=20
>=20
> It=E2=80=99s got a long history for sure :)
>=20
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
> >=20
> > I still hate this parse-requiring string, but I guess we're stuck with
> > it.
> >=20
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
> >=20
> > I'm still utterly baffled why the __local_fixups__ encoding is totally
> > different from the __fixups__ encoding.  But, again, stuck with it, I
> > guess.
> >=20
> > I'd really like to see a simplified, consolidated format defined and
> > deprecate this one, though.
> >=20
>=20
> I did explain it before, so here it goes again.
>=20
> Although the names are similar (fixups vs local fixups) the operation
> performed on them is completely different.
>=20
> The fixups are there so that we can resolve symbolic names to phandles, w=
hile
> the local fixups are there to track where local phandles exist in order to
> adjust them to be valid when the overlay is applied.
>=20
> So:
>=20
> fixups -> symbolic name to phandle
> local fixups -> local phandle locations to be adjusted on resolution

I get that distinction, but that's not the point.  While the method of
adjusting the phandle value is different, both types are a correction
to a single phandle value at a specific offset in a specific property.

In both cases you need to convey the location of a specific phandle
value, but that's encoded in a completely different way in each case.
That's what bothers me.

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

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRDHZAAoJEGw4ysog2bOSLYkP/2aA6mw4Vr4B5KumNHMo2zsD
2fNnNm4M9kdnOQie9S1HCfud8i/0NQYyYSRroXUiB7DIVUf0Uc7iYbszBwEnsOkO
oeSclSoIl+JN1CSwgtM3GLnnnK5Jjnsiy28m3VRLGD2AIHAUNlSNpV0Tj2MyK28P
jUQtYbC4dsSPvvy/jR6vyz5SxFbuvQMVSG3ldRDH+UMj+RKLQk+KNlDGVxMnOub/
h+P2KzN/auD+2NP+FZc3qozmWdeAIAMSc0Stoe0H6OGXd3N8Z4ZeF0P/pplrj6kF
SApbsSkM9QIZVOBxn6fM4PDs9/VWbq+8Wm6kUWKdYOJQO3x1UnU0K9eAlm88ZXMi
gan+y/t5neD6xstHtSJwDetuMS3eF+mVU5+SB6X3SA0aonpTEW7SCPjk00m4AnzX
VKtPgWZ7nNDuPXpKWORbjnTwTgB2Smf3afSUyGmcoxDD4Ki5PWr3PzpZWvyB1mVM
wzSB4S1j3gz1WJu0YbE9/ZREv41po4wakXQaOIbyTIjLi+jnssFtKMZIp4lXyLTy
kputAeLAFs/voEnTW6GF0JzZpyaXUNxUmSrkDLiH+sXANTp4r8f7oU3P9/muVwO8
0TO4iUdP2aUWe0csHQkBtr4yUwBv5s+wZItWhfKpqtXlk5EDWh1IjpOc3rdwKIjC
baOJ/h8b6yu/0kP4EQuc
=QCoq
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
