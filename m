From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 3/6] doc: dt: Document the indirect overlay method.
Date: Tue, 10 May 2016 16:59:06 +0300
Message-ID: <2A7DBC29-2A70-4076-8229-E2F517BFDE10@konsulko.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817147-7620-4-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqL6fTdUDNW_v0gb++vTK+hnDcR1vFEFevUxbg+s7khUqg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL6fTdUDNW_v0gb++vTK+hnDcR1vFEFevUxbg+s7khUqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 10, 2016, at 00:59 , Rob Herring <robherring2@gmail.com> wrote=
:
>=20
> On Mon, May 9, 2016 at 1:05 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Add a description of the indirect overlay method to the overlay
>> documention file.
>=20
> Why? Please write some decent commit messages.
>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> Documentation/devicetree/overlay-notes.txt | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentat=
ion/devicetree/overlay-notes.txt
>> index d418a6c..dd595e6 100644
>> --- a/Documentation/devicetree/overlay-notes.txt
>> +++ b/Documentation/devicetree/overlay-notes.txt
>> @@ -100,6 +100,10 @@ Finally, if you need to remove all overlays in =
one-go, just call
>> of_overlay_destroy_all() which will remove every single one in the c=
orrect
>> order.
>>=20
>> +If your board has multiple slots/places where a single overlay can =
work
>> +and each slot is defined by a node, you can use the of_overlay_crea=
te_indirect()
>> +method to select the target.
>> +
>> Overlay DTS Format
>> ------------------
>>=20
>> @@ -113,6 +117,11 @@ The DTS of an overlay should have the following=
 format:
>>                target=3D<phandle>;       /* phandle target of the ov=
erlay */
>>        or
>>                target-path=3D"/path";    /* target path of the overl=
ay */
>=20
> Why not just let these take multiple values and the user just selects=
 index?
>=20

Implementation details. Usually there=E2=80=99s a descriptive label use=
d for each
different target point. It could be a slot# or it could be a label=E2=80=
=A6

A string selector maps better IMO.


>> +       or
>> +               target-indirect {       /* indirect target selector =
*/
>> +                       foo { target|target-path ... };
>> +                       bar { .... };
>> +               };
>>=20
>>                __overlay__ {
>>                        property-a;     /* add property-a to the targ=
et */
>> @@ -131,3 +140,7 @@ Using the non-phandle based target method allows=
 one to use a base DT which does
>> not contain a __symbols__ node, i.e. it was not compiled with the -@=
 option.
>> The __symbols__ node is only required for the target=3D<phandle> met=
hod, since it
>> contains the information required to map from a phandle to a tree lo=
cation.
>> +
>> +The indirect target requires the use of a selector target on the ca=
ll to
>> +of_overlay_create_indirect(). I.e. passing the "foo" id will select=
 the target
>> +in the foo node, "bar" in bar node, etc.
>> --
>> 1.7.12
>>=20

Regards

=E2=80=94 Pantelis
