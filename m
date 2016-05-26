From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 08:49:10 -0500
Message-ID: <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA@mail.gmail.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com>
 <5745F95F.6000600@gmail.com> <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com>
 <20160526062848.GG17226@voom.fritz.box> <8CAE1792-841B-4048-B6B1-1F0F973E2E34@konsulko.com>
 <20160526063334.GH17226@voom.fritz.box> <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com>
 <20160526071243.GI17226@voom.fritz.box> <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 26, 2016 at 2:16 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi David,
>
>> On May 26, 2016, at 10:12 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
>>
>> On Thu, May 26, 2016 at 09:36:02AM +0300, Pantelis Antoniou wrote:
>>> Hi David,
>>>
>>>> On May 26, 2016, at 09:33 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
>>>>
>>>> On Thu, May 26, 2016 at 09:31:20AM +0300, Pantelis Antoniou wrote:
>>>>> Hi David,
>>>>>
>>>>>> On May 26, 2016, at 09:28 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6g@public.gmane.org=
id.au> wrote:
>>>>>>
>>>>>> On Thu, May 26, 2016 at 09:14:49AM +0300, Pantelis Antoniou wrot=
e:
>>>>>>> Hi Frank,
>>>>>>>
>>>>>>>> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list@gmail.c=
om> wrote:
>>>>>>>>
>>>>>>>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>>>>>>>> Provides the document explaining the internal mechanics of
>>>>>>>>> plugins and options.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.=
com>
>>>>>>>>> ---
>>>>>>>>> Documentation/dt-object-internal.txt | 318 ++++++++++++++++++=
+++++++++++++++++
>>>>>>>>> 1 file changed, 318 insertions(+)
>>>>>>>>> create mode 100644 Documentation/dt-object-internal.txt
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/dt-object-internal.txt b/Documenta=
tion/dt-object-internal.txt
>>>>>>>>> new file mode 100644
>>>>>>>>> index 0000000..d5b841e
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/Documentation/dt-object-internal.txt
>>>>>>>>> @@ -0,0 +1,318 @@
>>>>>>>>> +Device Tree Dynamic Object format internals
>>>>>>>>> +-------------------------------------------
>>>>>>>>> +
>>>>>>>>> +The Device Tree for most platforms is a static representatio=
n of
>>>>>>>>> +the hardware capabilities. This is insufficient for many pla=
tforms
>>>>>>>>> +that need to dynamically insert device tree fragments to the
>>>>>>>>> +running kernel's live tree.
>>>>>>>>> +
>>>>>>>>> +This document explains the the device tree object format and=
 the
>>>>>>>>> +modifications made to the device tree compiler, which make i=
t possible.
>>>>>>>>> +
>>>>>>>>> +1. Simplified Problem Definition
>>>>>>>>> +--------------------------------
>>>>>>>>> +
>>>>>>>>> +Assume we have a platform which boots using following simpli=
fied device tree.
>>>>>>>>> +
>>>>>>>>> +---- foo.dts -----------------------------------------------=
------------------
>>>>>>>>> +      /* FOO platform */
>>>>>>>>> +      / {
>>>>>>>>> +              compatible =3D "corp,foo";
>>>>>>>>> +
>>>>>>>>> +              /* shared resources */
>>>>>>>>> +              res: res {
>>>>>>>>> +              };
>>>>>>>>> +
>>>>>>>>> +              /* On chip peripherals */
>>>>>>>>> +              ocp: ocp {
>>>>>>>>> +                      /* peripherals that are always instant=
iated */
>>>>>>>>> +                      peripheral1 { ... };
>>>>>>>>> +              };
>>>>>>>>> +      };
>>>>>>>>> +---- foo.dts -----------------------------------------------=
------------------
>>>>>>>>> +
>>>>>>>>> +We have a number of peripherals that after probing (using so=
me undefined method)
>>>>>>>>> +should result in different device tree configuration.
>>>>>>>>> +
>>>>>>>>> +We cannot boot with this static tree because due to the conf=
iguration of the
>>>>>>>>> +foo platform there exist multiple conficting peripherals DT =
fragments.
>>>>>>>>> +
>>>>>>>>> +So for the bar peripheral we would have this:
>>>>>>>>> +
>>>>>>>>> +---- foo+bar.dts -------------------------------------------=
------------------
>>>>>>>>> +      /* FOO platform + bar peripheral */
>>>>>>>>> +      / {
>>>>>>>>> +              compatible =3D "corp,foo";
>>>>>>>>> +
>>>>>>>>> +              /* shared resources */
>>>>>>>>> +              res: res {
>>>>>>>>> +              };
>>>>>>>>> +
>>>>>>>>> +              /* On chip peripherals */
>>>>>>>>> +              ocp: ocp {
>>>>>>>>> +                      /* peripherals that are always instant=
iated */
>>>>>>>>> +                      peripheral1 { ... };
>>>>>>>>> +
>>>>>>>>> +                      /* bar peripheral */
>>>>>>>>> +                      bar {
>>>>>>>>> +                              compatible =3D "corp,bar";
>>>>>>>>> +                              ... /* various properties and =
child nodes */
>>>>>>>>> +                      };
>>>>>>>>> +              };
>>>>>>>>> +      };
>>>>>>>>> +---- foo+bar.dts -------------------------------------------=
------------------
>>>>>>>>> +
>>>>>>>>> +While for the baz peripheral we would have this:
>>>>>>>>> +
>>>>>>>>> +---- foo+baz.dts -------------------------------------------=
------------------
>>>>>>>>> +      /* FOO platform + baz peripheral */
>>>>>>>>> +      / {
>>>>>>>>> +              compatible =3D "corp,foo";
>>>>>>>>> +
>>>>>>>>> +              /* shared resources */
>>>>>>>>> +              res: res {
>>>>>>>>> +                      /* baz resources */
>>>>>>>>> +                      baz_res: res_baz { ... };
>>>>>>>>> +              };
>>>>>>>>> +
>>>>>>>>> +              /* On chip peripherals */
>>>>>>>>> +              ocp: ocp {
>>>>>>>>> +                      /* peripherals that are always instant=
iated */
>>>>>>>>> +                      peripheral1 { ... };
>>>>>>>>> +
>>>>>>>>> +                      /* baz peripheral */
>>>>>>>>> +                      baz {
>>>>>>>>> +                              compatible =3D "corp,baz";
>>>>>>>>> +                              /* reference to another point =
in the tree */
>>>>>>>>> +                              ref-to-res =3D <&baz_res>;
>>>>>>>>> +                              ... /* various properties and =
child nodes */
>>>>>>>>> +                      };
>>>>>>>>> +              };
>>>>>>>>> +      };
>>>>>>>>> +---- foo+baz.dts -------------------------------------------=
------------------
>>>>>>>>> +
>>>>>>>>> +We note that the baz case is more complicated, since the baz=
 peripheral needs to
