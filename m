Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <53A93907.6070408@nsn.com>
Date: Tue, 24 Jun 2014 11:54:29 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CAE7215-7D2D-454A-A6FD-6E93FAE8F1F7@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A93304.9000604@nsn.com> <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com> <53A93907.6070408@nsn.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Cc: Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Alexander,

On Jun 24, 2014, at 11:38 AM, Alexander Sverdlin wrote:

> Hi!
>=20
> On 24/06/14 10:19, ext Pantelis Antoniou wrote:
>=20
> [...]
>=20
>>> No, it's not bool... It's an existence of a void property.=20
>>>=20
>>=20
>> The is no such thing as a void property. A property without contents =
is defined as a bool.=20
>>=20
>>> =46rom Documentation/devicetree/bindings/interrupts.txt
>>=20
>> "A device is marked as an interrupt controller with the =
"interrupt-controller"
>> property. This is a empty, boolean property."
>=20
> Maybe, the comment here should be also corrected :)
>=20
> If we refer back to ePAPR, there are several use-cases of "<empty>" =
properties, for example:
>=20
> 2.3.8 ranges
> Property: ranges
> Value type: <empty> or <prop-encoded-array> encoded as arbitrary =
number of triplets of (child-bus-
> address, parent-bus-address, length).
> Description:
> The ranges property provides a means of defining a mapping or =
translation between the
> address space of the bus (the child address space) and the address =
space of the bus node's
> parent (the parent address space).
> ...
> If the property is defined with an <empty> value, it specifies that =
the parent and child address
> space is identical, and no address translation is required.
>=20

> =3D> by no means, should <empty> here be considered a "boolean".
>=20
> 2.4.2.2 Interrupt-controller
> Property: interrupt-controller
> Value type: <empty>
> Description:
> The presence of an interrupt-controller property defines a node as an =
interrupt controller node.
>=20

> Also, ePAPR has no single occurrence of "bool", so this is something =
out of specification scope of the
> device-tree :)
>=20

Let's just say that ePAPR hasn't been updated for quite a while.

The fact of the matter is that use of of_get_property() where the =
intended use is to check
for the existence of a property (that might be empty) is incorrect IMO. =
of_find_property might
work, as well as the more correct form, where we know the property is a =
boolean, of_property_read_bool().

The pointer returned from of_get_property() is not usable in any form. =
Whether it does=20
contains a NULL or not value is immaterial. That it works at all is a =
side-effect of how the
flattening code assigns value pointers.

My vote is to just fix all the call sites using this questionable idiom.

>>>> The use of of_get_property is a bug here. It is perfectly valid for =
a property to have a
>>>> NULL value when length =3D 0.
>>>=20
>>> of_find_property() would be really correct in this particular =
case...
>=20
> --=20
> Best regards,
> Alexander Sverdlin.

Regards

-- Pantelis
