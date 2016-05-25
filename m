From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] dtc: Document the dynamic plugin internals
Date: Wed, 25 May 2016 13:41:04 +1000
Message-ID: <20160525034104.GI17226@voom.fritz.box>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20160524045840.GC29005@voom.fritz.box>
 <53E9201A-5D63-4A8E-8179-F96980F76BED@konsulko.com>
 <20160524105002.GD17226@voom.fritz.box>
 <45A08C18-0368-48B2-B6E3-BC352E345125@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <45A08C18-0368-48B2-B6E3-BC352E345125-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 03:53:07PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On May 24, 2016, at 13:50 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Tue, May 24, 2016 at 10:43:29AM +0300, Pantelis Antoniou wrote:
> >> Hi David,
> >>=20
> >>> On May 24, 2016, at 07:58 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
> >>>=20
> >>> One small nit in the document itself.
> >>>=20
> >>> I have other comments, but they're about the overlay format itself,
> >>> rather than this patch as such.
> >>>=20
> >>=20
> >> OK.
> >>=20
> >>> On Thu, May 05, 2016 at 10:48:41PM +0300, Pantelis Antoniou wrote:
> >>>> Provides the document explaining the internal mechanics of
> >>>> plugins and options.
> >>>>=20
> >>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>>> ---
> >>>> Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++=
++++++++++
> >>>> 1 file changed, 318 insertions(+)
> >>>> create mode 100644 Documentation/dt-object-internal.txt
> >>>>=20
> >>>> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt=
-object-internal.txt
> >>>> new file mode 100644
> >>>> index 0000000..734f447
> >>>> --- /dev/null
> >>>> +++ b/Documentation/dt-object-internal.txt
> >>>> @@ -0,0 +1,318 @@
> >>>> +Device Tree Dynamic Object format internals
> >>>> +-------------------------------------------
> >>>> +
> >>>> +The Device Tree for most platforms is a static representation of
> >>>> +the hardware capabilities. This is insufficient for many platforms
> >>>> +that need to dynamically insert device tree fragments to the
> >>>> +running kernel's live tree.
> >>>> +
> >>>> +This document explains the the device tree object format and the
> >>>> +modifications made to the device tree compiler, which make it possi=
ble.
> >>>> +
> >>>> +1. Simplified Problem Definition
> >>>> +--------------------------------
> >>>> +
> >>>> +Assume we have a platform which boots using following simplified de=
vice tree.
> >>>> +
> >>>> +---- foo.dts ------------------------------------------------------=
-----------
> >>>> +	/* FOO platform */
> >>>> +	/ {
> >>>> +		compatible =3D "corp,foo";
> >>>> +
> >>>> +		/* shared resources */
> >>>> +		res: res {
> >>>> +		};
> >>>> +
> >>>> +		/* On chip peripherals */
> >>>> +		ocp: ocp {
> >>>> +			/* peripherals that are always instantiated */
> >>>> +			peripheral1 { ... };
> >>>> +		};
> >>>> +	};
> >>>> +---- foo.dts ------------------------------------------------------=
-----------
> >>>> +
> >>>> +We have a number of peripherals that after probing (using some unde=
fined method)
> >>>> +should result in different device tree configuration.
> >>>> +
> >>>> +We cannot boot with this static tree because due to the configurati=
on of the
> >>>> +foo platform there exist multiple conficting peripherals DT fragmen=
ts.
> >>>> +
> >>>> +So for the bar peripheral we would have this:
> >>>> +
> >>>> +---- foo+bar.dts --------------------------------------------------=
-----------
> >>>> +	/* FOO platform + bar peripheral */
> >>>> +	/ {
> >>>> +		compatible =3D "corp,foo";
> >>>> +
> >>>> +		/* shared resources */
> >>>> +		res: res {
> >>>> +		};
> >>>> +
> >>>> +		/* On chip peripherals */
> >>>> +		ocp: ocp {
> >>>> +			/* peripherals that are always instantiated */
> >>>> +			peripheral1 { ... };
> >>>> +
> >>>> +			/* bar peripheral */
> >>>> +			bar {
> >>>> +				compatible =3D "corp,bar";
> >>>> +				... /* various properties and child nodes */
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +---- foo+bar.dts --------------------------------------------------=
-----------
> >>>> +
> >>>> +While for the baz peripheral we would have this:
> >>>> +
> >>>> +---- foo+baz.dts --------------------------------------------------=
-----------
> >>>> +	/* FOO platform + baz peripheral */
> >>>> +	/ {
> >>>> +		compatible =3D "corp,foo";
> >>>> +
> >>>> +		/* shared resources */
> >>>> +		res: res {
> >>>> +			/* baz resources */
> >>>> +			baz_res: res_baz { ... };
> >>>> +		};
> >>>> +
> >>>> +		/* On chip peripherals */
> >>>> +		ocp: ocp {
> >>>> +			/* peripherals that are always instantiated */
> >>>> +			peripheral1 { ... };
> >>>> +
> >>>> +			/* baz peripheral */
> >>>> +			baz {
> >>>> +				compatible =3D "corp,baz";
> >>>> +				/* reference to another point in the tree */
> >>>> +				ref-to-res =3D <&baz_res>;
> >>>> +				... /* various properties and child nodes */
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +---- foo+baz.dts --------------------------------------------------=
-----------
> >>>> +
> >>>> +We note that the baz case is more complicated, since the baz periph=
eral needs to
> >>>> +reference another node in the DT tree.
> >>>> +
> >>>> +2. Device Tree Object Format Requirements
> >>>> +-----------------------------------------
> >>>> +
> >>>> +Since the device tree is used for booting a number of very differen=
t hardware
> >>>> +platforms it is imperative that we tread very carefully.
> >>>> +
> >>>> +2.a) No changes to the Device Tree binary format for the base tree.=
 We cannot
> >>>> +modify the tree format at all and all the information we require sh=
ould be
> >>>> +encoded using device tree itself. We can add nodes that can be safe=
ly ignored
> >>>> +by both bootloaders and the kernel. The plugin dtb's are optionally=
 tagged
> >>>> +with a different magic number in the header but otherwise they too =
are simple
> >>>> +blobs.
> >>>> +
> >>>> +2.b) Changes to the DTS source format should be absolutely minimal,=
 and should
> >>>> +only be needed for the DT fragment definitions, and not the base bo=
ot DT.
> >>>> +
> >>>> +2.c) An explicit option should be used to instruct DTC to generate =
the required
> >>>> +information needed for object resolution. Platforms that don't use =
the
> >>>> +dynamic object format can safely ignore it.
> >>>> +
> >>>> +2.d) Finally, DT syntax changes should be kept to a minimum. It sho=
uld be
> >>>> +possible to express everything using the existing DT syntax.
> >>>> +
> >>>> +3. Implementation
> >>>> +-----------------
> >>>> +
> >>>> +The basic unit of addressing in Device Tree is the phandle. Turns o=
ut it's
> >>>> +relatively simple to extend the way phandles are generated and refe=
renced
> >>>> +so that it's possible to dynamically convert symbolic references (l=
abels)
> >>>> +to phandle values. This is a valid assumption as long as the author=
 uses
> >>>> +reference syntax and does not assign phandle values manually (which=
 might
> >>>> +be a problem with decompiled source files).
> >>>> +
> >>>> +We can roughly divide the operation into two steps.
> >>>> +
> >>>> +3.a) Compilation of the base board DTS file using the '-@' option
> >>>> +generates a valid DT blob with an added __symbols__ node at the roo=
t node,
> >>>> +containing a list of all nodes that are marked with a label.
> >>>> +
> >>>> +Using the foo.dts file above the following node will be generated;
> >>>> +
> >>>> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
> >>>> +$ fdtdump foo.dtb
> >>>> +...
> >>>> +/ {
> >>>> +	...
> >>>> +	res {
> >>>> +		...
> >>>> +		phandle =3D <0x00000001>;
> >>>> +		...
> >>>> +	};
> >>>> +	ocp {
> >>>> +		...
> >>>> +		phandle =3D <0x00000002>;
> >>>> +		...
> >>>> +	};
> >>>> +	__symbols__ {
> >>>> +		res=3D"/res";
> >>>> +		ocp=3D"/ocp";
> >>>> +	};
> >>>> +};
> >>>> +
> >>>> +Notice that all the nodes that had a reference have been recorded, =
and that
> >>>=20
> >>> s/reference/label/
> >>>=20
> >>=20
> >> OK
> >>=20
> >>>> +phandles have been generated for them.
> >>>=20
> >>>=20
> >>>> +This blob can be used to boot the board normally, the __symbols__ n=
ode will
> >>>> +be safely ignored both by the bootloader and the kernel (the only l=
oss will
> >>>> +be a few bytes of memory and disk space).
> >>>> +
> >>>> +3.b) The Device Tree fragments must be compiled with the same optio=
n but they
> >>>> +must also have a tag (/plugin/) that allows undefined references to=
 nodes