>>>>>>>>> +reference another node in the DT tree.
>>>>>>>>> +
>>>>>>>>> +2. Device Tree Object Format Requirements
>>>>>>>>> +-----------------------------------------
>>>>>>>>> +
>>>>>>>>> +Since the device tree is used for booting a number of very d=
ifferent hardware
>>>>>>>>> +platforms it is imperative that we tread very carefully.
>>>>>>>>> +
>>>>>>>>> +2.a) No changes to the Device Tree binary format for the bas=
e tree. We cannot
>>>>>>>>> +modify the tree format at all and all the information we req=
uire should be
>>>>>>>>> +encoded using device tree itself. We can add nodes that can =
be safely ignored
>>>>>>>>> +by both bootloaders and the kernel. The plugin dtb's are opt=
ionally tagged
>>>>>>>>> +with a different magic number in the header but otherwise th=
ey too are simple
>>>>>>>>> +blobs.
>>>>>>>>> +
>>>>>>>>> +2.b) Changes to the DTS source format should be absolutely m=
inimal, and should
>>>>>>>>> +only be needed for the DT fragment definitions, and not the =
base boot DT.
>>>>>>>>> +
>>>>>>>>> +2.c) An explicit option should be used to instruct DTC to ge=
nerate the required
>>>>>>>>> +information needed for object resolution. Platforms that don=
't use the
>>>>>>>>> +dynamic object format can safely ignore it.
>>>>>>>>> +
>>>>>>>>> +2.d) Finally, DT syntax changes should be kept to a minimum.=
 It should be
>>>>>>>>> +possible to express everything using the existing DT syntax.
>>>>>>>>> +
>>>>>>>>> +3. Implementation
>>>>>>>>> +-----------------
>>>>>>>>> +
>>>>>>>>> +The basic unit of addressing in Device Tree is the phandle. =
Turns out it's
>>>>>>>>> +relatively simple to extend the way phandles are generated a=
nd referenced
>>>>>>>>> +so that it's possible to dynamically convert symbolic refere=
nces (labels)
>>>>>>>>> +to phandle values. This is a valid assumption as long as the=
 author uses
