From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] dtc: Document the dynamic plugin internals
Date: Thu, 26 May 2016 09:55:54 -0700
Message-ID: <57472A9A.1060903@gmail.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-4-git-send-email-pantelis.antoniou@konsulko.com> <5745F95F.6000600@gmail.com> <1151E0EF-B811-4C0B-858A-00810BE9BA42@konsulko.com> <20160526062848.GG17226@voom.fritz.box> <8CAE1792-841B-4048-B6B1-1F0F973E2E34@konsulko.com> <20160526063334.GH17226@voom.fritz.box> <BE239F34-7B36-4A78-BE21-AA48CB8349E4@konsulko.com> <20160526071243.GI17226@voom.fritz.box> <C43C3B01-5DF5-49DF-848D-0BEA48E3DB6E@konsulko.com> <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLTrSP577ViKRjoqyagWw4+dZuQQsTMMXdoU3n9HZSYZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On 5/26/2016 6:49 AM, Rob Herring wrote:
> On Thu, May 26, 2016 at 2:16 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi David,
>>
>>> On May 26, 2016, at 10:12 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
>>>
>>> On Thu, May 26, 2016 at 09:36:02AM +0300, Pantelis Antoniou wrote:
>>>> Hi David,
>>>>
>>>>> On May 26, 2016, at 09:33 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6vUpdFzICT1y@public.gmane.org=
d.au> wrote:
>>>>>
>>>>> On Thu, May 26, 2016 at 09:31:20AM +0300, Pantelis Antoniou wrote=
:
>>>>>> Hi David,
>>>>>>
>>>>>>> On May 26, 2016, at 09:28 , David Gibson <david-xT8FGy+AXnQMXKaNCjofrA@public.gmane.org=
=2Eid.au> wrote:
>>>>>>>
>>>>>>> On Thu, May 26, 2016 at 09:14:49AM +0300, Pantelis Antoniou wro=
te:
>>>>>>>> Hi Frank,
>>>>>>>>
>>>>>>>>> On May 25, 2016, at 22:13 , Frank Rowand <frowand.list@gmail.=
com> wrote:
>>>>>>>>>
>>>>>>>>> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
>>>>>>>>>> Provides the document explaining the internal mechanics of
>>>>>>>>>> plugins and options.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko=
=2Ecom>
>>>>>>>>>> ---
>>>>>>>>>> Documentation/dt-object-internal.txt | 318 +++++++++++++++++=
++++++++++++++++++

< snip >

>>>>>>>>>> +So the bar peripheral's DTS format would be of the form:
>>>>>>>>>> +
>>>>>>>>>> +/dts-v1/ /plugin/;    /* allow undefined references and rec=
ord them */
>>>>>>>>>> +/ {
>>>>>>>>>> +      ....    /* various properties for loader use; i.e. pa=
rt id etc. */
>>>>>>>>>> +      fragment@0 {
>>>>>>>>>> +              target =3D <&ocp>;
>>>>>>>>>> +              __overlay__ {
>>>>>>>>>> +                      /* bar peripheral */
>>>>>>>>>> +                      bar {
>>>>>>>>>> +                              compatible =3D "corp,bar";
>>>>>>>>>> +                              ... /* various properties and=
 child nodes */
>>>>>>>>>> +                      }
>>>>>>>>>
>>>>>>>>>                     };
>>>>>>>>>
>>>>>>>>>> +              };
>>>>>>>>>> +      };
>>>>>>>>>> +};
>>>>>>>>>
>>>>>>>>> Other than the fact that the above syntax is already in the L=
inux
>>>>>>>>> kernel overlay implementation, is there a need for the target
>>>>>>>>> property and the __overlay__ node?  I haven't figured out wha=
t
>>>>>>>>> extra value they provide.
>>>>>>>>>
>>>>>>>>> Without those added, the overlay dts becomes simpler (though =
for a
>>>>>>>>> multi-node target path example this would be more complex unl=
ess a label
>>>>>>>>> was used for the target node):
>>>>>>>>>
>>>>>>>>> +/dts-v1/ /plugin/;     /* allow undefined references and rec=
ord them */
>>>>>>>>> +/ {
>>>>>>>>> +       ....    /* various properties for loader use; i.e. pa=
rt id etc. */
>>>>>>>>> +       ocp {
>>>>>>>>> +                       /* bar peripheral */
>>>>>>>>> +                       bar {
>>>>>>>>> +                               compatible =3D "corp,bar";
>>>>>>>>> +                               ... /* various properties and=
 child nodes */
>>>>>>>>> +                       };
>>>>>>>>> +       };
>>>>>>>>> +};
>>>>>>>>>
>>>>>>>>
>>>>>>>> No.
>>>>>>>>
>>>>>>>> That only works if the overlay is applied in a single platform=
=2E
>>>>>>>>
>>>>>>>> I have working cases where the same overlay is applied on a pp=
c and a x86
>>>>>>>> platform.
>>>>>>>
>>>>>>> Huh?  How so..
>>>>>>>
>>>>>>
>>>>>> Yes, it does work. Yes it=E2=80=99s being used right now. It is =
a very valid use case.
>>>>>>
>>>>>> Think carrier boards on enterprise routers, plugging to a main b=
oard
>>>>>> that=E2=80=99s either ppc or x86 (or anything else for that matt=
er).
>>>>>
>>>>> Sorry, I wasn't clear.  I have no problem believing overlays can =
be
>>>>> applied on multiple platforms.
>>>>>
>>>>> What I can't see is how Frank's format breaks that.  AFAICT it
>>>>> contains exactly the same information in a simpler encoding.
>>>>>
>>>>
>>>> It breaks it because it=E2=80=99s missing the target property.
>>>>
>>>> The layout of the base tree is not going to be the same in differe=
nt
>>>> platforms, so in the above example =E2=80=98ocp=E2=80=99 would not=
 exist in x86 for
>>>> instance.
>>>
>>> I think you're misinterpreting Frank's suggestion.  As I understand=
 it
>>> the node names of the top level nodes in his format aren't treated =
as
>>> literal node names, but instead treated as label names which are
>>> resolved similarly to the phandle external fixups.
>>>
>>> Actually.. that is one serious problem with Frank's format, it does=
n't
>>> (easily) allow multiple fragments to be applied to the same target.
>>>
>>
>> Ugh, yeah I misinterpreted that. Still, it is not going to work with=
 the patches
>> I queued with multiple target support.

OK, so you are talking about the "[RFC] of: Portable Device Tree connec=
tor"
email from 4/27 (just to provide an easy link for everyone).  I'm still
trying to figure that out.

So other than that, am I missing something else about what extra
functionality the extra layers of nodes provides?


> Queued implies accepted which they are not. The multiple ways of
> expressing targets bothers me. Upstream still has no external
> interface to overlays, so I think there is still room to change thing=
s
> if we decide it is worthwhile. Better now than stuck with something
> forever.
>=20
> I too was wondering about the current syntax before this thread
> started. We have 2 levels of nodes before we get to any useful
> information with the current syntax.
>=20
> Rob
>=20
