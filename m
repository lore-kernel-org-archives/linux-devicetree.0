From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] doc: dt: Document the indirect overlay method.
Date: Tue, 10 May 2016 09:36:46 -0500
Message-ID: <CAL_JsqLQnVGsd8GkTocR4zeL-MU2wZ7V4s+FqCKt02GCBVHrMg@mail.gmail.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462817147-7620-4-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqL6fTdUDNW_v0gb++vTK+hnDcR1vFEFevUxbg+s7khUqg@mail.gmail.com> <2A7DBC29-2A70-4076-8229-E2F517BFDE10@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2A7DBC29-2A70-4076-8229-E2F517BFDE10-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 8:59 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
>> On May 10, 2016, at 00:59 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>
>> On Mon, May 9, 2016 at 1:05 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Add a description of the indirect overlay method to the overlay
>>> documention file.
>>
>> Why? Please write some decent commit messages.
>>
>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> ---
>>> Documentation/devicetree/overlay-notes.txt | 13 +++++++++++++
>>> 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documenta=
tion/devicetree/overlay-notes.txt
>>> index d418a6c..dd595e6 100644
>>> --- a/Documentation/devicetree/overlay-notes.txt
>>> +++ b/Documentation/devicetree/overlay-notes.txt
>>> @@ -100,6 +100,10 @@ Finally, if you need to remove all overlays in=
 one-go, just call
>>> of_overlay_destroy_all() which will remove every single one in the =
correct
>>> order.
>>>
>>> +If your board has multiple slots/places where a single overlay can=
 work
>>> +and each slot is defined by a node, you can use the of_overlay_cre=
ate_indirect()
>>> +method to select the target.
>>> +
>>> Overlay DTS Format
>>> ------------------
>>>
>>> @@ -113,6 +117,11 @@ The DTS of an overlay should have the followin=
g format:
>>>                target=3D<phandle>;       /* phandle target of the o=
verlay */
>>>        or
>>>                target-path=3D"/path";    /* target path of the over=
lay */
>>
>> Why not just let these take multiple values and the user just select=
s index?
>>
>
> Implementation details. Usually there=E2=80=99s a descriptive label u=
sed for each
> different target point. It could be a slot# or it could be a label=E2=
=80=A6
>
> A string selector maps better IMO.

Then add "target-names" perhaps.

What I really don't like is 3 different ways to specify the target and
having to maintain them (I'm not sure why we allowed 2 to start
with.). Come up with a single way that works for 1 or more targets. If
that is different than the current way, then let's deprecate the old
way.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