>>>>>>>>> +reference syntax and does not assign phandle values manually=
 (which might
>>>>>>>>> +be a problem with decompiled source files).
>>>>>>>>> +
>>>>>>>>> +We can roughly divide the operation into two steps.
>>>>>>>>> +
>>>>>>>>> +3.a) Compilation of the base board DTS file using the '-@' o=
ption
>>>>>>>>> +generates a valid DT blob with an added __symbols__ node at =
the root node,
>>>>>>>>> +containing a list of all nodes that are marked with a label.
>>>>>>>>> +
>>>>>>>>> +Using the foo.dts file above the following node will be gene=
rated;
>>>>>>>>> +
>>>>>>>>> +$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
>>>>>>>>> +$ fdtdump foo.dtb
>>>>>>>>> +...
>>>>>>>>> +/ {
>>>>>>>>> +      ...
>>>>>>>>> +      res {
>>>>>>>>> +              ...
>>>>>>>>> +              phandle =3D <0x00000001>;
>>>>>>>>> +              ...
>>>>>>>>> +      };
>>>>>>>>> +      ocp {
>>>>>>>>> +              ...
>>>>>>>>> +              phandle =3D <0x00000002>;
>>>>>>>>> +              ...
>>>>>>>>> +      };
>>>>>>>>> +      __symbols__ {
>>>>>>>>> +              res=3D"/res";
>>>>>>>>> +              ocp=3D"/ocp";
>>>>>>>>> +      };
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +Notice that all the nodes that had a label have been recorde=
d, and that
>>>>>>>>> +phandles have been generated for them.
>>>>>>>>> +
>>>>>>>>> +This blob can be used to boot the board normally, the __symb=
ols__ node will
>>>>>>>>> +be safely ignored both by the bootloader and the kernel (the=
 only loss will
>>>>>>>>> +be a few bytes of memory and disk space).
>>>>>>>>> +
>>>>>>>>> +3.b) The Device Tree fragments must be compiled with the sam=
e option but they
>>>>>>>>> +must also have a tag (/plugin/) that allows undefined refere=
nces to nodes
>>>>>>>>> +that are not present at compilation time to be recorded so t=
hat the runtime
>>>>>>>>> +loader can fix them.
>>>>>>>>> +
>>>>>>>>> +So the bar peripheral's DTS format would be of the form:
>>>>>>>>> +
>>>>>>>>> +/dts-v1/ /plugin/;    /* allow undefined references and reco=
rd them */
>>>>>>>>> +/ {
>>>>>>>>> +      ....    /* various properties for loader use; i.e. par=
t id etc. */
>>>>>>>>> +      fragment@0 {
>>>>>>>>> +              target =3D <&ocp>;
>>>>>>>>> +              __overlay__ {
>>>>>>>>> +                      /* bar peripheral */
>>>>>>>>> +                      bar {
>>>>>>>>> +                              compatible =3D "corp,bar";
>>>>>>>>> +                              ... /* various properties and =
child nodes */
>>>>>>>>> +                      }
>>>>>>>>
>>>>>>>>                     };
>>>>>>>>
>>>>>>>>> +              };
>>>>>>>>> +      };
>>>>>>>>> +};
>>>>>>>>
>>>>>>>> Other than the fact that the above syntax is already in the Li=
nux
>>>>>>>> kernel overlay implementation, is there a need for the target
>>>>>>>> property and the __overlay__ node?  I haven't figured out what
>>>>>>>> extra value they provide.
>>>>>>>>
>>>>>>>> Without those added, the overlay dts becomes simpler (though f=
or a
>>>>>>>> multi-node target path example this would be more complex unle=
ss a label
>>>>>>>> was used for the target node):
>>>>>>>>
>>>>>>>> +/dts-v1/ /plugin/;     /* allow undefined references and reco=
rd them */
>>>>>>>> +/ {
>>>>>>>> +       ....    /* various properties for loader use; i.e. par=
t id etc. */
>>>>>>>> +       ocp {
>>>>>>>> +                       /* bar peripheral */
>>>>>>>> +                       bar {
>>>>>>>> +                               compatible =3D "corp,bar";
>>>>>>>> +                               ... /* various properties and =
child nodes */
>>>>>>>> +                       };
>>>>>>>> +       };
>>>>>>>> +};
>>>>>>>>
>>>>>>>
>>>>>>> No.
>>>>>>>
>>>>>>> That only works if the overlay is applied in a single platform.
>>>>>>>
>>>>>>> I have working cases where the same overlay is applied on a ppc=
 and a x86
>>>>>>> platform.
>>>>>>
>>>>>> Huh?  How so..
>>>>>>
>>>>>
>>>>> Yes, it does work. Yes it=E2=80=99s being used right now. It is a=
 very valid use case.
>>>>>
>>>>> Think carrier boards on enterprise routers, plugging to a main bo=
ard
>>>>> that=E2=80=99s either ppc or x86 (or anything else for that matte=
r).
>>>>
>>>> Sorry, I wasn't clear.  I have no problem believing overlays can b=
e
>>>> applied on multiple platforms.
>>>>
>>>> What I can't see is how Frank's format breaks that.  AFAICT it
>>>> contains exactly the same information in a simpler encoding.
>>>>
>>>
>>> It breaks it because it=E2=80=99s missing the target property.
>>>
>>> The layout of the base tree is not going to be the same in differen=
t
>>> platforms, so in the above example =E2=80=98ocp=E2=80=99 would not =
exist in x86 for
>>> instance.
>>
>> I think you're misinterpreting Frank's suggestion.  As I understand =
it
>> the node names of the top level nodes in his format aren't treated a=
s
>> literal node names, but instead treated as label names which are
>> resolved similarly to the phandle external fixups.
>>
>> Actually.. that is one serious problem with Frank's format, it doesn=
't
>> (easily) allow multiple fragments to be applied to the same target.
>>
>
> Ugh, yeah I misinterpreted that. Still, it is not going to work with =
the patches
> I queued with multiple target support.

Queued implies accepted which they are not. The multiple ways of
expressing targets bothers me. Upstream still has no external
interface to overlays, so I think there is still room to change things
if we decide it is worthwhile. Better now than stuck with something
forever.

I too was wondering about the current syntax before this thread
started. We have 2 levels of nodes before we get to any useful
information with the current syntax.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
