From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Document the dynamic plugin internals
Date: Wed, 4 Mar 2015 15:16:32 +0200
Message-ID: <B7EF9B12-4309-4832-A33B-60E710ED25E6@konsulko.com>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com> <1425063346-14554-4-git-send-email-pantelis.antoniou@konsulko.com> <20150304112920.GE18072@voom.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150304112920.GE18072-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Mar 4, 2015, at 13:29 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
>=20
> On Fri, Feb 27, 2015 at 08:55:46PM +0200, Pantelis Antoniou wrote:
>> Provides the document explaining the internal mechanics of
>> plugins and options.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> Documentation/dt-object-internal.txt | 301 +++++++++++++++++++++++++=
++++++++++
>> 1 file changed, 301 insertions(+)
>> create mode 100644 Documentation/dt-object-internal.txt
>>=20
>> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt=
-object-internal.txt
>> new file mode 100644
>> index 0000000..b5ce9b4
>> --- /dev/null
>> +++ b/Documentation/dt-object-internal.txt
>> @@ -0,0 +1,301 @@
>> +Device Tree Dynamic Object format internals
>> +-------------------------------------------
>> +
>> +The Device Tree for most platforms is a static representation of
>> +the hardware capabilities. This is insufficient for many platforms
>> +that need to dynamically insert device tree fragments to the
>> +running kernel's live tree.
>> +
>> +This document explains the the device tree object format and the
>> +modifications made to the device tree compiler, which make it possi=
ble.
>> +
>> +1. Simplified Problem Definition
>> +--------------------------------
>> +
>> +Assume we have a platform which boots using following simplified de=
vice tree.
>> +
>> +---- foo.dts ------------------------------------------------------=
-----------
>> +	/* FOO platform */
>> +	/ {
>> +		compatible =3D "corp,foo";
>> +
>> +		/* shared resources */
>> +		res: res {
>> +		};
>> +
>> +		/* On chip peripherals */
>> +		ocp: ocp {
>> +			/* peripherals that are always instantiated */
>> +			peripheral1 { ... };
>> +		}
>> +	};
>> +---- foo.dts ------------------------------------------------------=
-----------
>> +
>> +We have a number of peripherals that after probing (using some unde=
fined method)
>> +should result in different device tree configuration.
>> +
>> +We cannot boot with this static tree because due to the configurati=
on of the
>> +foo platform there exist multiple conficting peripherals DT fragmen=
ts.
>> +
>> +So for the bar peripheral we would have this:
>> +
>> +---- foo+bar.dts --------------------------------------------------=
-----------
>> +	/* FOO platform + bar peripheral */
>> +	/ {
>> +		compatible =3D "corp,foo";
>> +
>> +		/* shared resources */
>> +		res: res {
>> +		};
>> +
>> +		/* On chip peripherals */
>> +		ocp: ocp {
>> +			/* peripherals that are always instantiated */
>> +			peripheral1 { ... };
>> +
>> +			/* bar peripheral */
>> +			bar {
>> +				compatible =3D "corp,bar";
>> +				... /* various properties and child nodes */
>> +			}
>> +		}
>> +	};
>> +---- foo+bar.dts --------------------------------------------------=
-----------
>> +
>> +While for the baz peripheral we would have this:
>> +
>> +---- foo+baz.dts --------------------------------------------------=
-----------
>> +	/* FOO platform + baz peripheral */
>> +	/ {
>> +		compatible =3D "corp,foo";
>> +
>> +		/* shared resources */
>> +		res: res {
>> +			/* baz resources */
>> +			baz_res: res_baz { ... };
>> +		};
>> +
>> +		/* On chip peripherals */
>> +		ocp: ocp {
>> +			/* peripherals that are always instantiated */
>> +			peripheral1 { ... };
>> +
>> +			/* baz peripheral */
>> +			baz {
>> +				compatible =3D "corp,baz";
>> +				/* reference to another point in the tree */
>> +				ref-to-res =3D <&baz_res>;
>> +				... /* various properties and child nodes */
>> +			}
>> +		}
>> +	};
>> +---- foo+baz.dts --------------------------------------------------=
-----------
>> +
>> +We note that the baz case is more complicated, since the baz periph=
eral needs to
>> +reference another node in the DT tree.
>> +
>> +2. Device Tree Object Format Requirements
>> +-----------------------------------------
>> +
>> +Since the device tree is used for booting a number of very differen=
t hardware
>> +platforms it is imperative that we tread very carefully.
>> +
>> +2.a) No changes to the Device Tree binary format. We cannot modify =
the tree
>> +format at all and all the information we require should be encoded =
using device
>> +tree itself. We can add nodes that can be safely ignored by both bo=
otloaders and
>> +the kernel.
>=20
> I really don't understand this requirement.  I mean, obviously it
> makes sense for the "base" dt, since that can be used as-is, ignoring
> the overlay stuff.  But the overlay fragments themselves are useless
> if not properly processed, in which case what's the point of
> maintaining the same dtb format.
>=20
> It really seems like you're trying to force out-of-band information
> into band.  The dt is flexible enough that you *can* do that, but tha=
t
> doesn't mean it's a good idea.
>=20

