From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Fri, 27 May 2016 17:52:41 +0300
Message-ID: <26CE3FC4-2B09-45E9-94E2-9EA7836A684F@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com> <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com> <20160526062848.GG17226@voom.fritz.box> <8CAE1792-841B-4048-B6B1-1F0F973E2E34@konsulko.com> <20160526063334.GH17226@voom.fritz.box> <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com> <20160526071243.GI17226@voom.fritz.box> <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com> <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA@mail.gmail.com> <57472A9A.1060903@gmail.com> <EAD64177-3519-4CD2-AFB6-5EB765CC7459@konsulko.com> <57476B27.9070008@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57476B27.9070008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On May 27, 2016, at 00:31 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>=20
> On 5/26/2016 10:09 AM, Pantelis Antoniou wrote:
>> Hi Frank,
>>=20
>>> On May 26, 2016, at 19:55 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>>>=20
>>> Hi Pantelis,
>>>=20
>>> On 5/26/2016 6:49 AM, Rob Herring wrote:
>>>> On Thu, May 26, 2016 at 2:16 AM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> Hi David,
>>>>>=20
>>>>>> On May 26, 2016, at 10:12 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6g@public.gmane.org=
id.au> wrote:
>>>>>>=20
>>>>>> On Thu, May 26, 2016 at 09:36:02AM +0300, Pantelis Antoniou wrot=
e:
>>>>>>> Hi David,
>>>>>>>=20
>>>>>>>> On May 26, 2016, at 09:33 , David Gibson <david-xT8FGy+AXnSZP5U4TJ/6Hg@public.gmane.org=
r.id.au> wrote:
>>>>>>>>=20
>>>>>>>> On Thu, May 26, 2016 at 09:31:20AM +0300, Pantelis Antoniou wr=
ote:
>>>>>>>>> Hi David,
>>>>>>>>>=20
>>>>>>>>>> On May 26, 2016, at 09:28 , David Gibson <david-xT8FGy+AXnSoZLXPBrMMyA@public.gmane.org=
ear.id.au> wrote:
>>>>>>>>>>=20
>>>>>>>>>> On Thu, May 26, 2016 at 09:14:49AM +0300, Pantelis Antoniou =
wrote:
>>>>>>>>>>> Hi Frank,
>>>>>>>>>>>=20
>>>>>>>>>>>> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list@gma=
il.com> wrote:
>>>>>>>>>>>>=20
>>>>>>>>>>>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>>>>>>>>>>>> Provides the document explaining the internal mechanics o=
f
>>>>>>>>>>>>> plugins and options.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsu=
lko.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>> Documentation/dt-object-internal.txt | 318 ++++++++++++++=
+++++++++++++++++++++
>>>=20
>>> < snip >
>>>=20
>>>>>>>>>>>>> +So the bar peripheral's DTS format would be of the form:
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +/dts-v1/ /plugin/;    /* allow undefined references and =
record them */
>>>>>>>>>>>>> +/ {
>>>>>>>>>>>>> +      ....    /* various properties for loader use; i.e.=
 part id etc. */
>>>>>>>>>>>>> +      fragment@0 {
>>>>>>>>>>>>> +              target =3D <&ocp>;
>>>>>>>>>>>>> +              __overlay__ {
>>>>>>>>>>>>> +                      /* bar peripheral */
>>>>>>>>>>>>> +                      bar {
>>>>>>>>>>>>> +                              compatible =3D "corp,bar";
>>>>>>>>>>>>> +                              ... /* various properties =
and child nodes */
>>>>>>>>>>>>> +                      }
>>>>>>>>>>>>=20
>>>>>>>>>>>>                   };
>>>>>>>>>>>>=20
>>>>>>>>>>>>> +              };
>>>>>>>>>>>>> +      };
>>>>>>>>>>>>> +};
>>>>>>>>>>>>=20
>>>>>>>>>>>> Other than the fact that the above syntax is already in th=
e Linux
>>>>>>>>>>>> kernel overlay implementation, is there a need for the tar=
get
>>>>>>>>>>>> property and the __overlay__ node?  I haven't figured out =
what
>>>>>>>>>>>> extra value they provide.
>>>>>>>>>>>>=20
>>>>>>>>>>>> Without those added, the overlay dts becomes simpler (thou=
gh for a
>>>>>>>>>>>> multi-node target path example this would be more complex =
unless a label
>>>>>>>>>>>> was used for the target node):
>>>>>>>>>>>>=20
>>>>>>>>>>>> +/dts-v1/ /plugin/;     /* allow undefined references and =
record them */
>>>>>>>>>>>> +/ {
>>>>>>>>>>>> +       ....    /* various properties for loader use; i.e.=
 part id etc. */
>>>>>>>>>>>> +       ocp {
>>>>>>>>>>>> +                       /* bar peripheral */
>>>>>>>>>>>> +                       bar {
>>>>>>>>>>>> +                               compatible =3D "corp,bar";
>>>>>>>>>>>> +                               ... /* various properties =
and child nodes */
>>>>>>>>>>>> +                       };
>>>>>>>>>>>> +       };
>>>>>>>>>>>> +};
>>>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>> No.
>>>>>>>>>>>=20
>>>>>>>>>>> That only works if the overlay is applied in a single platf=
orm.
>>>>>>>>>>>=20
>>>>>>>>>>> I have working cases where the same overlay is applied on a=
 ppc and a x86
