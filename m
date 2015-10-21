From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/2] dtc: Document the dynamic plugin internals
Date: Wed, 21 Oct 2015 13:44:26 +1100
Message-ID: <20151021024426.GC15881@voom.fritz.box>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1440614674-7055-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440614674-7055-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 09:44:34PM +0300, Pantelis Antoniou wrote:
> Provides the document explaining the internal mechanics of
> plugins and options.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/dt-object-internal.txt | 317 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 317 insertions(+)
>  create mode 100644 Documentation/dt-object-internal.txt
>=20
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> new file mode 100644
> index 0000000..38a47b6
> --- /dev/null
> +++ b/Documentation/dt-object-internal.txt
> @@ -0,0 +1,317 @@
> +Device Tree Dynamic Object format internals
> +-------------------------------------------
> +
> +The Device Tree for most platforms is a static representation of
> +the hardware capabilities. This is insufficient for many platforms
> +that need to dynamically insert device tree fragments to the
> +running kernel's live tree.
> +
> +This document explains the the device tree object format and the
> +modifications made to the device tree compiler, which make it possible.
> +
> +1. Simplified Problem Definition
> +--------------------------------
> +
> +Assume we have a platform which boots using following simplified device =
tree.
> +
> +---- foo.dts -----------------------------------------------------------=
------
> +	/* FOO platform */
> +	/ {
> +		compatible =3D "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +		}
> +	};
> +---- foo.dts -----------------------------------------------------------=
------
> +
> +We have a number of peripherals that after probing (using some undefined=
 method)
> +should result in different device tree configuration.
> +
> +We cannot boot with this static tree because due to the configuration of=
 the
> +foo platform there exist multiple conficting peripherals DT fragments.
> +
> +So for the bar peripheral we would have this:
> +
> +---- foo+bar.dts -------------------------------------------------------=
------
> +	/* FOO platform + bar peripheral */
> +	/ {
> +		compatible =3D "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +
> +			/* bar peripheral */
> +			bar {
> +				compatible =3D "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		}
> +	};
> +---- foo+bar.dts -------------------------------------------------------=
------
> +
> +While for the baz peripheral we would have this:
> +
> +---- foo+baz.dts -------------------------------------------------------=
------
> +	/* FOO platform + baz peripheral */
> +	/ {
> +		compatible =3D "corp,foo";
> +
> +		/* shared resources */
> +		res: res {
> +			/* baz resources */
> +			baz_res: res_baz { ... };
> +		};
> +
> +		/* On chip peripherals */
> +		ocp: ocp {
> +			/* peripherals that are always instantiated */
> +			peripheral1 { ... };
> +
> +			/* baz peripheral */
> +			baz {
> +				compatible =3D "corp,baz";
> +				/* reference to another point in the tree */
> +				ref-to-res =3D <&baz_res>;
> +				... /* various properties and child nodes */
> +			}
> +		}
> +	};
> +---- foo+baz.dts -------------------------------------------------------=
------
> +
> +We note that the baz case is more complicated, since the baz peripheral =
needs to
> +reference another node in the DT tree.
> +
> +2. Device Tree Object Format Requirements
> +-----------------------------------------
> +
> +Since the device tree is used for booting a number of very different har=
dware
> +platforms it is imperative that we tread very carefully.
> +
> +2.a) No changes to the Device Tree binary format. We cannot modify the t=
ree
> +format at all and all the information we require should be encoded using=
 device
> +tree itself. We can add nodes that can be safely ignored by both bootloa=
ders and
> +the kernel.

I think this is a bit misguided.  For the base tree with extra symbols
information, this makes sense.  But for the actual plugin framents,
it's basically impossible for the kernel to use them without knowing
that they're a plugin and how to apply them.

So I think plugin "dtb"s should be given a new magic number.  I guess
we'll need shims for existing fragments with the old magic number.
But I still think a new magic number should be the default and
recommended approach.

