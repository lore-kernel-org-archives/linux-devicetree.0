From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 10:16:15 +0300
Message-ID: <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com> <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com> <20160526062848.GG17226@voom.fritz.box> <8CAE1792-841B-4048-B6B1-1F0F973E2E34@konsulko.com> <20160526063334.GH17226@voom.fritz.box> <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com> <20160526071243.GI17226@voom.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160526071243.GI17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On May 26, 2016, at 10:12 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
>=20
> On Thu, May 26, 2016 at 09:36:02AM +0300, Pantelis Antoniou wrote:
>> Hi David,
>>=20
>>> On May 26, 2016, at 09:33 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
>>>=20
>>> On Thu, May 26, 2016 at 09:31:20AM +0300, Pantelis Antoniou wrote:
>>>> Hi David,
>>>>=20
>>>>> On May 26, 2016, at 09:28 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6vUpdFzICT1y@public.gmane.org=
d.au> wrote:
>>>>>=20
>>>>> On Thu, May 26, 2016 at 09:14:49AM +0300, Pantelis Antoniou wrote=
:
>>>>>> Hi Frank,
>>>>>>=20
>>>>>>> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>>>>>>>=20
>>>>>>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>>>>>>> Provides the document explaining the internal mechanics of
>>>>>>>> plugins and options.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.c=
om>
>>>>>>>> ---
>>>>>>>> Documentation/dt-object-internal.txt | 318 +++++++++++++++++++=
++++++++++++++++
>>>>>>>> 1 file changed, 318 insertions(+)
>>>>>>>> create mode 100644 Documentation/dt-object-internal.txt
>>>>>>>>=20
>>>>>>>> diff --git a/Documentation/dt-object-internal.txt b/Documentat=
ion/dt-object-internal.txt
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..d5b841e
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/dt-object-internal.txt
>>>>>>>> @@ -0,0 +1,318 @@
>>>>>>>> +Device Tree Dynamic Object format internals
>>>>>>>> +-------------------------------------------
>>>>>>>> +
>>>>>>>> +The Device Tree for most platforms is a static representation=
 of
>>>>>>>> +the hardware capabilities. This is insufficient for many plat=
forms
>>>>>>>> +that need to dynamically insert device tree fragments to the
>>>>>>>> +running kernel's live tree.
>>>>>>>> +
>>>>>>>> +This document explains the the device tree object format and =
the
>>>>>>>> +modifications made to the device tree compiler, which make it=
 possible.
