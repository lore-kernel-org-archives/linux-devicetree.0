From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 09:16:45 +0300
Message-ID: <385BDFB4-A23F-4B2C-9ACB-DFD78C6E1500@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com> <20160526045801.GD17226@voom.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160526045801.GD17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On May 26, 2016, at 07:58 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
>=20
> On Wed, May 25, 2016 at 12:13:35PM -0700, Frank Rowand wrote:
>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>> Provides the document explaining the internal mechanics of
>>> plugins and options.
>>>=20
>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> ---
>>> Documentation/dt-object-internal.txt | 318 ++++++++++++++++++++++++=
+++++++++++
>>> 1 file changed, 318 insertions(+)
>>> create mode 100644 Documentation/dt-object-internal.txt
>>>=20
>>> diff --git a/Documentation/dt-object-internal.txt b/Documentation/d=
t-object-internal.txt
>>> new file mode 100644
>>> index 0000000..d5b841e
>>> --- /dev/null
>>> +++ b/Documentation/dt-object-internal.txt
>>> @@ -0,0 +1,318 @@
>>> +Device Tree Dynamic Object format internals
>>> +-------------------------------------------
>>> +
>>> +The Device Tree for most platforms is a static representation of
>>> +the hardware capabilities. This is insufficient for many platforms
>>> +that need to dynamically insert device tree fragments to the
>>> +running kernel's live tree.
>>> +
>>> +This document explains the the device tree object format and the
>>> +modifications made to the device tree compiler, which make it poss=
ible.
>>> +
>>> +1. Simplified Problem Definition
>>> +--------------------------------
>>> +
>>> +Assume we have a platform which boots using following simplified d=
evice tree.
>>> +
>>> +---- foo.dts -----------------------------------------------------=
------------
>>> +	/* FOO platform */
>>> +	/ {
>>> +		compatible =3D "corp,foo";
>>> +
>>> +		/* shared resources */
>>> +		res: res {
>>> +		};
>>> +
>>> +		/* On chip peripherals */
>>> +		ocp: ocp {
>>> +			/* peripherals that are always instantiated */
>>> +			peripheral1 { ... };
>>> +		};
>>> +	};
>>> +---- foo.dts -----------------------------------------------------=
------------
>>> +
>>> +We have a number of peripherals that after probing (using some und=
efined method)
>>> +should result in different device tree configuration.
>>> +
>>> +We cannot boot with this static tree because due to the configurat=
ion of the
>>> +foo platform there exist multiple conficting peripherals DT fragme=
nts.
>>> +
>>> +So for the bar peripheral we would have this:
>>> +
>>> +---- foo+bar.dts -------------------------------------------------=
------------
>>> +	/* FOO platform + bar peripheral */
>>> +	/ {
>>> +		compatible =3D "corp,foo";
>>> +
>>> +		/* shared resources */
>>> +		res: res {
>>> +		};
>>> +
>>> +		/* On chip peripherals */
>>> +		ocp: ocp {
>>> +			/* peripherals that are always instantiated */
>>> +			peripheral1 { ... };
>>> +
>>> +			/* bar peripheral */
>>> +			bar {
>>> +				compatible =3D "corp,bar";
>>> +				... /* various properties and child nodes */
>>> +			};
>>> +		};
>>> +	};
>>> +---- foo+bar.dts -------------------------------------------------=
------------
>>> +
>>> +While for the baz peripheral we would have this:
>>> +
>>> +---- foo+baz.dts -------------------------------------------------=
------------
>>> +	/* FOO platform + baz peripheral */
>>> +	/ {
>>> +		compatible =3D "corp,foo";
>>> +
>>> +		/* shared resources */
>>> +		res: res {
>>> +			/* baz resources */
>>> +			baz_res: res_baz { ... };
>>> +		};
>>> +
>>> +		/* On chip peripherals */
>>> +		ocp: ocp {
>>> +			/* peripherals that are always instantiated */
>>> +			peripheral1 { ... };
>>> +
>>> +			/* baz peripheral */
>>> +			baz {
>>> +				compatible =3D "corp,baz";
>>> +				/* reference to another point in the tree */
>>> +				ref-to-res =3D <&baz_res>;
>>> +				... /* various properties and child nodes */
>>> +			};
>>> +		};
>>> +	};
>>> +---- foo+baz.dts -------------------------------------------------=
------------
>>> +
>>> +We note that the baz case is more complicated, since the baz perip=
heral needs to
>>> +reference another node in the DT tree.
>>> +
>>> +2. Device Tree Object Format Requirements
>>> +-----------------------------------------
>>> +
>>> +Since the device tree is used for booting a number of very differe=
nt hardware
>>> +platforms it is imperative that we tread very carefully.
>>> +
>>> +2.a) No changes to the Device Tree binary format for the base tree=
=2E We cannot
>>> +modify the tree format at all and all the information we require s=
hould be
>>> +encoded using device tree itself. We can add nodes that can be saf=
ely ignored
>>> +by both bootloaders and the kernel. The plugin dtb's are optionall=
y tagged
>>> +with a different magic number in the header but otherwise they too=
 are simple