> >>>> +that are not present at compilation time to be recorded so that the=
 runtime
> >>>> +loader can fix them.
> >>>> +
> >>>> +So the bar peripheral's DTS format would be of the form:
> >>>> +
> >>>> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
> >>>> +/ {
> >>>> +	....	/* various properties for loader use; i.e. part id etc. */
> >>>> +	fragment@0 {
> >>>> +		target =3D <&ocp>;
> >>>> +		__overlay__ {
> >>>> +			/* bar peripheral */
> >>>> +			bar {
> >>>> +				compatible =3D "corp,bar";
> >>>> +				... /* various properties and child nodes */
> >>>> +			}
> >>>> +		};
> >>>> +	};
> >>>> +};
> >>>> +
> >>>> +Note that there's a target property that specifies the location whe=
re the
> >>>> +contents of the overlay node will be placed, and it references the =
node
> >>>> +in the foo.dts file.
> >>>=20
> >>> Ugh.. I really don't like the target stuff appearing in the dts like
> >>> this.  I thought we were changing this so these appeared in the blob,
> >>> but in the source we just used the existing overlay syntax, so for the
> >>> above, something like:
> >>>=20
> >>> &ocp {
> >>> 	...
> >>> };
> >>>=20
> >>=20
> >> This works, but it=E2=80=99s just syntactic sugar.
> >=20
> > Hmmm....  The target=3D property and fragment@ nodes are part of the
> > internal overlay glue, rather than actual DT content.  So, I *really*
> > dislike including it inline in the dts file.  Come to that, I dislike
> > including it in the dtb, but I can see the rationale and we're kind of
> > stuck with it anyway.  The dts, not so much.
> >=20
>=20
> There are more target variants to come, but they don=E2=80=99t require any
> dtc changes.
>=20
> The &label { }; transforms to fragment@0 { target =3D <&label>; __overlay=
__ { }; };
>=20
> >> It does not cover the cases where the target is a path, or a different
> >> kind of target.
> >=20
> > Huh?  It certainly covers the case of a path
> > 	&{/some/path} { ... }
> > What other sort of target did you have in mind?
> >=20
>=20
> That is just not supported right now. There is no phandle to resolve.
>=20
> I=E2=80=99ll take a stab at it, but it will transform to the target-path =
variant.