>>>>>>>>>>> platform.
>>>>>>>>>>=20
>>>>>>>>>> Huh?  How so..
>>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Yes, it does work. Yes it=E2=80=99s being used right now. It =
is a very valid use case.
>>>>>>>>>=20
>>>>>>>>> Think carrier boards on enterprise routers, plugging to a mai=
n board
>>>>>>>>> that=E2=80=99s either ppc or x86 (or anything else for that m=
atter).
>>>>>>>>=20
>>>>>>>> Sorry, I wasn't clear.  I have no problem believing overlays c=
an be
>>>>>>>> applied on multiple platforms.
>>>>>>>>=20
>>>>>>>> What I can't see is how Frank's format breaks that.  AFAICT it
>>>>>>>> contains exactly the same information in a simpler encoding.
>>>>>>>>=20
>>>>>>>=20
>>>>>>> It breaks it because it=E2=80=99s missing the target property.
>>>>>>>=20
>>>>>>> The layout of the base tree is not going to be the same in diff=
erent
>>>>>>> platforms, so in the above example =E2=80=98ocp=E2=80=99 would =
not exist in x86 for
>>>>>>> instance.
>>>>>>=20
>>>>>> I think you're misinterpreting Frank's suggestion.  As I underst=
and it
>>>>>> the node names of the top level nodes in his format aren't treat=
ed as
>>>>>> literal node names, but instead treated as label names which are
>>>>>> resolved similarly to the phandle external fixups.
>>>>>>=20
>>>>>> Actually.. that is one serious problem with Frank's format, it d=
oesn't
>>>>>> (easily) allow multiple fragments to be applied to the same targ=
et.
>>>>>>=20
>>>>>=20
>>>>> Ugh, yeah I misinterpreted that. Still, it is not going to work w=
ith the patches
>>>>> I queued with multiple target support.
>>>=20
>>> OK, so you are talking about the "[RFC] of: Portable Device Tree co=
nnector"
>>> email from 4/27 (just to provide an easy link for everyone).  I'm s=
till
>>> trying to figure that out.
>>>=20
>>> So other than that, am I missing something else about what extra
>>> functionality the extra layers of nodes provides?
>>>=20
>>=20
>> No, I=E2=80=99m talking about the new target options patchset.
>>=20
>> "of: overlays: New target methods=E2=80=9D & in particular
>>=20
>> "of: overlay: Implement target index support"
>=20
> Thanks for the pointer.  I don't think the target options approach
> is the way to handle the issue (see my reply a couple of minutes
> ago in that thread).
>=20
>>=20
>>>=20
>>>> Queued implies accepted which they are not. The multiple ways of
>>>> expressing targets bothers me. Upstream still has no external
>>>> interface to overlays, so I think there is still room to change th=
ings
>>>> if we decide it is worthwhile. Better now than stuck with somethin=
g
>>>> forever.
>>>>=20
>>>> I too was wondering about the current syntax before this thread
>>>> started. We have 2 levels of nodes before we get to any useful
>>>> information with the current syntax.
>>>>=20
>>=20
>> That=E2=80=99s on purpose. The first level is to contain load manage=
r specific details,
>> i.e. part-numbers and other platform specific properties.
>>=20
>> The second level contains the per fragment properties (at the moment=
 targets).
>=20
> My suggestion removed the target property.
>=20

Removing the target property requires using a loader. That may be fine
in general and in fact that=E2=80=99s what the target root methods do (=
setting
the target root to =E2=80=98/=E2=80=98 makes them equivalent to your ve=
rsion).

> What other properties are you envisioning?  (Looking for the architec=
tural
> vision that you have.)
>=20

Oh, there are a lot of properties that can be provided.

=46or instance you can declare manufacturing info (like part numbers, v=
ersion numbers,
serial numbers that can be used for quirking). You can declare things l=
ike load order
when you need precedence of overlays (i.e. on the bone the soldered on =
hdmi output
should be disabled when an add on cape with display capability is attac=
hed).
You can declare resources (i.e. pins or power draw figures) to make a d=
ecision
whether enabling an expansion board is safe.

I=E2=80=99m sure more ideas will come when we put it into wide-spread u=
se. =20

> If load manager specific details are appropriate in the devicetree (a=
 whole
> different discussion) then maybe a /chosen/load-manager node could ex=
ist to
> hold them instead of putting them in /, where the patch currently loc=
ates
> "/* various properties for loader use; i.e. part id etc. */".

Oh yes. But that=E2=80=99s something for us to figure out.

Regards

=E2=80=94 Pantelis
