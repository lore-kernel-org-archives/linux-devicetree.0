From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [Question] refcount of DT node
Date: Thu, 14 Apr 2016 13:40:30 +0300
Message-ID: <EF5FABC1-E74B-4154-8F20-A21DC6E01AB5@konsulko.com>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com> <20160414101053.GC10273@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160414101053.GC10273@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Apr 14, 2016, at 13:10 , Mark Rutland <mark.rutland@arm.com> wrote=
:
>=20
> On Thu, Apr 14, 2016 at 04:47:57PM +0900, Masahiro Yamada wrote:
>> Hi experts.
>>=20
>> My understanding of refcount of DT node is poor.
>> Please help me understand it correctly.
>>=20
>> Sorry if I am asking stupid questions.
>>=20
>>=20
>> [1] Does this reference count exist for Overlay?
>>    Is a node freed when its refcount becomes zero?
>=20
> I'm not familiar with the way that overlays are intended to work, but
> generally this is true, and I believe the same applies.
>=20
> Pantelis, please correct me if I am wrong on that front.
>=20

Yes, if the refcount goes to zero everything is released.
No that doesn=E2=80=99t always imply freeing memory.

>> [2] When of_node_put() should be called,
>>     or should not be called?
>>=20
>>=20
>> Shouldn't of_node_put() be called
>> when we are still referencing to any of its properties?
>>=20
>> For example,  cpu_read_enable_method()
>> in arch/arm64/kernel/cpu_ops.c
>> returns a pointer to the property value
>> instead of creating a copy of it.
>>=20
>> In this case, of_node_put() should not be called
>> because we are still referencing the DT property
>> (in other words, referencing to the DT node indirectly).
>>=20
>> Am I right?
>=20
> Yes, the node should not be freed while its data is referred to.
>=20
> We are leaking a ref there, though, as we no longer refer to that dat=
a
> after cpu_read_ops().
>=20
> Fixing that will require some restructuring. We don't expect a CPU no=
de
> to need to disappear, so while it's currently not strictly correct th=
e
> code shouldn't lead to any adverse behaviour.
>=20

So let me explain a bit.

Due to historical reasons by default nodes and property contents are no=
t dynamically
allocated, they are merely being pointed at in the binary blob that was=
 passed on
during boot.

This all takes place in __unflatten_device_tree and there is an allocat=
or argument for
allocating the device_node & properties structures. The content pointer=
s of those structures
are directly pointing in the binary blob.

Early in the boot process the allocator used is not the standard kmallo=
c allocator; this does
not support freeing the structures at all.

Dynamic DT instead kmalloc=E2=80=99s everything; this is marked by usin=
g the node flag OF_DYNAMIC.

So when a node is released a check is performed whether OF_DYNAMIC is s=
et.

There is an additional complication with properties. Since DT property =
methods (like of_get_property)
return a pointer to property value it is generally not safe to free a p=
roperty. So when a property
is removed (but the node still exists) it is placed on the node=E2=80=99=
s deadprops list which may reside
until the node is released.

Hope this makes things clearer.

>> [3] Is the following code correct?
>>=20
>>   np =3D of_find_compatible_node(NULL, NULL,"foo-node");
>>   of_node_put(np);
>>   ret =3D of_address_to_resource(np, 0, &res);
>>   if (ret) {
>>            pr_err("failed to get resource\n");
>>            return ret;
>>   }
>>=20
>> Actually I wrote the code above, and it was applied.
>>=20
>> But, the node is still referenced while of_address_to_resource() is =
being run.
>>=20
>> So the correct code should be as follows?
>>=20
>>   np =3D of_find_compatible_node(NULL, NULL,"foo-node");
>>   ret =3D of_address_to_resource(np, 0, &res);
>>   of_node_put(np);
>>   if (ret) {
>>            pr_err("failed to get resource\n");
>>            return ret;
>>   }
>=20
> It is correctly balanced, yes.
>=20
> If you don't need to keep the node for future use, this is fine.
>=20

The second code fragment is the correct one.

> Mark.

Regards

=E2=80=94 Pantelis
