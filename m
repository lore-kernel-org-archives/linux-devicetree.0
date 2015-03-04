From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Document the dynamic plugin internals
Date: Wed, 4 Mar 2015 22:29:20 +1100
Message-ID: <20150304112920.GE18072@voom.fritz.box>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1425063346-14554-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425063346-14554-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 08:55:46PM +0200, Pantelis Antoniou wrote:
> Provides the document explaining the internal mechanics of
> plugins and options.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/dt-object-internal.txt | 301 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 301 insertions(+)
>  create mode 100644 Documentation/dt-object-internal.txt
>=20
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> new file mode 100644
> index 0000000..b5ce9b4
> --- /dev/null
> +++ b/Documentation/dt-object-internal.txt
> @@ -0,0 +1,301 @@
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

I really don't understand this requirement.  I mean, obviously it
makes sense for the "base" dt, since that can be used as-is, ignoring
the overlay stuff.  But the overlay fragments themselves are useless
if not properly processed, in which case what's the point of
maintaining the same dtb format.

It really seems like you're trying to force out-of-band information
into band.  The dt is flexible enough that you *can* do that, but that
doesn't mean it's a good idea.


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
> +		linux,phandle =3D <0x00000001>;
> +		phandle =3D <0x00000001>;
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


So, the __symbols__ node looks an awful lot like the OF-standard
aliases node.  Is there any reason you can't use /aliases for this
instead?  (Automatically generating aliases for nodes with a label is
a dtc feature I've had vaguely in mind since forever).


> +	};
> +};
> +
> +Notice that all the nodes that had a label have been recorded, and that
> +phandles have been generated for them.
> +
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
> +/plugin/;	/* allow undefined label references and record them */
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

The target property is specific to the overlay format.  So specifying
it as a nonsense phandle, which must then be fixed up is silly.  It
should be encoded directly as a symbolic name.


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
> +Note that the target's ocp label is undefined, so the phandle handle
> +value is filled with the illegal value '0xdeadbeef',

0xdeadbeef is not an illegal phandle value.  Use either 0 or -1 if you
need an illegal phandle value.

> while a __fixups__
> +node has been generated, which marks the location in the tree where
> +the label lookup should store the runtime phandle value of the ocp node.
> +
> +The format of the __fixups__ node entry is
> +
> +	<label> =3D "<local-full-path>:<property-name>:<offset>";

Encoding multiple things into parsed text strings, and encoding
numbers into text really doesn't sit well with normal conventions for
encoding dt properties.  You can mix \0 terminated strings and binary
encoded numbers into a single property if necessary, or use multiple
properties.

Worse, this encoding doesn't allow multiple overlay properties to be
fixed up to point to the same label.


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
> +/plugin/;	/* allow undefined label references and record them */
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
> +local reference is being made. Since phandles are allocated
> starting at 1

That's not guaranteed, it's just what the current dtc implementation does.

> +the run time loader must apply an offset to each phandle in every dynamic
> +DT object loaded. The __local_fixups__ node records the place of every
> +local reference so that the loader can apply the offset.

The __local_fixups__ has a totally different format from __fixups__
for doing a very similar operation.  You should be able to unify the
encoding for local and non-local fixups.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU9uyQAAoJEGw4ysog2bOSlmoQAJO191xTSeQdVuCbdJoP2XSF
3Tgdn6EvDplgnSYMpk2mN726bPJo23Z4LCEivWtWjdN8K62vwmW/2h2yZOI09lZ5
eJkaoUoPkEgxY9aGLCjt2XLXpPXhZah6iQDWX34mq2ZhxmQYlRjrO+CQXWwolK4M
+FF2uFkDcjGH0jI+gRu/5ppKX78pBp7gnX6BH4WYK8J7Ddqzk3VYp3EqcWCKbRoa
hXBXQLF67uEAP8qmt7wKQosd649dy3+g6oIyKI4poNExXQSPDv6BvP1dEghCxBcn
1tJTLq3CVYvvz/vRyOTC349IG8FWyEIx9eH1V3UOvu1gyJ23CgP6H2h6B/TslN/T
2cYDjHjjaLpz23h06qO2TrVSLrJAnelF0wYW89+G4ymR+QJXKQfD3Ry8Hx9NvYQv
jW2RC+tCxIk23ubqPnmBzjJgKiejV0UKnupfOt2199H+LEDNhnvjBimFwyGOlaRs
r+sBSN2PQ8pS0hzI9Ss3pQVY8TfNsL0MqTaPNLI4qbBfm/CnnYtsSOMjS9LI7GsY
pa0bwbmceTzjh8NNjxe3L1IVN/pXLRqYb8f/pLPDEafkwvCuImkyWcOTLQBHjD5y
umJluuiRKRECs/M5E3/aKMdYAbshDUB+fXLdfzYScyY8KDmx63hTU/W9InZ1AMKZ
NnAfMEPKzZyJFBtAGnM8
=LUGM
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
