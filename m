From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 14:58:01 +1000
Message-ID: <20160526045801.GD17226@voom.fritz.box>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com>
 <5745F95F.6000600@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QBJnsLb0QyYEYRYK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5745F95F.6000600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--QBJnsLb0QyYEYRYK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 12:13:35PM -0700, Frank Rowand wrote:
> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
> > Provides the document explaining the internal mechanics of
> > plugins and options.
> >=20
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 318 insertions(+)
> >  create mode 100644 Documentation/dt-object-internal.txt
> >=20
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
> > +that need to dynamically insert device tree fragments to the
> > +running kernel's live tree.
> > +
> > +This document explains the the device tree object format and the
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
> > +	/* FOO platform */
> > +	/ {
> > +		compatible =3D "corp,foo";
> > +
> > +		/* shared resources */
> > +		res: res {
> > +		};
> > +
> > +		/* On chip peripherals */
> > +		ocp: ocp {
> > +			/* peripherals that are always instantiated */
> > +			peripheral1 { ... };
> > +		};
> > +	};
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
> > +	/* FOO platform + bar peripheral */
> > +	/ {
> > +		compatible =3D "corp,foo";
> > +
> > +		/* shared resources */
> > +		res: res {
> > +		};
> > +
> > +		/* On chip peripherals */
> > +		ocp: ocp {
> > +			/* peripherals that are always instantiated */
> > +			peripheral1 { ... };
> > +
> > +			/* bar peripheral */
> > +			bar {
> > +				compatible =3D "corp,bar";
> > +				... /* various properties and child nodes */
> > +			};
> > +		};
> > +	};
> > +---- foo+bar.dts -----------------------------------------------------=
--------
> > +
> > +While for the baz peripheral we would have this:
> > +
> > +---- foo+baz.dts -----------------------------------------------------=
--------
> > +	/* FOO platform + baz peripheral */
> > +	/ {
> > +		compatible =3D "corp,foo";
> > +
> > +		/* shared resources */
> > +		res: res {
> > +			/* baz resources */
> > +			baz_res: res_baz { ... };
> > +		};
> > +
> > +		/* On chip peripherals */
> > +		ocp: ocp {
> > +			/* peripherals that are always instantiated */
> > +			peripheral1 { ... };
> > +
> > +			/* baz peripheral */
> > +			baz {
> > +				compatible =3D "corp,baz";
> > +				/* reference to another point in the tree */
> > +				ref-to-res =3D <&baz_res>;
> > +				... /* various properties and child nodes */
> > +			};
> > +		};
> > +	};
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
> > +with a different magic number in the header but otherwise they too are=
 simple
> > +blobs.
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
> > +	...
> > +	res {
> > +		...
> > +		phandle =3D <0x00000001>;
> > +		...
> > +	};
> > +	ocp {
> > +		...
> > +		phandle =3D <0x00000002>;
> > +		...
> > +	};
> > +	__symbols__ {
> > +		res=3D"/res";
> > +		ocp=3D"/ocp";
> > +	};
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
> > +/dts-v1/ /plugin/;	/* allow undefined references and record them */
> > +/ {
> > +	....	/* various properties for loader use; i.e. part id etc. */
> > +	fragment@0 {
> > +		target =3D <&ocp>;
> > +		__overlay__ {
> > +			/* bar peripheral */
> > +			bar {
> > +				compatible =3D "corp,bar";
> > +				... /* various properties and child nodes */
> > +			}
>=20
>                         };
>=20
> > +		};
> > +	};
> > +};
>=20
> Other than the fact that the above syntax is already in the Linux
> kernel overlay implementation, is there a need for the target
> property and the __overlay__ node?  I haven't figured out what
> extra value they provide.

I've been assuming that the fact the syntax is already used in the
kernel was the main reason here.

> Without those added, the overlay dts becomes simpler (though for a
> multi-node target path example this would be more complex unless a label
> was used for the target node):
>=20
> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	ocp {
> +			/* bar peripheral */
> +			bar {
> +				compatible =3D "corp,bar";
> +				... /* various properties and child nodes */
> +			};
> +	};
> +};

Hmm, that is simpler - and avoids the rather silly fact in the current
version that there's a basically useless phandle value here - it will
always be -1 and have to be resolved using data elsewhere.

That said, I'm not sure the change is enough of a win to recommend
changing it given that the __overlay__ format is in use in the wild.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QBJnsLb0QyYEYRYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRoJZAAoJEGw4ysog2bOS9xgQALxFiIgbIV0FjhHrqsW2PA7E
rxh4t2cfaFpc3gCa7oZ70Sip583X/65IMlnBMcIG27vgjCfPnjTzW+VUMmFseLJ6
kJmoUfQPbYM0dmwguYKLa4+D5bGmx0ZjnSQ6keyWjSusmTLKd1dH4aMvmaOw1Uj+
RRl69OCcZ8DYD0wmd/PI3dv9FYM+M4sQ8JLXsVD+yxSYlOWOcZpwUd6mPnrF2rks
HLJQft1KjFtMW3M6O0VUz0wrFbm6fiCKIiopkdrtUlH/LtpY7z4hAnMoRdJtcXPh
IdOdDyq029S2IPtyVxvpUY57XN1R9wqPQlYRo4xKyV5FDlFVXOVp8LPoSSG1/HVs
kwbBUP45UDTPyUuQlVzyx63RGG1o8nAYVL9i8ncXvCZiILOrX6HCqWPF/PO7zVd+
1bdZot7L+EGp4Qqg07I8JeTUIEsjdOLkCQ2skhfkVm4YFy6GPUujcrtkF3PaKI3t
/JVlaaEtTl022UYnNlpjx8EPk44Xm+7kj750LaLgX9H8eJfbqBVPrPIbY4H4qq3j
2qb5GPNr+seorP8zhWmnHCgHOtxKAVtaC2+C83smqx972m3jEiM/e84S1FqCCxPr
fOwahY+fehd35loLt3f6VUg/ni5qJp4ROKY3jYES+lh5xFUsTBFmlxs5Zmoq9rYg
WUOQd2cAj0HgJ7QWbxKo
=EbOJ
-----END PGP SIGNATURE-----

--QBJnsLb0QyYEYRYK--
