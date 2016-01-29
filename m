From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Fri, 29 Jan 2016 19:33:02 +0200
Message-ID: <C95DDB58-2BFB-42FA-BB00-0CE130CE90BC@konsulko.com>
References: <20160127152017.GA16048@amitoj-Inspiron-3542> <20160127160531.GB17123@leverpostej> <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com> <20160129164531.GB15053@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160129164531.GB15053@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jan 29, 2016, at 18:45 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
>> Hi Mark,
>>=20
>>> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wro=
te:
>>>=20
>>> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
>>>> for_each_child_of_node performs an of_node_get on each iteration, =
so
>>>> to break out of the loop an of_node_put is required.
>>>>=20
>>>> Found using Coccinelle. The semantic patch used for this is as fol=
lows:
>>>>=20
>>>> // <smpl>
>>>> @@
>>>> expression e;
>>>> local idexpression n;
>>>> @@
>>>>=20
>>>> for_each_child_of_node(..., n) {
>>>>  ... when !=3D of_node_put(n)
>>>>      when !=3D e =3D n
>>>> (
>>>>  return n;
>>>> |
>>>> +  of_node_put(n);
>>>> ?  return ...;
>>>> )
>>>>  ...
>>>> }
>>>> // </smpl
>>>>=20
>>>> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>> drivers/of/resolver.c | 4 +++-
>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>>>> index 640eb4c..e2a0143 100644
>>>> --- a/drivers/of/resolver.c
>>>> +++ b/drivers/of/resolver.c
>>>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_fu=
ll_name(struct device_node *node,
>>>>=20
>>>> 	for_each_child_of_node(node, child) {
>>>> 		found =3D __of_find_node_by_full_name(child, full_name);
>>>> -		if (found !=3D NULL)
>>>> +		if (found !=3D NULL) {
>>>> +			of_node_put(child);
>>>> 			return found;
>>>> +		}
>>>> 	}
>>>>=20
>>>> 	return NULL;
>>>=20
>>> I don't think this is quite right. When child =3D=3D found, this ch=
ange will
>>> leave it decremented.
>>>=20
>>=20
>>=20
>> This patch is bogus.=20
>>=20
>> __of_find_node_by_full_name() is not taking a reference on the node =
if found.=20
>> This method relies on keeping the reference taken by the loop.
>>=20
>> Taking this into account all of these conccinelle tests are bogus.
>>=20
>> The DT internal method are not using the object model in an obvious =
manner
>> and applying these patches without vetting each and everyone is boun=
d to
>> break things.
>=20
> Things are already broken. But does it matter?
>=20
> Our time would be better spent re-designing any refcounting around wh=
ere=20
> we actually need it rather than trying to fix up the many locations=20
> which are wrong and don't matter. As long as it is callers'=20
> responsibility to get this right, it will never be right. Even the co=
re=20
> code has a hard time getting it right.
>=20

Let me pile up. Refcounting for DT is broken. There=E2=80=99s no point =
trying to fix
it as it is. I have a big pile of TODO, one of these is fixing (as in s=
everely
cutting down) the areas where refcounting is needed.

The idea would be to keep refcounting only in core and provide interfac=
es that
use different semantics for drivers and subsystems.

We can discuss things in ELC this April, perhaps on a BoF session again=
=2E


> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