Right, but my point is there's an obvious dts syntex for
path-targetted fragments.  My inclination is to create syntax for any
new fragment types, rather than expose the encoding of the overlay
metadata as if it were in-band information.

> >> Besides the sugary part, a target is something that doesn=E2=80=99t ha=
ve anything to
> >> do with the plugin format.
> >>=20
> >>> Or have I gotten confused by the history of things.
> >>>=20
> >>=20
> >> It=E2=80=99s got a long history for sure :)
> >>=20
> >>>> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> >>>> +$ fdtdump bar.dtbo
> >>>> +...
> >>>> +/ {
> >>>> +	... /* properties */
> >>>> +	fragment@0 {
> >>>> +		target =3D <0xffffffff>;
> >>>> +		__overlay__ {
> >>>> +			bar {
> >>>> +				compatible =3D "corp,bar";
> >>>> +				... /* various properties and child nodes */
> >>>> +			}
> >>>> +		};
> >>>> +	};
> >>>> +	__fixups__ {
> >>>> +	    ocp =3D "/fragment@0:target:0";
> >>>=20
> >>> I still hate this parse-requiring string, but I guess we're stuck with
> >>> it.
> >>>=20
> >>>> +	};
> >>>> +};
> >>>> +
> >>>> +No __symbols__ has been generated (no label in bar.dts).
> >>>> +Note that the target's ocp label is undefined, so the phandle handle
> >>>> +value is filled with the illegal value '0xffffffff', while a __fixu=
ps__
> >>>> +node has been generated, which marks the location in the tree where
> >>>> +the label lookup should store the runtime phandle value of the ocp =
node.
> >>>> +
> >>>> +The format of the __fixups__ node entry is
> >>>> +
> >>>> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
> >>>> +
> >>>> +<label> 		Is the label we're referring
> >>>> +<local-full-path>	Is the full path of the node the reference is
> >>>> +<property-name>		Is the name of the property containing the
> >>>> +			reference
> >>>> +<offset>		The offset (in bytes) of where the property's
> >>>> +			phandle value is located.
> >>>> +
> >>>> +Doing the same with the baz peripheral's DTS format is a little bit=
 more