>>>>>>>> +
>>>>>>>> +1. Simplified Problem Definition
>>>>>>>> +--------------------------------
>>>>>>>> +
>>>>>>>> +Assume we have a platform which boots using following simplif=
ied device tree.
>>>>>>>> +
>>>>>>>> +---- foo.dts ------------------------------------------------=
-----------------
>>>>>>>> +	/* FOO platform */
>>>>>>>> +	/ {
>>>>>>>> +		compatible =3D "corp,foo";
>>>>>>>> +
>>>>>>>> +		/* shared resources */
>>>>>>>> +		res: res {
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		/* On chip peripherals */
>>>>>>>> +		ocp: ocp {
>>>>>>>> +			/* peripherals that are always instantiated */
>>>>>>>> +			peripheral1 { ... };
>>>>>>>> +		};
>>>>>>>> +	};
>>>>>>>> +---- foo.dts ------------------------------------------------=
-----------------
>>>>>>>> +
>>>>>>>> +We have a number of peripherals that after probing (using som=
e undefined method)
>>>>>>>> +should result in different device tree configuration.
>>>>>>>> +
>>>>>>>> +We cannot boot with this static tree because due to the confi=
guration of the
>>>>>>>> +foo platform there exist multiple conficting peripherals DT f=
ragments.
>>>>>>>> +
>>>>>>>> +So for the bar peripheral we would have this:
>>>>>>>> +
>>>>>>>> +---- foo+bar.dts --------------------------------------------=
-----------------
>>>>>>>> +	/* FOO platform + bar peripheral */
>>>>>>>> +	/ {
>>>>>>>> +		compatible =3D "corp,foo";
>>>>>>>> +
>>>>>>>> +		/* shared resources */
>>>>>>>> +		res: res {
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		/* On chip peripherals */
>>>>>>>> +		ocp: ocp {
>>>>>>>> +			/* peripherals that are always instantiated */
>>>>>>>> +			peripheral1 { ... };
>>>>>>>> +
>>>>>>>> +			/* bar peripheral */
>>>>>>>> +			bar {
>>>>>>>> +				compatible =3D "corp,bar";
>>>>>>>> +				... /* various properties and child nodes */
>>>>>>>> +			};
>>>>>>>> +		};
>>>>>>>> +	};
>>>>>>>> +---- foo+bar.dts --------------------------------------------=
-----------------
>>>>>>>> +
>>>>>>>> +While for the baz peripheral we would have this:
>>>>>>>> +
>>>>>>>> +---- foo+baz.dts --------------------------------------------=
-----------------
>>>>>>>> +	/* FOO platform + baz peripheral */
>>>>>>>> +	/ {
>>>>>>>> +		compatible =3D "corp,foo";
>>>>>>>> +
>>>>>>>> +		/* shared resources */
>>>>>>>> +		res: res {
>>>>>>>> +			/* baz resources */
>>>>>>>> +			baz_res: res_baz { ... };
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		/* On chip peripherals */
>>>>>>>> +		ocp: ocp {
>>>>>>>> +			/* peripherals that are always instantiated */
>>>>>>>> +			peripheral1 { ... };
>>>>>>>> +
>>>>>>>> +			/* baz peripheral */
>>>>>>>> +			baz {
>>>>>>>> +				compatible =3D "corp,baz";
>>>>>>>> +				/* reference to another point in the tree */
>>>>>>>> +				ref-to-res =3D <&baz_res>;
>>>>>>>> +				... /* various properties and child nodes */
>>>>>>>> +			};
>>>>>>>> +		};
>>>>>>>> +	};
>>>>>>>> +---- foo+baz.dts --------------------------------------------=
-----------------
>>>>>>>> +
>>>>>>>> +We note that the baz case is more complicated, since the baz =
peripheral needs to
>>>>>>>> +reference another node in the DT tree.
>>>>>>>> +
>>>>>>>> +2. Device Tree Object Format Requirements
>>>>>>>> +-----------------------------------------
>>>>>>>> +
>>>>>>>> +Since the device tree is used for booting a number of very di=
fferent hardware
>>>>>>>> +platforms it is imperative that we tread very carefully.
>>>>>>>> +
>>>>>>>> +2.a) No changes to the Device Tree binary format for the base=
 tree. We cannot
>>>>>>>> +modify the tree format at all and all the information we requ=
ire should be
>>>>>>>> +encoded using device tree itself. We can add nodes that can b=
e safely ignored
>>>>>>>> +by both bootloaders and the kernel. The plugin dtb's are opti=
onally tagged
>>>>>>>> +with a different magic number in the header but otherwise the=
y too are simple
>>>>>>>> +blobs.
>>>>>>>> +
>>>>>>>> +2.b) Changes to the DTS source format should be absolutely mi=
nimal, and should
>>>>>>>> +only be needed for the DT fragment definitions, and not the b=
ase boot DT.
>>>>>>>> +
>>>>>>>> +2.c) An explicit option should be used to instruct DTC to gen=
erate the required
>>>>>>>> +information needed for object resolution. Platforms that don'=
t use the
>>>>>>>> +dynamic object format can safely ignore it.
>>>>>>>> +
>>>>>>>> +2.d) Finally, DT syntax changes should be kept to a minimum. =
It should be
>>>>>>>> +possible to express everything using the existing DT syntax.
>>>>>>>> +
>>>>>>>> +3. Implementation
>>>>>>>> +-----------------
>>>>>>>> +
>>>>>>>> +The basic unit of addressing in Device Tree is the phandle. T=
urns out it's
>>>>>>>> +relatively simple to extend the way phandles are generated an=
d referenced
>>>>>>>> +so that it's possible to dynamically convert symbolic referen=
ces (labels)
>>>>>>>> +to phandle values. This is a valid assumption as long as the =
author uses
>>>>>>>> +reference syntax and does not assign phandle values manually =
(which might
>>>>>>>> +be a problem with decompiled source files).
>>>>>>>> +
>>>>>>>> +We can roughly divide the operation into two steps.
>>>>>>>> +
>>>>>>>> +3.a) Compilation of the base board DTS file using the '-@' op=
tion
>>>>>>>> +generates a valid DT blob with an added __symbols__ node at t=
he root node,
>>>>>>>> +containing a list of all nodes that are marked with a label.
>>>>>>>> +
>>>>>>>> +Using the foo.dts file above the following node will be gener=
ated;
>>>>>>>> +
>>>>>>>> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
>>>>>>>> +$ fdtdump foo.dtb
>>>>>>>> +...
>>>>>>>> +/ {
>>>>>>>> +	...
>>>>>>>> +	res {
>>>>>>>> +		...
>>>>>>>> +		phandle =3D <0x00000001>;
>>>>>>>> +		...
>>>>>>>> +	};
>>>>>>>> +	ocp {
>>>>>>>> +		...
>>>>>>>> +		phandle =3D <0x00000002>;
>>>>>>>> +		...
>>>>>>>> +	};
>>>>>>>> +	__symbols__ {
>>>>>>>> +		res=3D"/res";
>>>>>>>> +		ocp=3D"/ocp";
>>>>>>>> +	};
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +Notice that all the nodes that had a label have been recorded=
, and that
>>>>>>>> +phandles have been generated for them.
>>>>>>>> +
>>>>>>>> +This blob can be used to boot the board normally, the __symbo=
ls__ node will
>>>>>>>> +be safely ignored both by the bootloader and the kernel (the =
only loss will
>>>>>>>> +be a few bytes of memory and disk space).
>>>>>>>> +
>>>>>>>> +3.b) The Device Tree fragments must be compiled with the same=
 option but they
