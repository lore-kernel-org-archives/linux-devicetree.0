From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Wed, 27 Jan 2016 18:14:00 +0200
Message-ID: <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com>
References: <20160127152017.GA16048@amitoj-Inspiron-3542> <20160127160531.GB17123@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160127160531.GB17123@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Amitoj Kaur Chawla <amitoj1606@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, julia.lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland@arm.com> wrote=
:
>=20
> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
>> for_each_child_of_node performs an of_node_get on each iteration, so
>> to break out of the loop an of_node_put is required.
>>=20
>> Found using Coccinelle. The semantic patch used for this is as follo=
ws:
>>=20
>> // <smpl>
>> @@
>> expression e;
>> local idexpression n;
>> @@
>>=20
>> for_each_child_of_node(..., n) {
>>   ... when !=3D of_node_put(n)
>>       when !=3D e =3D n
>> (
>>   return n;
>> |
>> +  of_node_put(n);
>> ?  return ...;
>> )
>>   ...
>> }
>> // </smpl
>>=20
>> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
>> ---
>> drivers/of/resolver.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 640eb4c..e2a0143 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full=
_name(struct device_node *node,
>>=20
>> 	for_each_child_of_node(node, child) {
>> 		found =3D __of_find_node_by_full_name(child, full_name);
>> -		if (found !=3D NULL)
>> +		if (found !=3D NULL) {
>> +			of_node_put(child);
>> 			return found;
>> +		}
>> 	}
>>=20
>> 	return NULL;
>=20
> I don't think this is quite right. When child =3D=3D found, this chan=
ge will
> leave it decremented.
>=20


This patch is bogus.=20

__of_find_node_by_full_name() is not taking a reference on the node if =
found.=20
This method relies on keeping the reference taken by the loop.

Taking this into account all of these conccinelle tests are bogus.

The DT internal method are not using the object model in an obvious man=
ner
and applying these patches without vetting each and everyone is bound t=
o
break things.

Regards

=E2=80=94 Pantelis


> Thanks,
> Mark.
