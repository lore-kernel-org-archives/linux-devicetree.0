Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <53A93304.9000604@nsn.com>
Date: Tue, 24 Jun 2014 11:19:25 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A93304.9000604@nsn.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Cc: Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Alexander,

On Jun 24, 2014, at 11:12 AM, Alexander Sverdlin wrote:

> Hi!
>=20
> On 23/06/14 21:13, ext Pantelis Antoniou wrote:
>=20
> [...]
>=20
>>>> I don't know of any place in the kernel accessing the value if =
prop->length=3D=3D0
>>>>=20
>>>=20
>>> We have a simple use case. We have an overlay which adds an =
interrupt controller.
>>> If you look in drivers/of/irq.c, in of_irq_parse_raw():
>>>=20
>>> [...]
>>> 	/* Now start the actual "proper" walk of the interrupt tree */
>>> 	while (ipar !=3D NULL) {
>>> 		/* Now check if cursor is an interrupt-controller and if =
it is
>>> 		 * then we are done
>>> 		 */
>>> 		if (of_get_property(ipar, "interrupt-controller", NULL) =
!=3D
>>> 				NULL) {
>>> 			pr_debug(" -> got it !\n");
>>> 			return 0;
>>> 		}
>>> [...]
>>>=20
>>> A node is identified as an interrupt controller if it has a =
zero-length property
>>> called "interrupt-controller" but with a non-NULL value.
>>>=20
>>> My proposed fix for this was to remove the if () condition. =
propn->value will be
>>> allocated with kmalloc(0) which returns ZERO_SIZE_PTR which is !=3D =
NULL.
>>>=20
>>=20
>> If that's the case, the code in irq.c is wrong.
>>=20
>> interrupt-controller is a bool property; the correct call to use is =
of_property_read_bool()
>> which returns true or false when the value is defined.
>=20
> No, it's not bool... It's an existence of a void property.=20
>=20

The is no such thing as a void property. A property without contents is =
defined as a bool.=20

=46rom Documentation/devicetree/bindings/interrupts.txt

"A device is marked as an interrupt controller with the =
"interrupt-controller"
property. This is a empty, boolean property."

>> The use of of_get_property is a bug here. It is perfectly valid for a =
property to have a
>> NULL value when length =3D 0.
>=20
> of_find_property() would be really correct in this particular case...
>=20
> --=20
> Best regards,
> Alexander Sverdlin.

Regards

-- Pantelis
