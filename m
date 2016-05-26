From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 14:31:19 -0700
Message-ID: <57476B27.9070008@gmail.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com> <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com> <20160526062848.GG17226@voom.fritz.box> <8CAE1792-841B-4048-B6B1-1F0F973E2E34@konsulko.com> <20160526063334.GH17226@voom.fritz.box> <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com> <20160526071243.GI17226@voom.fritz.box> <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com> <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA@mail.gmail.com> <57472A9A.1060903@gmail.com> <EAD64177-3519-4CD2-AFB6-5EB765CC7459@konsulko.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EAD64177-3519-4CD2-AFB6-5EB765CC7459-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5/26/2016 10:09 AM, Pantelis Antoniou wrote:
> Hi Frank,
>=20
>> On May 26, 2016, at 19:55 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>>
>> Hi Pantelis,
>>
>> On 5/26/2016 6:49 AM, Rob Herring wrote:
>>> On Thu, May 26, 2016 at 2:16 AM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hi David,
>>>>
>>>>> On May 26, 2016, at 10:12 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6vUpdFzICT1y@public.gmane.org=
d.au> wrote:
>>>>>
>>>>> On Thu, May 26, 2016 at 09:36:02AM +0300, Pantelis Antoniou wrote=
:
>>>>>> Hi David,
>>>>>>
>>>>>>> On May 26, 2016, at 09:33 , David Gibson <david-xT8FGy+AXnQMXKaNCjofrA@public.gmane.org=
=2Eid.au> wrote:
>>>>>>>
>>>>>>> On Thu, May 26, 2016 at 09:31:20AM +0300, Pantelis Antoniou wro=
te:
>>>>>>>> Hi David,
>>>>>>>>
>>>>>>>>> On May 26, 2016, at 09:28 , David Gibson <david-xT8FGy+AXnSXP4QZYUMu1g@public.gmane.org=
ar.id.au> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, May 26, 2016 at 09:14:49AM +0300, Pantelis Antoniou w=
rote:
>>>>>>>>>> Hi Frank,
>>>>>>>>>>
>>>>>>>>>>> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list@gmai=
l.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>>>>>>>>>>> Provides the document explaining the internal mechanics of
>>>>>>>>>>>> plugins and options.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsul=
ko.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>> Documentation/dt-object-internal.txt | 318 +++++++++++++++=
++++++++++++++++++++
>>
>> < snip >
>>
>>>>>>>>>>>> +So the bar peripheral's DTS format would be of the form:
>>>>>>>>>>>> +
>>>>>>>>>>>> +/dts-v1/ /plugin/;    /* allow undefined references and r=
ecord them */
>>>>>>>>>>>> +/ {
>>>>>>>>>>>> +      ....    /* various properties for loader use; i.e. =
part id etc. */
>>>>>>>>>>>> +      fragment@0 {
>>>>>>>>>>>> +              target =3D <&ocp>;
>>>>>>>>>>>> +              __overlay__ {
>>>>>>>>>>>> +                      /* bar peripheral */
>>>>>>>>>>>> +                      bar {
>>>>>>>>>>>> +                              compatible =3D "corp,bar";
>>>>>>>>>>>> +                              ... /* various properties a=
nd child nodes */
>>>>>>>>>>>> +                      }
>>>>>>>>>>>
>>>>>>>>>>>                    };
>>>>>>>>>>>
>>>>>>>>>>>> +              };
>>>>>>>>>>>> +      };
>>>>>>>>>>>> +};
>>>>>>>>>>>
>>>>>>>>>>> Other than the fact that the above syntax is already in the=
 Linux