It means that every piece of software that understands DT can be used a=
s is
without any changes to the format.

And IMHO all information that is related to DT should be expressed usin=
g DT only
constructs and not out of band data like memory ranges.

The existence of out-of-band data is owed to the easier processing of t=
hem by
non-DT aware bootloaders, but that that=E2=80=99s anymore the case.

>=20
>> +2.b) Changes to the DTS source format should be absolutely minimal,=
 and should
>> +only be needed for the DT fragment definitions, and not the base bo=
ot DT.
>> +
>> +2.c) An explicit option should be used to instruct DTC to generate =
the required
>> +information needed for object resolution. Platforms that don't use =
the
>> +dynamic object format can safely ignore it.
>> +
>> +2.d) Finally, DT syntax changes should be kept to a minimum. It sho=
uld be
>> +possible to express everything using the existing DT syntax.
>> +
>> +3. Implementation
>> +-----------------
>> +
>> +The basic unit of addressing in Device Tree is the phandle. Turns o=
ut it's
>> +relatively simple to extend the way phandles are generated and refe=
renced
>> +so that it's possible to dynamically convert symbolic references (l=
abels)
>> +to phandle values.
>> +
>> +We can roughly divide the operation into two steps.
>> +
>> +3.a) Compilation of the base board DTS file using the '-@' option
>> +generates a valid DT blob with an added __symbols__ node at the roo=
t node,
>> +containing a list of all nodes that are marked with a label.
>> +
>> +Using the foo.dts file above the following node will be generated;
>> +
>> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
>> +$ fdtdump foo.dtb
>> +...
>> +/ {
>> +	...
>> +	res {
>> +		...
>> +		linux,phandle =3D <0x00000001>;
>> +		phandle =3D <0x00000001>;
>> +		...
>> +	};
>> +	ocp {
>> +		...
>> +		linux,phandle =3D <0x00000002>;
>> +		phandle =3D <0x00000002>;
>> +		...
>> +	};
>> +	__symbols__ {
>> +		res=3D"/res";
>> +		ocp=3D"/ocp";
>=20
>=20
> So, the __symbols__ node looks an awful lot like the OF-standard
> aliases node.  Is there any reason you can't use /aliases for this
> instead?  (Automatically generating aliases for nodes with a label is
> a dtc feature I've had vaguely in mind since forever).
>=20

The point of the aliases node is to add explicitly defined shortcut=20
for locations in the tree, when the symbols node records all the label
instances. If we were to go with the implicit aliases node fill up,
should the existing aliases node definition by the user continue? Cause=
 that
might cause conflicts.

>=20
>> +	};
>> +};
>> +
>> +Notice that all the nodes that had a label have been recorded, and =
that
>> +phandles have been generated for them.
>> +
>> +This blob can be used to boot the board normally, the __symbols__ n=
ode will
>> +be safely ignored both by the bootloader and the kernel (the only l=
oss will
>> +be a few bytes of memory and disk space).
>> +
>> +3.b) The Device Tree fragments must be compiled with the same optio=
n but they
>> +must also have a tag (/plugin/) that allows undefined references to=
 labels
>> +that are not present at compilation time to be recorded so that the=
 runtime
>> +loader can fix them.
>> +
>> +So the bar peripheral's DTS format would be of the form:
>> +
>> +/plugin/;	/* allow undefined label references and record them */
>> +/ {
>> +	....	/* various properties for loader use; i.e. part id etc. */
>> +	fragment@0 {
>> +		target =3D <&ocp>;
>> +		__overlay__ {
>> +			/* bar peripheral */
>> +			bar {
>> +				compatible =3D "corp,bar";
>> +				... /* various properties and child nodes */
>> +			}
>> +		};
>> +	};
>> +};
>> +
>> +Note that there's a target property that specifies the location whe=
re the
>> +contents of the overlay node will be placed, and it references the =
label
>> +in the foo.dts file.
>> +
>> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
>> +$ fdtdump bar.dtbo
>> +...
>> +/ {
>> +	... /* properties */
>> +	fragment@0 {
>> +		target =3D <0xdeadbeef>;
>=20
> The target property is specific to the overlay format.  So specifying
> it as a nonsense phandle, which must then be fixed up is silly.  It
> should be encoded directly as a symbolic name.
>=20

There is nothing specific to the target property for the overlay format=
 per-se.
The 0xdeadbeef value is used as an easily visually identified value tha=
t will
be fixed up by resolution.=20

>=20
>> +		__overlay__ {
>> +			bar {
>> +				compatible =3D "corp,bar";
>> +				... /* various properties and child nodes */
>> +			}
>> +		};
>> +	};
>> +	__fixups__ {
>> +	    ocp =3D "/fragment@0:target:0";
>> +	};
>> +};
>> +
>> +No __symbols__ has been generated (no label in bar.dts).
>> +Note that the target's ocp label is undefined, so the phandle handl=
e
>> +value is filled with the illegal value '0xdeadbeef',
>=20
> 0xdeadbeef is not an illegal phandle value.  Use either 0 or -1 if yo=
u
> need an illegal phandle value.

