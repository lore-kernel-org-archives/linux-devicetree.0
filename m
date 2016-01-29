From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Fri, 29 Jan 2016 15:46:48 -0800
Message-ID: <56ABF9E8.2080609@gmail.com>
References: <20160127152017.GA16048@amitoj-Inspiron-3542> <20160127160531.GB17123@leverpostej> <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com> <20160129164531.GB15053@rob-hp-laptop> <C95DDB58-2BFB-42FA-BB00-0CE130CE90BC@konsulko.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C95DDB58-2BFB-42FA-BB00-0CE130CE90BC@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Grant Likely <grant.likely@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, julia.lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

On 1/29/2016 9:33 AM, Pantelis Antoniou wrote:
> Hi Rob,
>=20
>> On Jan 29, 2016, at 18:45 , Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
>>> Hi Mark,
>>>
>>>> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland@arm.com> wr=
ote:
>>>>
>>>> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote=
:
>>>>> for_each_child_of_node performs an of_node_get on each iteration,=
 so
>>>>> to break out of the loop an of_node_put is required.
>>>>>
>>>>> Found using Coccinelle. The semantic patch used for this is as fo=
llows:
>>>>>
>>>>> // <smpl>
>>>>> @@
>>>>> expression e;
>>>>> local idexpression n;
>>>>> @@
>>>>>
>>>>> for_each_child_of_node(..., n) {
>>>>>  ... when !=3D of_node_put(n)
>>>>>      when !=3D e =3D n
>>>>> (
>>>>>  return n;
>>>>> |
>>>>> +  of_node_put(n);
>>>>> ?  return ...;
>>>>> )
>>>>>  ...
>>>>> }
>>>>> // </smpl
>>>>>
>>>>> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
>>>>> ---
>>>>> drivers/of/resolver.c | 4 +++-
>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>>>>> index 640eb4c..e2a0143 100644
>>>>> --- a/drivers/of/resolver.c
>>>>> +++ b/drivers/of/resolver.c
>>>>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_f=
ull_name(struct device_node *node,
>>>>>
>>>>> 	for_each_child_of_node(node, child) {
>>>>> 		found =3D __of_find_node_by_full_name(child, full_name);
>>>>> -		if (found !=3D NULL)
>>>>> +		if (found !=3D NULL) {
>>>>> +			of_node_put(child);
>>>>> 			return found;
>>>>> +		}
>>>>> 	}
>>>>>
>>>>> 	return NULL;
>>>>
>>>> I don't think this is quite right. When child =3D=3D found, this c=
hange will
>>>> leave it decremented.
>>>>
>>>
>>>
>>> This patch is bogus.=20
>>>
>>> __of_find_node_by_full_name() is not taking a reference on the node=
 if found.=20
>>> This method relies on keeping the reference taken by the loop.
>>>
>>> Taking this into account all of these conccinelle tests are bogus.
>>>
>>> The DT internal method are not using the object model in an obvious=
 manner
>>> and applying these patches without vetting each and everyone is bou=
nd to
>>> break things.
>>
>> Things are already broken. But does it matter?
>>
>> Our time would be better spent re-designing any refcounting around w=
here=20
>> we actually need it rather than trying to fix up the many locations=20
>> which are wrong and don't matter. As long as it is callers'=20
>> responsibility to get this right, it will never be right. Even the c=
ore=20
>> code has a hard time getting it right.
>>
>=20
> Let me pile up. Refcounting for DT is broken. There=E2=80=99s no poin=
t trying to fix
> it as it is. I have a big pile of TODO, one of these is fixing (as in=
 severely
> cutting down) the areas where refcounting is needed.

May as well violently agree.

An additional way that DT refcounting is architecturally broken is the =
concept
of using a held refcount as a lock substitute while traversing a linked=
 list.
=46ixing this is on my todo list, hopefully late this winter or early s=
pring.

>=20
> The idea would be to keep refcounting only in core and provide interf=
aces that
> use different semantics for drivers and subsystems.
>=20
> We can discuss things in ELC this April, perhaps on a BoF session aga=
in.

Yes, all interested people please come discuss things with us.  I have
submitted a BoF proposal.

-Frank

>=20
>=20
>> Rob
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
>=20
