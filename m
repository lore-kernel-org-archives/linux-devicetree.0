Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140623183343.GA10389@heimdall>
Date: Mon, 23 Jun 2014 22:13:36 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall>
To: Ioan Nicu <ioan.nicu.ext@nsn.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Ioan,

I'm going to let Grant answer that but the code in question doesn't look =
right.

On Jun 23, 2014, at 9:33 PM, Ioan Nicu wrote:

> Hi Pantelis,
>=20
> On Mon, Jun 23, 2014 at 07:57:24PM +0300, ext Pantelis Antoniou wrote:
>> Hi Alexander,
>>=20
>> On Jun 23, 2014, at 7:26 PM, Alexander Sverdlin wrote:
>>=20
>>> Hello Pantelis!
>>>=20
>>> On 22/06/14 11:40, ext Pantelis Antoniou wrote:
>>>> Introduce helper functions for working with the live DT tree,
>>>> all of them related to dynamically adding/removing nodes and
>>>> properties.
>>>>=20
>>>> __of_copy_property() copies a property dynamically
>>>> __of_create_empty_node() creates an empty node
>>>>=20
>>>> Bug fix about prop->len =3D=3D 0 by Ionut Nicu =
<ioan.nicu.ext@nsn.com>
>>>=20
>>> Are you sure about this? (see below...)
>>>=20
>=20
> Alexander is right, my fix was lost even though it's mentioned in this =
patch.
>=20

I'm sorry, I didn't understand that the intention of the fix was to =
address
the issue below.

>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>>>> ---
>>=20
>> [snip]
>>>> +
>>>> +	if (prop->length > 0) {
>>>       ^^^^^^^^^^^^^^^^^^^^^
>>> Seems, that length=3D=3D0 case will still produce value=3D=3DNULL =
results,
>>> which will brake some checks in the kernel... Or am I missing =
something in
>>> the new version?
>>>=20
>>=20
>> prop->value will be set to NULL, and length will be set to zero =
(kzalloc).
>> This is a normal zero length property.
>>=20
>> I don't know of any place in the kernel accessing the value if =
prop->length=3D=3D0
>>=20
>=20
> We have a simple use case. We have an overlay which adds an interrupt =
controller.
> If you look in drivers/of/irq.c, in of_irq_parse_raw():
>=20
> [...]
> 	/* Now start the actual "proper" walk of the interrupt tree */
> 	while (ipar !=3D NULL) {
> 		/* Now check if cursor is an interrupt-controller and if =
it is
> 		 * then we are done
> 		 */
> 		if (of_get_property(ipar, "interrupt-controller", NULL) =
!=3D
> 				NULL) {
> 			pr_debug(" -> got it !\n");
> 			return 0;
> 		}
> [...]
>=20
> A node is identified as an interrupt controller if it has a =
zero-length property
> called "interrupt-controller" but with a non-NULL value.
>=20
> My proposed fix for this was to remove the if () condition. =
propn->value will be
> allocated with kmalloc(0) which returns ZERO_SIZE_PTR which is !=3D =
NULL.
>=20

If that's the case, the code in irq.c is wrong.

interrupt-controller is a bool property; the correct call to use is =
of_property_read_bool()
which returns true or false when the value is defined.

The use of of_get_property is a bug here. It is perfectly valid for a =
property to have a
NULL value when length =3D 0.

Regards

-- Pantelis

>=20
>>=20
>> [snip]
>>=20
>>>> +
>>>> #endif /* _LINUX_OF_H */
>>>>=20
>>>=20
>>> --=20
>>> Best regards,
>>> Alexander Sverdlin.
>>=20
>> Regards
>>=20
>> -- Pantelis
>>=20
>=20
> Regards,
> Ionut Nicu