0xdeadbeef is just used to be easily identified. 0 or -1 can easily be
substituted.
=20
>=20
>> while a __fixups__
>> +node has been generated, which marks the location in the tree where
>> +the label lookup should store the runtime phandle value of the ocp =
node.
>> +
>> +The format of the __fixups__ node entry is
>> +
>> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
>=20
> Encoding multiple things into parsed text strings, and encoding
> numbers into text really doesn't sit well with normal conventions for
> encoding dt properties.  You can mix \0 terminated strings and binary
> encoded numbers into a single property if necessary, or use multiple
> properties.
>=20
> Worse, this encoding doesn't allow multiple overlay properties to be
> fixed up to point to the same label.
>=20

My mistake, the documentation entry is not exactly accurate, there are
multiple entries by label encoded as multiple zero encoded strings.

So that=E2=80=99s

<label> =3D "<local-full-path>:<property-name>:<offset>=E2=80=9D
	[, "<local-full-path>:<property-name>:<offset>=E2=80=9D =E2=80=A6] ;

>=20
>> +<label> 		Is the label we're referring
>> +<local-full-path>	Is the full path of the node the reference is
>> +<property-name>		Is the name of the property containing the
>> +			reference
>> +<offset>		The offset (in bytes) of where the property's
>> +			phandle value is located.
>> +
>> +Doing the same with the baz peripheral's DTS format is a little bit=
 more
>> +involved, since baz contains references to local labels which requi=
re
>> +local fixups.
>> +
>> +/plugin/;	/* allow undefined label references and record them */
>> +/ {
>> +	....	/* various properties for loader use; i.e. part id etc. */
>> +	fragment@0 {
>> +		target =3D <&res>;
>> +		__overlay__ {
>> +			/* baz resources */
>> +			baz_res: res_baz { ... };
>> +		};
>> +	};
>> +	fragment@1 {
>> +		target =3D <&ocp>;
>> +		__overlay__ {
>> +			/* baz peripheral */
>> +			baz {
>> +				compatible =3D "corp,baz";
>> +				/* reference to another point in the tree */
>> +				ref-to-res =3D <&baz_res>;
>> +				... /* various properties and child nodes */
>> +			}
>> +		};
>> +	};
>> +};
>> +
>> +Note that &bar_res reference.
>> +
>> +$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
>> +$ fdtdump baz.dtbo
>> +...
>> +/ {
>> +	... /* properties */
>> +	fragment@0 {
>> +		target =3D <0xdeadbeef>;
>> +		__overlay__ {
>> +			res_baz {
>> +				....
>> +				linux,phandle =3D <0x00000001>;
>> +				phandle =3D <0x00000001>;
>> +			};
>> +		};
>> +	};
>> +	fragment@1 {
>> +		target =3D <0xdeadbeef>;
>> +		__overlay__ {
>> +			baz {
>> +				compatible =3D "corp,baz";
>> +				... /* various properties and child nodes */
>> +				ref-to-res =3D <0x00000001>;
>> +			}
>> +		};
>> +	};
>> +	__fixups__ {
>> +		res =3D "/fragment@0:target:0";
>> +		ocp =3D "/fragment@1:target:0";
>> +	};
>> +	__local_fixups__ {
>> +		fragment@1 {
>> +			__overlay__ {
>> +				baz {
>> +					ref-to-res =3D <0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +This is similar to the bar case, but the reference of a local label=
 by the
>> +baz node generates a __local_fixups__ entry that records the place =
that the
>> +local reference is being made. Since phandles are allocated
>> starting at 1
>=20
> That's not guaranteed, it's just what the current dtc implementation =
does.
>=20

OK, I will remove the reference to the =E2=80=981=E2=80=99 number. It=E2=
=80=99s only there to illustrate
the theory of operation.

>> +the run time loader must apply an offset to each phandle in every d=
ynamic
>> +DT object loaded. The __local_fixups__ node records the place of ev=
ery
>> +local reference so that the loader can apply the offset.
>=20
> The __local_fixups__ has a totally different format from __fixups__
> for doing a very similar operation.  You should be able to unify the
> encoding for local and non-local fixups.
>=20

The __fixups__ and __local_fixups__ are used for completely different o=
perations.

__local_fixups__ contain pointers in the local tree where phandle refer=
ences are
been taken, while __fixups__ contains pointers to the local tree where =
phandle
resolution takes place.

So no, they perform completely different operations.

> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree-co=
mpiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
