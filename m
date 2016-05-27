From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 0/6]  of: overlays: New target methods
Date: Fri, 27 May 2016 13:35:28 -0700
Message-ID: <5748AF90.3090607@gmail.com>
References: <1463429892-3369-1-git-send-email-pantelis.antoniou@konsulko.com> <57476782.3040703@gmail.com> <70AB0C5B-737D-41B9-8D21-4205379ABDB7@konsulko.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70AB0C5B-737D-41B9-8D21-4205379ABDB7@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Devicetree List <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/27/2016 7:46 AM, Pantelis Antoniou wrote:
> Hi Frank,
>=20
>> On May 27, 2016, at 00:15 , Frank Rowand <frowand.list@gmail.com> wr=
ote:
>>
>> On 5/16/2016 1:18 PM, Pantelis Antoniou wrote:
>>> This patchset implements two new target methods.
>>>
>>> A target index method which allows selecting different
>>> targets according to an argument using an extended API and
>>> a target root method that fences the target only
>>> to a specific given root.
>>>
>>> Documentation and unit-tests are included.
>>
>> I think you are attacking the problem the wrong way.
>>
>> If I understand correctly, the problem statement is:
>>
>>  In some cases, a devicetree overlay is meant to describe
>>  a pluggable piece of hardware, which may be plugged into
>>  various locations on a platform.  It should be possible
>>  to apply a single devicetree to one or more locations
>>  on a given platform.
>>
>> If that is the case, then putting the locations where the
>> overlay can be applied into the devicetree is not the
>> approach that I would use.  It seems it would be better
>> to specify the target location as a separate item from
>> the overlay to the method that applies the devicetree.
>> In that case, I would put the node(s) describing the
>> pluggable hardware in the root node of the overlay
>> devicetree (dtc expects a root node).  The apply
>> method can easily find the node(s) and relocate them
>> to the appropriate location in the platform's
>> devicetree.
>>
>=20
> It=E2=80=99s a bit more complicated. This was considered initially
> but we ended up with the targets on the overlay.
>=20
> It can work either way, but the problem with storing the
> indirect targets in the base tree is that there is no
> change in the bindings of the targets.

I am not suggesting putting the targets in the base tree.

I do not know where it should be.  Still thinking about
that part.

>=20
> Putting things in the overlay seemed like it would have
> no effect on the base tree whatsoever.
>=20
>=20
>> -Frank
>>
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
>=20