>>>>>>>>>>> kernel overlay implementation, is there a need for the targ=
et
>>>>>>>>>>> property and the __overlay__ node?  I haven't figured out w=
hat
>>>>>>>>>>> extra value they provide.
>>>>>>>>>>>
>>>>>>>>>>> Without those added, the overlay dts becomes simpler (thoug=
h for a
>>>>>>>>>>> multi-node target path example this would be more complex u=
nless a label
>>>>>>>>>>> was used for the target node):
>>>>>>>>>>>
>>>>>>>>>>> +/dts-v1/ /plugin/;     /* allow undefined references and r=
ecord them */
>>>>>>>>>>> +/ {
>>>>>>>>>>> +       ....    /* various properties for loader use; i.e. =
part id etc. */
>>>>>>>>>>> +       ocp {
>>>>>>>>>>> +                       /* bar peripheral */
>>>>>>>>>>> +                       bar {
>>>>>>>>>>> +                               compatible =3D "corp,bar";
>>>>>>>>>>> +                               ... /* various properties a=
nd child nodes */
>>>>>>>>>>> +                       };
>>>>>>>>>>> +       };
>>>>>>>>>>> +};
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> No.
>>>>>>>>>>
>>>>>>>>>> That only works if the overlay is applied in a single platfo=
rm.
>>>>>>>>>>
>>>>>>>>>> I have working cases where the same overlay is applied on a =
ppc and a x86
>>>>>>>>>> platform.
>>>>>>>>>
>>>>>>>>> Huh?  How so..
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yes, it does work. Yes it=E2=80=99s being used right now. It i=
s a very valid use case.
>>>>>>>>
>>>>>>>> Think carrier boards on enterprise routers, plugging to a main=
 board
>>>>>>>> that=E2=80=99s either ppc or x86 (or anything else for that ma=
tter).
>>>>>>>
>>>>>>> Sorry, I wasn't clear.  I have no problem believing overlays ca=
n be
>>>>>>> applied on multiple platforms.
>>>>>>>
>>>>>>> What I can't see is how Frank's format breaks that.  AFAICT it
>>>>>>> contains exactly the same information in a simpler encoding.
>>>>>>>
>>>>>>
>>>>>> It breaks it because it=E2=80=99s missing the target property.
>>>>>>
>>>>>> The layout of the base tree is not going to be the same in diffe=
rent
>>>>>> platforms, so in the above example =E2=80=98ocp=E2=80=99 would n=
ot exist in x86 for
>>>>>> instance.
>>>>>
>>>>> I think you're misinterpreting Frank's suggestion.  As I understa=
nd it
>>>>> the node names of the top level nodes in his format aren't treate=
d as
>>>>> literal node names, but instead treated as label names which are
>>>>> resolved similarly to the phandle external fixups.
>>>>>
>>>>> Actually.. that is one serious problem with Frank's format, it do=
esn't
>>>>> (easily) allow multiple fragments to be applied to the same targe=
t.
>>>>>
>>>>
>>>> Ugh, yeah I misinterpreted that. Still, it is not going to work wi=
th the patches
>>>> I queued with multiple target support.
>>
>> OK, so you are talking about the "[RFC] of: Portable Device Tree con=
nector"
>> email from 4/27 (just to provide an easy link for everyone).  I'm st=
ill
>> trying to figure that out.
>>
>> So other than that, am I missing something else about what extra
>> functionality the extra layers of nodes provides?
>>
>=20
> No, I=E2=80=99m talking about the new target options patchset.
>=20
> "of: overlays: New target methods=E2=80=9D & in particular
>=20
> "of: overlay: Implement target index support"

Thanks for the pointer.  I don't think the target options approach
is the way to handle the issue (see my reply a couple of minutes
ago in that thread).

>=20
>>
>>> Queued implies accepted which they are not. The multiple ways of
>>> expressing targets bothers me. Upstream still has no external
>>> interface to overlays, so I think there is still room to change thi=
ngs
>>> if we decide it is worthwhile. Better now than stuck with something
>>> forever.
>>>
>>> I too was wondering about the current syntax before this thread
>>> started. We have 2 levels of nodes before we get to any useful
>>> information with the current syntax.
>>>
>=20
> That=E2=80=99s on purpose. The first level is to contain load manager=
 specific details,
> i.e. part-numbers and other platform specific properties.
>=20
> The second level contains the per fragment properties (at the moment =
targets).

My suggestion removed the target property.

What other properties are you envisioning?  (Looking for the architectu=
ral
vision that you have.)

If load manager specific details are appropriate in the devicetree (a w=
hole
different discussion) then maybe a /chosen/load-manager node could exis=
t to
hold them instead of putting them in /, where the patch currently locat=
es
"/* various properties for loader use; i.e. part id etc. */".
