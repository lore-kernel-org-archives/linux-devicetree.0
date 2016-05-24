From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] dtc: Document the dynamic plugin internals
Date: Tue, 24 May 2016 14:58:40 +1000
Message-ID: <20160524045840.GC29005@voom.fritz.box>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462477724-8092-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

One small nit in the document itself.

I have other comments, but they're about the overlay format itself,
rather than this patch as such.

On Thu, May 05, 2016 at 10:48:41PM +0300, Pantelis Antoniou wrote:
> Provides the document explaining the internal mechanics of
> plugins and options.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 318 insertions(+)
>  create mode 100644 Documentation/dt-object-internal.txt
>=20
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> new file mode 100644
> index 0000000..734f447
> --- /dev/null
> +++ b/Documentation/dt-object-internal.txt
> @@ -0,0 +1,318 @@
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
> +		};
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
> +			};
> +		};
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
> +			};
> +		};
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
> +2.a) No changes to the Device Tree binary format for the base tree. We c=
annot
> +modify the tree format at all and all the information we require should =
be
> +encoded using device tree itself. We can add nodes that can be safely ig=
nored
> +by both bootloaders and the kernel. The plugin dtb's are optionally tagg=
ed
> +with a different magic number in the header but otherwise they too are s=
imple
> +blobs.
> +
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
> +to phandle values. This is a valid assumption as long as the author uses
> +reference syntax and does not assign phandle values manually (which might
> +be a problem with decompiled source files).
> +
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
> +		phandle =3D <0x00000001>;
> +		...
> +	};
> +	ocp {
> +		...
> +		phandle =3D <0x00000002>;
> +		...
> +	};
> +	__symbols__ {
> +		res=3D"/res";
> +		ocp=3D"/ocp";
> +	};
> +};
> +
> +Notice that all the nodes that had a reference have been recorded, and t=
hat

s/reference/label/

> +phandles have been generated for them.


> +This blob can be used to boot the board normally, the __symbols__ node w=
ill
> +be safely ignored both by the bootloader and the kernel (the only loss w=
ill
> +be a few bytes of memory and disk space).
> +
> +3.b) The Device Tree fragments must be compiled with the same option but=
 they
> +must also have a tag (/plugin/) that allows undefined references to nodes
> +that are not present at compilation time to be recorded so that the runt=
ime
> +loader can fix them.
> +
> +So the bar peripheral's DTS format would be of the form:
> +
> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
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
> +contents of the overlay node will be placed, and it references the node
> +in the foo.dts file.

Ugh.. I really don't like the target stuff appearing in the dts like
this.  I thought we were changing this so these appeared in the blob,
but in the source we just used the existing overlay syntax, so for the
above, something like:

&ocp {
	...
};

Or have I gotten confused by the history of things.

> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
> +$ fdtdump bar.dtbo
> +...
> +/ {
> +	... /* properties */
> +	fragment@0 {
> +		target =3D <0xffffffff>;
> +		__overlay__ {
> +			bar {
> +				compatible =3D "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +	__fixups__ {
> +	    ocp =3D "/fragment@0:target:0";

I still hate this parse-requiring string, but I guess we're stuck with
it.

> +	};
> +};
> +
> +No __symbols__ has been generated (no label in bar.dts).
> +Note that the target's ocp label is undefined, so the phandle handle
> +value is filled with the illegal value '0xffffffff', while a __fixups__
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
> +		target =3D <0xffffffff>;
> +		__overlay__ {
> +			res_baz {
> +				....
> +				phandle =3D <0x00000001>;
> +			};
> +		};
> +	};
> +	fragment@1 {
> +		target =3D <0xffffffff>;
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

I'm still utterly baffled why the __local_fixups__ encoding is totally
different from the __fixups__ encoding.  But, again, stuck with it, I
guess.

I'd really like to see a simplified, consolidated format defined and
deprecate this one, though.

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

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXQ99/AAoJEGw4ysog2bOS47kP/3FWf7Ko6zAT9OFxDLnGvvOS
b8T/pxGU4ac95fbuJIlq1PiWGluXS2Tf3YCRSlVrsyRGyFnmYVot3gu0rbQJnmt0
yf9i1yst7Vc9wKstdMB2jQD1PiQMyrQ2wv8ClkfpGhOvpgaxjiBCzmmwk/cSEGH9
zGQn5ZSI9k7KDlJD2lrAZMCS1jDZeXjMep1nxzJ4lTEn4y85KA7BgaG4Hg/Tnzki
yhSCIVrKLrTvhFVUhmQ8anDoyhN7KlYY04rBxlPmc+kACGySNqvLcjmN/ptDwFdU
09SedHl/R9f2RAh5VZFBbOuYMXTnhgoWhPBwBHbU0X4sP1S52hp2eQAb99qOrorG
a/XxL7elMOfv1LAnR/ER5kZ/UCouhWVfCSHk2lMgIEOQyhi+cYynvj1g4sZ6ASyL
w8QY/s8i+P4of4K+shuYch9Czxqf49d7044MzcFECY2cljv3I9pwdCqlEZjk4O+C
cVD0Wk3rlYWUxCB0IXqzLFYZvCY1S9sdTi5wHrFFJhm3ZmBJZghI2l31fYjo9qjn
BsV4Hb+S+dGx3sfCq/xu4d7m+dSREIZJTVo7ibbjhTNhNph5vMmOT9nhjXvJGAIN
Vqvu+7Gnjl8qv6lK0rkjw2wM4z31L3Ak6+Lmo3ECOC2c3KVRK8w0BBMZQ5NB9Mc6
roijURT+c8pnx6x3QjPT
=mo1C
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
