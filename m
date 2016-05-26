From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 09:14:49 +0300
Message-ID: <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5745F95F.6000600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>=20
> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>> Provides the document explaining the internal mechanics of
>> plugins and options.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++=
++++++++++
>> 1 file changed, 318 insertions(+)
>> create mode 100644 Documentation/dt-object-internal.txt
>>=20
>> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt=
-object-internal.txt
>> new file mode 100644
>> index 0000000..d5b841e
>> --- /dev/null
>> +++ b/Documentation/dt-object-internal.txt
>> @@ -0,0 +1,318 @@
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
>> +		};
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
>> +			};
>> +		};
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
>> +			};
>> +		};
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
>> +2.a) No changes to the Device Tree binary format for the base tree.=
 We cannot
>> +modify the tree format at all and all the information we require sh=
ould be
>> +encoded using device tree itself. We can add nodes that can be safe=
ly ignored
>> +by both bootloaders and the kernel. The plugin dtb's are optionally=
 tagged
>> +with a different magic number in the header but otherwise they too =
are simple
>> +blobs.
>> +
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
>> +to phandle values. This is a valid assumption as long as the author=
 uses
>> +reference syntax and does not assign phandle values manually (which=
 might
>> +be a problem with decompiled source files).
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
>> +		phandle =3D <0x00000001>;
>> +		...
>> +	};
>> +	ocp {
>> +		...
>> +		phandle =3D <0x00000002>;
>> +		...
>> +	};
>> +	__symbols__ {
>> +		res=3D"/res";
>> +		ocp=3D"/ocp";
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
 nodes
>> +that are not present at compilation time to be recorded so that the=
 runtime
>> +loader can fix them.
>> +
>> +So the bar peripheral's DTS format would be of the form:
>> +
>> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
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
>=20
>                        };
>=20
>> +		};
>> +	};
>> +};
>=20
> Other than the fact that the above syntax is already in the Linux
> kernel overlay implementation, is there a need for the target
> property and the __overlay__ node?  I haven't figured out what
> extra value they provide.
>=20
> Without those added, the overlay dts becomes simpler (though for a
> multi-node target path example this would be more complex unless a la=
bel
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
>=20

No.

That only works if the overlay is applied in a single platform.

I have working cases where the same overlay is applied on a ppc and a x=
86
platform.


>> +
>> +Note that there's a target property that specifies the location whe=
re the
>> +contents of the overlay node will be placed, and it references the =
node
>> +in the foo.dts file.
>> +
>> +$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
>> +$ fdtdump bar.dtbo
>> +...
>> +/ {
>> +	... /* properties */
>> +	fragment@0 {
>> +		target =3D <0xffffffff>;
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
>> +value is filled with the illegal value '0xffffffff', while a __fixu=
ps__
>> +node has been generated, which marks the location in the tree where
>> +the label lookup should store the runtime phandle value of the ocp =
node.
>> +
>> +The format of the __fixups__ node entry is
>> +
>> +	<label> =3D "<local-full-path>:<property-name>:<offset>";
>> +
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
>> +/dts-v1/ /plugin/;	/* allow undefined label references and record t=
hem */
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
>> +		target =3D <0xffffffff>;
>> +		__overlay__ {
>> +			res_baz {
>> +				....
>> +				phandle =3D <0x00000001>;
>> +			};
>> +		};
>> +	};
>> +	fragment@1 {
>> +		target =3D <0xffffffff>;
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
>> +local reference is being made. No matter how phandles are allocated=
 from dtc
>> +the run time loader must apply an offset to each phandle in every d=
ynamic
>> +DT object loaded. The __local_fixups__ node records the place of ev=
ery
>> +local reference so that the loader can apply the offset.
>> +
>> +There is an alternative syntax to the expanded form for overlays wi=
th phandle
>> +targets which makes the format similar to the one using in .dtsi in=
clude files.
>> +
>> +So for the &ocp target example above one can simply write:
>> +
>> +/dts-v1/ /plugin/;
>> +&ocp {
>> +	/* bar peripheral */
>> +	bar {
>> +		compatible =3D "corp,bar";
>> +		... /* various properties and child nodes */
>> +	}
>> +};
>> +
>> +The resulting dtb object is identical.

Regards

=E2=80=94 Pantelis