>>>>>>>> +must also have a tag (/plugin/) that allows undefined referen=
ces to nodes
>>>>>>>> +that are not present at compilation time to be recorded so th=
at the runtime
>>>>>>>> +loader can fix them.
>>>>>>>> +
>>>>>>>> +So the bar peripheral's DTS format would be of the form:
>>>>>>>> +
>>>>>>>> +/dts-v1/ /plugin/;	/* allow undefined references and record t=
hem */
>>>>>>>> +/ {
>>>>>>>> +	....	/* various properties for loader use; i.e. part id etc.=
 */
>>>>>>>> +	fragment@0 {
>>>>>>>> +		target =3D <&ocp>;
>>>>>>>> +		__overlay__ {
>>>>>>>> +			/* bar peripheral */
>>>>>>>> +			bar {
>>>>>>>> +				compatible =3D "corp,bar";
>>>>>>>> +				... /* various properties and child nodes */
>>>>>>>> +			}
>>>>>>>=20
>>>>>>>                     };
>>>>>>>=20
>>>>>>>> +		};
>>>>>>>> +	};
>>>>>>>> +};
>>>>>>>=20
>>>>>>> Other than the fact that the above syntax is already in the Lin=
ux
>>>>>>> kernel overlay implementation, is there a need for the target
>>>>>>> property and the __overlay__ node?  I haven't figured out what
>>>>>>> extra value they provide.
>>>>>>>=20
>>>>>>> Without those added, the overlay dts becomes simpler (though fo=
r a
>>>>>>> multi-node target path example this would be more complex unles=
s a label
>>>>>>> was used for the target node):
>>>>>>>=20
>>>>>>> +/dts-v1/ /plugin/;	/* allow undefined references and record th=
em */
>>>>>>> +/ {
>>>>>>> +	....	/* various properties for loader use; i.e. part id etc. =
*/
>>>>>>> +	ocp {
>>>>>>> +			/* bar peripheral */
>>>>>>> +			bar {
>>>>>>> +				compatible =3D "corp,bar";
>>>>>>> +				... /* various properties and child nodes */
>>>>>>> +			};
>>>>>>> +	};
>>>>>>> +};
>>>>>>>=20
>>>>>>=20
>>>>>> No.
>>>>>>=20
>>>>>> That only works if the overlay is applied in a single platform.
>>>>>>=20
>>>>>> I have working cases where the same overlay is applied on a ppc =
and a x86
>>>>>> platform.
>>>>>=20
>>>>> Huh?  How so..
>>>>>=20
>>>>=20
>>>> Yes, it does work. Yes it=E2=80=99s being used right now. It is a =
very valid use case.
>>>>=20
>>>> Think carrier boards on enterprise routers, plugging to a main boa=
rd
>>>> that=E2=80=99s either ppc or x86 (or anything else for that matter=
).
>>>=20
>>> Sorry, I wasn't clear.  I have no problem believing overlays can be
>>> applied on multiple platforms.
>>>=20
>>> What I can't see is how Frank's format breaks that.  AFAICT it
>>> contains exactly the same information in a simpler encoding.
>>>=20
>>=20
>> It breaks it because it=E2=80=99s missing the target property.
>>=20
>> The layout of the base tree is not going to be the same in different
>> platforms, so in the above example =E2=80=98ocp=E2=80=99 would not e=
xist in x86 for
>> instance.
>=20
> I think you're misinterpreting Frank's suggestion.  As I understand i=
t
> the node names of the top level nodes in his format aren't treated as
> literal node names, but instead treated as label names which are
> resolved similarly to the phandle external fixups.
>=20
> Actually.. that is one serious problem with Frank's format, it doesn'=
t
> (easily) allow multiple fragments to be applied to the same target.
>=20

Ugh, yeah I misinterpreted that. Still, it is not going to work with th=
e patches
I queued with multiple target support.

> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis
