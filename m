From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Document the dynamic plugin internals
Date: Thu, 5 Mar 2015 09:51:49 +1100
Message-ID: <20150304225149.GH18072@voom.fritz.box>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1425063346-14554-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20150304112920.GE18072@voom.fritz.box>
 <B7EF9B12-4309-4832-A33B-60E710ED25E6@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B7EF9B12-4309-4832-A33B-60E710ED25E6-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 03:16:32PM +0200, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Mar 4, 2015, at 13:29 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >=20
> > On Fri, Feb 27, 2015 at 08:55:46PM +0200, Pantelis Antoniou wrote:
> >> Provides the document explaining the internal mechanics of
> >> plugins and options.
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >> Documentation/dt-object-internal.txt | 301 +++++++++++++++++++++++++++=
++++++++
> >> 1 file changed, 301 insertions(+)
> >> create mode 100644 Documentation/dt-object-internal.txt
> >>=20
> >> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-o=
bject-internal.txt
> >> new file mode 100644
> >> index 0000000..b5ce9b4
> >> --- /dev/null
> >> +++ b/Documentation/dt-object-internal.txt
> >> @@ -0,0 +1,301 @@
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
> >> +		}
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
> >> +			}
> >> +		}
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
> >> +			}
> >> +		}
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
> >> +2.a) No changes to the Device Tree binary format. We cannot modify th=
e tree
> >> +format at all and all the information we require should be encoded us=
ing device
> >> +tree itself. We can add nodes that can be safely ignored by both boot=
loaders and
> >> +the kernel.
> >=20
> > I really don't understand this requirement.  I mean, obviously it
> > makes sense for the "base" dt, since that can be used as-is, ignoring
> > the overlay stuff.  But the overlay fragments themselves are useless
> > if not properly processed, in which case what's the point of
> > maintaining the same dtb format.
> >=20
> > It really seems like you're trying to force out-of-band information
> > into band.  The dt is flexible enough that you *can* do that, but that
> > doesn't mean it's a good idea.
> >=20
>=20
> It means that every piece of software that understands DT can be used as =
is
> without any changes to the format.

No, only those pieces of software that process the dtb format, but
don't actually do anything with the tree content continue to work.
Software which wants to actually make sense of the tree will *think*
they understand the format, but be horribly mistaken.

So, apart from dtc itself, what software in the first category did
you have in mind.

> And IMHO all information that is related to DT should be expressed using =
DT only
> constructs and not out of band data like memory ranges.

You're going to have to back up your HO with better reasons that
you've given so far..