> +2.b) Changes to the DTS source format should be absolutely minimal, and =
should
> +only be needed for the DT fragment definitions, and not the base boot DT.
> +
> +2.c) An explicit option should be used to instruct DTC to generate the r=
equired
> +information needed for object resolution. Platforms that don't use the
> +dynamic object format can safely ignore it.
> +
> +2.d) Finally, DT syntax changes should be kept to a minimum. It should be
> +possible to express everything using the existing DT syntax.
> +
> +3. Implementation
> +-----------------
> +
> +The basic unit of addressing in Device Tree is the phandle. Turns out it=
's
> +relatively simple to extend the way phandles are generated and referenced
> +so that it's possible to dynamically convert symbolic references (labels)
> +to phandle values.

At least provided the dts author always uses reference syntax and
never explicitly assigns phandles.  Unlikely to be an issue with most
hand-authored dts files, but could crop up with decompiled files.

> +We can roughly divide the operation into two steps.
> +
> +3.a) Compilation of the base board DTS file using the '-@' option
> +generates a valid DT blob with an added __symbols__ node at the root nod=
e,
> +containing a list of all nodes that are marked with a label.
> +
> +Using the foo.dts file above the following node will be generated;
> +
> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
> +$ fdtdump foo.dtb
> +...
> +/ {
> +	...
> +	res {
> +		...
> +		linux,phandle =3D <0x00000001>;
> +		phandle =3D <0x00000001>;

Probably not useful to include both forms of the phandle property in
the example.

> +		...
> +	};
> +	ocp {
> +		...
> +		linux,phandle =3D <0x00000002>;
> +		phandle =3D <0x00000002>;
> +		...
> +	};
> +	__symbols__ {
> +		res=3D"/res";
> +		ocp=3D"/ocp";
> +	};
> +};
> +
> +Notice that all the nodes that had a label have been recorded, and that
> +phandles have been generated for them.

Um.. except that your example _doesn't_ show any labels, just node names.

> +This blob can be used to boot the board normally, the __symbols__ node w=
ill
> +be safely ignored both by the bootloader and the kernel (the only loss w=
ill
> +be a few bytes of memory and disk space).
> +
> +3.b) The Device Tree fragments must be compiled with the same option but=
 they