>>> +blobs.
>>> +
>>> +2.b) Changes to the DTS source format should be absolutely minimal=
, and should
>>> +only be needed for the DT fragment definitions, and not the base b=
oot DT.
>>> +
>>> +2.c) An explicit option should be used to instruct DTC to generate=
 the required
>>> +information needed for object resolution. Platforms that don't use=
 the
>>> +dynamic object format can safely ignore it.
>>> +
>>> +2.d) Finally, DT syntax changes should be kept to a minimum. It sh=
ould be
>>> +possible to express everything using the existing DT syntax.
>>> +
>>> +3. Implementation
>>> +-----------------
>>> +
>>> +The basic unit of addressing in Device Tree is the phandle. Turns =
out it's
>>> +relatively simple to extend the way phandles are generated and ref=
erenced
>>> +so that it's possible to dynamically convert symbolic references (=
labels)
>>> +to phandle values. This is a valid assumption as long as the autho=
r uses
>>> +reference syntax and does not assign phandle values manually (whic=
h might
>>> +be a problem with decompiled source files).
>>> +
>>> +We can roughly divide the operation into two steps.
>>> +
>>> +3.a) Compilation of the base board DTS file using the '-@' option
>>> +generates a valid DT blob with an added __symbols__ node at the ro=
ot node,
>>> +containing a list of all nodes that are marked with a label.
>>> +
>>> +Using the foo.dts file above the following node will be generated;
>>> +
>>> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
>>> +$ fdtdump foo.dtb
>>> +...
>>> +/ {
>>> +	...
>>> +	res {
>>> +		...
>>> +		phandle =3D <0x00000001>;
>>> +		...
>>> +	};
>>> +	ocp {
>>> +		...
>>> +		phandle =3D <0x00000002>;
>>> +		...
>>> +	};
>>> +	__symbols__ {
>>> +		res=3D"/res";
>>> +		ocp=3D"/ocp";
>>> +	};
>>> +};
>>> +
>>> +Notice that all the nodes that had a label have been recorded, and=
 that
>>> +phandles have been generated for them.
>>> +
>>> +This blob can be used to boot the board normally, the __symbols__ =
node will
>>> +be safely ignored both by the bootloader and the kernel (the only =
loss will
>>> +be a few bytes of memory and disk space).
>>> +
>>> +3.b) The Device Tree fragments must be compiled with the same opti=
on but they
>>> +must also have a tag (/plugin/) that allows undefined references t=
o nodes
>>> +that are not present at compilation time to be recorded so that th=
e runtime
>>> +loader can fix them.
>>> +
>>> +So the bar peripheral's DTS format would be of the form:
>>> +
>>> +/dts-v1/ /plugin/;	/* allow undefined references and record them *=
/
>>> +/ {
>>> +	....	/* various properties for loader use; i.e. part id etc. */
>>> +	fragment@0 {
>>> +		target =3D <&ocp>;
>>> +		__overlay__ {
>>> +			/* bar peripheral */
>>> +			bar {
>>> +				compatible =3D "corp,bar";
>>> +				... /* various properties and child nodes */
>>> +			}
>>=20
>>                        };
>>=20
>>> +		};
>>> +	};
>>> +};
>>=20
>> Other than the fact that the above syntax is already in the Linux
>> kernel overlay implementation, is there a need for the target
>> property and the __overlay__ node?  I haven't figured out what
>> extra value they provide.
>=20
> I've been assuming that the fact the syntax is already used in the
> kernel was the main reason here.
>=20
>> Without those added, the overlay dts becomes simpler (though for a
>> multi-node target path example this would be more complex unless a l=
abel
>> was used for the target node):
>>=20
>> +/dts-v1/ /plugin/;	/* allow undefined references and record them */
>> +/ {
>> +	....	/* various properties for loader use; i.e. part id etc. */
>> +	ocp {
>> +			/* bar peripheral */
>> +			bar {
>> +				compatible =3D "corp,bar";
>> +				... /* various properties and child nodes */
>> +			};
>> +	};
>> +};
>=20
> Hmm, that is simpler - and avoids the rather silly fact in the curren=
t
> version that there's a basically useless phandle value here - it will
> always be -1 and have to be resolved using data elsewhere.
>=20
> That said, I'm not sure the change is enough of a win to recommend
> changing it given that the __overlay__ format is in use in the wild.
>=20

As as replied to Frank, no. This is a simplification that completely
breaks other uses of overlays. This format assumes that the overlay
is only going to be applied on a single platform, where that is not the
case now.

> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis
