Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <53A85549.7040809@nsn.com>
Date: Mon, 23 Jun 2014 19:57:24 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Alexander,

On Jun 23, 2014, at 7:26 PM, Alexander Sverdlin wrote:

> Hello Pantelis!
>=20
> On 22/06/14 11:40, ext Pantelis Antoniou wrote:
>> Introduce helper functions for working with the live DT tree,
>> all of them related to dynamically adding/removing nodes and
>> properties.
>>=20
>> __of_copy_property() copies a property dynamically
>> __of_create_empty_node() creates an empty node
>>=20
>> Bug fix about prop->len =3D=3D 0 by Ionut Nicu =
<ioan.nicu.ext@nsn.com>
>=20
> Are you sure about this? (see below...)
>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---

[snip]
>> +
>> +	if (prop->length > 0) {
>        ^^^^^^^^^^^^^^^^^^^^^
> Seems, that length=3D=3D0 case will still produce value=3D=3DNULL =
results,
> which will brake some checks in the kernel... Or am I missing =
something in
> the new version?
>=20

prop->value will be set to NULL, and length will be set to zero =
(kzalloc).
This is a normal zero length property.

I don't know of any place in the kernel accessing the value if =
prop->length=3D=3D0


>=20
>> +		if (of_property_check_flag(propn, OF_ALLOCVALUE)) {
>> +			propn->value =3D kmalloc(prop->length, =
allocflags);
>> +			if (propn->value =3D=3D NULL)
>> +				goto err_fail_value;
>> +=09

[snip]

>> +
>> #endif /* _LINUX_OF_H */
>>=20
>=20
> --=20
> Best regards,
> Alexander Sverdlin.

Regards

-- Pantelis