> +must also have a tag (/plugin/) that allows undefined references to labe=
ls
> +that are not present at compilation time to be recorded so that the runt=
ime
> +loader can fix them.
> +
> +So the bar peripheral's DTS format would be of the form:
> +
> +/dts-v1/ /plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target =3D <&ocp>;
> +		__overlay__ {
> +			/* bar peripheral */
> +			bar {
> +				compatible =3D "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};
> +
> +Note that there's a target property that specifies the location where the
> +contents of the overlay node will be placed, and it references the label
> +in the foo.dts file.
> +
> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> +$ fdtdump bar.dtbo
> +...
> +/ {
> +	... /* properties */
> +	fragment@0 {
> +		target =3D <0xdeadbeef>;
> +		__overlay__ {
> +			bar {
> +				compatible =3D "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +	__fixups__ {
> +	    ocp =3D "/fragment@0:target:0";
> +	};
> +};
> +
> +No __symbols__ has been generated (no label in bar.dts).

I'd actually prefer to see all the "special" nodes be created
unconditionally with -@, even if some of them are empty.  Makes it
easier to spot when plugins are in play.

> +Note that the target's ocp label is undefined, so the phandle handle
> +value is filled with the illegal value '0xdeadbeef', while a __fixups__

No longer matches the code which (correctly) uses 0xffffffff instead
of 0xdeafbeef.

> +node has been generated, which marks the location in the tree where
> +the label lookup should store the runtime phandle value of the ocp node.
> +
> +The format of the __fixups__ node entry is
> +
> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
> +
> +<label> 		Is the label we're referring
> +<local-full-path>	Is the full path of the node the reference is
> +<property-name>		Is the name of the property containing the
> +			reference
> +<offset>		The offset (in bytes) of where the property's
> +			phandle value is located.
> +
> +Doing the same with the baz peripheral's DTS format is a little bit more
> +involved, since baz contains references to local labels which require
> +local fixups.
> +
> +/dts-v1/ /plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target =3D <&res>;
> +		__overlay__ {
> +			/* baz resources */
> +			baz_res: res_baz { ... };
> +		};
> +	};
> +	fragment@1 {
> +		target =3D <&ocp>;
> +		__overlay__ {
> +			/* baz peripheral */
> +			baz {
> +				compatible =3D "corp,baz";
> +				/* reference to another point in the tree */
> +				ref-to-res =3D <&baz_res>;
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};
> +
> +Note that &bar_res reference.
> +
> +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
> +$ fdtdump baz.dtbo
> +...
> +/ {
> +	... /* properties */
> +	fragment@0 {
> +		target =3D <0xdeadbeef>;
> +		__overlay__ {
> +			res_baz {
> +				....
> +				linux,phandle =3D <0x00000001>;
> +				phandle =3D <0x00000001>;
> +			};
> +		};
> +	};
> +	fragment@1 {
> +		target =3D <0xdeadbeef>;
> +		__overlay__ {
> +			baz {
> +				compatible =3D "corp,baz";
> +				... /* various properties and child nodes */
> +				ref-to-res =3D <0x00000001>;
> +			}
> +		};
> +	};
> +	__fixups__ {
> +		res =3D "/fragment@0:target:0";
> +		ocp =3D "/fragment@1:target:0";
> +	};
> +	__local_fixups__ {
> +		fragment@1 {
> +			__overlay__ {
> +				baz {
> +					ref-to-res =3D <0>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +This is similar to the bar case, but the reference of a local label by t=
he
> +baz node generates a __local_fixups__ entry that records the place that =
the
> +local reference is being made. No matter how phandles are allocated from=
 dtc
> +the run time loader must apply an offset to each phandle in every dynamic
> +DT object loaded. The __local_fixups__ node records the place of every
> +local reference so that the loader can apply the offset.
> +
> +There is an alternative syntax to the expanded form for overlays with ph=
andle
> +targets which makes the format similar to the one using in .dtsi include=
 files.
> +
> +So for the &ocp target example above one can simply write:
> +
> +/dts-v1/ /plugin/;
> +&ocp {
> +	/* bar peripheral */
> +	bar {
> +		compatible =3D "corp,bar";
> +		... /* various properties and child nodes */
> +	}
> +};
> +
> +The resulting dtb object is identical.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJvwKAAoJEGw4ysog2bOS2QoP/0Q6mJaibSSNJIEbVf+qBj2D
xia7ekwW/6SK6psXE3EV1GePSz9Mbu4uTHITceRwxGJ3SCvIOWU1ebAzxqU9ssFb
hsRWwvTtTG3IOk9c+Wu+8TqugkmLSKwxp0s4SqYVw56Bxri678Yw5lOhyXEUgNeo
sUQ6VM2smL3QHcdMWfH+5Pz35WfseYhAhCqiFzmjjSQggcuK0IKniv2Nw5rC7/A4
6ObxQzAROJF0iV7mi3Pn4ltWwScg37QAnPXGshQS7JoPLxxmCun5m9ev1wkwCjN/
6PD3t6rDS0DnK6bx0OiImdg9h91mnT3zoRfgI02lCGOy5qqo+JC0D7P9nnkk2xeU
4hEB22UgpIyX9tJs/sY1eyBOs4p13zvakDqx88omUg6BTgOTWtfAobUvFnwGOKO1
vE0ShnT1fWPiHszRjcoxrTKWaWg3h1amc1dAMnWRBaNYvfNYmETpnhhOABgh3kXn
q8vDEtuViymC9gVT8Ql1akkuRJ9rzKkQ5S3luZqY7yB1HyvR9GG80cCPqYLsmnFY
YaHCzGgAG0q24+tcwRJXSD98yBSGG1nZT4nYCaTbc6eOM8HwjAJmjJCdppwbkDuv
nJO4DxvRUUulSQ+4igAZA2J9WwLDGxayqV+85weEDHmhDjreXQanPz2RoiimPBcb
giWNVUo9U0RVu/+3tZcG
=L4fJ
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