> The existence of out-of-band data is owed to the easier processing of the=
m by
> non-DT aware bootloaders, but that that=E2=80=99s anymore the case.
>=20
> >=20
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
> >> +to phandle values.
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
> >> +		linux,phandle =3D <0x00000001>;
> >> +		phandle =3D <0x00000001>;
> >> +		...
> >> +	};
> >> +	ocp {
> >> +		...
> >> +		linux,phandle =3D <0x00000002>;
> >> +		phandle =3D <0x00000002>;
> >> +		...
> >> +	};
> >> +	__symbols__ {
> >> +		res=3D"/res";
> >> +		ocp=3D"/ocp";
> >=20
> >=20
> > So, the __symbols__ node looks an awful lot like the OF-standard
> > aliases node.  Is there any reason you can't use /aliases for this
> > instead?  (Automatically generating aliases for nodes with a label is
> > a dtc feature I've had vaguely in mind since forever).
> >=20
>=20
> The point of the aliases node is to add explicitly defined shortcut=20
> for locations in the tree, when the symbols node records all the label
> instances. If we were to go with the implicit aliases node fill up,
> should the existing aliases node definition by the user continue? Cause t=
hat
> might cause conflicts.

Automatically putting every node label into aliases might cause
problems, yes.  But it's also not clear that making every label
available for use by overlays is a good idea.  What I had in mind was
some way of tagging labels to say that they're exported, meaning they
go into aliases.

>=20
> >=20
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
> >> +must also have a tag (/plugin/) that allows undefined references to l=
abels
> >> +that are not present at compilation time to be recorded so that the r=
untime
> >> +loader can fix them.
> >> +
> >> +So the bar peripheral's DTS format would be of the form:
> >> +
> >> +/plugin/;	/* allow undefined label references and record them */
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
> >> +contents of the overlay node will be placed, and it references the la=
bel
> >> +in the foo.dts file.
> >> +
> >> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> >> +$ fdtdump bar.dtbo
> >> +...
> >> +/ {
> >> +	... /* properties */
> >> +	fragment@0 {
> >> +		target =3D <0xdeadbeef>;
> >=20
> > The target property is specific to the overlay format.  So specifying
> > it as a nonsense phandle, which must then be fixed up is silly.  It
> > should be encoded directly as a symbolic name.
>=20
> There is nothing specific to the target property for the overlay format p=
er-se.
> The 0xdeadbeef value is used as an easily visually identified value that =
will
> be fixed up by resolution.

What I mean is that there isn't a previous standard defining the
format of the target property, which means you can format it however
you like.  In which case making it a phandle which will always needing
fixing up is stupid.  Make it be a symbolic name which you can resolve
directly.

>=20
> >=20
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
> >> +value is filled with the illegal value '0xdeadbeef',
> >=20
> > 0xdeadbeef is not an illegal phandle value.  Use either 0 or -1 if you
> > need an illegal phandle value.
>=20
> 0xdeadbeef is just used to be easily identified. 0 or -1 can easily be
> substituted.
> =20
> >=20
> >> while a __fixups__
> >> +node has been generated, which marks the location in the tree where
> >> +the label lookup should store the runtime phandle value of the ocp no=
de.
> >> +
> >> +The format of the __fixups__ node entry is
> >> +
> >> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
> >=20
> > Encoding multiple things into parsed text strings, and encoding
> > numbers into text really doesn't sit well with normal conventions for
> > encoding dt properties.  You can mix \0 terminated strings and binary
> > encoded numbers into a single property if necessary, or use multiple
> > properties.
> >=20
> > Worse, this encoding doesn't allow multiple overlay properties to be
> > fixed up to point to the same label.
> >=20
>=20
> My mistake, the documentation entry is not exactly accurate, there are
> multiple entries by label encoded as multiple zero encoded strings.
>=20
> So that=E2=80=99s
>=20
> <label> =3D "<local-full-path>:<property-name>:<offset>=E2=80=9D
> 	[, "<local-full-path>:<property-name>:<offset>=E2=80=9D =E2=80=A6] ;

Ok.  The format still doesn't sit well with DT conventions.

> >=20
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
> >> +/plugin/;	/* allow undefined label references and record them */
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
> >> +		target =3D <0xdeadbeef>;
> >> +		__overlay__ {
> >> +			res_baz {
> >> +				....
> >> +				linux,phandle =3D <0x00000001>;
> >> +				phandle =3D <0x00000001>;
> >> +			};
> >> +		};
> >> +	};
> >> +	fragment@1 {
> >> +		target =3D <0xdeadbeef>;
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
> >> +local reference is being made. Since phandles are allocated
> >> starting at 1
> >=20
> > That's not guaranteed, it's just what the current dtc implementation do=
es.
> >=20
>=20
> OK, I will remove the reference to the =E2=80=981=E2=80=99 number. It=E2=
=80=99s only there to illustrate
> the theory of operation.
>=20
> >> +the run time loader must apply an offset to each phandle in every dyn=
amic
> >> +DT object loaded. The __local_fixups__ node records the place of every
> >> +local reference so that the loader can apply the offset.
> >=20
> > The __local_fixups__ has a totally different format from __fixups__
> > for doing a very similar operation.  You should be able to unify the
> > encoding for local and non-local fixups.
> >=20
>=20
> The __fixups__ and __local_fixups__ are used for completely different ope=
rations.
>=20
> __local_fixups__ contain pointers in the local tree where phandle referen=
ces are
> been taken, while __fixups__ contains pointers to the local tree where ph=
andle
> resolution takes place.

> So no, they perform completely different operations.

I'm not sure quite what distinction you're making between "references
are been taken" and "phandle resolution".  But as far as I can tell
both local and non-local fixups involve taking a phandle value in the
local fragment and correcting it in some way, which sound like pretty
similar operations to me.

But even to the extent that they're different, your own description
above says both involve a pointer to the local tree.  But you've
encoded that pointer to the local tree in a completely different way
in the two cases, which is idiotic.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU94yFAAoJEGw4ysog2bOSxskP/2+ZSuVRVUtTRn0y8/wVY0xk
tGVbVihX0/jhpQvEgLvBWMNvLFXSwGgzG1Z4H6mKVDgGA/WB8NKBe2mKx7kgnQx2
S1hG8aN2XovtqrcYklX8z4zpcVVCTccheBqsUgJUbNeUsmYrNMdXduG3nN8j2ic5
+8d6aExkGaOjX2j7Z9FDMNDn32fGkWoLQ6OI80jUio/+gg5D+sDXi13cp7FC0TpZ
gSsNqeN0T1VUXpY41Y2efMcW2CuIl2LlOxZpeF0a/eWvZw4fZWWb2LfLxYkOm0PN
3rsIeulr65uSVDZ7IxORscoLcHDthEtJPKOnU/KAs4gn1Wt2/QJaEl219A4cHtNp
z+eo+/CI2HZX1YjVTyaS/4fOVaxmvP1K5C5wiAsab/CklCks8dZMRzYPm2Rh1Med
vEzYcEf5pEWTNNIaFn2wIQ3KOPBxJyzWgysiplHsVDA92skiiry7Q62YgxOARTQ4
51qa9ptHVma9TMugupMwXb/32NsliGCoTuU+h0X2DnWOsQpFPJf573qztZ7P/CO8
aWFIj+tsUK9ZnRir0csTgK+Il28dbKaLTUxiIldW5XbvwPRAo85uaE7+xmxky2CG
HzYOpJo4dAwEm7pGCRBlMEBEMvla4K+xNTYKNDfCMWEloVCrxLZSRkD3qsrO2E5a
hjKy6Eu1zX0akNfKTVj7
=rBkV
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