> >>>> +involved, since baz contains references to local labels which requi=
re
> >>>> +local fixups.
> >>>> +
> >>>> +/dts-v1/ /plugin/;	/* allow undefined label references and record t=
hem */
> >>>> +/ {
> >>>> +	....	/* various properties for loader use; i.e. part id etc. */
> >>>> +	fragment@0 {
> >>>> +		target =3D <&res>;
> >>>> +		__overlay__ {
> >>>> +			/* baz resources */
> >>>> +			baz_res: res_baz { ... };
> >>>> +		};
> >>>> +	};
> >>>> +	fragment@1 {
> >>>> +		target =3D <&ocp>;
> >>>> +		__overlay__ {
> >>>> +			/* baz peripheral */
> >>>> +			baz {
> >>>> +				compatible =3D "corp,baz";
> >>>> +				/* reference to another point in the tree */
> >>>> +				ref-to-res =3D <&baz_res>;
> >>>> +				... /* various properties and child nodes */
> >>>> +			}
> >>>> +		};
> >>>> +	};
> >>>> +};
> >>>> +
> >>>> +Note that &bar_res reference.
> >>>> +
> >>>> +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
> >>>> +$ fdtdump baz.dtbo
> >>>> +...
> >>>> +/ {
> >>>> +	... /* properties */
> >>>> +	fragment@0 {
> >>>> +		target =3D <0xffffffff>;
> >>>> +		__overlay__ {
> >>>> +			res_baz {
> >>>> +				....
> >>>> +				phandle =3D <0x00000001>;
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +	fragment@1 {
> >>>> +		target =3D <0xffffffff>;
> >>>> +		__overlay__ {
> >>>> +			baz {
> >>>> +				compatible =3D "corp,baz";
> >>>> +				... /* various properties and child nodes */
> >>>> +				ref-to-res =3D <0x00000001>;
> >>>> +			}
> >>>> +		};
> >>>> +	};
> >>>> +	__fixups__ {
> >>>> +		res =3D "/fragment@0:target:0";
> >>>> +		ocp =3D "/fragment@1:target:0";
> >>>> +	};
> >>>> +	__local_fixups__ {
> >>>> +		fragment@1 {
> >>>> +			__overlay__ {
> >>>> +				baz {
> >>>> +					ref-to-res =3D <0>;
> >>>> +				};
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +};
> >>>> +
> >>>> +This is similar to the bar case, but the reference of a local label=
 by the
> >>>> +baz node generates a __local_fixups__ entry that records the place =
that the
> >>>> +local reference is being made. No matter how phandles are allocated=
 from dtc
> >>>> +the run time loader must apply an offset to each phandle in every d=
ynamic
> >>>> +DT object loaded. The __local_fixups__ node records the place of ev=
ery
> >>>> +local reference so that the loader can apply the offset.
> >>>=20
> >>> I'm still utterly baffled why the __local_fixups__ encoding is totally
> >>> different from the __fixups__ encoding.  But, again, stuck with it, I
> >>> guess.
> >>>=20
> >>> I'd really like to see a simplified, consolidated format defined and
> >>> deprecate this one, though.
> >>>=20
> >>=20
> >> I did explain it before, so here it goes again.
> >>=20
> >> Although the names are similar (fixups vs local fixups) the operation
> >> performed on them is completely different.
> >>=20
> >> The fixups are there so that we can resolve symbolic names to phandles=
, while
> >> the local fixups are there to track where local phandles exist in orde=
r to
> >> adjust them to be valid when the overlay is applied.
> >>=20
> >> So:
> >>=20
> >> fixups -> symbolic name to phandle
> >> local fixups -> local phandle locations to be adjusted on resolution
> >=20
> > I get that distinction, but that's not the point.  While the method of
> > adjusting the phandle value is different, both types are a correction
> > to a single phandle value at a specific offset in a specific property.
> >=20
> > In both cases you need to convey the location of a specific phandle
> > value, but that's encoded in a completely different way in each case.
> > That's what bothers me.
> >=20
>=20
> It might be possible for the format to change but it=E2=80=99s just not g=
oing to be the same.

Not identical, no, but it could be much more similar than it is.  For
example:

/{
	fragment@0 {
		target =3D <&somewhere>;
		__overlay__ =3D {
			dev0: dev@0 {
				link =3D <&devx>;
			};
			dev@1 {
				link =3D <&dev0>;
			};
		};
	};
	__fixups__ =3D {
		somewhere =3D "/fragment@0:target:0";
		devx =3D "/fragment@0/__overlay__/dev@0:link:0";
		local,phandles =3D "/fragment@0/__overlay__/dev@1:link:0";
	};
};

(',' is not a valid character for labels, so this is unambiguous).

> There=E2=80=99s no place to put the label reference in the fixup form so =
no code-reuse is
> going to happen.

I don't follow what you mean by this.

> >>>> +There is an alternative syntax to the expanded form for overlays wi=
th phandle
> >>>> +targets which makes the format similar to the one using in .dtsi in=
clude files.
> >>>> +
> >>>> +So for the &ocp target example above one can simply write:
> >>>> +
> >>>> +/dts-v1/ /plugin/;
> >>>> +&ocp {
> >>>> +	/* bar peripheral */
> >>>> +	bar {
> >>>> +		compatible =3D "corp,bar";
> >>>> +		... /* various properties and child nodes */
> >>>> +	}
> >>>> +};
> >>>> +
> >>>> +The resulting dtb object is identical.
> >>>=20
> >>=20
> >> Regards
> >>=20
> >> =E2=80=94 Pantelis
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

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRR7QAAoJEGw4ysog2bOSQjEP/iu5YWDfFqtS+Id7NxU//yQB
H8bsXwUYGmKCD1/YH0BC1R3eXqe4jxVD6iGsGPpVHE3M/ewnB2A+S5V9pG2/e7xH
epkIKJOMASmDakgI1XTJpDItpYhXcXoMB2tCfFljL+Gxbimk2RacW1otuvpxVbNv
WeH5ACElTPyOHslgec/so/mnIqkwj2ShMa0Yhm+w7ahp71gC5nIRSfkrAGzg/J/T
P88Hk0HSH58sR8FlqwdtN1e46rVRnXSvd07zDXse4vM0QQ993K3Eq75VKUYrtZkP
JVjLd0kCH/a3bhMH39m+8ssTcI/os/s1pwRSAlN+tBWJkJlDk59KHAv1LlaI+zSv
197qtF+5c1g20bULonCfHaqwWRQ4LZw1uf+a302Y38JTFPNgU/lCWS1yonin/eqg
5sfeoHZp9423hLdS48Y0x0kcNhgwKpyw9KDGe/l8xXUqEuTT2cmk4vh6v2nCIVc6
FL9x3UI77oznzggUUpdLo5oTFug2VzefNYg7kUam//es/ARAkOF5RrWh+t3kjWDf
XQt66oo1M4H9Ku/zKq1XWcfchGa7B8dkhyoffag9oyDYxso3/vnJGxyW1OQ6jqsK
qH+5frR2RIlfPgshK+/fQ1g2binHtidt3uj88zO9HeGNFh/gnPO485ZZ7LcfdMpk
v47iMXr4E7kIZdVDK3uG
=rJFN
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
